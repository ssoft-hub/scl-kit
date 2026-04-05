

# File wrapper.h

[**File List**](files.md) **>** [**detail**](dir_b3eb4ac5eceab19e0dcca8b4c96aaf20.md) **>** [**wrapper.h**](detail_2wrapper_8h.md)

[Go to the documentation of this file](detail_2wrapper_8h.md)


```C++
#pragma once

#include <scl/feature/concepts/executor.h>
#include <scl/feature/detail/wrapper_constructor_resolver.h>
#include <scl/feature/detail/wrapper_constructors.h>

#include <utility>

namespace scl::feature::detail
{
    // NOLINTBEGIN(cppcoreguidelines-special-member-functions)
    template <typename Value, template <typename> class Executor>
        requires ::scl::feature::concepts::executor<Executor<Value>>
    class wrapper
    {
        using self_type = wrapper<Value, Executor>;

    public:
        using value_type = Value;
        using executor_type = Executor<value_type>;

    private:
        [[no_unique_address]]
        executor_type m_executor;

        friend struct executor_access;

    public:
        template <typename... Args>
        constexpr explicit wrapper(Args &&... args)
            : m_executor{::std::forward<Args>(args)...}
        {}

        // clang-format off
        // cppcheck-suppress noExplicitConstructor
        SCL_WRAPPER_CONSTRUCTOR_FOR_SELF // NOLINT(performance-noexcept-move-constructor)
        // cppcheck-suppress noExplicitConstructor
        SCL_WRAPPER_CONSTRUCTOR_FOR_OTHER
        // clang-format on
    };
    // NOLINTEND(cppcoreguidelines-special-member-functions)
} // namespace scl::feature::detail
```


