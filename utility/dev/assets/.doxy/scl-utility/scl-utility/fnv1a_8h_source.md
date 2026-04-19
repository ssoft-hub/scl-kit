

# File fnv1a.h

[**File List**](files.md) **>** [**hash**](dir_cc128476db6d6d60652f2f6242c2398d.md) **>** [**fnv1a.h**](fnv1a_8h.md)

[Go to the documentation of this file](fnv1a_8h.md)


```C++
#pragma once


#include <concepts>
#include <cstdint>
#include <ranges>
#include <utility>

namespace scl::hash
{
    template <::std::ranges::range Range>
        requires ::std::convertible_to<::std::ranges::range_value_t<Range>, ::std::uint8_t>
    constexpr ::std::uint64_t fnv1a(Range const & range, ::std::uint64_t h = 14695981039346656037ull)
    {
        for (auto const c : range)
        {
            h ^= static_cast<::std::uint8_t>(c);
            h *= 1099511628211ull;
        }
        return h;
    }

    struct fnv1a_hasher
    {
        using result_type = ::std::uint64_t;

        template <::std::ranges::range Range>
            requires ::std::convertible_to<::std::ranges::range_value_t<Range>, ::std::uint8_t>
        constexpr result_type operator()(Range const & range) const noexcept
        {
            return ::scl::hash::fnv1a(range);
        }
    };

} // namespace scl::hash
```


