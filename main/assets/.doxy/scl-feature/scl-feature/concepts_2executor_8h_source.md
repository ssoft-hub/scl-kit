

# File executor.h

[**File List**](files.md) **>** [**concepts**](dir_f37dd920b215c7d361cd7dbe8578ca36.md) **>** [**executor.h**](concepts_2executor_8h.md)

[Go to the documentation of this file](concepts_2executor_8h.md)


```C++
#pragma once

#include <scl/feature/type_traits/executor.h>

namespace scl::feature::concepts
{
    template <typename Type>
    concept executor = ::scl::feature::is_executor_v<Type>;
} // namespace scl::feature::concepts
```


