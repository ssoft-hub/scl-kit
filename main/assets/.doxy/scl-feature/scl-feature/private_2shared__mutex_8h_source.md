

# File shared\_mutex.h

[**File List**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**tool**](dir_0db53c02b814272e3ba3b8732fb26ebe.md) **>** [**thread\_safe**](dir_8a2b411b9706713697d4c9ec9050a0f3.md) **>** [**private**](dir_9e2643970d322ab98f0c971a04cf35ed.md) **>** [**shared\_mutex.h**](private_2shared__mutex_8h.md)

[Go to the documentation of this file](private_2shared__mutex_8h.md)


```C++
#pragma once
#ifndef SCL_TOOL_PRIVATE_SHATED_MUTEX_H
#define SCL_TOOL_PRIVATE_SHATED_MUTEX_H

#include <condition_variable>
#include <mutex>

namespace ScL::Feature::Detail
{
    /*
     * Copied implementation from Boost library
     */
    class SharedMutex
    {
    private:
        struct StateData
        {
            unsigned m_shared_count;
            bool m_exclusive;
            bool m_upgrade;
            bool m_exclusive_waiting_blocked;

            StateData()
                : m_shared_count()
                , m_exclusive()
                , m_upgrade()
                , m_exclusive_waiting_blocked()
            {}
        };

        StateData m_state;
        ::std::mutex m_mutex;
        ::std::condition_variable m_shared_condition;
        ::std::condition_variable m_exclusive_condition;

        void release_waiters()
        {
            m_exclusive_condition.notify_one();
            m_shared_condition.notify_all();
        }

    public:
        SharedMutex()
            : m_state()
        {}

        ~SharedMutex() {}

        void lock_shared()
        {
            ::std::unique_lock< ::std::mutex> locker(m_mutex);
            while (m_state.m_exclusive || m_state.m_exclusive_waiting_blocked)
                m_shared_condition.wait(locker);
            ++m_state.m_shared_count;
        }

        bool try_lock_shared()
        {
            ::std::unique_lock< ::std::mutex> locker(m_mutex);
            if (m_state.m_exclusive || m_state.m_exclusive_waiting_blocked)
                return false;
            ++m_state.m_shared_count;
            return true;
        }

        void unlock_shared()
        {
            ::std::unique_lock< ::std::mutex> locker(m_mutex);
            if (--m_state.m_shared_count == 0)
            {
                if (m_state.m_upgrade)
                {
                    m_state.m_upgrade = false;
                    m_state.m_exclusive = true;
                }
                else
                {
                    m_state.m_exclusive_waiting_blocked = false;
                }
                release_waiters();
            }
        }

        void lock()
        {
            ::std::unique_lock< ::std::mutex> locker(m_mutex);
            while (m_state.m_shared_count || m_state.m_exclusive)
            {
                m_state.m_exclusive_waiting_blocked = true;
                m_exclusive_condition.wait(locker);
            }
            m_state.m_exclusive = true;
        }

        bool try_lock()
        {
            ::std::unique_lock< ::std::mutex> locker(m_mutex);
            if (m_state.m_shared_count || m_state.m_exclusive)
            {
                return false;
            }
            else
            {
                m_state.m_exclusive = true;
                return true;
            }
        }

        void unlock()
        {
            ::std::unique_lock< ::std::mutex> locker(m_mutex);
            m_state.m_exclusive = false;
            m_state.m_exclusive_waiting_blocked = false;
            release_waiters();
        }
    };
} // namespace ScL::Feature::Detail

#endif
```


