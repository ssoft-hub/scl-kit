

# File hotcold.h

[**File List**](files.md) **>** [**attribute**](dir_329a2a35dc2fa6e7b16bddbfbc08f988.md) **>** [**hotcold.h**](hotcold_8h.md)

[Go to the documentation of this file](hotcold_8h.md)


```C++
#pragma once




#ifndef SCL_HOT
#if defined(_MSC_VER) && !defined(__clang__)
#define SCL_HOT
#elif __has_cpp_attribute(gnu::hot)
#define SCL_HOT [[gnu::hot]]
#elif defined(__has_attribute) && __has_attribute(hot)
#define SCL_HOT __attribute__((hot))
#else
#define SCL_HOT
#endif
#endif

#ifndef SCL_COLD
#if defined(_MSC_VER) && !defined(__clang__)
#define SCL_COLD
#elif __has_cpp_attribute(gnu::cold)
#define SCL_COLD [[gnu::cold]]
#elif defined(__has_attribute) && __has_attribute(cold)
#define SCL_COLD __attribute__((cold))
#else
#define SCL_COLD
#endif
#endif
```


