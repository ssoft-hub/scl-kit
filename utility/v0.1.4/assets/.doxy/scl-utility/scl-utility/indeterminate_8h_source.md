

# File indeterminate.h

[**File List**](files.md) **>** [**attribute**](dir_329a2a35dc2fa6e7b16bddbfbc08f988.md) **>** [**indeterminate.h**](indeterminate_8h.md)

[Go to the documentation of this file](indeterminate_8h.md)


```C++
#pragma once

#ifndef SCL_INDETERMINATE
#if __has_cpp_attribute(indeterminate)
#define SCL_INDETERMINATE [[indeterminate]]
#else
#define SCL_INDETERMINATE
#endif
#endif
```


