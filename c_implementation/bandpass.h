#include <stdint.h>

#define MAX_SIGNAL_SIZE 3000000

void bb_digital_double_filter(double *b, double *a, double *x, double *y, double *Z, int len_b, uint32_t len_x, int stride_X, int stride_Y);

extern double b[];
extern double a[];
extern double delay[];
extern double filtered_sig[];

extern double raw_data1[];
extern double raw_data2[];
extern double raw_data3[];

extern double filtered_signal_1[];
extern double filtered_signal_2[];
extern double filtered_signal_3[];

extern double max_reading;
extern int max_entry;