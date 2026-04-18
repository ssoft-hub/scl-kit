

# File function.h

[**File List**](files.md) **>** [**detection**](dir_7ae4f81ae30c9db8975b98cdcb7060a6.md) **>** [**function.h**](function_8h.md)

[Go to the documentation of this file](function_8h.md)


```C++

#pragma once

#include <scl/utility/type_traits/detection.h>

#define SCL_FUNCTION_DETECTION(name)                                                      \
    template <typename... Arguments>                                                      \
    using name##_function_operation = decltype(name(::std::declval<Arguments>()...));     \
    template <typename... Arguments>                                                      \
    inline constexpr auto has_##name##_function_v =                                       \
        ::scl::is_detected_v<name##_function_operation, Arguments...>;                    \
    template <typename... Arguments>                                                      \
    using name##_function_t = ::scl::detected_t<name##_function_operation, Arguments...>; \
                                                                                          \
    template <typename... Arguments>                                                      \
    using name##_function_exact_operation = decltype((                                    \
        static_cast<name##_function_operation<Arguments...> (*)(Arguments...)>(&name))(   \
        ::std::declval<Arguments>()...));                                                 \
    template <typename... Arguments>                                                      \
    inline constexpr auto has_##name##_function_exact_v =                                 \
        ::scl::is_detected_v<name##_function_exact_operation, Arguments...>;              \
    template <typename... Arguments>                                                      \
    using name##_function_exact_t = ::scl::detected_t<name##_function_exact_operation, Arguments...>;
```


