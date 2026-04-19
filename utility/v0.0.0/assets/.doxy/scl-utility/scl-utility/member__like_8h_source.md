

# File member\_like.h

[**File List**](files.md) **>** [**module**](dir_a7b0466279106ea0b8f86f609f621680.md) **>** [**utility**](dir_cca185d4009e66bf68ef58b617abaf60.md) **>** [**src**](dir_ab13fdfb8e4c1ff98b437eee9f69d35c.md) **>** [**scl**](dir_ca45970a26780365ec2accbdb8d8d4fe.md) **>** [**utility**](dir_76f6b7cf5a6cf438d50211f1abeeaae6.md) **>** [**type\_traits**](dir_ee84acd7aed8e5e3b0eed877408f2d18.md) **>** [**member\_like.h**](member__like_8h.md)

[Go to the documentation of this file](member__like_8h.md)


```C++
#pragma once

#include <type_traits>


namespace scl::detail
{
    template <class Type, class Signature>
    struct member_function_like;

    enum class member_function_noexcept
    {
        disabled,
        enabled
    };

    // Common builder parametrized by Noex (controls noexcept on the member function)
    template <class Type, class Result, member_function_noexcept Noexcept, class... Arguments>
    struct build_member_function_like
    {
    private:
        static_assert(::std::is_class_v<::std::remove_cvref_t<Type>>,
            "member_function_like_t requires Type to be a class type");

        using T = ::std::remove_cvref_t<Type>;
        static constexpr bool noex = (Noexcept == member_function_noexcept::enabled);

        // All cv/ref forms in one place; noexcept is controlled by noex
        using un = Result (T::*)(Arguments...) noexcept(noex);
        using c = Result (T::*)(Arguments...) const noexcept(noex);
        using v = Result (T::*)(Arguments...) volatile noexcept(noex);
        using cv = Result (T::*)(Arguments...) const volatile noexcept(noex);

        using un_l = Result (T::*)(Arguments...) & noexcept(noex);
        using un_r = Result (T::*)(Arguments...) && noexcept(noex);
        using c_l = Result (T::*)(Arguments...) const & noexcept(noex);
        using c_r = Result (T::*)(Arguments...) const && noexcept(noex);
        using v_l = Result (T::*)(Arguments...) volatile & noexcept(noex);
        using v_r = Result (T::*)(Arguments...) volatile && noexcept(noex);
        using cv_l = Result (T::*)(Arguments...) const volatile & noexcept(noex);
        using cv_r = Result (T::*)(Arguments...) const volatile && noexcept(noex);

        static constexpr bool is_c = ::std::is_const_v<::std::remove_reference_t<Type>>;
        static constexpr bool is_v = ::std::is_volatile_v<::std::remove_reference_t<Type>>;
        static constexpr bool is_l = ::std::is_lvalue_reference_v<Type>;
        static constexpr bool is_r = ::std::is_rvalue_reference_v<Type>;

    public:
        using type = ::std::conditional_t<is_l,
            // lvalue-qualified member functions
            ::std::conditional_t<(is_c && is_v), cv_l, ::std::conditional_t<is_c, c_l, ::std::conditional_t<is_v, v_l, un_l>>>,
            ::std::conditional_t<is_r,
                // rvalue-qualified member functions
                ::std::conditional_t<(is_c && is_v), cv_r, ::std::conditional_t<is_c, c_r, ::std::conditional_t<is_v, v_r, un_r>>>,
                // no ref-qualifier
                ::std::conditional_t<(is_c && is_v), cv, ::std::conditional_t<is_c, c, ::std::conditional_t<is_v, v, un>>>>>;
    };

    // Entry: Signature without noexcept
    template <class Type, class Result, class... Arguments>
    struct member_function_like<Type, Result(Arguments...)>
        : build_member_function_like<Type, Result, member_function_noexcept::disabled, Arguments...>
    {};

    // Entry: Signature with noexcept
    template <class Type, class Result, class... Arguments>
    struct member_function_like<Type, Result(Arguments...) noexcept>
        : build_member_function_like<Type, Result, member_function_noexcept::enabled, Arguments...>
    {};

    // Fallback for non-function Signature
    template <class Type, class Signature>
    struct member_function_like
    {
        static_assert(::std::is_function_v<Signature>,
            "scl::member_function_like_t requires a function type like Result(Arguments...) or Result(Arguments...) noexcept");
    };

    template <class Type, class Member>
    struct member_property_like
    {
    private:
        using Class = ::std::remove_cvref_t<Type>;

        static_assert(::std::is_class_v<Class> || ::std::is_union_v<Class>,
            "member_property_like_t requires Type to be a class or union type");
        static_assert(!::std::is_function_v<Member>,
            "member_property_like_t expects a data member type; use member_function_like_t for member functions");

        using TypeNoRef = ::std::remove_reference_t<Type>;
        using MemberLikeConst =
            ::std::conditional_t<::std::is_const_v<TypeNoRef>, ::std::add_const_t<Member>, Member>;
        using MemberLikeConstVolatile =
            ::std::conditional_t<::std::is_volatile_v<TypeNoRef>, ::std::add_volatile_t<MemberLikeConst>, MemberLikeConst>;

    public:
        using type = MemberLikeConstVolatile(Class::*);
    };

    template <class Type, class T, bool IsFunction = ::std::is_function_v<T>>
    struct member_like;

    template <class Type, class Signature>
    struct member_like<Type, Signature, true> : member_function_like<Type, Signature>
    {};

    template <class Type, class Member>
    struct member_like<Type, Member, false> : member_property_like<Type, Member>
    {};

} // namespace scl::detail

namespace scl
{
    template <class Type, class Signature>
    using member_function_like_t = typename ::scl::detail::member_function_like<Type, Signature>::type;

    template <class Type, class Member>
    using member_property_like_t = typename ::scl::detail::member_property_like<Type, Member>::type;

    template <class Type, class Member>
    using member_like_t = typename ::scl::detail::member_like<Type, Member>::type;
} // namespace scl
```


