#pragma once

#if defined ANDROID || defined __ANDROID__
#if __ANDROID_API__ < 24
#define ___BUILD_ANDROID_IFADDRS_SUPPORT
#endif /* __ANDROID_API__ < 24 */
#endif /* defined ANDROID || defined __ANDROID__ */

#ifdef ___BUILD_ANDROID_IFADDRS_SUPPORT

#include <sys/types.h>
#include <ifaddrs.h>
#include <sys/cdefs.h>

__BEGIN_DECLS
void freeifaddrs(struct ifaddrs* list);
int getifaddrs(struct ifaddrs** out);
__END_DECLS

#endif /* ___BUILD_ANDROID_IFADDRS_SUPPORT */
