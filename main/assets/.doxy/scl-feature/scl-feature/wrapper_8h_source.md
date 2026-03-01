

# File wrapper.h

[**File List**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**wrapper.h**](wrapper_8h.md)

[Go to the documentation of this file](wrapper_8h.md)


```C++
#pragma once
#ifndef SCL_FUTURE_WRAPPER_H
#define SCL_FUTURE_WRAPPER_H

#ifdef _MSC_VER
#pragma warning(disable: 4521 4522)
#endif

namespace ScL::Feature::Inplace
{
    struct Default;
} // namespace ScL::Feature::Inplace

namespace ScL::Feature::Detail
{
    template <typename, typename>
    class Wrapper;
} // namespace ScL::Feature::Detail

namespace ScL::Feature::Detail
{
    template <typename _Value, typename... _Tools>
    struct MultiToolHelper;

    template <typename _Value>
    struct MultiToolHelper<_Value>
    {
        using Type = typename MultiToolHelper<_Value, ::ScL::Feature::Inplace::Default>::Type;
    };

    template <typename _Value, typename _Tool>
    struct MultiToolHelper<_Value, _Tool>
    {
        using Type = ::ScL::Feature::Detail::Wrapper<_Value, _Tool>;
    };

    template <typename _Value, typename _Tool>
    struct MultiToolHelper< ::ScL::Feature::Detail::Wrapper<_Value, _Tool> >
    {
        using Type = ::ScL::Feature::Detail::Wrapper<_Value, _Tool>;
    };

    template <typename _Value, typename _Tool, typename... _Tools>
    struct MultiToolHelper<_Value, _Tool, _Tools...>
    {
        using Type = typename MultiToolHelper< ::ScL::Feature::Detail::Wrapper<_Value, _Tool>,
            _Tools...>::Type;
    };

    template <typename _Value, typename _Tool, typename... _Tools>
    struct MultiToolHelper<_Value, _Tool, _Tool, _Tools...>
    {
        using Type = typename MultiToolHelper<_Value, _Tool, _Tools...>::Type;
    };
} // namespace ScL::Feature::Detail

namespace ScL::Feature::Detail
{
    template <typename _Type>
    struct WrapperSimplifyHelper
    {
        using Type = _Type;
    };

    template <typename _Value, typename _Tool, typename _OtherTool>
    struct WrapperSimplifyHelper<
        ::ScL::Feature::Detail::Wrapper< ::ScL::Feature::Detail::Wrapper<_Value, _Tool>,
            _OtherTool> >
    {
        using Type = ::ScL::Feature::Detail::Wrapper<
            typename WrapperSimplifyHelper< ::ScL::Feature::Detail::Wrapper<_Value, _Tool> >::Type,
            _OtherTool>;
    };

    template <typename _Value, typename _Tool>
    struct WrapperSimplifyHelper<
        ::ScL::Feature::Detail::Wrapper< ::ScL::Feature::Detail::Wrapper<_Value, _Tool>, _Tool> >
    {
        using Type = typename WrapperSimplifyHelper<
            ::ScL::Feature::Detail::Wrapper<_Value, _Tool> >::Type;
    };
} // namespace ScL::Feature::Detail

namespace ScL::Feature
{
    template <typename _Value, typename... _Tools>
    using Wrapper = typename ::ScL::Feature::Detail::WrapperSimplifyHelper<
        typename ::ScL::Feature::Detail::MultiToolHelper<_Value, _Tools...>::Type>::Type;
} // namespace ScL::Feature

// ::ScL::Feature::Wrapper must be defined before includes.
#include "detail/wrapper.h"

#endif
```


