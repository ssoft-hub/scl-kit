

# File executor\_access.h

[**File List**](files.md) **>** [**detail**](dir_b3eb4ac5eceab19e0dcca8b4c96aaf20.md) **>** [**executor\_access.h**](executor__access_8h.md)

[Go to the documentation of this file](executor__access_8h.md)


```C++
#pragma once

#include <scl/feature/concepts/wrapper.h>
#include <scl/utility/type_traits/forward_like.h>

namespace scl::feature::detail
{
    struct executor_access
    {
        // NOLINTBEGIN(cppcoreguidelines-missing-std-forward)
        template <typename Wrapper>
        static constexpr decltype(auto) get(Wrapper && w) noexcept
            requires ::scl::feature::concepts::wrapper<Wrapper>
        {
            return ::scl::forward_like<Wrapper>(w.m_executor);
        }
        // NOLINTEND(cppcoreguidelines-missing-std-forward)
    };
} // namespace scl::feature::detail
```


