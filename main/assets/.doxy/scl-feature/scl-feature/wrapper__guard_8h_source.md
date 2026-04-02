

# File wrapper\_guard.h

[**File List**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**wrapper\_guard.h**](wrapper__guard_8h.md)

[Go to the documentation of this file](wrapper__guard_8h.md)


```C++
#pragma once

#ifndef DOXYGEN

#include <scl/feature/detail/wrapper_guard.h>
#include <scl/feature/type_traits/wrapper.h>

#include <type_traits>

namespace scl
{
    template <typename Refer>
    using wrapper_guard = ::scl::feature::detail::wrapper_guard<Refer,
        ::scl::feature::is_wrapper_v<::std::remove_cvref_t<Refer>>
            ? ::scl::feature::detail::wrapper_guard_case::wrapper
            : ::scl::feature::detail::wrapper_guard_case::value>;
} // namespace scl

#else // DOXYGEN

namespace scl
{
    template <typename Refer>
    class wrapper_guard
    {
    public:
        wrapper_guard(wrapper_guard &&) = delete;
        wrapper_guard(wrapper_guard const &) = delete;
        wrapper_guard & operator=(wrapper_guard &&) = delete;
        wrapper_guard & operator=(wrapper_guard const &) = delete;

        explicit wrapper_guard(Refer v);

        ~wrapper_guard();

        decltype(auto) value() const noexcept;
    };

} // namespace scl

#endif // DOXYGEN
```


