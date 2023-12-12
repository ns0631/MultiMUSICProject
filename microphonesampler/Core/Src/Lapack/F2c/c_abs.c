#include "../../Lapack/Include/f2c.h"
#ifdef __cplusplus
extern "C" {
#endif

#ifdef KR_headers
extern double f__cabs();

double c_abs(z) fcomplex *z;
#else
extern double f__cabs(double, double);

double c_abs(fcomplex *z)
#endif
{
return( f__cabs( z->r, z->i ) );
}
#ifdef __cplusplus
}
#endif
