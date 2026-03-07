

# File plain.h

[**File List**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**inplace**](dir_a84fae2e5328daedf40681be880e8335.md) **>** [**plain.h**](plain_8h.md)

[Go to the documentation of this file](plain_8h.md)


```C++
#pragma once

#include <utility>

namespace scl::feature::inplace
{
    template <typename Value>
    class plain
    {
    public:
        using value_type = Value;

    public:
        template <typename... Args>
        constexpr explicit plain(Args &&... args)
            : m_value{::std::forward<Args>(args)...}
        {}

    private:
        value_type m_value;
    };
} // namespace scl::feature::inplace
```


