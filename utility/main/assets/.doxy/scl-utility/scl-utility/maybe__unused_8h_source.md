

# File maybe\_unused.h

[**File List**](files.md) **>** [**attribute**](dir_329a2a35dc2fa6e7b16bddbfbc08f988.md) **>** [**maybe\_unused.h**](maybe__unused_8h.md)

[Go to the documentation of this file](maybe__unused_8h.md)


```C++
#pragma once

#ifndef SCL_MAYBE_UNUSED
#if __has_cpp_attribute(maybe_unused)
#define SCL_MAYBE_UNUSED [[maybe_unused]]
#elif defined(__has_attribute) && __has_attribute(unused)
#define SCL_MAYBE_UNUSED __attribute__((unused))
#else
#define SCL_MAYBE_UNUSED
#endif
#endif
```


