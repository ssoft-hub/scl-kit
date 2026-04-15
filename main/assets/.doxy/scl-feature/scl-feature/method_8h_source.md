

# File method.h

[**File List**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**reflection**](dir_262f3534dca743723347393893d6556e.md) **>** [**method.h**](method_8h.md)

[Go to the documentation of this file](method_8h.md)


```C++
#pragma once


#include <scl/feature/reflection/access.h>
#include <scl/feature/reflection/type.h>
#include <scl/feature/type_traits/executor.h>
#include <scl/feature/type_traits/has_qualified_method.h>
#include <scl/feature/wrapper_cast.h>
#include <scl/utility/preprocessor/forward.h>

#include <type_traits>
#include <utility>

// clang-format off

#define SCL_EXECUTE_OVERRIDED(method, cv_ref)                                       \
    S_c_L_executor_type_::execute(SCL_EXECUTOR_ACCESS(cv_ref),                      \
        [this](A_r_g_s__ &&... values)                                              \
            -> decltype(SCL_VALUE_ACCESS(cv_ref)                                    \
                .method(::scl::wrapper_cast(::std::forward<A_r_g_s__>(values))...)) \
        {                                                                           \
            return SCL_VALUE_ACCESS(cv_ref).method(                                 \
                ::scl::wrapper_cast(std::forward<A_r_g_s__>(values))...);           \
        },  ::std::forward<A_r_g_s__>(a_r_g_s__)...)

#define SCL_EXECUTOR_METHOD_OVERRIDED(method, cv_ref)  \
    S_c_L_executor_type_::method_##method(             \
        SCL_EXECUTOR_ACCESS(cv_ref),                   \
        ::std::forward<A_r_g_s__>(a_r_g_s__)...)

#define SCL_REFLECT_METHOD_EXEC_HELPERS(method)                                             \
    template <typename S_c_L_E__, typename... S_c_L_A___>                                   \
    static constexpr bool method##_S_c_L_has_exec_override_ =                               \
        requires {                                                                          \
            static_cast<                                                                    \
                decltype(::std::remove_cvref_t<S_c_L_E__>::method_##method(                 \
                    ::std::declval<S_c_L_E__>(), ::std::declval<S_c_L_A___>()...))          \
                (*)(S_c_L_E__, S_c_L_A___...)                                               \
            >(&::std::remove_cvref_t<S_c_L_E__>::method_##method);                          \
        };                                                                                  \
    template <typename S_c_L_E__, typename... S_c_L_A___>                                   \
    static constexpr bool method##_S_c_L_exec_noexcept_ = []() constexpr noexcept -> bool { \
        if constexpr (method##_S_c_L_has_exec_override_<S_c_L_E__, S_c_L_A___...>)          \
            return noexcept(::std::remove_cvref_t<S_c_L_E__>::method_##method(              \
                ::std::declval<S_c_L_E__>(), ::std::declval<S_c_L_A___>()...));             \
        return false;                                                                       \
    }();

#define SCL_REFLECT_METHOD_CALLER(method)                                                                       \
    struct method##_S_c_L_caller_                                                                               \
    {                                                                                                           \
        template <typename P_a_r_a_m___, typename... P_a_r_a_m_s___, typename O_b_j___, typename... A_r_g_s___> \
        static constexpr auto call(O_b_j___ && o_b_j___, A_r_g_s___ &&... a_r_g_s___)                           \
            -> decltype(::std::forward<O_b_j___>(o_b_j___).template method<P_a_r_a_m___, P_a_r_a_m_s___...>(    \
                ::scl::wrapper_cast(::std::forward<A_r_g_s___>(a_r_g_s___))...))                                \
        {                                                                                                       \
            return ::std::forward<O_b_j___>(o_b_j___).template method<P_a_r_a_m___, P_a_r_a_m_s___...>(         \
                ::scl::wrapper_cast(::std::forward<A_r_g_s___>(a_r_g_s___))...);                                \
        }                                                                                                       \
    };                                                                                                          \

#define SCL_REFLECT_METHOD_QUALS(method)                                          \
    template <typename S_c_L_V___, typename... S_c_L_A___>                        \
    static constexpr bool method##_S_c_L_quals_ =                                 \
        SCL_HAS_QUALIFIED_METHOD(SCL_FORWARD(method), S_c_L_V___, S_c_L_A___...); \
    template <typename S_c_L_P___, typename... S_c_L_Ps___>                       \
    struct method##_S_c_L_template_quals_                                         \
    {                                                                             \
        template <typename S_c_L_V___, typename... S_c_L_A___>                    \
        static constexpr bool value =                                             \
            SCL_HAS_QUALIFIED_METHOD(                                             \
                SCL_FORWARD(template method<S_c_L_P___, S_c_L_Ps___...>),         \
                S_c_L_V___, S_c_L_A___...);                                       \
    };

#define SCL_EXECUTE_TEMPLATE_OVERRIDED(caller, cv_ref)                           \
    S_c_L_executor_type_::execute(SCL_EXECUTOR_ACCESS(cv_ref),                   \
        [this](A_r_g_s__ &&... values)                                           \
            -> decltype(caller::template call<P_a_r_a_m__, P_a_r_a_m_s__...>(    \
                SCL_VALUE_ACCESS(cv_ref), ::std::forward<A_r_g_s__>(values)...)) \
        {                                                                        \
            return caller::template call<P_a_r_a_m__, P_a_r_a_m_s__...>(         \
                SCL_VALUE_ACCESS(cv_ref), ::std::forward<A_r_g_s__>(values)...); \
        }, ::std::forward<A_r_g_s__>(a_r_g_s__)...)

#define SCL_REFLECT_METHOD_EXECUTOR_OVERRIDE_BASE(method, cv_ref)                      \
    template <typename S_c_L_E__ = S_c_L_executor_type_ cv_ref, typename... A_r_g_s__> \
    constexpr decltype(auto) method(A_r_g_s__ &&... a_r_g_s__) cv_ref                  \
    noexcept(method##_S_c_L_exec_noexcept_<S_c_L_E__, A_r_g_s__...>)                   \
    requires                                                                           \
        (::std::is_same_v<S_c_L_E__, S_c_L_executor_type_ cv_ref>                      \
            && method##_S_c_L_has_exec_override_<S_c_L_E__, A_r_g_s__...>)             \
    {                                                                                  \
        return ::std::remove_cvref_t<S_c_L_E__>::method_##method(                      \
            SCL_EXECUTOR_ACCESS(cv_ref),                                               \
            ::std::forward<A_r_g_s__>(a_r_g_s__)...);                                  \
    }

#define SCL_REFLECT_METHOD_BASE(method, cv_ref)                                           \
    noexcept (noexcept(SCL_EXECUTE_OVERRIDED(SCL_FORWARD(method), cv_ref)))               \
    requires                                                                              \
        (!method##_S_c_L_has_exec_override_<S_c_L_executor_type_ cv_ref, A_r_g_s__...> && \
        requires                                                                          \
        {                                                                                 \
            SCL_VALUE_DECLVAL(cv_ref).method(                                             \
                ::scl::wrapper_cast(::std::declval<A_r_g_s__>())...);                     \
        } && method##_S_c_L_quals_<decltype(SCL_VALUE_DECLVAL(cv_ref)),                   \
            decltype(::scl::wrapper_cast(::std::declval<A_r_g_s__>()))...>)               \
    {                                                                                     \
        return SCL_EXECUTE_OVERRIDED(SCL_FORWARD(method), cv_ref);                        \
    }

#define SCL_REFLECT_TEMPLATE_METHOD_BASE(method, caller, cv_ref)                    \
    noexcept(noexcept(SCL_EXECUTE_TEMPLATE_OVERRIDED(caller, cv_ref)))              \
    requires                                                                        \
        requires                                                                    \
        {                                                                           \
            caller::template call<P_a_r_a_m__, P_a_r_a_m_s__...>(                   \
                SCL_VALUE_DECLVAL(cv_ref), ::std::declval<A_r_g_s__>()...);         \
        } && method##_S_c_L_template_quals_<P_a_r_a_m__, P_a_r_a_m_s__...>          \
                 ::template value<decltype(SCL_VALUE_DECLVAL(cv_ref)),              \
                     decltype(::scl::wrapper_cast(::std::declval<A_r_g_s__>()))...> \
    {                                                                               \
        return SCL_EXECUTE_TEMPLATE_OVERRIDED(caller, cv_ref);                      \
    }

#define SCL_REFLECT_METHOD_HELPER(method, caller, cv_ref)                             \
    SCL_REFLECT_METHOD_EXECUTOR_OVERRIDE_BASE(method, cv_ref)                         \
    template <typename... A_r_g_s__>                                                  \
    constexpr decltype(auto) method(A_r_g_s__ &&... a_r_g_s__) cv_ref                 \
        SCL_REFLECT_METHOD_BASE(method, cv_ref)                                       \
    template <typename P_a_r_a_m__, typename... P_a_r_a_m_s__, typename... A_r_g_s__> \
    constexpr decltype(auto) method(A_r_g_s__ &&... a_r_g_s__) cv_ref                 \
        SCL_REFLECT_TEMPLATE_METHOD_BASE(method, caller, cv_ref)

#define SCL_REFLECT_METHOD(method)                                                           \
    SCL_REFLECT_METHOD_QUALS(method)                                                         \
    SCL_REFLECT_METHOD_CALLER(method)                                                        \
    SCL_REFLECT_METHOD_EXEC_HELPERS(method)                                                  \
    SCL_REFLECT_METHOD_HELPER(SCL_FORWARD(method), method##_S_c_L_caller_, &)                \
    SCL_REFLECT_METHOD_HELPER(SCL_FORWARD(method), method##_S_c_L_caller_, &&)               \
    SCL_REFLECT_METHOD_HELPER(SCL_FORWARD(method), method##_S_c_L_caller_, const &)          \
    SCL_REFLECT_METHOD_HELPER(SCL_FORWARD(method), method##_S_c_L_caller_, const &&)         \
    SCL_REFLECT_METHOD_HELPER(SCL_FORWARD(method), method##_S_c_L_caller_, volatile &)       \
    SCL_REFLECT_METHOD_HELPER(SCL_FORWARD(method), method##_S_c_L_caller_, volatile &&)      \
    SCL_REFLECT_METHOD_HELPER(SCL_FORWARD(method), method##_S_c_L_caller_, const volatile &) \
    SCL_REFLECT_METHOD_HELPER(SCL_FORWARD(method), method##_S_c_L_caller_, const volatile &&)

// clang-format on
```


