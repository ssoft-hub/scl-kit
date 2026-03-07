

# File uninitialized.h

[**File List**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**inplace**](dir_a84fae2e5328daedf40681be880e8335.md) **>** [**uninitialized.h**](uninitialized_8h.md)

[Go to the documentation of this file](uninitialized_8h.md)


```C++
#pragma once

#include <cstddef>

namespace scl::feature::inplace
{
    template <typename Value>
    class uninitialized
    {
    public:
        using value_type = Value;

    private:
        alignas(Value)::std::byte m_storage[sizeof(Value)]; // NOLINT(*-avoid-c-arrays)
    };
} // namespace scl::feature::inplace
```


