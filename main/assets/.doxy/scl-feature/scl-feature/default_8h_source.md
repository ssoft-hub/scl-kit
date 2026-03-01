

# File default.h

[**File List**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**tool**](dir_0db53c02b814272e3ba3b8732fb26ebe.md) **>** [**inplace**](dir_7bf0b05e4f8b53958db4f23e94c624c5.md) **>** [**default.h**](default_8h.md)

[Go to the documentation of this file](default_8h.md)


```C++
#pragma once
#ifndef SCL_WRAPPER_TOOL_INPLACE_DEFAULT_H
#define SCL_WRAPPER_TOOL_INPLACE_DEFAULT_H

#include <scl/utility/type_traits.h>
#include <utility>

namespace ScL::Feature::Inplace
{
    struct Default
    {
        template <typename _Value>
        struct Holder
        {
            using ThisType = Holder<_Value>;
            using Value = _Value;

            Value m_value;

            template <typename... _Arguments>
            constexpr Holder(_Arguments &&... arguments)
                noexcept(::std::is_nothrow_constructible<Value, _Arguments &&...>())
                : m_value(::std::forward<_Arguments>(arguments)...)
            {}

            constexpr Holder(ThisType && other)
                noexcept(::std::is_nothrow_constructible<Value, Value &&>())
                : m_value{::std::forward<Value>(other.m_value)}
            {}

            constexpr Holder(ThisType const && other)
                noexcept(::std::is_nothrow_constructible<Value, Value const &&>())
                : m_value{::std::forward<Value const>(other.m_value)}
            {}

            constexpr Holder(ThisType volatile && other)
                noexcept(::std::is_nothrow_constructible<Value, Value volatile &&>())
                : m_value{::std::forward<Value volatile>(other.m_value)}
            {}

            constexpr Holder(ThisType const volatile && other)
                noexcept(::std::is_nothrow_constructible<Value, Value const volatile &&>())
                : m_value{::std::forward<Value const volatile>(other.m_value)}
            {}

            constexpr Holder(ThisType & other)
                noexcept(::std::is_nothrow_constructible<Value, Value &>())
                : m_value{other.m_value}
            {}

            constexpr Holder(ThisType const & other)
                noexcept(::std::is_nothrow_constructible<Value, Value const &>())
                : m_value{other.m_value}
            {}

            constexpr Holder(ThisType volatile & other)
                noexcept(::std::is_nothrow_constructible<Value, Value volatile &>())
                : m_value{other.m_value}
            {}

            constexpr Holder(ThisType const volatile & other)
                noexcept(::std::is_nothrow_constructible<Value, Value const volatile &>())
                : m_value{other.m_value}
            {}

            template <typename _OtherValue>
            constexpr Holder(Holder<_OtherValue> && other)
                noexcept(::std::is_nothrow_constructible<Value, _OtherValue &&>())
                : m_value{::std::forward<typename Holder<_OtherValue>::Value>(other.m_value)}
            {}

            template <typename _OtherValue>
            constexpr Holder(Holder<_OtherValue> const && other)
                noexcept(::std::is_nothrow_constructible<Value, _OtherValue const &&>())
                : m_value{::std::forward<typename Holder<_OtherValue const>::Value>(other.m_value)}
            {}

            template <typename _OtherValue>
            constexpr Holder(Holder<_OtherValue> volatile && other)
                noexcept(::std::is_nothrow_constructible<Value, _OtherValue volatile &&>())
                : m_value{
                      ::std::forward<typename Holder<_OtherValue volatile>::Value>(other.m_value)}
            {}

            template <typename _OtherValue>
            constexpr Holder(Holder<_OtherValue> const volatile && other)
                noexcept(::std::is_nothrow_constructible<Value, _OtherValue const volatile &&>())
                : m_value{::std::forward<typename Holder<_OtherValue const volatile>::Value>(
                      other.m_value)}
            {}

            template <typename _OtherValue>
            constexpr Holder(Holder<_OtherValue> & other)
                noexcept(::std::is_nothrow_constructible<Value, _OtherValue &>())
                : m_value{other.m_value}
            {}

            template <typename _OtherValue>
            constexpr Holder(Holder<_OtherValue> const & other)
                noexcept(::std::is_nothrow_constructible<Value, _OtherValue const &>())
                : m_value{other.m_value}
            {}

            template <typename _OtherValue>
            constexpr Holder(Holder<_OtherValue> volatile & other)
                noexcept(::std::is_nothrow_constructible<Value, _OtherValue volatile &>())
                : m_value{other.m_value}
            {}

            template <typename _OtherValue>
            constexpr Holder(Holder<_OtherValue> const volatile & other)
                noexcept(::std::is_nothrow_constructible<Value, _OtherValue const volatile &>())
                : m_value{other.m_value}
            {}

            template <typename _HolderRefer>
            static constexpr decltype(auto) value(_HolderRefer && holder) noexcept
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


