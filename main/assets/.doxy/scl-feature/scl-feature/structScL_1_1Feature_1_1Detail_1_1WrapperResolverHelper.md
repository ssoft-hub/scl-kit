

# Struct ScL::Feature::Detail::WrapperResolverHelper

**template &lt;typename \_LeftWrapper, typename \_RightRefer&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Detail**](namespaceScL_1_1Feature_1_1Detail.md) **>** [**WrapperResolverHelper**](structScL_1_1Feature_1_1Detail_1_1WrapperResolverHelper.md)






















## Public Types

| Type | Name |
| ---: | :--- |
| typedef \_LeftWrapper | [**LeftWrapper**](#typedef-leftwrapper)  <br> |
| typedef \_RightRefer | [**RightRefer**](#typedef-rightrefer)  <br> |
| typedef ::std::remove\_reference\_t&lt; \_RightRefer &gt; | [**RightWrapper**](#typedef-rightwrapper)  <br> |
| typedef ::std::conditional\_t&lt; [**::ScL::Feature::IsThisCompatibleWithOther**](namespaceScL_1_1Feature.md#typedef-isthiscompatiblewithother)&lt; RightWrapper, LeftWrapper &gt;::value, [**::ScL::Feature::Detail::RightCompatibleWithLeftWrapperResolver**](classScL_1_1Feature_1_1Detail_1_1RightCompatibleWithLeftWrapperResolver.md)&lt; LeftWrapper, RightRefer &gt;, ::std::conditional\_t&lt; [**::ScL::Feature::IsThisCompatibleWithPartOfOther**](namespaceScL_1_1Feature.md#typedef-isthiscompatiblewithpartofother)&lt; RightWrapper, LeftWrapper &gt;::value, [**::ScL::Feature::Detail::RightCompatibleWithPartOfLeftWrapperResolver**](classScL_1_1Feature_1_1Detail_1_1RightCompatibleWithPartOfLeftWrapperResolver.md)&lt; LeftWrapper, RightRefer &gt;, ::std::conditional\_t&lt; [**::ScL::Feature::IsPartOfThisCompatibleWithOther**](namespaceScL_1_1Feature.md#typedef-ispartofthiscompatiblewithother)&lt; RightWrapper, LeftWrapper &gt;::value, [**::ScL::Feature::Detail::PartOfRightCompatibleWithLeftWrapperResolver**](classScL_1_1Feature_1_1Detail_1_1PartOfRightCompatibleWithLeftWrapperResolver.md)&lt; LeftWrapper, RightRefer &gt;, [**::ScL::Feature::Detail::ValueWrapperResolver**](classScL_1_1Feature_1_1Detail_1_1ValueWrapperResolver.md)&lt; LeftWrapper, RightRefer &gt; &gt; &gt; &gt; | [**Type**](#typedef-type)  <br> |
















































## Public Types Documentation




### typedef LeftWrapper 

```C++
using ScL::Feature::Detail::WrapperResolverHelper< _LeftWrapper, _RightRefer >::LeftWrapper =  _LeftWrapper;
```




<hr>



### typedef RightRefer 

```C++
using ScL::Feature::Detail::WrapperResolverHelper< _LeftWrapper, _RightRefer >::RightRefer =  _RightRefer;
```




<hr>



### typedef RightWrapper 

```C++
using ScL::Feature::Detail::WrapperResolverHelper< _LeftWrapper, _RightRefer >::RightWrapper =  ::std::remove_reference_t<_RightRefer>;
```




<hr>



### typedef Type 

```C++
using ScL::Feature::Detail::WrapperResolverHelper< _LeftWrapper, _RightRefer >::Type =  ::std::conditional_t< ::ScL::Feature::IsThisCompatibleWithOther<RightWrapper, LeftWrapper>::value, ::ScL::Feature::Detail::RightCompatibleWithLeftWrapperResolver<LeftWrapper, RightRefer>, ::std::conditional_t< ::ScL::Feature::IsThisCompatibleWithPartOfOther<RightWrapper, LeftWrapper>::value, ::ScL::Feature::Detail::RightCompatibleWithPartOfLeftWrapperResolver<LeftWrapper, RightRefer>, ::std::conditional_t< ::ScL::Feature::IsPartOfThisCompatibleWithOther<RightWrapper, LeftWrapper>::value, ::ScL::Feature::Detail::PartOfRightCompatibleWithLeftWrapperResolver<LeftWrapper, RightRefer>, ::ScL::Feature::Detail::ValueWrapperResolver<LeftWrapper, RightRefer> > > >;
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/detail/resolver.h`

