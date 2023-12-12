#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "bandpass.h"

double signal[MAX_SIGNAL_SIZE];
double filtered_signal_1[MAX_SIGNAL_SIZE];
double filtered_signal_2[MAX_SIGNAL_SIZE];
double filtered_signal_3[MAX_SIGNAL_SIZE];

double raw_data1[MAX_SIGNAL_SIZE];
double raw_data2[MAX_SIGNAL_SIZE];
double raw_data3[MAX_SIGNAL_SIZE];


double b[13] = { 1.96388456e-07,  0.00000000e+00, -1.17833074e-06,  0.00000000e+00,
                 2.94582684e-06,  0.00000000e+00, -3.92776912e-06,  0.00000000e+00,
                 2.94582684e-06,  0.00000000e+00, -1.17833074e-06,  0.00000000e+00,
                 1.96388456e-07 };
double a[13] = { 1., -9.73518949, 44.89144749, -129.27097137,
                258.44035421, -377.47482575, 412.76768439, -340.41377444,
                210.18376234, -94.81159027, 29.6927554, -5.80722751,
                0.53800442 };

  double delay[25] = {0};
  double filtered_sig[1] = {};

double max_reading = 0;
int max_entry = 0;

void bb_digital_double_filter(double *b, double *a, double *x, double *y, double *Z, int len_b, uint32_t len_x, int stride_X, int stride_Y)
{

  double *ptr_x = x, *ptr_y = y;
  double *ptr_Z;
  double *ptr_b = (double*)b;
  double *ptr_a = (double*)a;
  double *xn, *yn;
  const double a0 = *((double *)a);
  int n;
  uint32_t k;

  /* normalize the filter coefs only once. */
  for (n = 0; n < len_b; ++n) {
    ptr_b[n] /= a0;
    ptr_a[n] /= a0;
  }

  for (k = 0; k < len_x; k++) {
    ptr_b = (double *)b;   /* Reset a and b pointers */
    ptr_a = (double *)a;
    xn = (double *)ptr_x;
    yn = (double *)ptr_y;
    if (len_b > 1) {
      ptr_Z = ((double *)Z);
      *yn = *ptr_Z + *ptr_b  * *xn;   /* Calculate first delay (output) */
      ptr_b++;
      ptr_a++;
      /* Fill in middle delays */
      for (n = 0; n < len_b - 2; n++) {
        *ptr_Z =
          ptr_Z[1] + *xn * (*ptr_b) - *yn * (*ptr_a);
        ptr_b++;
        ptr_a++;
        ptr_Z++;
      }
      /* Calculate last delay */
      *ptr_Z = *xn * (*ptr_b) - *yn * (*ptr_a);
    }
    else {
      *yn = *xn * (*ptr_b);
    }

    ptr_y += stride_Y;      /* Move to next input/output point */
    ptr_x += stride_X;
  }

}

/*int main()
{

  FILE* readptr;
  readptr = fopen("/home/nikhil/Desktop/avbotz/Mic1.txt", "r");

  FILE* writeptr;
  writeptr = fopen("/home/nikhil/Desktop/avbotz/bpfiltered.txt", "w");

  int i = 0;

  if(readptr == NULL){
        printf("Failed to open file.\n");
  } else{
      char line[20];
      while(fgets(line, sizeof(line), readptr)){
          signal[i] = atof(line);
          i++;
        }
    }

  fclose(readptr);

  for (int j = 0; j < i; j++)
  {
    bb_digital_double_filter(b, a, &signal[j], filtered_sig, delay, 13, 1, 1, 1);
    //printf("%f\n", y[0]);
    fprintf(writeptr, "%lf\n", filtered_sig[0]);
  }

  fclose(writeptr);

  return 0;

}*/