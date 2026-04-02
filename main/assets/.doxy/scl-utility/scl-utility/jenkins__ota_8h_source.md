

# File jenkins\_ota.h

[**File List**](files.md) **>** [**hash**](dir_cc128476db6d6d60652f2f6242c2398d.md) **>** [**jenkins\_ota.h**](jenkins__ota_8h.md)

[Go to the documentation of this file](jenkins__ota_8h.md)


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
    constexpr ::std::uint32_t jenkins_ota(Range const & range)
    {
        ::std::uint32_t h = 0;

        for (auto const c : range)
        {
            h += static_cast<::std::uint8_t>(c);
            h += h << 10;
            h ^= h >> 6;
        }

        h += h << 3;
        h ^= h >> 11;
        h += h << 15;

        return h;
    }

    struct jenkins_ota_hasher
    {
        using result_type = ::std::uint32_t;

        template <::std::ranges::range Range>
            requires ::std::convertible_to<::std::ranges::range_value_t<Range>, ::std::uint8_t>
        constexpr result_type operator()(Range const & range) const noexcept
        {
            return ::scl::hash::jenkins_ota(range);
        }
    };

} // namespace scl::hash
```


