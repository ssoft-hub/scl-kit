

# File wrapper\_guard.h

[**File List**](files.md) **>** [**detail**](dir_b3eb4ac5eceab19e0dcca8b4c96aaf20.md) **>** [**wrapper\_guard.h**](detail_2wrapper__guard_8h.md)

[Go to the documentation of this file](detail_2wrapper__guard_8h.md)


```C++
#pragma once

#include <scl/feature/detail/executor_access.h>
#include <scl/feature/type_traits/wrapper.h>
#include <scl/utility/type_traits/forward_like.h>

#include <type_traits>
#include <utility>

namespace scl::feature::detail
{
    enum class wrapper_guard_case : bool
    {
        value = false,
        wrapper = true,
    };

    template <typename Refer, wrapper_guard_case Case>
        requires ::std::is_reference_v<Refer>
    class wrapper_guard;

    template <typename Refer>
        requires ::std::is_reference_v<Refer>
    class wrapper_guard<Refer, wrapper_guard_case::value>
    {
    public:
        wrapper_guard(wrapper_guard &&) = delete;
        wrapper_guard(wrapper_guard const &) = delete;
        wrapper_guard & operator=(wrapper_guard &&) = delete;
        wrapper_guard & operator=(wrapper_guard const &) = delete;
        ~wrapper_guard() = default;

        constexpr explicit wrapper_guard(Refer v) noexcept
            : m_value{::std::forward<Refer>(v)}
        {}

        constexpr decltype(auto) value() const noexcept { return ::std::forward<Refer>(m_value); }

    private:
        Refer m_value;
    };

    template <typename WrapperRefer>
        requires ::std::is_reference_v<WrapperRefer> &&
        ::scl::feature::is_wrapper_v<::std::remove_cvref_t<WrapperRefer>>
    class wrapper_guard<WrapperRefer, wrapper_guard_case::wrapper>
    {
        using wrapper_type = ::std::remove_cvref_t<WrapperRefer>;
        using executor_type = typename wrapper_type::executor_type;
        using executor_refer = scl::forward_like_t<WrapperRefer, executor_type>;

    public:
        wrapper_guard(wrapper_guard &&) = delete;
        wrapper_guard(wrapper_guard const &) = delete;
        wrapper_guard & operator=(wrapper_guard &&) = delete;
        wrapper_guard & operator=(wrapper_guard const &) = delete;

        constexpr explicit wrapper_guard(WrapperRefer w)
            : m_executor{executor_access::get(::std::forward<WrapperRefer>(w))}
        {
            if constexpr (requires { executor_type::template guard<executor_refer>(m_executor); })
                executor_type::template guard<executor_refer>(m_executor);
        }

        constexpr ~wrapper_guard()
        {
            if constexpr (requires { executor_type::template unguard<executor_refer>(m_executor); })
                executor_type::template unguard<executor_refer>(m_executor);
        }

        constexpr decltype(auto) value() const noexcept
            requires requires {
                         executor_type::template value<executor_refer>(::std::declval<executor_refer>());
                     }
        {
            return executor_type::template value<executor_refer>(::std::forward<executor_refer>(m_executor));
        }

    private:
        executor_refer m_executor;
    };
} // namespace scl::feature::detail
```


