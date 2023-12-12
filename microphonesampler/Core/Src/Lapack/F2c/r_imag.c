#include "../../Lapack/Include/f2c.h"
#ifdef __cplusplus
extern "C" {
#endif

#ifdef KR_headers
double r_imag(z) fcomplex *z;
#else
double r_imag(fcomplex *z)
#endif
{
return(z->i);
}
#ifdef __cplusplus
}
#endif
