

# File shared\_mutex.h

[**File List**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**tool**](dir_0db53c02b814272e3ba3b8732fb26ebe.md) **>** [**thread\_safe**](dir_8a2b411b9706713697d4c9ec9050a0f3.md) **>** [**shared\_mutex.h**](shared__mutex_8h.md)

[Go to the documentation of this file](shared__mutex_8h.md)


```C++
#pragma once
#ifndef SCL_WRAPPER_TOOL_THREAD_SAFE_SHARED_MUTEX_H
#define SCL_WRAPPER_TOOL_THREAD_SAFE_SHARED_MUTEX_H

#include <scl/feature/tool/thread_safe/lock.h>

#if __cplusplus > 201700L
#   include <shared_mutex>
#else
#include "private/shared_mutex.h"
#endif

namespace ScL
{
    using SharedMutex =
#if __cplusplus > 201700L
        ::std::shared_mutex
#else
    ::ScL::Feature::Detail::SharedMutex
#endif
    ;
}

namespace ScL::Feature::ThreadSafe
{
    template < typename _Holder >
    struct Locking< ::ScL::SharedMutex, _Holder >
    {
        template < typename _LockRefer >
        static constexpr void lock ( _LockRefer && lock )
        {
            using LockRefer = _LockRefer &&;
            ::std::forward< LockRefer >( lock ).lock();
        }

        template < typename _LockRefer >
        static constexpr void unlock ( _LockRefer && lock )
        {
            using LockRefer = _LockRefer &&;
            ::std::forward< LockRefer >( lock ).unlock();
        }
    };

    template < typename _Holder >
    struct Locking< ::ScL::SharedMutex, const _Holder >
    {
        template < typename _LockRefer >
        static constexpr void lock ( _LockRefer && lock )
        {
            using LockRefer = _LockRefer &&;
            ::std::forward< LockRefer >( lock ).lock_shared();
        }

        template < typename _LockRefer >
        static constexpr void unlock ( _LockRefer && lock )
        {
            using LockRefer = _LockRefer &&;
            ::std::forward< LockRefer >( lock ).unlock_shared();
        }
    };
}

namespace ScL::Feature::ThreadSafe
{
    using SharedMutex = ::ScL::Feature::ThreadSafe::Lock< ::ScL::SharedMutex >;
}

#endif
```


