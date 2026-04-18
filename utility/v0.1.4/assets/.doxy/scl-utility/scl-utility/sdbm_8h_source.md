

# File sdbm.h

[**File List**](files.md) **>** [**hash**](dir_cc128476db6d6d60652f2f6242c2398d.md) **>** [**sdbm.h**](sdbm_8h.md)

[Go to the documentation of this file](sdbm_8h.md)


```C++
#pragma once


#include <concepts>
#include <cstdint>
#include <numeric>
#include <ranges>

namespace scl::hash
{
    template <::std::ranges::range Range>
    constexpr ::std::uint64_t sdbm(Range const & range, ::std::uint64_t h = 0ull)
        requires ::std::convertible_to<::std::ranges::range_value_t<Range>, ::std::uint8_t>
    {
        return ::std::accumulate(::std::ranges::begin(range), ::std::ranges::end(range), h,
            [](::std::uint64_t acc, auto c) noexcept {
            return static_cast<::std::uint8_t>(c) + (acc << 6) + (acc << 16) - acc;
        });
    }

    struct sdbm_hasher
    {
        using result_type = ::std::uint64_t;

        template <::std::ranges::range Range>
        constexpr result_type operator()(Range const & range) const noexcept
            requires ::std::convertible_to<::std::ranges::range_value_t<Range>, ::std::uint8_t>
        {
            return ::scl::hash::sdbm(range);
        }
    };

} // namespace scl::hash
```


