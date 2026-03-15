

# File wrapper\_constructors.h

[**File List**](files.md) **>** [**detail**](dir_b3eb4ac5eceab19e0dcca8b4c96aaf20.md) **>** [**wrapper\_constructors.h**](wrapper__constructors_8h.md)

[Go to the documentation of this file](wrapper__constructors_8h.md)


```C++
#pragma once

#include <concepts>
#include <type_traits>

#define SCL_WRAPPER_CONSTRUCTOR_FOR_SELF_PROTOTYPE(cv_ref)                       \
    constexpr wrapper(self_type cv_ref other) noexcept(                          \
        ::std::is_nothrow_constructible_v<executor_type, executor_type cv_ref>)  \
        requires(::std::constructible_from<executor_type, executor_type cv_ref>) \
        : m_executor{::scl::forward_like<self_type cv_ref>(other.m_executor)}    \
    {}

#define SCL_WRAPPER_CONSTRUCTOR_FOR_SELF                         \
    SCL_WRAPPER_CONSTRUCTOR_FOR_SELF_PROTOTYPE(&)                \
    SCL_WRAPPER_CONSTRUCTOR_FOR_SELF_PROTOTYPE(const &)          \
    SCL_WRAPPER_CONSTRUCTOR_FOR_SELF_PROTOTYPE(volatile &)       \
    SCL_WRAPPER_CONSTRUCTOR_FOR_SELF_PROTOTYPE(const volatile &) \
    SCL_WRAPPER_CONSTRUCTOR_FOR_SELF_PROTOTYPE(&&)               \
    SCL_WRAPPER_CONSTRUCTOR_FOR_SELF_PROTOTYPE(const &&)         \
    SCL_WRAPPER_CONSTRUCTOR_FOR_SELF_PROTOTYPE(volatile &&)      \
    SCL_WRAPPER_CONSTRUCTOR_FOR_SELF_PROTOTYPE(const volatile &&)

#define SCL_WRAPPER_CONSTRUCTOR_FOR_OTHER                                                                       \
    template <typename Other>                                                                                   \
    constexpr wrapper(Other && other) noexcept(                                                                 \
        noexcept(::std::declval<wrapper_constructor_resolver<self_type, Other &&>>().resolve()))                \
        requires(::scl::feature::is_wrapper_v<::std::remove_cvref_t<Other>> &&                                  \
            !::std::same_as<::std::remove_cvref_t<Other>, self_type> &&                                         \
            ::std::constructible_from<executor_type,                                                            \
                decltype(::std::declval<wrapper_constructor_resolver<self_type, Other &&>>().resolve())>)       \
        : m_executor{wrapper_constructor_resolver<self_type, Other &&>{::std::forward<Other>(other)}.resolve()} \
    {}
```


