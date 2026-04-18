

# File deprecated.h

[**File List**](files.md) **>** [**attribute**](dir_329a2a35dc2fa6e7b16bddbfbc08f988.md) **>** [**deprecated.h**](deprecated_8h.md)

[Go to the documentation of this file](deprecated_8h.md)


```C++
#pragma once

#ifndef SCL_DEPRECATED
#if __has_cpp_attribute(deprecated)
#define SCL_DEPRECATED [[deprecated]]
#define SCL_DEPRECATED_MSG(msg) [[deprecated(msg)]]
#elif defined(_MSC_VER) && !defined(__clang__)
#define SCL_DEPRECATED __declspec(deprecated)
#define SCL_DEPRECATED_MSG(msg) __declspec(deprecated(msg))
#elif defined(__has_attribute) && __has_attribute(deprecated)
#define SCL_DEPRECATED __attribute__((deprecated))
#define SCL_DEPRECATED_MSG(msg) __attribute__((deprecated(msg)))
#else
#define SCL_DEPRECATED
#define SCL_DEPRECATED_MSG(msg)
#endif
#endif

#ifndef SCL_DEPRECATED_MSG
#define SCL_DEPRECATED_MSG(msg) SCL_DEPRECATED
#endif
```


