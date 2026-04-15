

# File wrapper.h

[**File List**](files.md) **>** [**detail**](dir_b3eb4ac5eceab19e0dcca8b4c96aaf20.md) **>** [**wrapper.h**](detail_2wrapper_8h.md)

[Go to the documentation of this file](detail_2wrapper_8h.md)


```C++
#pragma once

#include <scl/feature/concepts/executor.h>
#include <scl/feature/concepts/wrapper.h>
#include <scl/feature/detail/executor_access.h>
#include <scl/feature/detail/wrapper_constructor_resolver.h>
#include <scl/feature/detail/wrapper_constructors.h>
#include <scl/feature/reflection/methods.h>
#include <scl/utility/attribute.h>

#include <utility>

namespace scl::feature::detail
{
    // NOLINTBEGIN(cppcoreguidelines-special-member-functions)
    template <typename Value, template <typename> class Executor>
        requires ::scl::feature::concepts::executor<Executor<Value>>
    class wrapper
        : public ::scl::feature::methods_reflection<wrapper<Value, Executor>, Executor<Value>, wrapper<Value, Executor>>
    {
        using self_type = wrapper<Value, Executor>;

    public:
        using value_type = Value;
        using executor_type = Executor<value_type>;

    private:
        SCL_NO_UNIQUE_ADDRESS
        executor_type m_executor;

        friend struct executor_access;

    public:
        template <typename... Args>
        constexpr explicit wrapper(Args &&... args)
            : m_executor{::std::forward<Args>(args)...}
        {}

        // clang-format off
        SCL_REFLECT_TYPE(self_type, executor_type)
        
        // cppcheck-suppress noExplicitConstructor
        SCL_WRAPPER_CONSTRUCTOR_FOR_SELF // NOLINT(performance-noexcept-move-constructor)
        // cppcheck-suppress noExplicitConstructor
        SCL_WRAPPER_CONSTRUCTOR_FOR_OTHER
        // clang-format on
    };
    // NOLINTEND(cppcoreguidelines-special-member-functions)
} // namespace scl::feature::detail

template <typename Value, template <typename> class Executor>
struct scl::feature::executor_trait<::scl::feature::detail::wrapper<Value, Executor>>
{
    template <typename Self>
    static constexpr decltype(auto) executor(Self && self) noexcept
    {
        return ::scl::feature::detail::executor_access::get(::std::forward<Self>(self));
    }
};

namespace scl::feature
{
    template <typename Wrapper, typename Executor, typename QualifiedInner, template <typename> class OuterExecutor>
        requires(::scl::feature::concepts::wrapper<QualifiedInner> &&
            !::std::same_as<QualifiedInner, ::std::remove_cvref_t<QualifiedInner>>)
    class methods_reflection<Wrapper, Executor, detail::wrapper<QualifiedInner, OuterExecutor>>
        : public methods_reflection<Wrapper, Executor, detail::wrapper<::std::remove_cvref_t<QualifiedInner>, OuterExecutor>>
    {};

    template <typename Wrapper, typename Executor, typename Value, template <typename> class OuterExecutor>
    class methods_reflection<Wrapper, Executor, detail::wrapper<Value, OuterExecutor>>
        : public methods_reflection<Wrapper, Executor, Value>
    {};
} // namespace scl::feature
```


