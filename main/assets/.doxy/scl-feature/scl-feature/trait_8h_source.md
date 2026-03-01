

# File trait.h

[**File List**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**trait.h**](trait_8h.md)

[Go to the documentation of this file](trait_8h.md)


```C++
#pragma once
#ifndef SCL_FEATURED_TRAITS_H
#define SCL_FEATURED_TRAITS_H

#include <scl/utility/type_traits.h>

#include <type_traits>

namespace ScL
{
    template <typename _Type, typename _Refer>
    // using SimilarRefer = typename ::scl::detail::SimilarReferHelper<_Type, _Refer>::Type;
    using SimilarRefer = typename ::scl::forward_like_t<_Refer, _Type>;
} // namespace ScL

namespace ScL::Feature::Inplace
{
    struct Default;
} // namespace ScL::Feature::Inplace

namespace ScL::Feature::Detail
{
    template <typename, typename>
    class Wrapper;
} // namespace ScL::Feature::Detail

namespace ScL::Feature::Detail
{
    template <typename>
    struct IsWrapper : ::std::false_type
    {};

    template <typename _Test, typename _Tool>
    struct IsWrapper< ::ScL::Feature::Detail::Wrapper<_Test, _Tool> > : ::std::true_type
    {};
} // namespace ScL::Feature::Detail

namespace ScL::Feature
{
    template <typename _Test>
    using IsWrapper = ::ScL::Feature::Detail::IsWrapper< ::std::remove_cv_t<_Test> >;

    template <typename _Test>
    inline constexpr bool isWrapper()
    {
        return ::ScL::Feature::IsWrapper<_Test>::value;
    }

    template <typename _Test>
    using is_wrapper = ::ScL::Feature::IsWrapper<_Test>;
    template <typename _Test>
    using is_wrapper_t = typename ::ScL::Feature::IsWrapper<_Test>::type;
    template <typename _Test>
    inline constexpr auto is_wrapper_v = ::ScL::Feature::IsWrapper<_Test>::value;
} // namespace ScL::Feature

namespace ScL::Feature::Detail
{
    template <typename _Test, typename _Other>
    struct IsThisCompatibleWithOther
        : ::std::integral_constant<bool,
              ::std::is_same< ::std::remove_cv_t<_Test>, ::std::remove_cv_t<_Other> >::value
                  || ::std::is_base_of< ::std::remove_cv_t<_Other>,
                      ::std::remove_cv_t<_Test> >::value>
    {};

    template <typename _Test, typename _Other, typename _Tool>
    struct IsThisCompatibleWithOther< ::ScL::Feature::Detail::Wrapper<_Test, _Tool>,
        ::ScL::Feature::Detail::Wrapper<_Other, _Tool> >
        : ::ScL::Feature::Detail::IsThisCompatibleWithOther< ::std::remove_cv_t<_Test>,
              ::std::remove_cv_t<_Other> >
    {};
} // namespace ScL::Feature::Detail

namespace ScL::Feature
{
    template <typename _Test, typename _Other>
    using IsThisCompatibleWithOther = ::ScL::Feature::Detail::IsThisCompatibleWithOther<
        ::std::remove_cv_t<_Test>,
        ::std::remove_cv_t<_Other> >;

    template <typename _Test, typename _Other>
    inline constexpr bool isThisCompatibleWithOther()
    {
        return ::ScL::Feature::IsThisCompatibleWithOther<_Test, _Other>::value;
    }

    template <typename _Test, typename _Other>
    using is_this_compatible_with_other = ::ScL::Feature::IsThisCompatibleWithOther<_Test, _Other>;
    template <typename _Test, typename _Other>
    using is_this_compatible_with_other_t = typename ::ScL::Feature::IsThisCompatibleWithOther<
        _Test,
        _Other>::type;
    template <typename _Test, typename _Other>
    inline constexpr auto
        is_this_compatible_with_other_v = ::ScL::Feature::IsThisCompatibleWithOther<_Test,
            _Other>::value;
} // namespace ScL::Feature

namespace ScL::Feature::Detail
{
    template <typename _Test, typename _Other>
    struct IsThisCompatibleWithPartOfOther : ::std::false_type
    {};

    template <typename _Test, typename _Other, typename _OtherTool>
    struct IsThisCompatibleWithPartOfOther<_Test,
        ::ScL::Feature::Detail::Wrapper<_Other, _OtherTool> >
        : ::std::integral_constant<bool,
              ::ScL::Feature::IsThisCompatibleWithOther< ::std::remove_cv_t<_Test>,
                  ::std::remove_cv_t<_Other> >::value>
    {};

    template <typename _Test, typename _TestTool, typename _Other, typename _OtherTool>
    struct IsThisCompatibleWithPartOfOther< ::ScL::Feature::Detail::Wrapper<_Test, _TestTool>,
        ::ScL::Feature::Detail::Wrapper<_Other, _OtherTool> >
        : ::std::integral_constant<bool,
              ::ScL::Feature::IsThisCompatibleWithOther<
                  ::ScL::Feature::Detail::Wrapper<_Test, _TestTool>,
                  ::std::remove_cv_t<_Other> >::value
                  || ::ScL::Feature::Detail::IsThisCompatibleWithPartOfOther<
                      ::ScL::Feature::Detail::Wrapper<_Test, _TestTool>,
                      ::std::remove_cv_t<_Other> >::value>
    {};
} // namespace ScL::Feature::Detail

namespace ScL::Feature
{
    template <typename _Test, typename _Other>
    using IsThisCompatibleWithPartOfOther = ::ScL::Feature::Detail::IsThisCompatibleWithPartOfOther<
        ::std::remove_cv_t<_Test>,
        ::std::remove_cv_t<_Other> >;

    template <typename _Test, typename _Other>
    inline constexpr bool isThisCompatibleWithPartOfOther()
    {
        return ::ScL::Feature::IsThisCompatibleWithPartOfOther<_Test, _Other>::value;
    }

    template <typename _Test, typename _Other>
    using is_this_compatible_with_part_of_other = ::ScL::Feature::IsThisCompatibleWithPartOfOther<
        _Test,
        _Other>;
    template <typename _Test, typename _Other>
    using is_this_compatible_with_part_of_other_t =
        typename ::ScL::Feature::IsThisCompatibleWithPartOfOther<_Test, _Other>::type;
    template <typename _Test, typename _Other>
    inline constexpr auto
        is_this_compatible_with_part_of_other_v = ::ScL::Feature::IsThisCompatibleWithPartOfOther<
            _Test,
            _Other>::value;
} // namespace ScL::Feature

namespace ScL::Feature::Detail
{
    template <typename _Test, typename _Other>
    struct IsPartOfThisCompatibleWithOther : ::std::false_type
    {};

    template <typename _Test, typename _TestTool, typename _Other>
    struct IsPartOfThisCompatibleWithOther< ::ScL::Feature::Detail::Wrapper<_Test, _TestTool>,
        _Other>
        : ::std::integral_constant<bool,
              ::ScL::Feature::IsThisCompatibleWithOther< ::std::remove_cv_t<_Test>,
                  ::std::remove_cv_t<_Other> >::value>
    {};

    template <typename _Test, typename _TestTool, typename _Other, typename _OtherTool>
    struct IsPartOfThisCompatibleWithOther< ::ScL::Feature::Detail::Wrapper<_Test, _TestTool>,
        ::ScL::Feature::Detail::Wrapper<_Other, _OtherTool> >
        : ::std::integral_constant<bool,
              ::ScL::Feature::IsThisCompatibleWithOther< ::std::remove_cv_t<_Test>,
                  ::ScL::Feature::Detail::Wrapper<_Other, _OtherTool> >::value
                  || ::ScL::Feature::Detail::IsPartOfThisCompatibleWithOther<
                      ::std::remove_cv_t<_Test>,
                      ::ScL::Feature::Detail::Wrapper<_Other, _OtherTool> >::value>
    {};
} // namespace ScL::Feature::Detail

namespace ScL::Feature
{
    template <typename _Test, typename _Other>
    using IsPartOfThisCompatibleWithOther = ::ScL::Feature::Detail::IsPartOfThisCompatibleWithOther<
        ::std::remove_cv_t<_Test>,
        ::std::remove_cv_t<_Other> >;

    template <typename _Test, typename _Other>
    inline constexpr bool isPartOfThisCompatibleWithOther()
    {
        return ::ScL::Feature::IsPartOfThisCompatibleWithOther<_Test, _Other>::value;
    }

    template <typename _Test, typename _Other>
    using is_part_of_this_compatible_with_other = ::ScL::Feature::IsPartOfThisCompatibleWithOther<
        _Test,
        _Other>;
    template <typename _Test, typename _Other>
    using is_part_of_this_compatible_with_other_t =
        typename ::ScL::Feature::IsPartOfThisCompatibleWithOther<_Test, _Other>::type;
    template <typename _Test, typename _Other>
    inline constexpr auto
        is_part_of_this_compatible_with_other_v = ::ScL::Feature::IsPartOfThisCompatibleWithOther<
            _Test,
            _Other>::value;
} // namespace ScL::Feature

namespace ScL::Feature
{
    template <typename _Test, typename _Other>
    struct IsSimilar
        : ::std::integral_constant<bool,
              ::std::is_rvalue_reference<_Test>::value
                  == ::std::is_rvalue_reference<_Other>::value && ::std::is_lvalue_reference<
                      _Test>::value
                  == ::std::is_lvalue_reference<_Other>::value && ::std::is_const<
                      ::std::remove_reference_t<_Test> >::value
                  == ::std::is_const< ::std::remove_reference_t<
                      _Other> >::value && ::std::is_volatile< ::std::remove_reference_t<_Test> >::value
                  == ::std::is_volatile< ::std::remove_reference_t<_Other> >::value>
    {};

    template <typename _Test, typename _Other>
    inline constexpr bool isSimilar()
    {
        return ::ScL::Feature::IsSimilar<_Test, _Other>::value;
    }

    template <typename _Test, typename _Other>
    using is_similar = ::ScL::Feature::IsSimilar<_Test, _Other>;
    template <typename _Test, typename _Other>
    using is_similar_t = typename ::ScL::Feature::IsSimilar<_Test, _Other>::type;
    template <typename _Test, typename _Other>
    inline constexpr auto is_similar_v = ::ScL::Feature::IsSimilar<_Test, _Other>::value;
} // namespace ScL::Feature

namespace ScL::Feature
{
    template <typename _Test, typename _Other>
    struct IsThisSpecifierCompatibleWithOther
        : ::std::integral_constant<bool,
              (!::std::is_const<_Other>::value
                  || (::std::is_const<_Other>::value && ::std::is_const<_Test>::value))
                  && (!::std::is_volatile<_Other>::value
                      || (::std::is_volatile<_Other>::value && ::std::is_volatile<_Test>::value))>
    {};

    template <typename _Test, typename _Other>
    inline constexpr bool isThisSpecifierCompatibleWithOther()
    {
        return ::ScL::Feature::IsThisSpecifierCompatibleWithOther<_Test, _Other>::value;
    }

    template <typename _Test, typename _Other>
    using is_this_specifier_compatible_with_other =
        ::ScL::Feature::IsThisSpecifierCompatibleWithOther<_Test, _Other>;
    template <typename _Test, typename _Other>
    using is_this_specifier_compatible_with_other_t =
        typename ::ScL::Feature::IsThisSpecifierCompatibleWithOther<_Test, _Other>::type;
    template <typename _Test, typename _Other>
    inline constexpr auto is_this_specifier_compatible_with_other_v =
        ::ScL::Feature::IsThisSpecifierCompatibleWithOther<_Test, _Other>::value;
} // namespace ScL::Feature

#endif
```


