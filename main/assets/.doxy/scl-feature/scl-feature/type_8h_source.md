

# File type.h

[**File List**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**reflection**](dir_262f3534dca743723347393893d6556e.md) **>** [**type.h**](type_8h.md)

[Go to the documentation of this file](type_8h.md)


```C++
#pragma once


#include <type_traits>

#define SCL_REFLECT_TYPE(type, executor) \
    using S_c_L_type_ = type;            \
    using S_c_L_executor_type_ = executor;
```


