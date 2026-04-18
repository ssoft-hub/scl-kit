

# File detection.h

[**File List**](files.md) **>** [**module**](dir_a7b0466279106ea0b8f86f609f621680.md) **>** [**utility**](dir_cca185d4009e66bf68ef58b617abaf60.md) **>** [**src**](dir_ab13fdfb8e4c1ff98b437eee9f69d35c.md) **>** [**scl**](dir_ca45970a26780365ec2accbdb8d8d4fe.md) **>** [**utility**](dir_76f6b7cf5a6cf438d50211f1abeeaae6.md) **>** [**type\_traits**](dir_ee84acd7aed8e5e3b0eed877408f2d18.md) **>** [**detection.h**](detection_8h.md)

[Go to the documentation of this file](detection_8h.md)


```C++

#pragma once

#include <type_traits>

namespace scl::detail
{
    template <typename Default, typename AlwaysVoid, template <typename...> class Operation, typename... Arguments>
    struct detector
    {
        using value_t = ::std::false_type; 
        using type = Default;              
    };

    template <typename Default, template <typename...> class Operation, typename... Arguments>
    struct detector<Default, ::std::void_t<Operation<Arguments...>>, Operation, Arguments...>
    {
        using value_t = ::std::true_type;     
        using type = Operation<Arguments...>; 
    };

} // namespace scl::detail

namespace scl
{
    template <template <typename...> class Operation, typename... Arguments>
    using is_detected = typename detail::detector<void, void, Operation, Arguments...>::value_t;

    template <template <typename...> class Operation, typename... Arguments>
    inline constexpr bool is_detected_v = is_detected<Operation, Arguments...>::value;

    template <template <typename...> class Operation, typename... Arguments>
    using detected_t = typename detail::detector<void, void, Operation, Arguments...>::type;

    template <typename Default, template <typename...> class Operation, typename... Arguments>
    using detected_or = detail::detector<Default, void, Operation, Arguments...>;

    template <typename Default, template <typename...> class Operation, typename... Arguments>
    using detected_or_t = typename detected_or<Default, Operation, Arguments...>::type;

    template <typename Expected, template <typename...> class Operation, typename... Arguments>
    using is_detected_exact = ::std::is_same<Expected, detected_t<Operation, Arguments...>>;

    template <typename Expected, template <typename...> class Operation, typename... Arguments>
    inline constexpr bool is_detected_exact_v = is_detected_exact<Expected, Operation, Arguments...>::value;

    template <typename To, template <typename...> class Operation, typename... Arguments>
    using is_detected_convertible = ::std::is_convertible<detected_t<Operation, Arguments...>, To>;

    template <typename To, template <typename...> class Operation, typename... Arguments>
    inline constexpr bool is_detected_convertible_v = is_detected_convertible<To, Operation, Arguments...>::value;

} // namespace scl
```


