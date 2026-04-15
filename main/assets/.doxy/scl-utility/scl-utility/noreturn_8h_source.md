

# File noreturn.h

[**File List**](files.md) **>** [**attribute**](dir_329a2a35dc2fa6e7b16bddbfbc08f988.md) **>** [**noreturn.h**](noreturn_8h.md)

[Go to the documentation of this file](noreturn_8h.md)


```C++
#pragma once

#ifndef SCL_NORETURN
#if __has_cpp_attribute(noreturn)
#define SCL_NORETURN [[noreturn]]
#elif defined(_MSC_VER) && !defined(__clang__)
#define SCL_NORETURN __declspec(noreturn)
#elif defined(__has_attribute) && __has_attribute(noreturn)
#define SCL_NORETURN __attribute__((noreturn))
#else
#define SCL_NORETURN
#endif
#endif
```


