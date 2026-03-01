

# File unique.h

[**File List**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**tool**](dir_0db53c02b814272e3ba3b8732fb26ebe.md) **>** [**heap**](dir_816633cfa35d7e17fbf25bbeb0389798.md) **>** [**unique.h**](unique_8h.md)

[Go to the documentation of this file](unique_8h.md)


```C++
#pragma once
#ifndef SCL_WRAPPER_TOOL_HEAP_UNIQUE_H
#define SCL_WRAPPER_TOOL_HEAP_UNIQUE_H

#include <memory>
#include <utility>

#include <scl/feature/access/holder_guard.h>
#include <scl/feature/trait.h>
#include <scl/utility/type_traits.h>

namespace ScL::Feature::Heap
{
    struct Unique
    {
        template <typename _Value>
        struct Holder
        {
            using ThisType = Holder<_Value>;
            using Value = _Value;
            using Pointer = ::std::unique_ptr<_Value>;

            Pointer m_pointer;

            template <typename... _Arguments>
            Holder(_Arguments &&... arguments)
                : m_pointer{::std::make_unique<Value>(::std::forward<_Arguments>(arguments)...)}
            {}

            Holder(ThisType && other)
                : m_pointer{::std::forward<Pointer>(other.m_pointer)}
            {}

            Holder(ThisType const && other)
                : Holder{*other.m_pointer.get()}
            {}

            Holder(ThisType & other)
                : Holder{*other.m_pointer.get()}
            {}

            Holder(ThisType const & other)
                : Holder{*other.m_pointer.get()}
            {}

            template <typename _OtherValue>
            Holder(Holder<_OtherValue> && other)
                : m_pointer{::std::forward<typename Holder<_OtherValue>::Pointer>(other.m_pointer)}
            {}

            template <typename _OtherValue>
            Holder(Holder<_OtherValue> const && other)
                : Holder{*other.m_pointer.get()}
            {}

            template <typename _OtherValue>
            Holder(Holder<_OtherValue> & other)
                : Holder{*other.m_pointer.get()}
            {}

            template <typename _OtherValue>
            Holder(Holder<_OtherValue> const & other)
                : Holder{*other.m_pointer.get()}
            {}

            template <typename _LeftWrapperRefer,
                typename _RightWrapperRefer,
                typename = ::std::enable_if_t<
                    !::std::is_const< ::std::remove_reference_t<_LeftWrapperRefer> >::value
                    && ::ScL::Feature::IsThisCompatibleWithOther<
                        ::std::decay_t<_RightWrapperRefer>,
                        ::std::decay_t<_LeftWrapperRefer> >::value
                    && !::std::is_const< ::std::remove_reference_t<_RightWrapperRefer> >::value
                    && (::std::is_volatile< ::std::remove_reference_t<_LeftWrapperRefer> >::value
                        == ::std::is_volatile<
                            ::std::remove_reference_t<_RightWrapperRefer> >::value)
                    && ::std::is_rvalue_reference<_RightWrapperRefer &&>::value> >
            static decltype(auto) operatorAssignment_(
                _LeftWrapperRefer && left, _RightWrapperRefer && right)
            {
                ::ScL::Feature::Detail::wrapperHolder(left).m_pointer.swap(
                    ::ScL::Feature::Detail::wrapperHolder(right).m_pointer);
                return ::std::forward<_LeftWrapperRefer>(left);
            }

            template <typename _HolderRefer,
                typename = ::std::enable_if_t<
                    !::std::is_volatile< ::std::remove_reference_t<_HolderRefer> >::value> >
            static constexpr decltype(auto) value(_HolderRefer && holder)
            {
                using HolderRefer = _HolderRefer &&;
                using ValueRefer = ::ScL::SimilarRefer<_Value, HolderRefer>;
                // NOTE: Functionality ::std::unique_ptr has a limitation for volatile case.
                return ::std::forward<ValueRefer>(*holder.m_pointer.get());
            }
        };
    };
} // namespace ScL::Feature::Heap

#endif
```


