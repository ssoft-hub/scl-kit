

# File value\_lock.h

[**File List**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**value\_lock.h**](value__lock_8h.md)

[Go to the documentation of this file](value__lock_8h.md)


```C++
#pragma once

#ifndef DOXYGEN

#include <scl/feature/detail/value_lock.h>
#include <scl/feature/type_traits/wrapper.h>

#include <type_traits>

namespace scl
{
    template <typename Refer>
    using value_lock = ::scl::feature::detail::value_lock<Refer,
        ::scl::feature::is_wrapper_v<::std::remove_cvref_t<Refer>>
            ? ::scl::feature::detail::value_lock_case::wrapper
            : ::scl::feature::detail::value_lock_case::value>;
} // namespace scl

#else // DOXYGEN

namespace scl
{
    template <typename Refer>
    class value_lock
    {
    public:
        value_lock(value_lock &&) = delete;
        value_lock(value_lock const &) = delete;
        value_lock & operator=(value_lock &&) = delete;
        value_lock & operator=(value_lock const &) = delete;

        explicit value_lock(Refer ref);

        ~value_lock();

        template <typename Target>
        void lock_for();

        template <typename Target>
        Target value_as() const;
    };

} // namespace scl

#endif // DOXYGEN
```


