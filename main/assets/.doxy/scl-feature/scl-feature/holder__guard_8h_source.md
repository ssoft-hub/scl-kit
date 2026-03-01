

# File holder\_guard.h

[**File List**](files.md) **>** [**access**](dir_72f9e8d407eb10544270ff484bd5a287.md) **>** [**holder\_guard.h**](holder__guard_8h.md)

[Go to the documentation of this file](holder__guard_8h.md)


```C++
#pragma once
#ifndef SCL_GUARD_HOLDER_POINTER_H
#define SCL_GUARD_HOLDER_POINTER_H

#include "detail/holder_interface.h"

#include <type_traits>
#include <utility>

namespace ScL::Feature
{
    template <typename _HolderRefer>
    class HolderGuard
    {
        using ThisType = HolderGuard<_HolderRefer>;

    public:
        using HolderRefer = _HolderRefer;
        using Holder = ::std::decay_t<HolderRefer>;

        static_assert(::std::is_reference<HolderRefer>::value,
            "The template parameter _HolderRefer must to be a reference type.");

    private:
        HolderRefer m_holder;

    private:
        HolderGuard(ThisType &&) = delete;
        HolderGuard(ThisType const &&) = delete;
        HolderGuard(ThisType volatile &&) = delete;
        HolderGuard(ThisType const volatile &&) = delete;
        HolderGuard(ThisType &) = delete;
        HolderGuard(ThisType const &) = delete;
        HolderGuard(ThisType volatile &) = delete;
        HolderGuard(ThisType const volatile &) = delete;

    public:
        HolderGuard(HolderRefer holder)
            : m_holder(::std::forward<HolderRefer>(holder))
        {
            ::ScL::Feature::Detail::HolderInterface::guard<HolderRefer>(
                ::std::forward<HolderRefer>(m_holder));
        }

        ~HolderGuard()
        {
            ::ScL::Feature::Detail::HolderInterface::unguard<HolderRefer>(
                ::std::forward<HolderRefer>(m_holder));
        }
    };
} // namespace ScL::Feature

#endif
```


