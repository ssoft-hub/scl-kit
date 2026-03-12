

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
        template <typename WrapperRefer>
            requires ::scl::feature::is_wrapper_v<::std::remove_cvref_t<WrapperRefer>>
        static constexpr decltype(auto) get(WrapperRefer && w) noexcept
        {
            return ::scl::forward_like<WrapperRefer>(w.m_executor);
        }
    };
} // namespace scl::feature::detail
```


