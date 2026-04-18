

# File access.h

[**File List**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**reflection**](dir_262f3534dca743723347393893d6556e.md) **>** [**access.h**](access_8h.md)

[Go to the documentation of this file](access_8h.md)


```C++
#pragma once


#include <scl/feature/type_traits/executor.h>

#include <type_traits>

#define SCL_EXECUTOR_ACCESS(cv_ref) \
    ::scl::feature::executor_trait<S_c_L_type_>::executor(static_cast<S_c_L_type_ cv_ref>(*this))

#define SCL_VALUE_DECLVAL(cv_ref) \
    S_c_L_executor_type_::value(::std::declval<S_c_L_executor_type_ cv_ref>())

#define SCL_VALUE_ACCESS(cv_ref) S_c_L_executor_type_::value(SCL_EXECUTOR_ACCESS(cv_ref))
```


