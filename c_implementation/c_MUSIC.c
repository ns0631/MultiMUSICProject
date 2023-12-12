#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <complex.h>
#include <stdbool.h>
#include <stdint.h>

#include <gsl/gsl_errno.h>
#include <gsl/gsl_fft_complex.h>
#include <gsl/gsl_fft_real.h>
#include <gsl/gsl_fft_halfcomplex.h>

#include <sys/time.h>

#include "bandpass.h"

#define signal_size 128
#define SIGNALDIM 1

#define REAL(z,i) ((z)[2*(i)])
#define IMAG(z,i) ((z)[2*(i)+1])

const int n = signal_size;

double absval(double a){
    if(a < 0){
        return -a;
    }
    return a;
}

//C version of this: https://www.gaussianwaves.com/2017/04/analytic-signal-hilbert-transform-and-fft/
void analytic_signal(double* data, complex double* resultant){
    int i;

      gsl_fft_complex_wavetable * wavetable;
      gsl_fft_complex_workspace * workspace;

      wavetable = gsl_fft_complex_wavetable_alloc (n);
      workspace = gsl_fft_complex_workspace_alloc (n);

      gsl_fft_complex_forward (data, 1, n,
                               wavetable, workspace);

      double h[n];
      h[0] = 1;
      for(int i = 1; i <= n / 2; i++){
        h[i] = 2;
      }
      h[n / 2] = 1;
      for(int i = n / 2 + 1; i < n; i++){
        h[i] = 0;
      }

      complex double Z[n];
      for(int i = 0; i < n; i++){
        if(h[i] == 0){
            Z[i] = 0;
        }
        else{
            Z[i] = h[i] * ( REAL(data, i) + I * IMAG(data, i) ) ; 
        }
      }

      double z[2 * n];
      for(int i = 0 ; i < n; i++){
        REAL(z,i) = creal(Z[i]);
        IMAG(z,i) = cimag(Z[i]);
      }

      gsl_fft_complex_inverse (z, 1, n,
                               wavetable, workspace);

      for(int i = 0; i < n; i++){
        resultant[i] = REAL(z, i) + I * IMAG(z, i) ;
      }

      gsl_fft_complex_wavetable_free (wavetable);
      gsl_fft_complex_workspace_free (workspace);
}

int M = 3;

float c = 1500;
float freq = 40e3;
float width = 1.5e-2;

float signal1[signal_size];
float signal2[signal_size];
float signal3[signal_size];

float threshold = 1e-2;

/* Complex datatype */
struct _dcomplex { double re, im; };
typedef struct _dcomplex dcomplex;

/* ZGEEV prototype */
extern void zgeev_( char* jobvl, char* jobvr, int* n, dcomplex* a,
                int* lda, dcomplex* w, dcomplex* vl, int* ldvl, dcomplex* vr, int* ldvr,
                dcomplex* work, int* lwork, double* rwork, int* info );
/* Auxiliary routines prototypes */
extern void print_matrix( char* desc, int m, int n, dcomplex* a, int lda );

/* Parameters */
#define N 3
#define LDA N
#define LDVL N
#define LDVR N

/* Auxiliary routine: printing a matrix */
void print_matrix( char* desc, int m, int n, dcomplex* a, int lda ) {
        int i, j;
        printf( "\n %s\n", desc );
        for( i = 0; i < m; i++ ) {
                for( j = 0; j < n; j++ )
                        printf( " (%f,%f)", a[i+j*lda].re, a[i+j*lda].im );
                printf( "\n" );
        }
}

void initialize(complex float*** matrix, int height, int width)
{
   *matrix = (complex float **)calloc(height, sizeof(complex float *));
   for(int i = 0; i < height; i++) {
        (*matrix)[i] = (complex float *)calloc(width, sizeof(complex float));
   }

   for(int i = 0; i < height; i++){
        for(int j = 0; j < width; j++){
            (*matrix)[i][j] = 0.0 * I + 0.0;
        }
   }
}

void zero(complex float** matrix, int height, int width){
    for(int i = 0; i < height; i++){
        for(int j = 0; j < width; j++){
            matrix[i][j] = 0;
        }
    }
}

