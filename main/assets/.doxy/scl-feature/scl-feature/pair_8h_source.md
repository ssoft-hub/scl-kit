

# File pair.h

[**File List**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**reflection**](dir_262f3534dca743723347393893d6556e.md) **>** [**std**](dir_c95cccd52aeb9cfbe30ebf02714dd6b9.md) **>** [**pair.h**](pair_8h.md)

[Go to the documentation of this file](pair_8h.md)


```C++
#pragma once
#ifndef SCL_FEATURE_REFLECTION_STRING_H
#define SCL_FEATURE_REFLECTION_STRING_H

#include <scl/feature/mixin.h>
#include <scl/feature/reflection.h>

#include <utility>

namespace ScL::Feature {
template<typename Self_, typename SelfHolder_, typename First_, typename Second_>
class ValueReflectionMixIn<Self_, SelfHolder_, ::std::pair<First_, Second_>>
{
    SCL_REFLECT_PROPERTY(first);
    SCL_REFLECT_PROPERTY(second);

    // using first_type = SCL_DECLTYPE_PROPERTY(first);
    // using second_type = SCL_DECLTYPE_PROPERTY(second);
};
} // namespace ScL::Feature

#endif
```


