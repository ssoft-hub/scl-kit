

# File wrapper.h

[**File List**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**wrapper.h**](wrapper_8h.md)

[Go to the documentation of this file](wrapper_8h.md)


```C++
#pragma once

#include <scl/feature/detail/wrapper.h>
#include <scl/feature/inplace/plain.h>

#include <type_traits>

namespace scl::feature::detail
{
    template <typename State, template <typename> class... Executor>
    struct wrapper_fold
    {
        using type = State;
    };

    template <typename State, template <typename> class Executor, template <typename> class... Rest>
    struct wrapper_fold<State, Executor, Rest...>
    {
        using type = typename wrapper_fold<::scl::feature::detail::wrapper<State, Executor>, Rest...>::type;
    };

    template <typename Value, template <typename> class Executor, template <typename> class... Rest>
    struct wrapper_fold<::scl::feature::detail::wrapper<Value, Executor>, Executor, Rest...>
    {
        using type = typename wrapper_fold<::scl::feature::detail::wrapper<Value, Executor>, Rest...>::type;
    };
} // namespace scl::feature::detail

namespace scl
{
    template <typename Value, template <typename> class... Executors>
    using wrapper = ::std::conditional_t<sizeof...(Executors) == 0,
        typename ::scl::feature::detail::wrapper_fold<Value, ::scl::feature::inplace::plain>::type,
        typename ::scl::feature::detail::wrapper_fold<Value, Executors...>::type>;
} // namespace scl

```


