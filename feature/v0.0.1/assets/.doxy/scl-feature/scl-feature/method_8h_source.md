

# File method.h

[**File List**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**reflection**](dir_262f3534dca743723347393893d6556e.md) **>** [**method.h**](method_8h.md)

[Go to the documentation of this file](method_8h.md)


```C++
#pragma once


#include <scl/feature/reflection/type.h>
#include <scl/feature/type_traits/executor.h>
#include <scl/feature/type_traits/has_qualified_method.h>
#include <scl/utility/preprocessor/forward.h>

#include <type_traits>
#include <utility>

#define SCL_VALUE_DECLVAL(cv_ref) \
    S_c_L_executor_type_::value(::std::declval<S_c_L_executor_type_ cv_ref>())

#define SCL_VALUE_ACCESS(cv_ref)                                                       \
    S_c_L_executor_type_::value(::scl::feature::executor_trait<S_c_L_type_>::executor( \
        ::std::forward<S_c_L_type_ cv_ref>(*this)))

#define SCL_REFLECT_METHOD_BASE(method, cv_ref)                                                \
    requires requires { SCL_VALUE_DECLVAL(cv_ref).method(::std::declval<A_r_g_s__>()...); } && \
        method##_S_c_L_quals_<decltype(SCL_VALUE_DECLVAL(cv_ref)), A_r_g_s__...>               \
    {                                                                                          \
        return SCL_VALUE_ACCESS(cv_ref).method(::std::forward<A_r_g_s__>(a_r_g_s__)...);       \
    }

#define SCL_REFLECT_TEMPLATE_METHOD_BASE(method, CALLER, cv_ref)                                 \
    requires requires {                                                                          \
                 CALLER::template call<P_a_r_a_m__, P_a_r_a_m_s__...>(SCL_VALUE_DECLVAL(cv_ref), \
                     ::std::declval<A_r_g_s__>()...);                                            \
             } {                                                                                 \
        return CALLER::template call<P_a_r_a_m__, P_a_r_a_m_s__...>(SCL_VALUE_ACCESS(cv_ref),    \
            ::std::forward<A_r_g_s__>(a_r_g_s__)...);                                            \
    }

#define SCL_REFLECT_METHOD_HELPER(method, CALLER, cv_ref)                                                      \
    template <typename... A_r_g_s__>                                                                           \
    constexpr decltype(auto) method(A_r_g_s__ &&... a_r_g_s__) cv_ref SCL_REFLECT_METHOD_BASE(method,          \
        SCL_FORWARD(cv_ref)) template <typename P_a_r_a_m__, typename... P_a_r_a_m_s__, typename... A_r_g_s__> \
    constexpr decltype(auto) method(A_r_g_s__ &&... a_r_g_s__)                                                 \
        cv_ref SCL_REFLECT_TEMPLATE_METHOD_BASE(SCL_FORWARD(method), CALLER, SCL_FORWARD(cv_ref))

#define SCL_REFLECT_METHOD(method)                                                                              \
    struct method##_S_c_L_caller_                                                                               \
    {                                                                                                           \
        template <typename P_a_r_a_m___, typename... P_a_r_a_m_s___, typename O_b_j___, typename... A_r_g_s___> \
        static constexpr auto call(O_b_j___ && o_b_j___, A_r_g_s___ &&... a_r_g_s___)                           \
            -> decltype(::std::forward<O_b_j___>(o_b_j___).template method<P_a_r_a_m___, P_a_r_a_m_s___...>(    \
                ::std::forward<A_r_g_s___>(a_r_g_s___)...))                                                     \
        {                                                                                                       \
            return ::std::forward<O_b_j___>(o_b_j___).template method<P_a_r_a_m___, P_a_r_a_m_s___...>(         \
                ::std::forward<A_r_g_s___>(a_r_g_s___)...);                                                     \
        }                                                                                                       \
    };                                                                                                          \
    template <typename S_c_L_V___, typename... S_c_L_A___>                                                      \
    static constexpr bool method##_S_c_L_quals_ = SCL_HAS_QUALIFIED_METHOD(SCL_FORWARD(method),                 \
        S_c_L_V___, S_c_L_A___...);                                                                             \
    SCL_REFLECT_METHOD_HELPER(SCL_FORWARD(method), method##_S_c_L_caller_, &)                                   \
    SCL_REFLECT_METHOD_HELPER(SCL_FORWARD(method), method##_S_c_L_caller_, &&)                                  \
    SCL_REFLECT_METHOD_HELPER(SCL_FORWARD(method), method##_S_c_L_caller_, const &)                             \
    SCL_REFLECT_METHOD_HELPER(SCL_FORWARD(method), method##_S_c_L_caller_, const &&)                            \
    SCL_REFLECT_METHOD_HELPER(SCL_FORWARD(method), method##_S_c_L_caller_, volatile &)                          \
    SCL_REFLECT_METHOD_HELPER(SCL_FORWARD(method), method##_S_c_L_caller_, volatile &&)                         \
    SCL_REFLECT_METHOD_HELPER(SCL_FORWARD(method), method##_S_c_L_caller_, const volatile &)                    \
    SCL_REFLECT_METHOD_HELPER(SCL_FORWARD(method), method##_S_c_L_caller_, const volatile &&)
```


