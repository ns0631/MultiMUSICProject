#include "../../Lapack/Include/f2c.h"
#ifdef __cplusplus
extern "C" {
#endif

#ifdef KR_headers
extern integer s_cmp();
logical l_gt(a,b,la,lb) char *a, *b; ftnlen la, lb;
#else
extern integer s_cmp(char *, char *, ftnlen, ftnlen);
logical l_gt(char *a, char *b, ftnlen la, ftnlen lb)
#endif
{
return(s_cmp(a,b,la,lb) > 0);
}
#ifdef __cplusplus
}
#endif
