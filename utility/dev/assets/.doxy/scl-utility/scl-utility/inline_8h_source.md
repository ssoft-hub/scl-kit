

# File inline.h

[**File List**](files.md) **>** [**attribute**](dir_329a2a35dc2fa6e7b16bddbfbc08f988.md) **>** [**inline.h**](inline_8h.md)

[Go to the documentation of this file](inline_8h.md)


```C++
#pragma once

#ifndef SCL_FORCE_INLINE
#if defined(_MSC_VER) && !defined(__clang__)
#define SCL_FORCE_INLINE __forceinline
#elif __has_cpp_attribute(gnu::always_inline)
#define SCL_FORCE_INLINE [[gnu::always_inline]] inline
#else
#define SCL_FORCE_INLINE inline
#endif
#endif

#ifndef SCL_NOINLINE
#if defined(_MSC_VER) && !defined(__clang__)
#define SCL_NOINLINE __declspec(noinline)
#elif __has_cpp_attribute(gnu::noinline)
#define SCL_NOINLINE [[gnu::noinline]]
#else
#define SCL_NOINLINE
#endif
#endif
```


