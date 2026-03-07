

# File operator.h

[**File List**](files.md) **>** [**detection**](dir_7ae4f81ae30c9db8975b98cdcb7060a6.md) **>** [**operator.h**](operator_8h.md)

[Go to the documentation of this file](operator_8h.md)


```C++

#pragma once

#include <scl/utility/preprocessor/forward.h>
#include <scl/utility/type_traits/detection.h>
#include <scl/utility/type_traits/member_like.h>

#ifndef DOXYGEN

#define SCL_DETAIL_ARGUMENTS_OPERATOR_DETECTION(op, name)                                                                \
    namespace scl                                                                                                        \
    {                                                                                                                    \
        template <typename Type, typename... Arguments>                                                                  \
        using name##_member_operation =                                                                                  \
            decltype(::std::declval<Type>().operator op  (::std::declval<Arguments>()...));                          \
        template <typename... Arguments>                                                                                 \
        inline constexpr auto has_##name##_member_v =                                                                    \
            ::scl::is_detected_v<name##_member_operation, Arguments...>;                                                 \
        template <typename... Arguments>                                                                                 \
        using name##_member_t = ::scl::detected_t<name##_member_operation, Arguments...>;                                \
    }                                                                                                                    \
    namespace scl                                                                                                        \
    {                                                                                                                    \
        template <typename Type, typename... Arguments>                                                                  \
        using name##_member_exact_operation = decltype((::std::declval<Type>().*                                         \
            static_cast<::scl::member_function_like_t<Type, name##_member_operation<Type, Arguments...>(Arguments...)>>( \
                &::std::remove_cvref_t<Type>::operator op ))(::std::declval<Arguments>()...));                       \
        template <typename... Arguments>                                                                                 \
        inline constexpr auto has_##name##_member_exact_v =                                                              \
            ::scl::is_detected_v<name##_member_exact_operation, Arguments...>;                                           \
        template <typename... Arguments>                                                                                 \
        using name##_member_exact_t = ::scl::detected_t<name##_member_exact_operation, Arguments...>;                    \
    }

#define SCL_DETAIL_PREFIX_UNARY_OPERATOR_DETECTION(op, name)                                         \
    namespace scl                                                                                    \
    {                                                                                                \
        template <typename Type>                                                                     \
        using name##_operation = decltype(op  ::std::declval<Type>());                           \
        template <typename... Arguments>                                                             \
        inline constexpr auto has_##name##_v = ::scl::is_detected_v<name##_operation, Arguments...>; \
        template <typename... Arguments>                                                             \
        using name##_t = ::scl::detected_t<name##_operation, Arguments...>;                          \
    }                                                                                                \
    SCL_DETAIL_ARGUMENTS_OPERATOR_DETECTION(SCL_FORWARD(op), name)

#define SCL_DETAIL_POSTFIX_UNARY_OPERATOR_DETECTION(op, name)                                              \
    namespace scl                                                                                          \
    {                                                                                                      \
        template <typename Type>                                                                           \
        using name##_operation = decltype(::std::declval<Type>() op );                                 \
        template <typename... Arguments>                                                                   \
        inline constexpr auto has_##name##_v = ::scl::is_detected_v<name##_operation, Arguments...>;       \
        template <typename... Arguments>                                                                   \
        using name##_t = ::scl::detected_t<name##_operation, Arguments...>;                                \
    }                                                                                                      \
    namespace scl                                                                                          \
    {                                                                                                      \
        template <typename Type>                                                                           \
        using name##_member_operation =                                                                    \
            decltype(::std::declval<Type>().operator op  (::std::declval<int>()));                     \
        template <typename Type>                                                                           \
        inline constexpr auto has_##name##_member_v = ::scl::is_detected_v<name##_member_operation, Type>; \
        template <typename Type>                                                                           \
        using name##_member_t = ::scl::detected_t<name##_member_operation, Type>;                          \
    }                                                                                                      \
    namespace scl                                                                                          \
    {                                                                                                      \
        template <typename Type>                                                                           \
        using name##_member_exact_operation = decltype((::std::declval<Type>().*                           \
            static_cast<::scl::member_function_like_t<Type, name##_member_operation<Type>(int)>>(          \
                &::std::remove_cvref_t<Type>::operator op ))(::std::declval<int>()));                  \
        template <typename Type>                                                                           \
        inline constexpr auto has_##name##_member_exact_v =                                                \
            ::scl::is_detected_v<name##_member_exact_operation, Type>;                                     \
        template <typename Type>                                                                           \
        using name##_member_exact_t = ::scl::detected_t<name##_member_exact_operation, Type>;              \
    }

#define SCL_DETAIL_BINARY_OPERATOR_DETECTION(op, name)                                               \
    namespace scl                                                                                    \
    {                                                                                                \
        template <typename Left, typename Right>                                                     \
        using name##_operation = decltype(::std::declval<Left>() op  ::std::declval<Right>());   \
        template <typename... Arguments>                                                             \
        inline constexpr auto has_##name##_v = ::scl::is_detected_v<name##_operation, Arguments...>; \
        template <typename... Arguments>                                                             \
        using name##_t = ::scl::detected_t<name##_operation, Arguments...>;                          \
    }                                                                                                \
    SCL_DETAIL_ARGUMENTS_OPERATOR_DETECTION(SCL_FORWARD(op), name)

#define SCL_DETAIL_ARROW_OPERATOR_DETECTION(op, name)                                                \
    namespace scl                                                                                    \
    {                                                                                                \
        template <typename Type, typename... Arguments>                                              \
        using name##_operation =                                                                     \
            decltype(::std::declval<Type>().operator op  (::std::declval<Arguments>()...));      \
        template <typename... Arguments>                                                             \
        inline constexpr auto has_##name##_v = ::scl::is_detected_v<name##_operation, Arguments...>; \
        template <typename... Arguments>                                                             \
        using name##_t = ::scl::detected_t<name##_operation, Arguments...>;                          \
    }                                                                                                \
    SCL_DETAIL_ARGUMENTS_OPERATOR_DETECTION(SCL_FORWARD(op), name)

SCL_DETAIL_PREFIX_UNARY_OPERATOR_DETECTION(&, address_of)
SCL_DETAIL_PREFIX_UNARY_OPERATOR_DETECTION(*, indirection)
SCL_DETAIL_ARROW_OPERATOR_DETECTION(->*, arrow_to_pointer)
SCL_DETAIL_ARROW_OPERATOR_DETECTION(->, arrow)
// cppcheck-suppress syntaxError
SCL_DETAIL_BINARY_OPERATOR_DETECTION(SCL_FORWARD(, ), comma)

namespace scl
{
    template <typename Type, typename Argument>
    using subscript_operation = decltype(::std::declval<Type>()[::std::declval<Argument>()]);
    template <typename... Arguments>
    inline constexpr auto has_subscript_v = ::scl::is_detected_v<subscript_operation, Arguments...>;
    template <typename... Arguments>
    using subscript_t = ::scl::detected_t<subscript_operation, Arguments...>;
} // namespace scl
SCL_DETAIL_ARGUMENTS_OPERATOR_DETECTION([], subscript)

namespace scl
{
    template <typename Type, typename... Arguments>
    using call_operation = decltype(::std::declval<Type>()(::std::declval<Arguments>()...));
    template <typename... Arguments>
    inline constexpr auto has_call_v = ::scl::is_detected_v<call_operation, Arguments...>;
    template <typename... Arguments>
    using call_t = ::scl::detected_t<call_operation, Arguments...>;
} // namespace scl
SCL_DETAIL_ARGUMENTS_OPERATOR_DETECTION((), call)

SCL_DETAIL_PREFIX_UNARY_OPERATOR_DETECTION(+, unary_plus)
SCL_DETAIL_PREFIX_UNARY_OPERATOR_DETECTION(-, unary_minus)
SCL_DETAIL_PREFIX_UNARY_OPERATOR_DETECTION(++, prefix_increment)
SCL_DETAIL_PREFIX_UNARY_OPERATOR_DETECTION(--, prefix_decrement)
SCL_DETAIL_PREFIX_UNARY_OPERATOR_DETECTION(~, bitwise_not)
SCL_DETAIL_PREFIX_UNARY_OPERATOR_DETECTION(!, logical_not)

SCL_DETAIL_POSTFIX_UNARY_OPERATOR_DETECTION(++, postfix_increment) // NOLINT(bugprone-macro-repeated-side-effects)
SCL_DETAIL_POSTFIX_UNARY_OPERATOR_DETECTION(--, postfix_decrement) // NOLINT(bugprone-macro-repeated-side-effects)

SCL_DETAIL_BINARY_OPERATOR_DETECTION(==, equal_to)
SCL_DETAIL_BINARY_OPERATOR_DETECTION(!=, not_equal_to)
SCL_DETAIL_BINARY_OPERATOR_DETECTION(<, less)
SCL_DETAIL_BINARY_OPERATOR_DETECTION(<=, less_equal)
SCL_DETAIL_BINARY_OPERATOR_DETECTION(>, greater)
SCL_DETAIL_BINARY_OPERATOR_DETECTION(>=, greater_equal)

SCL_DETAIL_BINARY_OPERATOR_DETECTION(*, multiply)
SCL_DETAIL_BINARY_OPERATOR_DETECTION(/, divide)
SCL_DETAIL_BINARY_OPERATOR_DETECTION(%, modulo)
SCL_DETAIL_BINARY_OPERATOR_DETECTION(+, plus)
SCL_DETAIL_BINARY_OPERATOR_DETECTION(-, minus)

SCL_DETAIL_BINARY_OPERATOR_DETECTION(<<, left_shift)
SCL_DETAIL_BINARY_OPERATOR_DETECTION(>>, right_shift)

SCL_DETAIL_BINARY_OPERATOR_DETECTION(&, bitwise_and)
SCL_DETAIL_BINARY_OPERATOR_DETECTION(|, bitwise_or)
SCL_DETAIL_BINARY_OPERATOR_DETECTION(^, bitwise_xor)

SCL_DETAIL_BINARY_OPERATOR_DETECTION(&&, logical_and)
SCL_DETAIL_BINARY_OPERATOR_DETECTION(||, logical_or)

SCL_DETAIL_BINARY_OPERATOR_DETECTION(=, assign)
SCL_DETAIL_BINARY_OPERATOR_DETECTION(*=, multiply_assign)
SCL_DETAIL_BINARY_OPERATOR_DETECTION(/=, divide_assign)
SCL_DETAIL_BINARY_OPERATOR_DETECTION(%=, modulo_assign)
SCL_DETAIL_BINARY_OPERATOR_DETECTION(+=, plus_assign)
SCL_DETAIL_BINARY_OPERATOR_DETECTION(-=, minus_assign)
SCL_DETAIL_BINARY_OPERATOR_DETECTION(<<=, left_shift_assign)
SCL_DETAIL_BINARY_OPERATOR_DETECTION(>>=, right_shift_assign)
SCL_DETAIL_BINARY_OPERATOR_DETECTION(&=, bitwise_and_assign)
SCL_DETAIL_BINARY_OPERATOR_DETECTION(|=, bitwise_or_assign)
SCL_DETAIL_BINARY_OPERATOR_DETECTION(^=, bitwise_xor_assign)

#undef SCL_DETAIL_PREFIX_UNARY_OPERATOR_DETECTION
#undef SCL_DETAIL_POSTFIX_UNARY_OPERATOR_DETECTION
#undef SCL_DETAIL_BINARY_OPERATOR_DETECTION
#undef SCL_DETAIL_ARROW_OPERATOR_DETECTION
#undef SCL_DETAIL_ARGUMENTS_OPERATOR_DETECTION

#elif defined(DOXYGEN)

namespace scl
{
    // ============================================================================
    // PREFIX UNARY OPERATORS: &, *, +, -, ++, --, ~, !
    // ============================================================================

    template <typename Type>
    using address_of_operation = /* implementation defined */;
    template <typename Type>
    inline constexpr bool has_address_of_v = /* implementation defined */;
    template <typename Type>
    using address_of_t = /* implementation defined */;
    template <typename Type, typename... Arguments>
    using address_of_member_operation = /* implementation defined */;
    template <typename... Arguments>
    inline constexpr bool has_address_of_member_v = /* implementation defined */;
    template <typename... Arguments>
    using address_of_member_t = /* implementation defined */;
    template <typename Type, typename... Arguments>
    using address_of_member_exact_operation = /* implementation defined */;
    template <typename... Arguments>
    inline constexpr bool has_address_of_member_exact_v = /* implementation defined */;
    template <typename... Arguments>
    using address_of_member_exact_t = /* implementation defined */;

    template <typename Type>
    using indirection_operation = /* implementation defined */;
    template <typename Type>
    inline constexpr bool has_indirection_v = /* implementation defined */;
    template <typename Type>
    using indirection_t = /* implementation defined */;
    template <typename Type, typename... Arguments>
    using indirection_member_operation = /* implementation defined */;
    template <typename... Arguments>
    inline constexpr bool has_indirection_member_v = /* implementation defined */;
    template <typename... Arguments>
    using indirection_member_t = /* implementation defined */;
    template <typename Type, typename... Arguments>
    using indirection_member_exact_operation = /* implementation defined */;
    template <typename... Arguments>
    inline constexpr bool has_indirection_member_exact_v = /* implementation defined */;
    template <typename... Arguments>
    using indirection_member_exact_t = /* implementation defined */;

    template <typename Type>
    using unary_plus_operation = /* implementation defined */;
    template <typename Type>
    inline constexpr bool has_unary_plus_v = /* implementation defined */;
    template <typename Type>
    using unary_plus_t = /* implementation defined */;
    template <typename Type, typename... Arguments>
    using unary_plus_member_operation = /* implementation defined */;
    template <typename... Arguments>
    inline constexpr bool has_unary_plus_member_v = /* implementation defined */;
    template <typename... Arguments>
    using unary_plus_member_t = /* implementation defined */;
    template <typename Type, typename... Arguments>
    using unary_plus_member_exact_operation = /* implementation defined */;
    template <typename... Arguments>
    inline constexpr bool has_unary_plus_member_exact_v = /* implementation defined */;
    template <typename... Arguments>
    using unary_plus_member_exact_t = /* implementation defined */;

    template <typename Type>
    using unary_minus_operation = /* implementation defined */;
    template <typename Type>
    inline constexpr bool has_unary_minus_v = /* implementation defined */;
    template <typename Type>
    using unary_minus_t = /* implementation defined */;
    template <typename Type, typename... Arguments>
    using unary_minus_member_operation = /* implementation defined */;
    template <typename... Arguments>
    inline constexpr bool has_unary_minus_member_v = /* implementation defined */;
    template <typename... Arguments>
    using unary_minus_member_t = /* implementation defined */;
    template <typename Type, typename... Arguments>
    using unary_minus_member_exact_operation = /* implementation defined */;
    template <typename... Arguments>
    inline constexpr bool has_unary_minus_member_exact_v = /* implementation defined */;
    template <typename... Arguments>
    using unary_minus_member_exact_t = /* implementation defined */;

    template <typename Type>
    using prefix_increment_operation = /* implementation defined */;
    template <typename Type>
    inline constexpr bool has_prefix_increment_v = /* implementation defined */;
    template <typename Type>
    using prefix_increment_t = /* implementation defined */;
    template <typename Type, typename... Arguments>
    using prefix_increment_member_operation = /* implementation defined */;
    template <typename... Arguments>
    inline constexpr bool has_prefix_increment_member_v = /* implementation defined */;
    template <typename... Arguments>
    using prefix_increment_member_t = /* implementation defined */;
    template <typename Type, typename... Arguments>
    using prefix_increment_member_exact_operation = /* implementation defined */;
    template <typename... Arguments>
    inline constexpr bool has_prefix_increment_member_exact_v = /* implementation defined */;
    template <typename... Arguments>
    using prefix_increment_member_exact_t = /* implementation defined */;

    template <typename Type>
    using prefix_decrement_operation = /* implementation defined */;
    template <typename Type>
    inline constexpr bool has_prefix_decrement_v = /* implementation defined */;
    template <typename Type>
    using prefix_decrement_t = /* implementation defined */;
    template <typename Type, typename... Arguments>
    using prefix_decrement_member_operation = /* implementation defined */;
    template <typename... Arguments>
    inline constexpr bool has_prefix_decrement_member_v = /* implementation defined */;
    template <typename... Arguments>
    using prefix_decrement_member_t = /* implementation defined */;
    template <typename Type, typename... Arguments>
    using prefix_decrement_member_exact_operation = /* implementation defined */;
    template <typename... Arguments>
    inline constexpr bool has_prefix_decrement_member_exact_v = /* implementation defined */;
    template <typename... Arguments>
    using prefix_decrement_member_exact_t = /* implementation defined */;

    template <typename Type>
    using bitwise_not_operation = /* implementation defined */;
    template <typename Type>
    inline constexpr bool has_bitwise_not_v = /* implementation defined */;
    template <typename Type>
    using bitwise_not_t = /* implementation defined */;
    template <typename Type, typename... Arguments>
    using bitwise_not_member_operation = /* implementation defined */;
    template <typename... Arguments>
    inline constexpr bool has_bitwise_not_member_v = /* implementation defined */;
    template <typename... Arguments>
    using bitwise_not_member_t = /* implementation defined */;
    template <typename Type, typename... Arguments>
    using bitwise_not_member_exact_operation = /* implementation defined */;
    template <typename... Arguments>
    inline constexpr bool has_bitwise_not_member_exact_v = /* implementation defined */;
    template <typename... Arguments>
    using bitwise_not_member_exact_t = /* implementation defined */;

    template <typename Type>
    using logical_not_operation = /* implementation defined */;
    template <typename Type>
    inline constexpr bool has_logical_not_v = /* implementation defined */;
    template <typename Type>
    using logical_not_t = /* implementation defined */;
    template <typename Type, typename... Arguments>
    using logical_not_member_operation = /* implementation defined */;
    template <typename... Arguments>
    inline constexpr bool has_logical_not_member_v = /* implementation defined */;
    template <typename... Arguments>
    using logical_not_member_t = /* implementation defined */;
    template <typename Type, typename... Arguments>
    using logical_not_member_exact_operation = /* implementation defined */;
    template <typename... Arguments>
    inline constexpr bool has_logical_not_member_exact_v = /* implementation defined */;
    template <typename... Arguments>
    using logical_not_member_exact_t = /* implementation defined */;

    // ============================================================================
    // POSTFIX UNARY OPERATORS: ++, -- (postfix)
    // ============================================================================

    template <typename Type>
    using postfix_increment_operation = /* implementation defined */;
    template <typename Type>
    inline constexpr bool has_postfix_increment_v = /* implementation defined */;
    template <typename Type>
    using postfix_increment_t = /* implementation defined */;
    template <typename Type>
    using postfix_increment_member_operation = /* implementation defined */;
    template <typename Type>
    inline constexpr bool has_postfix_increment_member_v = /* implementation defined */;
    template <typename Type>
    using postfix_increment_member_t = /* implementation defined */;
    template <typename Type>
    using postfix_increment_member_exact_operation = /* implementation defined */;
    template <typename Type>
    inline constexpr bool has_postfix_increment_member_exact_v = /* implementation defined */;
    template <typename Type>
    using postfix_increment_member_exact_t = /* implementation defined */;

    template <typename Type>
    using postfix_decrement_operation = /* implementation defined */;
    template <typename Type>
    inline constexpr bool has_postfix_decrement_v = /* implementation defined */;
    template <typename Type>
    using postfix_decrement_t = /* implementation defined */;
    template <typename Type>
    using postfix_decrement_member_operation = /* implementation defined */;
    template <typename Type>
    inline constexpr bool has_postfix_decrement_member_v = /* implementation defined */;
    template <typename Type>
    using postfix_decrement_member_t = /* implementation defined */;
    template <typename Type>
    using postfix_decrement_member_exact_operation = /* implementation defined */;
    template <typename Type>
    inline constexpr bool has_postfix_decrement_member_exact_v = /* implementation defined */;
    template <typename Type>
    using postfix_decrement_member_exact_t = /* implementation defined */;

    // ============================================================================
    // BINARY COMPARISON OPERATORS: ==, !=, <, <=, >, >=
    // ============================================================================

    template <typename Left, typename Right>
    using equal_to_operation = /* implementation defined */;
    template <typename Left, typename Right>
    inline constexpr bool has_equal_to_v = /* implementation defined */;
    template <typename Left, typename Right>
    using equal_to_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using equal_to_member_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_equal_to_member_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using equal_to_member_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using equal_to_member_exact_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_equal_to_member_exact_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using equal_to_member_exact_t = /* implementation defined */;

    template <typename Left, typename Right>
    using not_equal_to_operation = /* implementation defined */;
    template <typename Left, typename Right>
    inline constexpr bool has_not_equal_to_v = /* implementation defined */;
    template <typename Left, typename Right>
    using not_equal_to_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using not_equal_to_member_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_not_equal_to_member_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using not_equal_to_member_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using not_equal_to_member_exact_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_not_equal_to_member_exact_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using not_equal_to_member_exact_t = /* implementation defined */;

    template <typename Left, typename Right>
    using less_operation = /* implementation defined */;
    template <typename Left, typename Right>
    inline constexpr bool has_less_v = /* implementation defined */;
    template <typename Left, typename Right>
    using less_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using less_member_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_less_member_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using less_member_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using less_member_exact_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_less_member_exact_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using less_member_exact_t = /* implementation defined */;

    template <typename Left, typename Right>
    using less_equal_operation = /* implementation defined */;
    template <typename Left, typename Right>
    inline constexpr bool has_less_equal_v = /* implementation defined */;
    template <typename Left, typename Right>
    using less_equal_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using less_equal_member_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_less_equal_member_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using less_equal_member_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using less_equal_member_exact_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_less_equal_member_exact_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using less_equal_member_exact_t = /* implementation defined */;

    template <typename Left, typename Right>
    using greater_operation = /* implementation defined */;
    template <typename Left, typename Right>
    inline constexpr bool has_greater_v = /* implementation defined */;
    template <typename Left, typename Right>
    using greater_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using greater_member_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_greater_member_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using greater_member_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using greater_member_exact_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_greater_member_exact_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using greater_member_exact_t = /* implementation defined */;

    template <typename Left, typename Right>
    using greater_equal_operation = /* implementation defined */;
    template <typename Left, typename Right>
    inline constexpr bool has_greater_equal_v = /* implementation defined */;
    template <typename Left, typename Right>
    using greater_equal_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using greater_equal_member_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_greater_equal_member_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using greater_equal_member_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using greater_equal_member_exact_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_greater_equal_member_exact_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using greater_equal_member_exact_t = /* implementation defined */;

    // ============================================================================
    // BINARY ARITHMETIC & BITWISE: *, /, %, +, -, <<, >>, &, |, ^
    // ============================================================================

    template <typename Left, typename Right>
    using multiply_operation = /* implementation defined */;
    template <typename Left, typename Right>
    inline constexpr bool has_multiply_v = /* implementation defined */;
    template <typename Left, typename Right>
    using multiply_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using multiply_member_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_multiply_member_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using multiply_member_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using multiply_member_exact_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_multiply_member_exact_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using multiply_member_exact_t = /* implementation defined */;

    template <typename Left, typename Right>
    using divide_operation = /* implementation defined */;
    template <typename Left, typename Right>
    inline constexpr bool has_divide_v = /* implementation defined */;
    template <typename Left, typename Right>
    using divide_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using divide_member_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_divide_member_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using divide_member_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using divide_member_exact_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_divide_member_exact_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using divide_member_exact_t = /* implementation defined */;

    template <typename Left, typename Right>
    using modulo_operation = /* implementation defined */;
    template <typename Left, typename Right>
    inline constexpr bool has_modulo_v = /* implementation defined */;
    template <typename Left, typename Right>
    using modulo_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using modulo_member_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_modulo_member_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using modulo_member_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using modulo_member_exact_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_modulo_member_exact_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using modulo_member_exact_t = /* implementation defined */;

    template <typename Left, typename Right>
    using plus_operation = /* implementation defined */;
    template <typename Left, typename Right>
    inline constexpr bool has_plus_v = /* implementation defined */;
    template <typename Left, typename Right>
    using plus_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using plus_member_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_plus_member_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using plus_member_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using plus_member_exact_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_plus_member_exact_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using plus_member_exact_t = /* implementation defined */;

    template <typename Left, typename Right>
    using minus_operation = /* implementation defined */;
    template <typename Left, typename Right>
    inline constexpr bool has_minus_v = /* implementation defined */;
    template <typename Left, typename Right>
    using minus_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using minus_member_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_minus_member_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using minus_member_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using minus_member_exact_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_minus_member_exact_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using minus_member_exact_t = /* implementation defined */;

    template <typename Left, typename Right>
    using left_shift_operation = /* implementation defined */;
    template <typename Left, typename Right>
    inline constexpr bool has_left_shift_v = /* implementation defined */;
    template <typename Left, typename Right>
    using left_shift_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using left_shift_member_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_left_shift_member_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using left_shift_member_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using left_shift_member_exact_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_left_shift_member_exact_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using left_shift_member_exact_t = /* implementation defined */;

    template <typename Left, typename Right>
    using right_shift_operation = /* implementation defined */;
    template <typename Left, typename Right>
    inline constexpr bool has_right_shift_v = /* implementation defined */;
    template <typename Left, typename Right>
    using right_shift_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using right_shift_member_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_right_shift_member_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using right_shift_member_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using right_shift_member_exact_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_right_shift_member_exact_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using right_shift_member_exact_t = /* implementation defined */;

    template <typename Left, typename Right>
    using bitwise_and_operation = /* implementation defined */;
    template <typename Left, typename Right>
    inline constexpr bool has_bitwise_and_v = /* implementation defined */;
    template <typename Left, typename Right>
    using bitwise_and_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using bitwise_and_member_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_bitwise_and_member_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using bitwise_and_member_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using bitwise_and_member_exact_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_bitwise_and_member_exact_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using bitwise_and_member_exact_t = /* implementation defined */;

    template <typename Left, typename Right>
    using bitwise_or_operation = /* implementation defined */;
    template <typename Left, typename Right>
    inline constexpr bool has_bitwise_or_v = /* implementation defined */;
    template <typename Left, typename Right>
    using bitwise_or_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using bitwise_or_member_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_bitwise_or_member_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using bitwise_or_member_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using bitwise_or_member_exact_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_bitwise_or_member_exact_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using bitwise_or_member_exact_t = /* implementation defined */;

    template <typename Left, typename Right>
    using bitwise_xor_operation = /* implementation defined */;
    template <typename Left, typename Right>
    inline constexpr bool has_bitwise_xor_v = /* implementation defined */;
    template <typename Left, typename Right>
    using bitwise_xor_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using bitwise_xor_member_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_bitwise_xor_member_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using bitwise_xor_member_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using bitwise_xor_member_exact_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_bitwise_xor_member_exact_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using bitwise_xor_member_exact_t = /* implementation defined */;

    // ============================================================================
    // LOGICAL BINARY: &&, ||
    // ============================================================================

    template <typename Left, typename Right>
    using logical_and_operation = /* implementation defined */;
    template <typename Left, typename Right>
    inline constexpr bool has_logical_and_v = /* implementation defined */;
    template <typename Left, typename Right>
    using logical_and_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using logical_and_member_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_logical_and_member_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using logical_and_member_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using logical_and_member_exact_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_logical_and_member_exact_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using logical_and_member_exact_t = /* implementation defined */;

    template <typename Left, typename Right>
    using logical_or_operation = /* implementation defined */;
    template <typename Left, typename Right>
    inline constexpr bool has_logical_or_v = /* implementation defined */;
    template <typename Left, typename Right>
    using logical_or_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using logical_or_member_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_logical_or_member_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using logical_or_member_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using logical_or_member_exact_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_logical_or_member_exact_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using logical_or_member_exact_t = /* implementation defined */;

    // ============================================================================
    // ASSIGNMENT OPERATORS: =, +=, -=, *=, /=, %=, <<=, >>=, &=, |=, ^=
    // ============================================================================

    template <typename Left, typename Right>
    using assign_operation = /* implementation defined */;
    template <typename Left, typename Right>
    inline constexpr bool has_assign_v = /* implementation defined */;
    template <typename Left, typename Right>
    using assign_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using assign_member_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_assign_member_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using assign_member_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using assign_member_exact_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_assign_member_exact_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using assign_member_exact_t = /* implementation defined */;

    template <typename Left, typename Right>
    using plus_assign_operation = /* implementation defined */;
    template <typename Left, typename Right>
    inline constexpr bool has_plus_assign_v = /* implementation defined */;
    template <typename Left, typename Right>
    using plus_assign_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using plus_assign_member_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_plus_assign_member_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using plus_assign_member_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using plus_assign_member_exact_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_plus_assign_member_exact_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using plus_assign_member_exact_t = /* implementation defined */;

    template <typename Left, typename Right>
    using minus_assign_operation = /* implementation defined */;
    template <typename Left, typename Right>
    inline constexpr bool has_minus_assign_v = /* implementation defined */;
    template <typename Left, typename Right>
    using minus_assign_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using minus_assign_member_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_minus_assign_member_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using minus_assign_member_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using minus_assign_member_exact_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_minus_assign_member_exact_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using minus_assign_member_exact_t = /* implementation defined */;

    template <typename Left, typename Right>
    using multiply_assign_operation = /* implementation defined */;
    template <typename Left, typename Right>
    inline constexpr bool has_multiply_assign_v = /* implementation defined */;
    template <typename Left, typename Right>
    using multiply_assign_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using multiply_assign_member_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_multiply_assign_member_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using multiply_assign_member_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using multiply_assign_member_exact_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_multiply_assign_member_exact_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using multiply_assign_member_exact_t = /* implementation defined */;

    template <typename Left, typename Right>
    using divide_assign_operation = /* implementation defined */;
    template <typename Left, typename Right>
    inline constexpr bool has_divide_assign_v = /* implementation defined */;
    template <typename Left, typename Right>
    using divide_assign_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using divide_assign_member_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_divide_assign_member_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using divide_assign_member_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using divide_assign_member_exact_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_divide_assign_member_exact_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using divide_assign_member_exact_t = /* implementation defined */;

    template <typename Left, typename Right>
    using modulo_assign_operation = /* implementation defined */;
    template <typename Left, typename Right>
    inline constexpr bool has_modulo_assign_v = /* implementation defined */;
    template <typename Left, typename Right>
    using modulo_assign_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using modulo_assign_member_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_modulo_assign_member_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using modulo_assign_member_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using modulo_assign_member_exact_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_modulo_assign_member_exact_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using modulo_assign_member_exact_t = /* implementation defined */;

    template <typename Left, typename Right>
    using left_shift_assign_operation = /* implementation defined */;
    template <typename Left, typename Right>
    inline constexpr bool has_left_shift_assign_v = /* implementation defined */;
    template <typename Left, typename Right>
    using left_shift_assign_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using left_shift_assign_member_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_left_shift_assign_member_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using left_shift_assign_member_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using left_shift_assign_member_exact_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_left_shift_assign_member_exact_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using left_shift_assign_member_exact_t = /* implementation defined */;

    template <typename Left, typename Right>
    using right_shift_assign_operation = /* implementation defined */;
    template <typename Left, typename Right>
    inline constexpr bool has_right_shift_assign_v = /* implementation defined */;
    template <typename Left, typename Right>
    using right_shift_assign_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using right_shift_assign_member_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_right_shift_assign_member_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using right_shift_assign_member_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using right_shift_assign_member_exact_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_right_shift_assign_member_exact_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using right_shift_assign_member_exact_t = /* implementation defined */;

    template <typename Left, typename Right>
    using bitwise_and_assign_operation = /* implementation defined */;
    template <typename Left, typename Right>
    inline constexpr bool has_bitwise_and_assign_v = /* implementation defined */;
    template <typename Left, typename Right>
    using bitwise_and_assign_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using bitwise_and_assign_member_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_bitwise_and_assign_member_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using bitwise_and_assign_member_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using bitwise_and_assign_member_exact_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_bitwise_and_assign_member_exact_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using bitwise_and_assign_member_exact_t = /* implementation defined */;

    template <typename Left, typename Right>
    using bitwise_or_assign_operation = /* implementation defined */;
    template <typename Left, typename Right>
    inline constexpr bool has_bitwise_or_assign_v = /* implementation defined */;
    template <typename Left, typename Right>
    using bitwise_or_assign_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using bitwise_or_assign_member_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_bitwise_or_assign_member_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using bitwise_or_assign_member_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using bitwise_or_assign_member_exact_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_bitwise_or_assign_member_exact_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using bitwise_or_assign_member_exact_t = /* implementation defined */;

    template <typename Left, typename Right>
    using bitwise_xor_assign_operation = /* implementation defined */;
    template <typename Left, typename Right>
    inline constexpr bool has_bitwise_xor_assign_v = /* implementation defined */;
    template <typename Left, typename Right>
    using bitwise_xor_assign_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using bitwise_xor_assign_member_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_bitwise_xor_assign_member_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using bitwise_xor_assign_member_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using bitwise_xor_assign_member_exact_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_bitwise_xor_assign_member_exact_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using bitwise_xor_assign_member_exact_t = /* implementation defined */;

    // ============================================================================
    // SPECIAL OPERATORS: ->*, ->, ,, [], ()
    // ============================================================================

    template <typename Type, typename... Arguments>
    using arrow_to_pointer_member_operation = /* implementation defined */;
    template <typename... Arguments>
    inline constexpr bool has_arrow_to_pointer_member_v = /* implementation defined */;
    template <typename... Arguments>
    using arrow_to_pointer_member_t = /* implementation defined */;
    template <typename Type, typename... Arguments>
    using arrow_to_pointer_member_exact_operation = /* implementation defined */;
    template <typename... Arguments>
    inline constexpr bool has_arrow_to_pointer_member_exact_v = /* implementation defined */;
    template <typename... Arguments>
    using arrow_to_pointer_member_exact_t = /* implementation defined */;

    template <typename Type, typename... Arguments>
    using arrow_member_operation = /* implementation defined */;
    template <typename... Arguments>
    inline constexpr bool has_arrow_member_v = /* implementation defined */;
    template <typename... Arguments>
    using arrow_member_t = /* implementation defined */;
    template <typename Type, typename... Arguments>
    using arrow_member_exact_operation = /* implementation defined */;
    template <typename... Arguments>
    inline constexpr bool has_arrow_member_exact_v = /* implementation defined */;
    template <typename... Arguments>
    using arrow_member_exact_t = /* implementation defined */;

    template <typename Left, typename Right>
    using comma_operation = /* implementation defined */;
    template <typename Left, typename Right>
    inline constexpr bool has_comma_v = /* implementation defined */;
    template <typename Left, typename Right>
    using comma_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using comma_member_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_comma_member_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using comma_member_t = /* implementation defined */;
    template <typename Type, typename Argument>
    using comma_member_exact_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_comma_member_exact_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using comma_member_exact_t = /* implementation defined */;

    template <typename Type, typename Argument>
    using subscript_operation = /* implementation defined */;
    template <typename Type, typename Argument>
    inline constexpr bool has_subscript_v = /* implementation defined */;
    template <typename Type, typename Argument>
    using subscript_t = /* implementation defined */;
    template <typename Type, typename... Arguments>
    using subscript_member_operation = /* implementation defined */;
    template <typename... Arguments>
    inline constexpr bool has_subscript_member_v = /* implementation defined */;
    template <typename... Arguments>
    using subscript_member_t = /* implementation defined */;
    template <typename Type, typename... Arguments>
    using subscript_member_exact_operation = /* implementation defined */;
    template <typename... Arguments>
    inline constexpr bool has_subscript_member_exact_v = /* implementation defined */;
    template <typename... Arguments>
    using subscript_member_exact_t = /* implementation defined */;

    template <typename Type, typename... Arguments>
    using call_operation = /* implementation defined */;
    template <typename Type, typename... Arguments>
    inline constexpr bool has_call_v = /* implementation defined */;
    template <typename Type, typename... Arguments>
    using call_t = /* implementation defined */;
    template <typename Type, typename... Arguments>
    using call_member_operation = /* implementation defined */;
    template <typename... Arguments>
    inline constexpr bool has_call_member_v = /* implementation defined */;
    template <typename... Arguments>
    using call_member_t = /* implementation defined */;
    template <typename Type, typename... Arguments>
    using call_member_exact_operation = /* implementation defined */;
    template <typename... Arguments>
    inline constexpr bool has_call_member_exact_v = /* implementation defined */;
    template <typename... Arguments>
    using call_member_exact_t = /* implementation defined */;


} // namespace scl

#endif // DOXYGEN
```


