

# File wrapper.h

[**File List**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**type\_traits**](dir_910e174fc0e8c8ed40843bba5172f2f4.md) **>** [**wrapper.h**](type__traits_2wrapper_8h.md)

[Go to the documentation of this file](type__traits_2wrapper_8h.md)


```C++
#pragma once

#include <type_traits>

namespace scl::feature::detail
{
    template <typename, template <typename> class>
    class wrapper;
} // namespace scl::feature::detail

namespace scl::feature
{
    template <typename Type>
    inline constexpr bool is_wrapper_v =
        ::std::is_same_v<::std::remove_cv_t<Type>, Type> ? false : is_wrapper_v<::std::remove_cv_t<Type>>;

    template <typename Type, template <typename> class Executor>
    inline constexpr bool is_wrapper_v<::scl::feature::detail::wrapper<Type, Executor>> = true;

    // -------------------------------------------------------------------------

    template <typename Expected, typename Test>
    inline constexpr bool is_compatible_with_v =
        (::std::is_same_v<::std::remove_cv_t<Expected>, Expected> &&
            ::std::is_same_v<::std::remove_cv_t<Test>, Test>)
        ? (::std::is_same_v<Expected, Test> || ::std::is_base_of_v<Expected, Test>)
        : is_compatible_with_v<::std::remove_cv_t<Expected>, ::std::remove_cv_t<Test>>;

    template <typename Expected, typename Test, template <typename> class Executor>
    inline constexpr bool is_compatible_with_v<::scl::feature::detail::wrapper<Expected, Executor>,
        ::scl::feature::detail::wrapper<Test, Executor>> = is_compatible_with_v<Expected, Test>;

    // -------------------------------------------------------------------------

    template <typename Expected, typename Test>
    inline constexpr bool is_compatible_with_part_of_v =
        (::std::is_same_v<::std::remove_cv_t<Expected>, Expected> &&
            ::std::is_same_v<::std::remove_cv_t<Test>, Test>)
        ? false
        : is_compatible_with_part_of_v<::std::remove_cv_t<Expected>, ::std::remove_cv_t<Test>>;

    template <typename ExpectedValue, template <typename> class ExpectedExecutor, typename TestValue, template <typename> class TestExecutor>
    inline constexpr bool is_compatible_with_part_of_v<::scl::feature::detail::wrapper<ExpectedValue, ExpectedExecutor>,
        ::scl::feature::detail::wrapper<TestValue, TestExecutor>> =
        is_compatible_with_v<::std::remove_cv_t<ExpectedValue>, ::scl::feature::detail::wrapper<TestValue, TestExecutor>> ||
        is_compatible_with_part_of_v<::std::remove_cv_t<ExpectedValue>,
            ::scl::feature::detail::wrapper<TestValue, TestExecutor>>;

    // -------------------------------------------------------------------------

    template <typename Expected, typename Test>
    inline constexpr bool is_part_compatible_with_v =
        (::std::is_same_v<::std::remove_cv_t<Expected>, Expected> &&
            ::std::is_same_v<::std::remove_cv_t<Test>, Test>)
        ? false
        : is_part_compatible_with_v<::std::remove_cv_t<Expected>, ::std::remove_cv_t<Test>>;

    template <typename ExpectedValue, template <typename> class ExpectedExecutor, typename TestValue, template <typename> class TestExecutor>
    inline constexpr bool is_part_compatible_with_v<::scl::feature::detail::wrapper<ExpectedValue, ExpectedExecutor>,
        ::scl::feature::detail::wrapper<TestValue, TestExecutor>> =
        is_compatible_with_v<::scl::feature::detail::wrapper<ExpectedValue, ExpectedExecutor>,
            ::std::remove_cv_t<TestValue>> ||
        is_part_compatible_with_v<::scl::feature::detail::wrapper<ExpectedValue, ExpectedExecutor>,
            ::std::remove_cv_t<TestValue>>;

} // namespace scl::feature
```


