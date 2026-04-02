

# File executor\_access.h

[**File List**](files.md) **>** [**detail**](dir_b3eb4ac5eceab19e0dcca8b4c96aaf20.md) **>** [**executor\_access.h**](executor__access_8h.md)

[Go to the documentation of this file](executor__access_8h.md)


```C++
#pragma once

#include <scl/feature/type_traits/wrapper.h>
#include <scl/utility/type_traits/forward_like.h>

#include <type_traits>

namespace scl::feature::detail
{
    struct executor_access
    {
        // NOLINTBEGIN(cppcoreguidelines-missing-std-forward)
        template <typename Wrapper>
            requires ::scl::feature::is_wrapper_v<::std::remove_cvref_t<Wrapper>>
        static constexpr decltype(auto) get(Wrapper && w) noexcept
        {
            return ::scl::forward_like<Wrapper>(w.m_executor);
        }
        // NOLINTEND(cppcoreguidelines-missing-std-forward)
    };
} // namespace scl::feature::detail
```


