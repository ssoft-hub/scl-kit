

# File wrapper.h

[**File List**](files.md) **>** [**concepts**](dir_f37dd920b215c7d361cd7dbe8578ca36.md) **>** [**wrapper.h**](concepts_2wrapper_8h.md)

[Go to the documentation of this file](concepts_2wrapper_8h.md)


```C++
#pragma once

#include <scl/feature/type_traits/wrapper.h>

namespace scl::feature::concepts
{
    template <typename T>
    concept wrapper_type = ::scl::feature::is_wrapper_v<T>;
} // namespace scl::feature::concepts
```


