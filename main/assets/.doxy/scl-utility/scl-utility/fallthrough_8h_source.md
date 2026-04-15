

# File fallthrough.h

[**File List**](files.md) **>** [**attribute**](dir_329a2a35dc2fa6e7b16bddbfbc08f988.md) **>** [**fallthrough.h**](fallthrough_8h.md)

[Go to the documentation of this file](fallthrough_8h.md)


```C++
#pragma once

#ifndef SCL_FALLTHROUGH
#if __has_cpp_attribute(fallthrough)
#define SCL_FALLTHROUGH [[fallthrough]]
#elif defined(__has_attribute) && __has_attribute(fallthrough)
#define SCL_FALLTHROUGH __attribute__((fallthrough))
#else
#define SCL_FALLTHROUGH ((void)0)
#endif
#endif
```


