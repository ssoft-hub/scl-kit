

# File assume.h

[**File List**](files.md) **>** [**attribute**](dir_329a2a35dc2fa6e7b16bddbfbc08f988.md) **>** [**assume.h**](assume_8h.md)

[Go to the documentation of this file](assume_8h.md)


```C++
#pragma once




#ifndef SCL_ASSUME
#if __has_cpp_attribute(assume)
#define SCL_ASSUME(expr) [[assume(expr)]]
#elif defined(_MSC_VER) && !defined(__clang__)
#define SCL_ASSUME(expr) __assume(expr)
#elif defined(__has_builtin) && __has_builtin(__builtin_assume)
#define SCL_ASSUME(expr) __builtin_assume(expr)
#elif defined(__has_attribute) && __has_attribute(assume)
#define SCL_ASSUME(expr) __attribute__((assume(expr)))
#elif defined(__has_builtin) && __has_builtin(__builtin_unreachable)
#define SCL_ASSUME(expr) (static_cast<bool>(expr) ? (void)0 : __builtin_unreachable())
#else
#define SCL_ASSUME(expr) ((void)(expr))
#endif
#endif

#ifndef SCL_UNREACHABLE
#if defined(_MSC_VER) && !defined(__clang__)
#define SCL_UNREACHABLE() __assume(false)
#elif defined(__has_builtin) && __has_builtin(__builtin_unreachable)
#define SCL_UNREACHABLE() __builtin_unreachable()
#else
#define SCL_UNREACHABLE() ((void)0)
#endif
#endif
```


