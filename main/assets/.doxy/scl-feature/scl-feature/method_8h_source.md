

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

#define SCL_EXECUTOR_TYPE_ S_c_L_executor_type_

#define SCL_VALUE_DECLVAL_(QUALIFIERS) \
    SCL_EXECUTOR_TYPE_::value(::std::declval<SCL_EXECUTOR_TYPE_ QUALIFIERS>())

#define SCL_VALUE_ACCESS_(QUALIFIERS)                                                \
    SCL_EXECUTOR_TYPE_::value(::scl::feature::executor_trait<S_c_L_type_>::executor( \
        ::std::forward<S_c_L_type_ QUALIFIERS>(*this)))

#define SCL_REFLECT_METHOD_BASE_(METHOD, QUALIFIERS)                                                \
    requires requires { SCL_VALUE_DECLVAL_(QUALIFIERS).METHOD(::std::declval<A_r_g_s__>()...); } && \
        METHOD##_S_c_L_quals_<decltype(SCL_VALUE_DECLVAL_(QUALIFIERS)), A_r_g_s__...>               \
    {                                                                                               \
        return SCL_VALUE_ACCESS_(QUALIFIERS).METHOD(::std::forward<A_r_g_s__>(a_r_g_s__)...);       \
    }

#define SCL_REFLECT_TEMPLATE_METHOD_BASE_(METHOD, CALLER, QUALIFIERS)                                 \
    requires requires {                                                                               \
                 CALLER::template call<P_a_r_a_m__, P_a_r_a_m_s__...>(SCL_VALUE_DECLVAL_(QUALIFIERS), \
                     ::std::declval<A_r_g_s__>()...);                                                 \
             } {                                                                                      \
        return CALLER::template call<P_a_r_a_m__, P_a_r_a_m_s__...>(SCL_VALUE_ACCESS_(QUALIFIERS),    \
            ::std::forward<A_r_g_s__>(a_r_g_s__)...);                                                 \
    }

#define SCL_REFLECT_METHOD_HELPER_(METHOD, CALLER, QUALIFIERS)                                                     \
    template <typename... A_r_g_s__>                                                                               \
    constexpr decltype(auto) METHOD(A_r_g_s__ &&... a_r_g_s__) QUALIFIERS SCL_REFLECT_METHOD_BASE_(METHOD,         \
        SCL_FORWARD(QUALIFIERS)) template <typename P_a_r_a_m__, typename... P_a_r_a_m_s__, typename... A_r_g_s__> \
    constexpr decltype(auto) METHOD(A_r_g_s__ &&... a_r_g_s__) QUALIFIERS                                          \
        SCL_REFLECT_TEMPLATE_METHOD_BASE_(SCL_FORWARD(METHOD), CALLER, SCL_FORWARD(QUALIFIERS))

#define SCL_REFLECT_METHOD(METHOD)                                                                              \
    struct METHOD##_S_c_L_caller_                                                                               \
    {                                                                                                           \
        template <typename P_a_r_a_m___, typename... P_a_r_a_m_s___, typename O_b_j___, typename... A_r_g_s___> \
        static constexpr auto call(O_b_j___ && o_b_j___, A_r_g_s___ &&... a_r_g_s___)                           \
            -> decltype(::std::forward<O_b_j___>(o_b_j___).template METHOD<P_a_r_a_m___, P_a_r_a_m_s___...>(    \
                ::std::forward<A_r_g_s___>(a_r_g_s___)...))                                                     \
        {                                                                                                       \
            return ::std::forward<O_b_j___>(o_b_j___).template METHOD<P_a_r_a_m___, P_a_r_a_m_s___...>(         \
                ::std::forward<A_r_g_s___>(a_r_g_s___)...);                                                     \
        }                                                                                                       \
    };                                                                                                          \
    template <typename S_c_L_V___, typename... S_c_L_A___>                                                      \
    static constexpr bool METHOD##_S_c_L_quals_ = SCL_HAS_QUALIFIED_METHOD(SCL_FORWARD(METHOD),                 \
        S_c_L_V___, S_c_L_A___...);                                                                             \
    SCL_REFLECT_METHOD_HELPER_(SCL_FORWARD(METHOD), METHOD##_S_c_L_caller_, &)                                  \
    SCL_REFLECT_METHOD_HELPER_(SCL_FORWARD(METHOD), METHOD##_S_c_L_caller_, &&)                                 \
    SCL_REFLECT_METHOD_HELPER_(SCL_FORWARD(METHOD), METHOD##_S_c_L_caller_, const &)                            \
    SCL_REFLECT_METHOD_HELPER_(SCL_FORWARD(METHOD), METHOD##_S_c_L_caller_, const &&)                           \
    SCL_REFLECT_METHOD_HELPER_(SCL_FORWARD(METHOD), METHOD##_S_c_L_caller_, volatile &)                         \
    SCL_REFLECT_METHOD_HELPER_(SCL_FORWARD(METHOD), METHOD##_S_c_L_caller_, volatile &&)                        \
    SCL_REFLECT_METHOD_HELPER_(SCL_FORWARD(METHOD), METHOD##_S_c_L_caller_, const volatile &)                   \
    SCL_REFLECT_METHOD_HELPER_(SCL_FORWARD(METHOD), METHOD##_S_c_L_caller_, const volatile &&)
```


