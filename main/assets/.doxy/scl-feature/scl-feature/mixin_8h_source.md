

# File mixin.h

[**File List**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**mixin.h**](mixin_8h.md)

[Go to the documentation of this file](mixin_8h.md)


```C++
#pragma once
#ifndef SCL_FEATURED_MIXIN_H
#define SCL_FEATURED_MIXIN_H

#include <type_traits>

namespace ScL::Feature::Detail
{
    template <typename Self_, typename SelfHolder_, typename Value_>
    class ReflectionMixIn
    {};

    template <typename Self_, typename Value_>
    class CastingMixIn
    {};
} // namespace ScL::Feature::Detail

namespace ScL::Feature
{
    template <typename Self_, typename SelfHolder_, typename Value_>
    class ValueReflectionMixIn
    {};

    template <typename Self_, typename SelfHolder_, typename Value_>
    class ToolReflectionMixIn
    {};
} // namespace ScL::Feature

namespace ScL::Feature
{
    template <typename Self_>
    class ToolAdditionMixIn
    {};
} // namespace ScL::Feature

namespace ScL::Feature
{
    template <typename Self_, typename SelfHolder_>
    class MixIn
        : public ::ScL::Feature::ToolAdditionMixIn<Self_>
        , public ::ScL::Feature::Detail::CastingMixIn<Self_, Self_>
        , public ::ScL::Feature::Detail::ReflectionMixIn<Self_, SelfHolder_, Self_>
    {
        static_assert(!::std::is_reference_v<Self_>);
        static_assert(!::std::is_reference_v<SelfHolder_>);
    };
} // namespace ScL::Feature

#endif
```


