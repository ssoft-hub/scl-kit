

# File wrapper\_lock.h

[**File List**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**wrapper\_lock.h**](wrapper__lock_8h.md)

[Go to the documentation of this file](wrapper__lock_8h.md)


```C++
#pragma once

#ifndef DOXYGEN

#include <scl/feature/detail/wrapper_lock.h>
#include <scl/feature/type_traits/wrapper.h>

#include <type_traits>

namespace scl
{
    template <typename Refer>
    using wrapper_lock = ::scl::feature::detail::wrapper_lock<Refer,
        ::scl::feature::is_wrapper_v<::std::remove_cvref_t<Refer>>
            ? ::scl::feature::detail::wrapper_lock_case::wrapper
            : ::scl::feature::detail::wrapper_lock_case::value>;
} // namespace scl

#else // DOXYGEN

namespace scl
{
    template <typename Refer>
    class wrapper_lock
    {
    public:
        wrapper_lock(wrapper_lock &&) = delete;
        wrapper_lock(wrapper_lock const &) = delete;
        wrapper_lock & operator=(wrapper_lock &&) = delete;
        wrapper_lock & operator=(wrapper_lock const &) = delete;

        explicit wrapper_lock(Refer ref);

        ~wrapper_lock();

        void lock();

        void unlock();

        Refer wrapper_value() const noexcept;

        decltype(auto) value() const noexcept;
    };

} // namespace scl

#endif // DOXYGEN
```


