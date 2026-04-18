

# File wrapper.h

[**File List**](files.md) **>** [**concepts**](dir_f37dd920b215c7d361cd7dbe8578ca36.md) **>** [**wrapper.h**](concepts_2wrapper_8h.md)

[Go to the documentation of this file](concepts_2wrapper_8h.md)


```C++
#pragma once

#include <scl/feature/type_traits/wrapper.h>

namespace scl::feature::concepts
{
    template <typename Type>
    concept wrapper = ::scl::feature::is_wrapper_v<Type>;

    template <typename Expected, typename Type>
    concept compatible_with = ::scl::feature::is_compatible_with_v<Expected, Type>;

    template <typename Expected, typename Type>
    concept compatible_with_part_of = ::scl::feature::is_compatible_with_part_of_v<Expected, Type>;

    template <typename Expected, typename Type>
    concept part_compatible_with = ::scl::feature::is_part_compatible_with_v<Expected, Type>;
} // namespace scl::feature::concepts
```


