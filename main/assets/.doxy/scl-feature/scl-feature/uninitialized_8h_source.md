

# File uninitialized.h

[**File List**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**inplace**](dir_a84fae2e5328daedf40681be880e8335.md) **>** [**uninitialized.h**](uninitialized_8h.md)

[Go to the documentation of this file](uninitialized_8h.md)


```C++
#pragma once


#include <concepts>
#include <cstddef>
#include <functional>
#include <utility>

#include <scl/utility/type_traits/forward_like.h>

#define SCL_EXECUTOR_CONSTRUCTOR_FOR_SELF_PROTOTYPE(cv_ref)           \
    constexpr explicit uninitialized(self_type cv_ref other) noexcept \
    {                                                                 \
        for (::std::size_t i = 0; i < sizeof(value_type); ++i)        \
            m_storage[i] = other.m_storage[i];                        \
    }

#define SCL_EXECUTOR_CONSTRUCTOR_FOR_SELF                         \
    SCL_EXECUTOR_CONSTRUCTOR_FOR_SELF_PROTOTYPE(&)                \
    SCL_EXECUTOR_CONSTRUCTOR_FOR_SELF_PROTOTYPE(const &)          \
    SCL_EXECUTOR_CONSTRUCTOR_FOR_SELF_PROTOTYPE(volatile &)       \
    SCL_EXECUTOR_CONSTRUCTOR_FOR_SELF_PROTOTYPE(const volatile &) \
    SCL_EXECUTOR_CONSTRUCTOR_FOR_SELF_PROTOTYPE(&&)               \
    SCL_EXECUTOR_CONSTRUCTOR_FOR_SELF_PROTOTYPE(const &&)         \
    SCL_EXECUTOR_CONSTRUCTOR_FOR_SELF_PROTOTYPE(volatile &&)      \
    SCL_EXECUTOR_CONSTRUCTOR_FOR_SELF_PROTOTYPE(const volatile &&)

namespace scl::feature::inplace
{
    // NOLINTBEGIN(cppcoreguidelines-special-member-functions, cppcoreguidelines-missing-std-forward, cppcoreguidelines-pro-type-member-init)
    template <typename Value>
    class uninitialized
    {
        using self_type = uninitialized<Value>;

    public:
        using value_type = Value;

    public:
        constexpr uninitialized() noexcept = default;

        SCL_EXECUTOR_CONSTRUCTOR_FOR_SELF

    public:
        template <typename Self, typename Func, typename... Args>
        static constexpr decltype(auto) execute(Self && self, Func && func, Args &&... args)
            requires(::std::same_as<::std::remove_cvref_t<Self>, self_type> && ::std::invocable<Func, Args && ...>)
        {
            return ::std::invoke(::std::forward<Func>(func), ::std::forward<Args>(args)...);
        }

        template <typename Self>
        static constexpr decltype(auto) value(Self && self)
            requires ::std::same_as<::std::remove_cvref_t<Self>, self_type>
        {
            // reinterpret_cast<value_type*> for raw storage access;
            // const correctness is restored by forward_like<Self>.
            return reinterpret_cast<::scl::forward_like_t<Self, value_type>>(*self.m_storage); // NOLINT(*-reinterpret-cast)
        }

    private:
        alignas(value_type)::std::byte m_storage[sizeof(value_type)]; // NOLINT(*-avoid-c-arrays)
    };
    // NOLINTEND(cppcoreguidelines-special-member-functions, cppcoreguidelines-missing-std-forward, cppcoreguidelines-pro-type-member-init)
} // namespace scl::feature::inplace

#undef SCL_EXECUTOR_CONSTRUCTOR_FOR_SELF
#undef SCL_EXECUTOR_CONSTRUCTOR_FOR_SELF_PROTOTYPE
```


