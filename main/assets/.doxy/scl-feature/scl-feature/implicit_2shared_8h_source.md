

# File shared.h

[**File List**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**tool**](dir_0db53c02b814272e3ba3b8732fb26ebe.md) **>** [**implicit**](dir_096185a65b7ad433db0580fac5802b6f.md) **>** [**shared.h**](implicit_2shared_8h.md)

[Go to the documentation of this file](implicit_2shared_8h.md)


```C++
#pragma once
#ifndef SCL_WRAPPER_TOOL_IMPLICIT_SHARED_H
#define SCL_WRAPPER_TOOL_IMPLICIT_SHARED_H

#include <memory>
#include <utility>

#include <scl/feature/access/holder_guard.h>
#include <scl/feature/trait.h>
#include <scl/utility/type_traits.h>

namespace ScL::Feature::Implicit
{
    struct Shared
    {
        template <typename _Value>
        struct Holder
        {
            using ThisType = Holder<_Value>;
            using Value = _Value;

            using Pointer = ::std::shared_ptr<Value>;
            using WritableGuard = ::ScL::Feature::HolderGuard<ThisType &>;

            Pointer m_pointer;

            template <typename... _Arguments>
            Holder(_Arguments &&... arguments)
                : m_pointer{::std::make_shared<Value>(::std::forward<_Arguments>(arguments)...)}
            {}

            Holder(ThisType && other)
                : m_pointer{::std::forward<Pointer>(other.m_pointer)}
            {}

            Holder(ThisType const && other)
                : m_pointer{other.m_pointer}
            {}

            Holder(ThisType & other)
                : m_pointer{other.m_pointer}
            {}

            Holder(ThisType const & other)
                : m_pointer{other.m_pointer}
            {}

            template <typename _OtherValue>
            Holder(Holder<_OtherValue> && other)
                : m_pointer{::std::forward<typename Holder<_OtherValue>::Pointer>(other.m_pointer)}
            {}

            template <typename _OtherValue>
            Holder(Holder<_OtherValue> const && other)
                : m_pointer{other.m_pointer}
            {}

            template <typename _OtherValue>
            Holder(Holder<_OtherValue> & other)
                : m_pointer{other.m_pointer}
            {}

            template <typename _OtherValue>
            Holder(Holder<_OtherValue> const & other)
                : m_pointer{other.m_pointer}
            {}

            ~Holder() { m_pointer.reset(); }

            template <typename _LeftWrapperRefer,
                typename _RightWrapperRefer,
                typename = ::std::enable_if_t<
                    !::std::is_const< ::std::remove_reference_t<_LeftWrapperRefer> >::value
                    && ::ScL::Feature::IsThisCompatibleWithOther<
                        ::std::decay_t<_RightWrapperRefer>,
                        ::std::decay_t<_LeftWrapperRefer> >::value
                    && (::std::is_volatile< ::std::remove_reference_t<_LeftWrapperRefer> >::value
                        == ::std::is_volatile<
                            ::std::remove_reference_t<_RightWrapperRefer> >::value)> >
            static decltype(auto) operatorAssignment(
                _LeftWrapperRefer && left, _RightWrapperRefer && right)
            {
                using RightWrapperRefer = _RightWrapperRefer &&;
                using RightHolder = typename ::std::decay_t<RightWrapperRefer>::Holder;
                using RightPointerRefer = ::ScL::SimilarRefer<typename RightHolder::Pointer,
                    RightWrapperRefer>;
                ::ScL::Feature::Detail::wrapperHolder(left)
                    .m_pointer = ::std::forward<RightPointerRefer>(
                    ::ScL::Feature::Detail::wrapperHolder(right).m_pointer);
            }

            template <typename _HolderRefer,
                typename = ::std::enable_if_t<
                    !::std::is_const< ::std::remove_reference_t<_HolderRefer> >::value> >
            static constexpr void guard(_HolderRefer && holder)
            {
                if (!!holder.m_pointer && holder.m_pointer.use_count() != 1)
                    holder.m_pointer = ::std::make_shared<Value>(*holder.m_pointer.get());
            }

            template <typename _HolderRefer,
                typename = ::std::enable_if_t<
                    !::std::is_volatile< ::std::remove_reference_t<_HolderRefer> >::value> >
            static constexpr decltype(auto) value(_HolderRefer && holder)
            {
                using HolderRefer = _HolderRefer &&;
                using ValueRefer = ::ScL::SimilarRefer<_Value, HolderRefer>;
                // NOTE: Functionality ::std::shared_ptr has a limitation for volatile case.
                return ::std::forward<ValueRefer>(*holder.m_pointer.get());
            }
        };
    };
} // namespace ScL::Feature::Implicit

#endif
```


