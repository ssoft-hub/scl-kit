

# File nodiscard.h

[**File List**](files.md) **>** [**attribute**](dir_329a2a35dc2fa6e7b16bddbfbc08f988.md) **>** [**nodiscard.h**](nodiscard_8h.md)

[Go to the documentation of this file](nodiscard_8h.md)


```C++
#pragma once




#ifndef SCL_NODISCARD
#if __has_cpp_attribute(nodiscard) >= 201907L
#define SCL_NODISCARD [[nodiscard]]
#define SCL_NODISCARD_MSG(msg) [[nodiscard(msg)]]
#elif __has_cpp_attribute(nodiscard)
#define SCL_NODISCARD [[nodiscard]]
#define SCL_NODISCARD_MSG(msg) [[nodiscard]]
#elif defined(__has_attribute) && __has_attribute(warn_unused_result)
#define SCL_NODISCARD __attribute__((warn_unused_result))
#define SCL_NODISCARD_MSG(msg) __attribute__((warn_unused_result))
#else
#define SCL_NODISCARD
#define SCL_NODISCARD_MSG(msg)
#endif
#endif

#ifndef SCL_NODISCARD_MSG
#define SCL_NODISCARD_MSG(msg) SCL_NODISCARD
#endif
```


