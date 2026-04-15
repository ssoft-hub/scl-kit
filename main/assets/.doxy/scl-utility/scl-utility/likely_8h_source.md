

# File likely.h

[**File List**](files.md) **>** [**attribute**](dir_329a2a35dc2fa6e7b16bddbfbc08f988.md) **>** [**likely.h**](likely_8h.md)

[Go to the documentation of this file](likely_8h.md)


```C++
#pragma once

#ifndef SCL_LIKELY
#if __has_cpp_attribute(likely)
#define SCL_LIKELY [[likely]]
#else
#define SCL_LIKELY
#endif
#endif

#ifndef SCL_UNLIKELY
#if __has_cpp_attribute(unlikely)
#define SCL_UNLIKELY [[unlikely]]
#else
#define SCL_UNLIKELY
#endif
#endif

#ifndef SCL_LIKELY_EXPR
#if defined(_MSC_VER) && !defined(__clang__)
#define SCL_LIKELY_EXPR(expr) (!!(expr))
#define SCL_UNLIKELY_EXPR(expr) (!!(expr))
#elif defined(__has_builtin) && __has_builtin(__builtin_expect)
#define SCL_LIKELY_EXPR(expr) __builtin_expect(!!(expr), 1)
#define SCL_UNLIKELY_EXPR(expr) __builtin_expect(!!(expr), 0)
#else
#define SCL_LIKELY_EXPR(expr) (!!(expr))
#define SCL_UNLIKELY_EXPR(expr) (!!(expr))
#endif
#endif

#ifndef SCL_UNLIKELY_EXPR
#define SCL_UNLIKELY_EXPR(expr) (!!(expr))
#endif
```


