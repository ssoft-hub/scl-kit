

# File has\_qualified\_method.h

[**File List**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**type\_traits**](dir_910e174fc0e8c8ed40843bba5172f2f4.md) **>** [**has\_qualified\_method.h**](has__qualified__method_8h.md)

[Go to the documentation of this file](has__qualified__method_8h.md)


```C++
#pragma once


#include <scl/utility/preprocessor/forward.h>

#include <type_traits>

#define SCL_HQM_CALL(method, quals) \
    ::std::declval<Obj quals>().method(::std::declval<S_c_L_Args_>()...)

#define SCL_HQM_SAME(method, left_quals, right_quals) \
    ::std::is_same_v<decltype(SCL_HQM_CALL(method, left_quals)), decltype(SCL_HQM_CALL(method, right_quals))>


#define SCL_HAS_QUALIFIED_METHOD(method, Type, ...)                                               \
    ([]<typename S_c_L_Type_, typename... S_c_L_Args_>() -> bool {                                \
        using Obj = ::std::remove_cvref_t<S_c_L_Type_>;                                           \
        using Base = ::std::remove_reference_t<S_c_L_Type_>;                                      \
                                                                                                  \
        constexpr bool is_obj_rvalue = ::std::is_rvalue_reference_v<S_c_L_Type_>;                 \
        constexpr bool is_obj_lvalue = ::std::is_lvalue_reference_v<S_c_L_Type_>;                 \
        constexpr bool is_obj_const = ::std::is_const_v<Base>;                                    \
        constexpr bool is_obj_volatile = ::std::is_volatile_v<Base>;                              \
        constexpr bool is_obj_cv = is_obj_const && is_obj_volatile;                               \
                                                                                                  \
        /* --- lvalue callability --- */                                                          \
        constexpr bool can_lv_m = requires { SCL_HQM_CALL(method, &); };                          \
        constexpr bool can_lv_c = requires { SCL_HQM_CALL(method, const &); };                    \
        constexpr bool can_lv_v = requires { SCL_HQM_CALL(method, volatile &); };                 \
        constexpr bool can_lv_cv = requires { SCL_HQM_CALL(method, const volatile &); };          \
                                                                                                  \
        /* --- rvalue callability --- */                                                          \
        constexpr bool can_rv_m = requires { SCL_HQM_CALL(method, &&); };                         \
        constexpr bool can_rv_c = requires { SCL_HQM_CALL(method, const &&); };                   \
        constexpr bool can_rv_v = requires { SCL_HQM_CALL(method, volatile &&); };                \
        constexpr bool can_rv_cv = requires { SCL_HQM_CALL(method, const volatile &&); };         \
                                                                                                  \
        /* --- lvalue qualifier detection --- */                                                  \
        /* Return-type comparisons (SCL_HQM_SAME) are guarded by if-constexpr */                  \
        /* callability checks so that decltype is never evaluated on an ill-formed call. */       \
        if constexpr (is_obj_lvalue)                                                              \
        {                                                                                         \
            if constexpr (is_obj_cv)                                                              \
            {                                                                                     \
                return can_lv_cv;                                                                 \
            }                                                                                     \
            else if constexpr (is_obj_volatile || is_obj_const)                                   \
            {                                                                                     \
                constexpr bool can_narrow = is_obj_volatile ? can_lv_v : can_lv_c;                \
                constexpr bool can_wider = can_lv_cv;                                             \
                if constexpr (!can_narrow)                                                        \
                    return false;                                                                 \
                else if constexpr (!can_wider)                                                    \
                    return true;                                                                  \
                else                                                                              \
                    return !(is_obj_volatile                                                      \
                            ? SCL_HQM_SAME(method, volatile &, const volatile &)                  \
                            : SCL_HQM_SAME(method, const &, const volatile &));                   \
            }                                                                                     \
            else                                                                                  \
            {                                                                                     \
                /* mutable lvalue: must differ from every wider qualifier that is callable. */    \
                if constexpr (!can_lv_m)                                                          \
                    return false;                                                                 \
                else                                                                              \
                {                                                                                 \
                    if constexpr (can_lv_c)                                                       \
                    {                                                                             \
                        if constexpr (SCL_HQM_SAME(method, &, const &))                           \
                            return false;                                                         \
                    }                                                                             \
                    if constexpr (can_lv_v)                                                       \
                    {                                                                             \
                        if constexpr (SCL_HQM_SAME(method, &, volatile &))                        \
                            return false;                                                         \
                    }                                                                             \
                    if constexpr (can_lv_cv)                                                      \
                    {                                                                             \
                        if constexpr (SCL_HQM_SAME(method, &, const volatile &))                  \
                            return false;                                                         \
                    }                                                                             \
                    return true;                                                                  \
                }                                                                                 \
            }                                                                                     \
        }                                                                                         \
        /* --- rvalue qualifier detection --- */                                                  \
        else if constexpr (is_obj_rvalue)                                                         \
        {                                                                                         \
            if constexpr (is_obj_cv)                                                              \
            {                                                                                     \
                return can_rv_cv;                                                                 \
            }                                                                                     \
            else if constexpr (is_obj_volatile)                                                   \
            {                                                                                     \
                if constexpr (!can_rv_v)                                                          \
                    return false;                                                                 \
                else if constexpr (!can_rv_cv)                                                    \
                    return true;                                                                  \
                else                                                                              \
                    return !SCL_HQM_SAME(method, volatile &&, const volatile &&);                 \
            }                                                                                     \
            else if constexpr (is_obj_const)                                                      \
            {                                                                                     \
                /* MSVC cross-category check: const& is callable on rvalues (non-standard). */    \
                /* Detect implicit binding by comparing return types across categories.     */    \
                if constexpr (!can_rv_c)                                                          \
                    return false;                                                                 \
                else                                                                              \
                {                                                                                 \
                    if constexpr (can_rv_cv)                                                      \
                    {                                                                             \
                        if constexpr (SCL_HQM_SAME(method, const &&, const volatile &&))          \
                            return false;                                                         \
                    }                                                                             \
                    if constexpr (can_lv_c)                                                       \
                    {                                                                             \
                        if constexpr (SCL_HQM_SAME(method, const &&, const &))                    \
                        {                                                                         \
                            if constexpr (!can_rv_m)                                              \
                                return false;                                                     \
                            else                                                                  \
                            {                                                                     \
                                constexpr bool scl_same_rv_ = SCL_HQM_SAME(method, &&, const &&); \
                                if constexpr (scl_same_rv_)                                       \
                                    return false;                                                 \
                            }                                                                     \
                        }                                                                         \
                    }                                                                             \
                    return true;                                                                  \
                }                                                                                 \
            }                                                                                     \
            else                                                                                  \
            {                                                                                     \
                /* mutable rvalue: must differ from every wider qualifier that is callable. */    \
                if constexpr (!can_rv_m)                                                          \
                    return false;                                                                 \
                else                                                                              \
                {                                                                                 \
                    if constexpr (can_rv_c)                                                       \
                    {                                                                             \
                        if constexpr (SCL_HQM_SAME(method, &&, const &&))                         \
                            return false;                                                         \
                    }                                                                             \
                    if constexpr (can_rv_v)                                                       \
                    {                                                                             \
                        if constexpr (SCL_HQM_SAME(method, &&, volatile &&))                      \
                            return false;                                                         \
                    }                                                                             \
                    if constexpr (can_rv_cv)                                                      \
                    {                                                                             \
                        if constexpr (SCL_HQM_SAME(method, &&, const volatile &&))                \
                            return false;                                                         \
                    }                                                                             \
                    return true;                                                                  \
                }                                                                                 \
            }                                                                                     \
        }                                                                                         \
        else                                                                                      \
        {                                                                                         \
            return false;                                                                         \
        }                                                                                         \
    }).template operator()<SCL_FORWARD(Type), ##__VA_ARGS__>()
```


