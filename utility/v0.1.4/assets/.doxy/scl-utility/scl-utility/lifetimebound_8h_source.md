

# File lifetimebound.h

[**File List**](files.md) **>** [**attribute**](dir_329a2a35dc2fa6e7b16bddbfbc08f988.md) **>** [**lifetimebound.h**](lifetimebound_8h.md)

[Go to the documentation of this file](lifetimebound_8h.md)


```C++
#pragma once



#ifndef SCL_LIFETIMEBOUND
#if defined(_MSC_VER) && !defined(__clang__)
#define SCL_LIFETIMEBOUND
#elif __has_cpp_attribute(clang::lifetimebound)
#define SCL_LIFETIMEBOUND [[clang::lifetimebound]]
#elif defined(__has_attribute) && __has_attribute(lifetimebound)
#define SCL_LIFETIMEBOUND __attribute__((lifetimebound))
#else
#define SCL_LIFETIMEBOUND
#endif
#endif
```


