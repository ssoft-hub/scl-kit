

# File uninitialized.h

[**File List**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**tool**](dir_0db53c02b814272e3ba3b8732fb26ebe.md) **>** [**inplace**](dir_7bf0b05e4f8b53958db4f23e94c624c5.md) **>** [**uninitialized.h**](uninitialized_8h.md)

[Go to the documentation of this file](uninitialized_8h.md)


```C++
#pragma once
#ifndef SCL_WRAPPER_TOOL_INPLACE_UNINITIALIZED_H
#define SCL_WRAPPER_TOOL_INPLACE_UNINITIALIZED_H

#include <scl/utility/type_traits.h>

#include <utility>

namespace ScL::Feature::Inplace
{
    struct Uninitialized
    {
        template <typename _Value>
        struct Holder
        {
            using ThisType = Holder<_Value>;
            using Value = _Value;

            Value m_value;

            constexpr Holder() {}

            template <typename _HolderRefer>
            static constexpr decltype(auto) value(_HolderRefer && holder)
            {
                using HolderRefer = _HolderRefer &&;
                using ValueRefer = ::ScL::SimilarRefer<Value, HolderRefer>;
                return ::std::forward<ValueRefer>(holder.m_value);
            }
        };
    };
} // namespace ScL::Feature::Inplace

#endif
```


