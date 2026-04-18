

# File key.h

[**File List**](files.md) **>** [**hash**](dir_cc128476db6d6d60652f2f6242c2398d.md) **>** [**key.h**](key_8h.md)

[Go to the documentation of this file](key_8h.md)


```C++
#pragma once


#include <scl/utility/hash/siphash.h>

#include <concepts>
#include <functional>
#include <type_traits>
#include <utility>

namespace scl::hash::concepts
{
    // clang-format off
    template <typename H>
    concept byte_hasher = ::std::default_initializable<H>
            && requires { typename H::result_type; }
            && ::std::integral<typename H::result_type>;
    // clang-format on
} // namespace scl::hash::concepts

namespace scl::hash
{
    template <concepts::byte_hasher Hasher = siphash_hasher<>>
    struct key
    {
        using hasher_type = Hasher;

        using value_type = typename Hasher::result_type;

        value_type value{};

        template <::std::ranges::range Range>
        explicit constexpr key(Range const & range) noexcept
            requires ::std::convertible_to<::std::ranges::range_value_t<Range>, ::std::uint8_t>
            : value{Hasher{}(range)}
        {}

        constexpr operator value_type() const noexcept { return value; }

        friend constexpr auto operator<=>(key const &, key const &) noexcept = default;
    };

} // namespace scl::hash

template <typename Hasher>
struct std::hash<::scl::hash::key<Hasher>>
{
    constexpr ::std::size_t operator()(::scl::hash::key<Hasher> const & k) const noexcept
    {
        return ::std::hash<typename ::scl::hash::key<Hasher>::value_type>{}(k.value);
    }
};
```


