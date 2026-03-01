

# File lock.h

[**File List**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**tool**](dir_0db53c02b814272e3ba3b8732fb26ebe.md) **>** [**thread\_safe**](dir_8a2b411b9706713697d4c9ec9050a0f3.md) **>** [**lock.h**](lock_8h.md)

[Go to the documentation of this file](lock_8h.md)


```C++
#pragma once
#ifndef SCL_WRAPPER_TOOL_THREAD_SAFE_LOCK_H
#define SCL_WRAPPER_TOOL_THREAD_SAFE_LOCK_H

#include <scl/feature/access/holder_guard.h>
#include <scl/utility/type_traits.h>

namespace ScL::Feature::ThreadSafe
{
    template <typename _Lock, typename _HolderRefer>
    struct Locking;
} // namespace ScL::Feature::ThreadSafe

namespace ScL::Feature::ThreadSafe
{
    template <typename _Lock>
    struct Lock
    {
        template <typename _Value>
        struct Holder
        {
            using ThisType = Holder<_Value>;
            using Value = _Value;
            using LockType = _Lock;

            mutable LockType m_lock;
            Value m_value;

            template <typename... _Arguments>
            Holder(_Arguments &&... arguments)
                : m_lock{}
                , m_value{::std::forward<_Arguments>(arguments)...}
            {}

            Holder(ThisType && other)
                : m_lock{}
            {
                using OtherMovableGuard = ::ScL::Feature::HolderGuard<ThisType &&>;
                OtherMovableGuard guard(other);
                m_value = ::std::forward<Value>(other.m_value);
            }

            Holder(ThisType const && other)
                : m_lock{}
            {
                using OtherReadableGuard = ::ScL::Feature::HolderGuard<ThisType const &&>;
                OtherReadableGuard guard(other);
                m_value = ::std::forward<Value const>(other.m_value);
            }

            Holder(ThisType volatile && other)
                : m_lock{}
            {
                using OtherMovableGuard = ::ScL::Feature::HolderGuard<ThisType volatile &&>;
                OtherMovableGuard guard(other);
                m_value = ::std::forward<Value volatile>(other.m_value);
            }

            Holder(ThisType const volatile && other)
                : m_lock{}
            {
                using OtherReadableGuard = ::ScL::Feature::HolderGuard<ThisType const volatile &&>;
                OtherReadableGuard guard(other);
                m_value = ::std::forward<Value const volatile>(other.m_value);
            }

            Holder(ThisType & other)
                : m_lock{}
            {
                using OtherMovableGuard = ::ScL::Feature::HolderGuard<ThisType &>;
                OtherMovableGuard guard(other);
                m_value = other.m_value;
            }

            Holder(ThisType const & other)
                : m_lock{}
            {
                using OtherReadableGuard = ::ScL::Feature::HolderGuard<ThisType const &>;
                OtherReadableGuard guard(other);
                m_value = other.m_value;
            }

            Holder(ThisType volatile & other)
                : m_lock{}
            {
                using OtherMovableGuard = ::ScL::Feature::HolderGuard<ThisType volatile &>;
                OtherMovableGuard guard(other);
                m_value = other.m_value;
            }

            Holder(ThisType const volatile & other)
                : m_lock{}
            {
                using OtherReadableGuard = ::ScL::Feature::HolderGuard<ThisType const volatile &>;
                OtherReadableGuard guard(other);
                m_value = other.m_value;
            }

            template <typename _OtherValue>
            Holder(Holder<_OtherValue> && other)
                : m_lock{}
            {
                using OtherMovableGuard = ::ScL::Feature::HolderGuard<Holder<_OtherValue> &&>;
                OtherMovableGuard guard(other);
                m_value = ::std::forward<Value>(other.m_value);
            }

            template <typename _OtherValue>
            Holder(Holder<_OtherValue> const && other)
                : m_lock{}
            {
                using OtherReadableGuard = ::ScL::Feature::HolderGuard<
                    Holder<_OtherValue> const &&>;
                OtherReadableGuard guard(other);
                m_value = ::std::forward<Value const>(other.m_value);
            }

            template <typename _OtherValue>
            Holder(Holder<_OtherValue> volatile && other)
                : m_lock{}
            {
                using OtherMovableGuard = ::ScL::Feature::HolderGuard<
                    Holder<_OtherValue> volatile &&>;
                OtherMovableGuard guard(other);
                m_value = ::std::forward<Value>(other.m_value);
            }

            template <typename _OtherValue>
            Holder(Holder<_OtherValue> const volatile && other)
                : m_lock{}
            {
                using OtherReadableGuard = ::ScL::Feature::HolderGuard<
                    Holder<_OtherValue> const volatile &&>;
                OtherReadableGuard guard(other);
                m_value = ::std::forward<Value const volatile>(other.m_value);
            }

            template <typename _OtherValue>
            Holder(Holder<_OtherValue> & other)
                : m_lock{}
            {
                using OtherMovableGuard = ::ScL::Feature::HolderGuard<Holder<_OtherValue> &>;
                OtherMovableGuard guard(other);
                m_value = other.m_value;
            }

            template <typename _OtherValue>
            Holder(Holder<_OtherValue> const & other)
                : m_lock{}
            {
                using OtherReadableGuard = ::ScL::Feature::HolderGuard<Holder<_OtherValue> const &>;
                OtherReadableGuard guard(other);
                m_value = other.m_value;
            }

            template <typename _OtherValue>
            Holder(Holder<_OtherValue> volatile & other)
                : m_lock{}
            {
                using OtherMovableGuard = ::ScL::Feature::HolderGuard<
                    Holder<_OtherValue> volatile &>;
                OtherMovableGuard guard(other);
                m_value = other.m_value;
            }

            template <typename _OtherValue>
            Holder(Holder<_OtherValue> const volatile & other)
                : m_lock{}
            {
                using OtherReadableGuard = ::ScL::Feature::HolderGuard<
                    Holder<_OtherValue> const volatile &>;
                OtherReadableGuard guard(other);
                m_value = other.m_value;
            }

            ~Holder()
            {
                using WritableGuard = ::ScL::Feature::HolderGuard<ThisType &>;
                WritableGuard guard(*this);
            }

            template <typename _HolderRefer>
            static constexpr void guard(_HolderRefer && holder)
            {
                using HolderRefer = _HolderRefer &&;
                ::ScL::Feature::ThreadSafe::Locking<LockType,
                    ::std::remove_reference_t<
                        HolderRefer> >::lock(::std::forward<HolderRefer>(holder).m_lock);
            }

            template <typename _HolderRefer>
            static constexpr void unguard(_HolderRefer && holder)
            {
                using HolderRefer = _HolderRefer &&;
                ::ScL::Feature::ThreadSafe::Locking<LockType,
                    ::std::remove_reference_t<
                        HolderRefer> >::unlock(::std::forward<HolderRefer>(holder).m_lock);
            }

            template <typename _HolderRefer>
            static constexpr decltype(auto) value(_HolderRefer && holder)
            {
                using HolderRefer = _HolderRefer &&;
                using ValueRefer = ::ScL::SimilarRefer<_Value, HolderRefer>;
                return ::std::forward<ValueRefer>(holder.m_value);
            }
        };
    };
} // namespace ScL::Feature::ThreadSafe

#endif
```


