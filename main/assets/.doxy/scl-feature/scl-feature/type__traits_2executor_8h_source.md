

# File executor.h

[**File List**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**type\_traits**](dir_910e174fc0e8c8ed40843bba5172f2f4.md) **>** [**executor.h**](type__traits_2executor_8h.md)

[Go to the documentation of this file](type__traits_2executor_8h.md)


```C++
#pragma once

#include <type_traits>
#include <utility>


namespace scl::feature
{
    template <typename T>
    struct executor_trait;

    // -------------------------------------------------------------------------

    template <typename ExecutorType, typename ExecutorRefer>
    inline constexpr bool has_value_v =
        requires {
            static_cast<decltype(ExecutorType::value(::std::declval<ExecutorRefer>())) (*)(ExecutorRefer)>(
                &ExecutorType::value);
        };

    template <typename ExecutorType, typename ExecutorRefer>
    inline constexpr bool has_execute_v =
        requires {
            static_cast<decltype(ExecutorType::execute(::std::declval<ExecutorRefer>(),
                ::std::declval<void (*&)()>())) (*)(ExecutorRefer, void (*&)())>(&ExecutorType::execute);
        };

    template <typename ExecutorType, typename ExecutorRefer>
    inline constexpr bool has_guard_v =
        requires { static_cast<void (*)(ExecutorRefer)>(&ExecutorType::guard); };

    template <typename ExecutorType, typename ExecutorRefer>
    inline constexpr bool has_unguard_v =
        requires { static_cast<void (*)(ExecutorRefer)>(&ExecutorType::unguard); };

    // -------------------------------------------------------------------------

    namespace detail
    {
        template <typename Type>
        inline constexpr bool has_executor_minimal_interface_v = []() constexpr -> bool {
            if constexpr (::std::is_class_v<Type>)
                return has_value_v<Type, Type &> && has_value_v<Type, Type &&> &&
                    has_value_v<Type, Type const &> && has_execute_v<Type, Type &> &&
                    has_execute_v<Type, Type &&> && has_execute_v<Type, Type const &>;
            return false;
        }();
    } // namespace detail

    // -------------------------------------------------------------------------

    template <typename Type>
    inline constexpr bool is_executor_v = ::std::is_same_v<::std::remove_cvref_t<Type>, Type>
        ? detail::has_executor_minimal_interface_v<Type>
        : is_executor_v<::std::remove_cvref_t<Type>>;

    // -------------------------------------------------------------------------

    template <typename ExecutorType, typename ExecutorRefer>
    inline constexpr bool is_guard_noexcept_v = []() constexpr -> bool {
        if constexpr (has_guard_v<ExecutorType, ExecutorRefer>)
            return noexcept(ExecutorType::guard(::std::declval<ExecutorRefer>()));
        return true;
    }();

    template <typename ExecutorType, typename ExecutorRefer>
    inline constexpr bool is_unguard_noexcept_v = []() constexpr -> bool {
        if constexpr (has_unguard_v<ExecutorType, ExecutorRefer>)
            return noexcept(ExecutorType::unguard(::std::declval<ExecutorRefer>()));
        return true;
    }();
} // namespace scl::feature
```