void transpose(float** resultant, float** matrix, int height, int width){
    for(int i = 0; i < height; i++){
        for(int j = 0; j < width; j++){
            resultant[j][i] = matrix[i][j];
        }
    }
}

float deg2rad(float angle){
    return angle / 180. * M_PI;
}

complex float multiplyComplex(complex float a, complex float b){
    complex float answer = I * ( creal(a) * cimag(b) + creal(b) * cimag(a) ) + ( creal(a) * creal(b) - cimag(a) * cimag(b) ) ;
    return answer;
}

bool complexDotProduct(complex float** resultant, complex float** matrix1, int height1, int width1, complex float** matrix2, int height2, int width2){
    if(width1 != height2){
        return false;
    }

    for(int i = 0; i < height1; i++){
        for(int j = 0; j < width2; j++){
            for(int k = 0; k < width1; k++){
                //resultant[i][j] += matrix1[i][k] * matrix2[k][j];
                resultant[i][j] += multiplyComplex( matrix1[i][k] , matrix2[k][j] ) ;
            }
        }
    }

    return true;
}

const int fs = 140000;
const int target = 40000;
const int lowcut = 29.9e3;
const int highcut = 40.1e3;

int DOA()
{
    FILE* roi1_file;
    roi1_file = fopen("Mic1.txt", "r");

    FILE* roi2_file;
    roi2_file = fopen("Mic2.txt", "r");

    FILE* roi3_file;
    roi3_file = fopen("Mic3.txt", "r");

    int i = 0;
    double val;

    if(roi1_file == NULL){
        printf("Failed to open file.\n");
    } else{
        char line[20];
        while(fgets(line, sizeof(line), roi1_file)){
            val = atof(line);
            raw_data1[i] = val;
            i++;
        }
    }

    if(i > max_entry){
        max_entry = i;
    }

    i = 0;
    if(roi2_file == NULL){
        printf("Failed to open file.\n");
    } else{
        char line[20];
        while(fgets(line, sizeof(line), roi2_file)){
            val = atof(line);
            raw_data2[i] = val;
            i++;
        }
    }

    if(i > max_entry){
        max_entry = i;
    }

    i = 0;
    if(roi3_file == NULL){
        printf("Failed to open file.\n");
    } else{
        char line[20];
        while(fgets(line, sizeof(line), roi3_file)){
            val = atof(line);
            raw_data3[i] = val;
            i++;
        }
    }

    if(i > max_entry){
        max_entry = i;
    }

    fclose(roi1_file);
    fclose(roi2_file);
    fclose(roi3_file);

    struct timeval stoptime, starttime;
    gettimeofday(&starttime, NULL);

    double area1, area2, area3 = 0;

    double offset1, offset2, offset3;
    for(int k = 0; k < max_entry; k++){
        area1 += raw_data1[k];
        area2 += raw_data2[k];
        area3 += raw_data3[k];
    }

    offset1 = area1 / (double) max_entry;
    offset2 = area2 / (double) max_entry;
    offset3 = area3 / (double) max_entry;

    filtered_sig[0] = 0;
    for(int j = 0; j < max_entry; j++){
        raw_data1[j] -= offset1;
        
        bb_digital_double_filter(b, a, &raw_data1[j], filtered_sig, delay, 13, 1, 1, 1);
        
        filtered_signal_1[j] = filtered_sig[0];

        if(filtered_sig[0] > absval(max_reading)){
            max_reading = filtered_sig[0];
        }
    }

    filtered_sig[0] = 0;
    for(int j = 0; j < max_entry; j++){
        raw_data2[j] -= offset2;
        bb_digital_double_filter(b, a, &raw_data2[j], filtered_sig, delay, 13, 1, 1, 1);
        
        filtered_signal_2[j] = filtered_sig[0];

        if(filtered_sig[0] > absval(max_reading)){
            max_reading = filtered_sig[0];
        }
    }

    filtered_sig[0] = 0;
    for(int j = 0; j < max_entry; j++){
        raw_data3[j] -= offset3;
        bb_digital_double_filter(b, a, &raw_data3[j], filtered_sig, delay, 13, 1, 1, 1);
        
        filtered_signal_3[j] = filtered_sig[0];

        if(filtered_sig[0] > absval(max_reading)){
            max_reading = filtered_sig[0];
        }
    }

    int start = 0;
    bool started = false;
    for(int i = 0; i < max_entry; i++){
        if(!started && (absval(filtered_signal_1[i]) >= threshold * max_reading || absval(filtered_signal_2[i]) >= threshold * max_reading || absval(filtered_signal_3[i]) >= threshold * max_reading)){
            started = true;
            printf("Started at %d\n", i);
        }

        if(started){
            signal1[start] = filtered_signal_1[i];
            signal2[start] = filtered_signal_2[i];
            signal3[start] = filtered_signal_3[i];
            start++;
        }

        if(start == signal_size){
            break;
        }
    }

    //Start real algorithm
    float wavelength = c / freq;
    float d = width / wavelength;

    int incident_angles[181];
    float x[M];
    float y[M];

    for(int i = 0 ; i < 181; i++){
        incident_angles[i] = i;
    }

    for(int i = 0 ; i < M; i++){
        x[i] = i * d;
        y[i] = 0.0;
    }

    float theta_rad;

    complex float scanningvectors[M][181];

    for(int j = 0; j < M; j++){
        for(int i = 0; i < 181; i++){
            theta_rad = deg2rad(incident_angles[i]);
            scanningvectors[j][i] = cexp( I * 2 * M_PI * ( x[j] * cos(theta_rad) + y[j] * sin(theta_rad) ) );
        }
    }
    
    double data1[2 * signal_size];
    double data2[2 * signal_size];
    double data3[2 * signal_size];

    for(int i = 0; i < signal_size; i++){
        data1[2 * i] = signal1[i];
        data2[2 * i] = signal2[i];
        data3[2 * i] = signal3[i];
    }

    complex double analytic_signal_1[signal_size];
    complex double analytic_signal_2[signal_size];
    complex double analytic_signal_3[signal_size];

    analytic_signal(data1, analytic_signal_1);
    analytic_signal(data2, analytic_signal_2);
    analytic_signal(data3, analytic_signal_3);

    complex float** R;
    initialize(&R, M, M);

    complex float** soi;
    initialize(&soi, M, signal_size);

    complex float** soi_T;
    initialize(&soi_T, signal_size, M);

    for(int i = 0; i < signal_size; i++){
        soi[0][i] = analytic_signal_1[i];
        soi[1][i] = analytic_signal_2[i];
        soi[2][i] = analytic_signal_3[i];

        for(int j = 0; j < M; j++){
            soi_T[i][j] = conj(soi[j][i]);
        }
    }

    bool dot = complexDotProduct(R, soi, M, signal_size, soi_T, signal_size, M);

    for(int i = 0; i < M; i++){
        for(int j = 0; j < M; j++){
            R[i][j] /= (float) signal_size;
            printf("%f %fi ; ", creal(R[i][j]), cimag(R[i][j]) );
        }
        printf("\n");
    }

    complex float test = multiplyComplex(  (1 + 1 * I), (1 - 1 * I)  ) ;

    //https://www.intel.com/content/www/us/en/docs/onemkl/code-samples-lapack/2023-1/zgeev-example-c.html

    /* Locals */
    int n = N, lda = LDA, ldvl = LDVL, ldvr = LDVR, info, lwork;
    dcomplex wkopt;
    dcomplex* work;
    /* Local arrays */
    /* rwork dimension should be at least 2*n */
    double rwork[2*N];
    dcomplex w[N], vl[LDVL*N], vr[LDVR*N];
    dcomplex a[LDA*N];

    for(int i = 0; i < N; i++){
        for(int j = 0; j < N; j++){
            a[3 * i + j].re = creal(R[i][j]);
            a[3 * i + j].im = cimag(R[i][j]);
        }
    }

    /* Executable statements */
    //printf( " ZGEEV Example Program Results\n" );
    /* Query and allocate the optimal workspace */
    lwork = -1;
    zgeev_( "Vectors", "Vectors", &n, a, &lda, w, vl, &ldvl, vr, &ldvr, &wkopt, &lwork, rwork, &info );
    lwork = (int)wkopt.re;
    work = (dcomplex*)malloc( lwork*sizeof(dcomplex) );
    /* Solve eigenproblem */
    zgeev_( "Vectors", "Vectors", &n, a, &lda, w, vl, &ldvl, vr, &ldvr, work, &lwork, rwork, &info );
    /* Check for convergence */
    if( info > 0 ) {
            printf( "The algorithm failed to compute eigenvalues.\n" );
            exit( 1 );
    }
    /* Print eigenvalues */
    //print_matrix( "Eigenvalues", 1, n, w, 1 );
    /* Print left eigenvectors */
    //print_matrix( "Left eigenvectors", n, n, vl, ldvl );
    /* Print right eigenvectors */
    //print_matrix( "Right eigenvectors", n, n, vr, ldvr );
    /* Free workspace */
    free( (void*)work );

    zero(R, M, M);

    complex float** E;
    initialize(&E, M, M - SIGNALDIM);

    complex float** E_H;
    initialize(&E_H, M - SIGNALDIM, M);
    
    //Remove one noise dimension
    float eigenvalues[M];
    for(int i = 0; i < M; i++){
        eigenvalues[i] = w[i].re + I * w[i].im;
    }

    complex float eigenvector1[M];
    complex float eigenvector2[M];
    complex float eigenvector3[M];

    for(int i = 0; i < M; i++){
        eigenvector1[i] = vr[M * 0 + i].re + I * vr[M * 0 + i].im ;
        eigenvector2[i] = vr[M * 1 + i].re + I * vr[M * 1 + i].im ;
        eigenvector3[i] = vr[M * 2 + i].re + I * vr[M * 2 + i].im ;
    }

    //Assuming only 3 eigenvalues
    if(eigenvalues[0] > eigenvalues[1] && eigenvalues[0] > eigenvalues[2]){
        //First is largest

        if(eigenvalues[1] > eigenvalues[2]){
            //Order: 1, 2, 3
            //Only care about eigenvectors of 3 & 2

            E[0][0] = eigenvector3[0];//vr[3][0];
            E[1][0] = eigenvector3[1];//vr[3][1];
            E[2][0] = eigenvector3[2];//vr[3][2];

            E[0][1] = eigenvector2[0];
            E[1][1] = eigenvector2[1];
            E[2][1] = eigenvector2[2];

        } else{
            //Order: 1, 3, 2
            //Only care about eigenvectors of 2 & 3

            E[0][0] = eigenvector2[0];//vr[3][0];
            E[1][0] = eigenvector2[1];//vr[3][1];
            E[2][0] = eigenvector2[2];//vr[3][2];

            E[0][1] = eigenvector3[0];
            E[1][1] = eigenvector3[1];
            E[2][1] = eigenvector3[2];
        }

    } else{
        if(eigenvalues[1] > eigenvalues[0] && eigenvalues[1] > eigenvalues[2]){
            //Second is largest

            if(eigenvalues[0] > eigenvalues[2]){
                //Order: 2, 1, 3
                //Only care about eigenvectors of 3 & 1

                E[0][0] = eigenvector3[0];//vr[3][0];
                E[1][0] = eigenvector3[1];//vr[3][1];
                E[2][0] = eigenvector3[2];//vr[3][2];

                E[0][1] = eigenvector1[0];
                E[1][1] = eigenvector1[1];
                E[2][1] = eigenvector1[2];

            } else{
                //Order: 2, 3, 1
                //Only care about eigenvectors of 1 & 3

                E[0][0] = eigenvector1[0];//vr[3][0];
                E[1][0] = eigenvector1[1];//vr[3][1];
                E[2][0] = eigenvector1[2];//vr[3][2];

                E[0][1] = eigenvector3[0];
                E[1][1] = eigenvector3[1];
                E[2][1] = eigenvector3[2];
            }

        } else{
            //Third is largest
            if(eigenvalues[0] > eigenvalues[1]){
                //Order: 3, 1, 2
                //Only care about eigenvectors of 2 & 1

                E[0][0] = eigenvector2[0];//vr[3][0];
                E[1][0] = eigenvector2[1];//vr[3][1];
                E[2][0] = eigenvector2[2];//vr[3][2];

                E[0][1] = eigenvector1[0];
                E[1][1] = eigenvector1[1];
                E[2][1] = eigenvector1[2];
            } else{
                //Order: 3, 2, 1
                //Only care about eigenvectors of 1 & 2

                E[0][0] = eigenvector1[0];//vr[3][0];
                E[1][0] = eigenvector1[1];//vr[3][1];
                E[2][0] = eigenvector1[2];//vr[3][2];

                E[0][1] = eigenvector2[0];
                E[1][1] = eigenvector2[1];
                E[2][1] = eigenvector2[2];
            }
        }
    }

    for(int i = 0 ; i < M - SIGNALDIM ; i++){
        for(int j = 0; j < M; j++){
            E[j][i] = conj(E[j][i]);
        }
    }

    float ADORT[181];
    int theta_index = 0;

    for(int i = 0; i < M; i++){
        for(int j = 0; j < M - SIGNALDIM; j++){
            E_H[j][i] = conj(E[i][j]);
        }
    }

    complex float** S_theta_;
    initialize(&S_theta_, M, 1);

    complex float** S_theta_H;
    initialize(&S_theta_H, 1, M);

    complex float** E_product;
    initialize(&E_product, M, M);

    complex float** first_product;
    initialize(&first_product, 1, M);

    complex float** final_product;
    initialize(&final_product, 1, 1);

    complexDotProduct(E_product, E, M, M - SIGNALDIM, E_H, M - SIGNALDIM, M);

    float complex_dist;
    
    for(int i = 0; i < 181; i++){
        S_theta_[0][0] = scanningvectors[0][i];
        S_theta_[1][0] = scanningvectors[1][i];
        S_theta_[2][0] = scanningvectors[2][i];

        S_theta_H[0][0] = conj(S_theta_[0][0]);
        S_theta_H[0][1] = conj(S_theta_[1][0]);
        S_theta_H[0][2] = conj(S_theta_[2][0]);

        //S_theta_  = np.matrix(S_theta_).getT()

        complexDotProduct(first_product, S_theta_H, 1, M, E_product, M, M);
        complexDotProduct(final_product, first_product, 1, M, S_theta_, M, 1);

        complex_dist = pow( pow( creal(final_product[0][0]), 2 ) + pow( cimag(final_product[0][0]), 2 ) , 0.5 ) ;

        ADORT[theta_index] = pow( complex_dist , -1. );
        
        theta_index++;

        zero(first_product, 1, M);
        zero(final_product, 1, 1);
    }

    int direction_of_arrival = 0;
    float maxVal = 0;
    for(int i = 0; i < 181; i++){
        if( ADORT[i] > maxVal ){
            maxVal = ADORT[i];
            direction_of_arrival = i;
        }
    }

    gettimeofday(&stoptime, NULL);
    printf("Time taken: %lu microseconds\n", (stoptime.tv_sec - starttime.tv_sec) * 1000000 + stoptime.tv_usec - starttime.tv_usec);

    return direction_of_arrival;
}

int main() {
    /*filtered_signal_1 = (double *)calloc(MAX_SIGNAL_SIZE, sizeof(double));
    filtered_signal_2 = (double *)calloc(MAX_SIGNAL_SIZE, sizeof(double));
    filtered_signal_3 = (double *)calloc(MAX_SIGNAL_SIZE, sizeof(double));

    highpass(filtered_signal_1, "Mic1.txt");
    lowpass(filtered_signal_1);

    highpass(filtered_signal_2, "Mic2.txt");
    lowpass(filtered_signal_2);

    highpass(filtered_signal_3, "Mic3.txt");
    lowpass(filtered_signal_3);*/

    printf("Direction of arrival: %d\n", DOA());

    return 0;
}
