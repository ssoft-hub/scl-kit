

# File wrapper.h

[**File List**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**type\_traits**](dir_910e174fc0e8c8ed40843bba5172f2f4.md) **>** [**wrapper.h**](type__traits_2wrapper_8h.md)

[Go to the documentation of this file](type__traits_2wrapper_8h.md)


```C++
#pragma once

#include <scl/feature/detail/wrapper.h>

#include <type_traits>

namespace scl::feature::detail
{
    template <typename T>
    struct is_wrapper : ::std::false_type
    {};

    template <typename Value, template <typename> class Executor>
    struct is_wrapper<wrapper<Value, Executor>> : ::std::true_type
    {};
} // namespace scl::feature::detail

namespace scl::feature
{
    template <typename T>
    struct is_wrapper : ::scl::feature::detail::is_wrapper<::std::remove_cv_t<T>>
    {};

    template <typename T>
    inline constexpr bool is_wrapper_v = is_wrapper<T>::value;
} // namespace scl::feature
```


