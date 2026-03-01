

# File featured.h

[**File List**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**tool**](dir_0db53c02b814272e3ba3b8732fb26ebe.md) **>** [**guard**](dir_36f128d2e82f1953ec658a4cf76f9eed.md) **>** [**featured.h**](featured_8h.md)

[Go to the documentation of this file](featured_8h.md)


```C++
#pragma once
#ifndef SCL_GUARD_FEATURED_TOOL_H
#define SCL_GUARD_FEATURED_TOOL_H

#include <scl/feature/access/value_guard.h>
#include <scl/utility/type_traits.h>

namespace ScL::Feature::Guard
{
    template <typename _Wrapper>
    struct Featured
    {
        using WrapperRefer = _Wrapper;

        template <typename _Value>
        struct Holder
        {
            using ThisType = Holder<_Value>;
            using Value = _Value;
            using ValueGuard = ::ScL::Feature::ValueGuard<WrapperRefer>;

            ValueGuard m_value_guard;

            Holder(WrapperRefer refer)
                : m_value_guard(::std::forward<WrapperRefer>(refer))
            {}

            template <typename _HolderRefer,
                typename = ::std::enable_if_t<
                    ::std::is_same<ThisType, ::std::decay_t<_HolderRefer> >::value> >
            static constexpr decltype(auto) value(_HolderRefer && holder)
            {
                using HolderRefer = _HolderRefer &&;
                using ValueRefer = ::ScL::SimilarRefer<Value, HolderRefer>;
                return ::std::forward<ValueRefer>(holder.m_value_guard.valueAccess());
            }
        };
    };
} // namespace ScL::Feature::Guard

#endif
```


