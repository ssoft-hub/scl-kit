

# File overload\_cast.h

[**File List**](files.md) **>** [**module**](dir_a7b0466279106ea0b8f86f609f621680.md) **>** [**utility**](dir_cca185d4009e66bf68ef58b617abaf60.md) **>** [**src**](dir_ab13fdfb8e4c1ff98b437eee9f69d35c.md) **>** [**scl**](dir_ca45970a26780365ec2accbdb8d8d4fe.md) **>** [**utility**](dir_76f6b7cf5a6cf438d50211f1abeeaae6.md) **>** [**type\_traits**](dir_ee84acd7aed8e5e3b0eed877408f2d18.md) **>** [**overload\_cast.h**](overload__cast_8h.md)

[Go to the documentation of this file](overload__cast_8h.md)


```C++
#pragma once

#include <type_traits>

namespace scl::detail
{
    template <class... Args>
    struct overload_cast
    {
        template <class Class, class R>
        constexpr auto operator()(R (Class::*ptr)(Args...)) const noexcept -> decltype(ptr)
        {
            return ptr;
        }
        template <class Class, class R>
        constexpr auto operator()(R (Class::*ptr)(Args...) noexcept) const noexcept -> decltype(ptr)
        {
            return ptr;
        }

        template <class Class, class R>
        constexpr auto operator()(R (Class::*ptr)(Args...) &) const noexcept -> decltype(ptr)
        {
            return ptr;
        }
        template <class Class, class R>
        constexpr auto operator()(R (Class::*ptr)(Args...) & noexcept) const noexcept -> decltype(ptr)
        {
            return ptr;
        }

        template <class Class, class R>
        constexpr auto operator()(R (Class::*ptr)(Args...) &&) const noexcept -> decltype(ptr)
        {
            return ptr;
        }
        template <class Class, class R>
        constexpr auto operator()(R (Class::*ptr)(Args...) && noexcept) const noexcept -> decltype(ptr)
        {
            return ptr;
        }

        template <class Class, class R>
        constexpr auto operator()(R (Class::*ptr)(Args...) const) const noexcept -> decltype(ptr)
        {
            return ptr;
        }
        template <class Class, class R>
        constexpr auto
        operator()(R (Class::*ptr)(Args...) const noexcept) const noexcept -> decltype(ptr)
        {
            return ptr;
        }

        template <class Class, class R>
        constexpr auto operator()(R (Class::*ptr)(Args...) const &) const noexcept -> decltype(ptr)
        {
            return ptr;
        }
        template <class Class, class R>
        constexpr auto
        operator()(R (Class::*ptr)(Args...) const & noexcept) const noexcept -> decltype(ptr)
        {
            return ptr;
        }

        template <class Class, class R>
        constexpr auto operator()(R (Class::*ptr)(Args...) const &&) const noexcept -> decltype(ptr)
        {
            return ptr;
        }
        template <class Class, class R>
        constexpr auto
        operator()(R (Class::*ptr)(Args...) const && noexcept) const noexcept -> decltype(ptr)
        {
            return ptr;
        }

        template <class Class, class R>
        constexpr auto operator()(R (Class::*ptr)(Args...) volatile) const noexcept -> decltype(ptr)
        {
            return ptr;
        }
        template <class Class, class R>
        constexpr auto
        operator()(R (Class::*ptr)(Args...) volatile noexcept) const noexcept -> decltype(ptr)
        {
            return ptr;
        }

        template <class Class, class R>
        constexpr auto operator()(R (Class::*ptr)(Args...) volatile &) const noexcept -> decltype(ptr)
        {
            return ptr;
        }
        template <class Class, class R>
        constexpr auto
        operator()(R (Class::*ptr)(Args...) volatile & noexcept) const noexcept -> decltype(ptr)
        {
            return ptr;
        }

        template <class Class, class R>
        constexpr auto operator()(R (Class::*ptr)(Args...) volatile &&) const noexcept -> decltype(ptr)
        {
            return ptr;
        }
        template <class Class, class R>
        constexpr auto
        operator()(R (Class::*ptr)(Args...) volatile && noexcept) const noexcept -> decltype(ptr)
        {
            return ptr;
        }

        template <class Class, class R>
        constexpr auto
        operator()(R (Class::*ptr)(Args...) const volatile) const noexcept -> decltype(ptr)
        {
            return ptr;
        }
        template <class Class, class R>
        constexpr auto
        operator()(R (Class::*ptr)(Args...) const volatile noexcept) const noexcept -> decltype(ptr)
        {
            return ptr;
        }

        template <class Class, class R>
        constexpr auto
        operator()(R (Class::*ptr)(Args...) const volatile &) const noexcept -> decltype(ptr)
        {
            return ptr;
        }
        template <class Class, class R>
        constexpr auto
        operator()(R (Class::*ptr)(Args...) const volatile & noexcept) const noexcept -> decltype(ptr)
        {
            return ptr;
        }

        template <class Class, class R>
        constexpr auto
        operator()(R (Class::*ptr)(Args...) const volatile &&) const noexcept -> decltype(ptr)
        {
            return ptr;
        }
        template <class Class, class R>
        constexpr auto
        operator()(R (Class::*ptr)(Args...) const volatile && noexcept) const noexcept -> decltype(ptr)
        {
            return ptr;
        }

        template <class R>
        constexpr auto operator()(R (*ptr)(Args...)) const noexcept -> decltype(ptr)
        {
            return ptr;
        }
        template <class R>
        constexpr auto operator()(R (*ptr)(Args...) noexcept) const noexcept -> decltype(ptr)
        {
            return ptr;
        }
    };
} // namespace scl::detail

namespace scl
{
    template <class... Args>
    inline constexpr detail::overload_cast<Args...> overload_cast{};

} // namespace scl
```


