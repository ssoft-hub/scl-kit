

# File siphash.h

[**File List**](files.md) **>** [**hash**](dir_cc128476db6d6d60652f2f6242c2398d.md) **>** [**siphash.h**](siphash_8h.md)

[Go to the documentation of this file](siphash_8h.md)


```C++
#pragma once


#include <bit>
#include <concepts>
#include <cstdint>
#include <ranges>
#include <utility>

namespace scl::hash
{
    struct siphash_key
    {
        ::std::uint64_t k0{};
        ::std::uint64_t k1{};
    };

    namespace detail
    {
        constexpr void
        sip_round(::std::uint64_t & v0, ::std::uint64_t & v1, ::std::uint64_t & v2, ::std::uint64_t & v3) noexcept
        {
            v0 += v1;
            v1 = ::std::rotl(v1, 13);
            v1 ^= v0;
            v0 = ::std::rotl(v0, 32);
            v2 += v3;
            v3 = ::std::rotl(v3, 16);
            v3 ^= v2;
            v0 += v3;
            v3 = ::std::rotl(v3, 21);
            v3 ^= v0;
            v2 += v1;
            v1 = ::std::rotl(v1, 17);
            v1 ^= v2;
            v2 = ::std::rotl(v2, 32);
        }
    } // namespace detail

    inline constexpr siphash_key siphash_default_key{
        .k0 = 0x0706050403020100ull, // bytes 00..07
        .k1 = 0x0f0e0d0c0b0a0908ull  // bytes 08..0f
    };

    template <::std::ranges::range Range>
        requires ::std::convertible_to<::std::ranges::range_value_t<Range>, ::std::uint8_t>
    constexpr ::std::uint64_t siphash(Range const & range, siphash_key const key = siphash_default_key)
    {
        // State initialised from key XOR'd with magic constants spelling
        // "somepseudorandomlygeneratedbytes".
        ::std::uint64_t v0 = key.k0 ^ 0x736f6d6570736575ull;
        ::std::uint64_t v1 = key.k1 ^ 0x646f72616e646f6dull;
        ::std::uint64_t v2 = key.k0 ^ 0x6c7967656e657261ull;
        ::std::uint64_t v3 = key.k1 ^ 0x7465646279746573ull;

        ::std::uint64_t m = 0; // current 8-byte block (little-endian)
        ::std::size_t len = 0;
        int shift = 0; // bits filled in m (0, 8, 16, ..., 56)

        for (auto const c : range)
        {
            m |= static_cast<::std::uint64_t>(static_cast<::std::uint8_t>(c)) << shift;
            shift += 8;
            ++len;

            if (shift == 64) // full 8-byte block ready
            {
                v3 ^= m;
                detail::sip_round(v0, v1, v2, v3); // c = 2
                detail::sip_round(v0, v1, v2, v3);
                v0 ^= m;
                m = 0;
                shift = 0;
            }
        }

        // Last (partial) block: high byte encodes message length mod 256.
        m |= static_cast<::std::uint64_t>(len & 0xffull) << 56;
        v3 ^= m;
        detail::sip_round(v0, v1, v2, v3); // c = 2
        detail::sip_round(v0, v1, v2, v3);
        v0 ^= m;

        // Finalization: d = 4 rounds.
        v2 ^= 0xffull;
        detail::sip_round(v0, v1, v2, v3);
        detail::sip_round(v0, v1, v2, v3);
        detail::sip_round(v0, v1, v2, v3);
        detail::sip_round(v0, v1, v2, v3);

        return v0 ^ v1 ^ v2 ^ v3;
    }

    template <siphash_key Key = siphash_default_key>
    struct siphash_hasher
    {
        using result_type = ::std::uint64_t;

        template <::std::ranges::range Range>
            requires ::std::convertible_to<::std::ranges::range_value_t<Range>, ::std::uint8_t>
        constexpr result_type operator()(Range const & range) const noexcept
        {
            return ::scl::hash::siphash(range, Key);
        }
    };

} // namespace scl::hash
```


