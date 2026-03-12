

# File plain.h

[**File List**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**inplace**](dir_a84fae2e5328daedf40681be880e8335.md) **>** [**plain.h**](plain_8h.md)

[Go to the documentation of this file](plain_8h.md)


```C++
#pragma once

#include <concepts>
#include <functional>
#include <utility>

#include <scl/utility/type_traits/forward_like.h>

namespace scl::feature::inplace
{
    template <typename Value>
    class plain
    {
        using self_type = plain<Value>;

    public:
        using value_type = Value;

    public:
        template <typename... Args>
        constexpr explicit plain(Args &&... args)
            : m_value{::std::forward<Args>(args)...}
        {}

    public:
        template <typename Self, typename Func, typename... Args>
        static constexpr decltype(auto) execute(Self && self, Func && func, Args &&... args)
            requires(::std::same_as<::std::remove_cvref_t<Self>, self_type> && ::std::invocable<Func, Args && ...>)
        {
            return ::std::invoke(::std::forward<Func>(func), ::std::forward<Args>(args)...);
        }

        template <typename Self>
        static constexpr decltype(auto) value(Self && self)
            requires ::std::same_as<::std::remove_cvref_t<Self>, self_type>
        {
            return ::scl::forward_like<Self>(self.m_value);
        }

    private:
        value_type m_value;
    };
} // namespace scl::feature::inplace
```


