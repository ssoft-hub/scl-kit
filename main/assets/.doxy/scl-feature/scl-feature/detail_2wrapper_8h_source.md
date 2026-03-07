

# File wrapper.h

[**File List**](files.md) **>** [**detail**](dir_b3eb4ac5eceab19e0dcca8b4c96aaf20.md) **>** [**wrapper.h**](detail_2wrapper_8h.md)

[Go to the documentation of this file](detail_2wrapper_8h.md)


```C++
#pragma once

#include <utility>

namespace scl::feature::detail
{
    template <typename Value, template <typename> class Executor>
    class wrapper
    {
    public:
        using value_type = Value;
        using executor_type = Executor<value_type>;

    public:
        template <typename... Args>
        constexpr explicit wrapper(Args &&... args)
            : m_executor{::std::forward<Args>(args)...}
        {}

    private:
        executor_type m_executor;
    };
} // namespace scl::feature::detail
```


