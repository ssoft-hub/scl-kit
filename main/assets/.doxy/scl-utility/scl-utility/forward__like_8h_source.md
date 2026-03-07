

# File forward\_like.h

[**File List**](files.md) **>** [**module**](dir_a7b0466279106ea0b8f86f609f621680.md) **>** [**utility**](dir_cca185d4009e66bf68ef58b617abaf60.md) **>** [**src**](dir_ab13fdfb8e4c1ff98b437eee9f69d35c.md) **>** [**scl**](dir_ca45970a26780365ec2accbdb8d8d4fe.md) **>** [**utility**](dir_76f6b7cf5a6cf438d50211f1abeeaae6.md) **>** [**type\_traits**](dir_ee84acd7aed8e5e3b0eed877408f2d18.md) **>** [**forward\_like.h**](forward__like_8h.md)

[Go to the documentation of this file](forward__like_8h.md)


```C++
#pragma once

#include <type_traits>

namespace scl::detail
{
    // Add const from From onto To if From is const (ignoring reference)
    template <typename From, typename To>
    using add_const_from_t =
        ::std::conditional_t<::std::is_const_v<::std::remove_reference_t<From>>, ::std::add_const_t<To>, To>;

    // Add volatile from From onto To if From is volatile (ignoring reference)
    template <typename From, typename To>
    using add_volatile_from_t =
        ::std::conditional_t<::std::is_volatile_v<::std::remove_reference_t<From>>, ::std::add_volatile_t<To>, To>;

    // Add both const and volatile from From to To (ignoring reference)
    template <typename From, typename To>
    using add_cv_from_t = add_const_from_t<From, add_volatile_from_t<From, To>>;

    // Copy ref from From onto To: if From is &, add &, if && add &&, else no reference.
    //s Don't add reference to void.
    template <typename From, typename To>
    using add_reference_like_t = ::std::conditional_t<::std::is_lvalue_reference_v<From>,
        ::std::conditional_t<::std::is_void_v<To>, To, ::std::add_lvalue_reference_t<To>>,
        ::std::conditional_t<::std::is_rvalue_reference_v<From>,
            ::std::conditional_t<::std::is_void_v<To>, To, ::std::add_rvalue_reference_t<To>>,
            To>>;

} // namespace scl::detail

namespace scl
{
    template <typename Base, typename Type>
    using forward_like_t = ::scl::detail::add_reference_like_t<Base,
        ::scl::detail::add_cv_from_t<Base, ::std::remove_reference_t<Type>>>;

    template <typename Base, typename T>
    constexpr decltype(auto) forward_like(T && t) noexcept // NOLINT(cppcoreguidelines-missing-std-forward)
    {
        return static_cast<forward_like_t<Base, T &&>>(t);
    }

} // namespace scl
```


