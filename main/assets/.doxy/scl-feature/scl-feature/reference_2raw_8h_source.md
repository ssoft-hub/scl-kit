

# File raw.h

[**File List**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**tool**](dir_0db53c02b814272e3ba3b8732fb26ebe.md) **>** [**reference**](dir_9115f697aa3f801177eb2e38965df668.md) **>** [**raw.h**](reference_2raw_8h.md)

[Go to the documentation of this file](reference_2raw_8h.md)


```C++
#pragma once
#ifndef SCL_WRAPPER_TOOL_REFERENCE_RAW_H
#define SCL_WRAPPER_TOOL_REFERENCE_RAW_H

#include <scl/utility/type_traits.h>

#include <utility>

namespace ScL::Feature::Reference
{
    struct Raw
    {
        template <typename _Value>
        struct Holder
        {
            using ThisType = Holder<_Value>;
            using Value = _Value;
            using ValuePtr = Value *;

            ValuePtr m_value_ptr;

            Holder(Value && other) = delete;

            constexpr Holder(Value & other) noexcept
                : m_value_ptr(::std::addressof(other))
            {}

            constexpr Holder(ThisType && other) noexcept
                : m_value_ptr(::std::forward<ValuePtr>(other.m_value_ptr))
            {}

            constexpr Holder(ThisType const && other) noexcept
                : m_value_ptr(::std::forward<ValuePtr const>(other.m_value_ptr))
            {}

            constexpr Holder(ThisType volatile && other) noexcept
                : m_value_ptr(::std::forward<ValuePtr volatile>(other.m_value_ptr))
            {}

            constexpr Holder(ThisType const volatile && other) noexcept
                : m_value_ptr(::std::forward<ValuePtr const volatile>(other.m_value_ptr))
            {}

            constexpr Holder(ThisType & other) noexcept
                : m_value_ptr(other.m_value_ptr)
            {}

            constexpr Holder(ThisType const & other) noexcept
                : m_value_ptr(other.m_value_ptr)
            {}

            constexpr Holder(ThisType volatile & other) noexcept
                : m_value_ptr(other.m_value_ptr)
            {}

            constexpr Holder(ThisType const volatile & other) noexcept
                : m_value_ptr(other.m_value_ptr)
            {}

            template <typename _OtherValue>
            constexpr Holder(Holder<_OtherValue> && other) noexcept
                : m_value_ptr(
                      ::std::forward<typename Holder<_OtherValue>::ValuePtr>(other.m_value_ptr))
            {}

            template <typename _OtherValue>
            constexpr Holder(Holder<_OtherValue> const && other) noexcept
                : m_value_ptr(::std::forward<typename Holder<_OtherValue const>::ValuePtr>(
                      other.m_value_ptr))
            {}

            template <typename _OtherValue>
            constexpr Holder(Holder<_OtherValue> volatile && other) noexcept
                : m_value_ptr(::std::forward<typename Holder<_OtherValue volatile>::ValuePtr>(
                      other.m_value_ptr))
            {}

            template <typename _OtherValue>
            constexpr Holder(Holder<_OtherValue> const volatile && other) noexcept
                : m_value_ptr(::std::forward<typename Holder<_OtherValue const volatile>::ValuePtr>(
                      other.m_value_ptr))
            {}

            template <typename _OtherValue>
            constexpr Holder(Holder<_OtherValue> & other) noexcept
                : m_value_ptr(other.m_value_ptr)
            {}

            template <typename _OtherValue>
            constexpr Holder(Holder<_OtherValue> const & other) noexcept
                : m_value_ptr(other.m_value_ptr)
            {}

            template <typename _OtherValue>
            constexpr Holder(Holder<_OtherValue> volatile & other) noexcept
                : m_value_ptr(other.m_value_ptr)
            {}

            template <typename _OtherValue>
            constexpr Holder(Holder<_OtherValue> const volatile & other) noexcept
                : m_value_ptr(other.m_value_ptr)
            {}

            template <typename _HolderRefer>
            static constexpr decltype(auto) value(_HolderRefer && holder) noexcept
            {
                using HolderRefer = _HolderRefer &&;
                using ValueRefer = ::ScL::SimilarRefer<Value, HolderRefer>;
                return ::std::forward<ValueRefer>(*holder.m_value_ptr);
            }
        };
    };
} // namespace ScL::Feature::Reference

#endif
```


