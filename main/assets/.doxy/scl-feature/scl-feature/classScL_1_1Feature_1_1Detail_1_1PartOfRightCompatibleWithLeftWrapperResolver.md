

# Class ScL::Feature::Detail::PartOfRightCompatibleWithLeftWrapperResolver

**template &lt;typename \_LeftWrapper, typename \_RightRefer&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Detail**](namespaceScL_1_1Feature_1_1Detail.md) **>** [**PartOfRightCompatibleWithLeftWrapperResolver**](classScL_1_1Feature_1_1Detail_1_1PartOfRightCompatibleWithLeftWrapperResolver.md)



[More...](#detailed-description)

* `#include <resolver.h>`

















## Public Types

| Type | Name |
| ---: | :--- |
| typedef typename NextResolver::AccessRefer | [**AccessRefer**](#typedef-accessrefer)  <br> |
| typedef \_LeftWrapper | [**LeftWrapper**](#typedef-leftwrapper)  <br> |
| typedef ::ScL::Feature::Detail::WrapperResolver&lt; LeftWrapper, RightValueRefer &gt; | [**NextResolver**](#typedef-nextresolver)  <br> |
| typedef \_RightRefer | [**RightRefer**](#typedef-rightrefer)  <br> |
| typedef typename RightWrapper::Value | [**RightValue**](#typedef-rightvalue)  <br> |
| typedef ::ScL::SimilarRefer&lt; RightValue, RightRefer &gt; | [**RightValueRefer**](#typedef-rightvaluerefer)  <br> |
| typedef ::std::remove\_reference\_t&lt; RightRefer &gt; | [**RightWrapper**](#typedef-rightwrapper)  <br> |
| typedef [**::ScL::Feature::WrapperGuard**](namespaceScL_1_1Feature.md#typedef-wrapperguard)&lt; RightRefer &gt; | [**RightWrapperGuard**](#typedef-rightwrapperguard)  <br> |




















## Public Functions

| Type | Name |
| ---: | :--- |
|   | [**PartOfRightCompatibleWithLeftWrapperResolver**](#function-partofrightcompatiblewithleftwrapperresolver) (RightRefer right) <br> |
|  AccessRefer | [**resolve**](#function-resolve) () const<br> |




























## Detailed Description


Используется, если \_LeftWrapper совместим с вложенной частью \_Right. 


    
## Public Types Documentation




### typedef AccessRefer 

```C++
using ScL::Feature::Detail::PartOfRightCompatibleWithLeftWrapperResolver< _LeftWrapper, _RightRefer >::AccessRefer =  typename NextResolver::AccessRefer;
```




<hr>



### typedef LeftWrapper 

```C++
using ScL::Feature::Detail::PartOfRightCompatibleWithLeftWrapperResolver< _LeftWrapper, _RightRefer >::LeftWrapper =  _LeftWrapper;
```




<hr>



### typedef NextResolver 

```C++
using ScL::Feature::Detail::PartOfRightCompatibleWithLeftWrapperResolver< _LeftWrapper, _RightRefer >::NextResolver =  ::ScL::Feature::Detail::WrapperResolver<LeftWrapper, RightValueRefer>;
```




<hr>



### typedef RightRefer 

```C++
using ScL::Feature::Detail::PartOfRightCompatibleWithLeftWrapperResolver< _LeftWrapper, _RightRefer >::RightRefer =  _RightRefer;
```




<hr>



### typedef RightValue 

```C++
using ScL::Feature::Detail::PartOfRightCompatibleWithLeftWrapperResolver< _LeftWrapper, _RightRefer >::RightValue =  typename RightWrapper::Value;
```




<hr>



### typedef RightValueRefer 

```C++
using ScL::Feature::Detail::PartOfRightCompatibleWithLeftWrapperResolver< _LeftWrapper, _RightRefer >::RightValueRefer =  ::ScL::SimilarRefer<RightValue, RightRefer>;
```




<hr>



### typedef RightWrapper 

```C++
using ScL::Feature::Detail::PartOfRightCompatibleWithLeftWrapperResolver< _LeftWrapper, _RightRefer >::RightWrapper =  ::std::remove_reference_t<RightRefer>;
```




<hr>



### typedef RightWrapperGuard 

```C++
using ScL::Feature::Detail::PartOfRightCompatibleWithLeftWrapperResolver< _LeftWrapper, _RightRefer >::RightWrapperGuard =  ::ScL::Feature::WrapperGuard<RightRefer>;
```




<hr>
## Public Functions Documentation




### function PartOfRightCompatibleWithLeftWrapperResolver 

```C++
inline ScL::Feature::Detail::PartOfRightCompatibleWithLeftWrapperResolver::PartOfRightCompatibleWithLeftWrapperResolver (
    RightRefer right
) 
```




<hr>



### function resolve 

```C++
inline AccessRefer ScL::Feature::Detail::PartOfRightCompatibleWithLeftWrapperResolver::resolve () const
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/detail/resolver.h`

