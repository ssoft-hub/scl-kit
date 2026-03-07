

# File method.h

[**File List**](files.md) **>** [**detection**](dir_7ae4f81ae30c9db8975b98cdcb7060a6.md) **>** [**method.h**](method_8h.md)

[Go to the documentation of this file](method_8h.md)


```C++

#pragma once

#include <scl/utility/type_traits/detection.h>
#include <scl/utility/type_traits/member_like.h>

#define SCL_METHOD_DETECTION(name)                                                                                   \
    template <typename Type, typename... Arguments>                                                                  \
    using name##_method_operation = decltype(::std::declval<Type>().name(::std::declval<Arguments>()...));           \
    template <typename... Arguments>                                                                                 \
    inline static constexpr auto has_##name##_method_v =                                                             \
        ::scl::is_detected_v<name##_method_operation, Arguments...>;                                                 \
    template <typename... Arguments>                                                                                 \
    using name##_method_t = ::scl::detected_t<name##_method_operation, Arguments...>;                                \
                                                                                                                     \
    template <typename Type, typename... Arguments>                                                                  \
    using name##_method_exact_operation = decltype((::std::declval<Type>().*                                         \
        static_cast<::scl::member_function_like_t<Type, name##_method_operation<Type, Arguments...>(Arguments...)>>( \
            &::std::remove_cvref_t<Type>::name))(::std::declval<Arguments>()...));                                   \
    template <typename... Arguments>                                                                                 \
    inline static constexpr auto has_##name##_method_exact_v =                                                       \
        ::scl::is_detected_v<name##_method_exact_operation, Arguments...>;                                           \
    template <typename... Arguments>                                                                                 \
    using name##_method_exact_t = ::scl::detected_t<name##_method_exact_operation, Arguments...>;                    \
                                                                                                                     \
    template <typename Type, typename... Arguments>                                                                  \
    using name##_static_method_operation =                                                                           \
        decltype(::std::remove_cvref_t<Type>::name(::std::declval<Arguments>()...));                                 \
    template <typename... Arguments>                                                                                 \
    inline static constexpr auto has_##name##_static_method_v =                                                      \
        ::scl::is_detected_v<name##_static_method_operation, Arguments...>;                                          \
    template <typename... Arguments>                                                                                 \
    using name##_static_method_t = ::scl::detected_t<name##_static_method_operation, Arguments...>;                  \
                                                                                                                     \
    template <typename Type, typename... Arguments>                                                                  \
    using name##_static_method_exact_operation = decltype((static_cast<                                              \
        name##_static_method_operation<Type, Arguments...> (*)(Arguments...)>(                                       \
        &::std::remove_cvref_t<Type>::name))(::std::declval<Arguments>()...));                                       \
    template <typename... Arguments>                                                                                 \
    inline static constexpr auto has_##name##_static_method_exact_v =                                                \
        ::scl::is_detected_v<name##_static_method_exact_operation, Arguments...>;                                    \
    template <typename... Arguments>                                                                                 \
    using name##_static_method_exact_t = ::scl::detected_t<name##_static_method_exact_operation, Arguments...>;
```


