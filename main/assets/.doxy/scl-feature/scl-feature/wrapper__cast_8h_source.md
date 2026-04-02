

# File wrapper\_cast.h

[**File List**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**wrapper\_cast.h**](wrapper__cast_8h.md)

[Go to the documentation of this file](wrapper__cast_8h.md)


```C++
#pragma once

#ifndef DOXYGEN

#include <scl/feature/detail/wrapper_cast.h>
#include <scl/feature/type_traits/wrapper.h>

#include <type_traits>
#include <utility>

namespace scl
{
    template <typename Refer>
    using wrapper_caster = ::scl::feature::detail::wrapper_caster<Refer>;

    template <typename Wrapper>
    [[nodiscard]]
    constexpr decltype(auto) wrapper_cast(Wrapper && w)
        requires ::scl::feature::is_wrapper_v<::std::remove_cvref_t<Wrapper>>
    {
        return ::scl::wrapper_caster<Wrapper &&>{::std::forward<Wrapper>(w)};
    }

    template <typename Value>
    [[nodiscard]]
    constexpr decltype(auto) wrapper_cast(Value && v) noexcept
        requires(!::scl::feature::is_wrapper_v<::std::remove_cvref_t<Value>>)
    {
        return ::std::forward<Value>(v);
    }
} // namespace scl

#else // DOXYGEN

namespace scl
{
    template <typename Refer>
    class wrapper_caster
    {
    public:
        wrapper_caster(wrapper_caster &&) = delete;
        wrapper_caster(wrapper_caster const &) = delete;
        wrapper_caster & operator=(wrapper_caster &&) = delete;
        wrapper_caster & operator=(wrapper_caster const &) = delete;

        explicit wrapper_caster(Refer ref);

        ~wrapper_caster();

        operator Refer() &&;

        template <typename T>
        T get() &&;
    };

    template <typename Wrapper>
    [[nodiscard]]
    constexpr decltype(auto) wrapper_cast(Wrapper && w);

    template <typename Value>
    [[nodiscard]]
    constexpr decltype(auto) wrapper_cast(Value && v) noexcept;

} // namespace scl

#endif // DOXYGEN
```


