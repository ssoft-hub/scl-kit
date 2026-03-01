

# File refer\_pointer.h

[**File List**](files.md) **>** [**access**](dir_72f9e8d407eb10544270ff484bd5a287.md) **>** [**detail**](dir_70c1ec0daadfbed979152c48a97b4cf5.md) **>** [**refer\_pointer.h**](refer__pointer_8h.md)

[Go to the documentation of this file](refer__pointer_8h.md)


```C++
#pragma once

#include <memory>
#include <utility>

namespace ScL::Feature::Detail
{
    template <typename _Refer>
    class ReferPointer
    {
        using ThisType = ReferPointer<_Refer>;

    public:
        using Refer = _Refer;
        using Value = ::std::remove_reference_t<Refer>;
        using RawPointer = ::std::add_pointer_t<Value>;

        static_assert(::std::is_reference<Refer>::value,
            "The template parameter _Refer must to be a reference type.");

    private:
        Refer m_refer;

    private:
        ReferPointer(ThisType && other) = delete;
        ReferPointer(ThisType const & other) = delete;

    public:
        constexpr ReferPointer(Refer refer)
            : m_refer{refer}
        {}

        constexpr Refer operator*() const { return ::std::forward<Refer>(m_refer); }

        constexpr RawPointer operator->() const { return ::std::addressof(m_refer); }
    };
} // namespace ScL::Feature::Detail
```


