

# File wrapper\_constructor\_resolver.h

[**File List**](files.md) **>** [**detail**](dir_b3eb4ac5eceab19e0dcca8b4c96aaf20.md) **>** [**wrapper\_constructor\_resolver.h**](wrapper__constructor__resolver_8h.md)

[Go to the documentation of this file](wrapper__constructor__resolver_8h.md)


```C++
#pragma once

#include <scl/feature/detail/wrapper_guard.h>
#include <scl/feature/type_traits/wrapper.h>
#include <scl/utility/type_traits/forward_like.h>

#include <type_traits>
#include <utility>

namespace scl::feature::detail
{
    template <typename Left, typename Right>
    class wrapper_constructor_resolver;

    template <typename LeftWrapper, typename RightRefer>
        requires ::scl::feature::is_wrapper_v<::std::remove_cvref_t<RightRefer>>
    class guarded_wrapper_constructor_resolver
    {
        using guard_type = wrapper_guard<RightRefer, wrapper_guard_case::wrapper>;
        using inner_refer_t = decltype(::std::declval<guard_type &>().value());
        using inner_resolver_t = wrapper_constructor_resolver<LeftWrapper, inner_refer_t>;

    public:
        constexpr explicit guarded_wrapper_constructor_resolver(RightRefer right)
            : m_guard{::std::forward<RightRefer>(right)}
            , m_resolver{m_guard.value()}
        {}

        constexpr decltype(auto) resolve() { return m_resolver.resolve(); }

    private:
        guard_type m_guard;
        inner_resolver_t m_resolver;
    };

    template <typename LeftValue, template <typename> class LeftExecutor, typename RightRefer>
    class wrapper_constructor_resolver<wrapper<LeftValue, LeftExecutor>, RightRefer>
    {
        using left_type = wrapper<LeftValue, LeftExecutor>;
        using right_type = ::std::remove_cvref_t<RightRefer>;

    public:
        explicit constexpr wrapper_constructor_resolver(RightRefer right) noexcept
            : m_right{::std::forward<RightRefer>(right)}
        {}

        constexpr wrapper_constructor_resolver(wrapper_constructor_resolver &) = default;
        constexpr wrapper_constructor_resolver(wrapper_constructor_resolver &&) = default;
        constexpr wrapper_constructor_resolver(wrapper_constructor_resolver const &) = default;

        constexpr decltype(auto) resolve() // NOLINT(bugprone-branch-clone)
        {
            if constexpr (::scl::feature::is_compatible_with_v<left_type, right_type>)
            {
                // strategy 1: same wrapper type — forward the executor directly
                return executor_access::get(::std::forward<RightRefer>(m_right));
            }
            else if constexpr (::scl::feature::is_compatible_with_part_of_v<left_type, right_type>)
            {
                // strategy 2: right fits into a part of left — forward the right wrapper
                return ::std::forward<RightRefer>(m_right);
            }
            else if constexpr (::scl::feature::is_wrapper_v<right_type>)
            {
                // strategy 3: right is a wrapper — peel one layer and recurse
                using right_executor = typename right_type::executor_type;
                using right_executor_refer = ::scl::forward_like_t<RightRefer, right_executor>;

                constexpr bool has_unguard =
                    requires(right_executor_refer e) {
                        right_executor::template unguard<right_executor_refer>(e);
                    };

                if constexpr (has_unguard)
                {
                    // unguard exists — need RAII wrapper_guard for guard/unguard bracketing
                    return guarded_wrapper_constructor_resolver<left_type, RightRefer>{
                        ::std::forward<RightRefer>(m_right)}
                        .resolve();
                }
                else
                {
                    // no unguard — no RAII needed; call guard if present, then access value directly
                    decltype(auto) executor = executor_access::get(::std::forward<RightRefer>(m_right));

                    if constexpr (
                        requires { right_executor::template guard<right_executor_refer>(executor); })
                        right_executor::template guard<right_executor_refer>(executor);

                    decltype(auto) inner = right_executor::template value<right_executor_refer>(
                        ::std::forward<decltype(executor)>(executor));

                    return wrapper_constructor_resolver<left_type, decltype(inner)>{
                        ::std::forward<decltype(inner)>(inner)}
                        .resolve();
                }
            }
            else
            {
                // strategy 4: plain value — forward as-is
                return ::std::forward<RightRefer>(m_right);
            }
        }

    private:
        RightRefer m_right;
    };

} // namespace scl::feature::detail
```


