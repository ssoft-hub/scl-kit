

# File unsequenced.h

[**File List**](files.md) **>** [**attribute**](dir_329a2a35dc2fa6e7b16bddbfbc08f988.md) **>** [**unsequenced.h**](unsequenced_8h.md)

[Go to the documentation of this file](unsequenced_8h.md)


```C++
#pragma once




#ifndef SCL_UNSEQUENCED
#if __has_cpp_attribute(unsequenced)
#define SCL_UNSEQUENCED(...) __VA_ARGS__ [[unsequenced]]
#elif defined(_MSC_VER) && !defined(__clang__)
#define SCL_UNSEQUENCED(...) __VA_ARGS__
#elif __has_cpp_attribute(gnu::const)
#define SCL_UNSEQUENCED(...) [[gnu::const]] __VA_ARGS__
#elif defined(__has_attribute) && __has_attribute(const)
#define SCL_UNSEQUENCED(...) __attribute__((const)) __VA_ARGS__
#else
#define SCL_UNSEQUENCED(...) __VA_ARGS__
#endif
#endif

#ifndef SCL_REPRODUCIBLE
#if __has_cpp_attribute(reproducible)
#define SCL_REPRODUCIBLE(...) __VA_ARGS__ [[reproducible]]
#elif defined(_MSC_VER) && !defined(__clang__)
#define SCL_REPRODUCIBLE(...) __VA_ARGS__
#elif __has_cpp_attribute(gnu::pure)
#define SCL_REPRODUCIBLE(...) [[gnu::pure]] __VA_ARGS__
#elif defined(__has_attribute) && __has_attribute(pure)
#define SCL_REPRODUCIBLE(...) __attribute__((pure)) __VA_ARGS__
#else
#define SCL_REPRODUCIBLE(...) __VA_ARGS__
#endif
#endif
```


