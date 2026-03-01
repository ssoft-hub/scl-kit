

# Class ScL::Feature::Detail::RightCompatibleWithLeftWrapperResolver

**template &lt;typename \_LeftWrapper, typename \_RightRefer&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Detail**](namespaceScL_1_1Feature_1_1Detail.md) **>** [**RightCompatibleWithLeftWrapperResolver**](classScL_1_1Feature_1_1Detail_1_1RightCompatibleWithLeftWrapperResolver.md)



[More...](#detailed-description)

* `#include <resolver.h>`

















## Public Types

| Type | Name |
| ---: | :--- |
| typedef RightHolderRefer | [**AccessRefer**](#typedef-accessrefer)  <br> |
| typedef \_LeftWrapper | [**LeftWrapper**](#typedef-leftwrapper)  <br> |
| typedef typename RightWrapper::Holder | [**RightHolder**](#typedef-rightholder)  <br> |
| typedef ::ScL::SimilarRefer&lt; RightHolder, RightRefer &gt; | [**RightHolderRefer**](#typedef-rightholderrefer)  <br> |
| typedef \_RightRefer | [**RightRefer**](#typedef-rightrefer)  <br> |
| typedef ::std::remove\_reference\_t&lt; RightRefer &gt; | [**RightWrapper**](#typedef-rightwrapper)  <br> |




















## Public Functions

| Type | Name |
| ---: | :--- |
|   | [**RightCompatibleWithLeftWrapperResolver**](#function-rightcompatiblewithleftwrapperresolver) (RightRefer Right) <br> |
|  AccessRefer | [**resolve**](#function-resolve) () const<br> |




























## Detailed Description


Используется, если \_Other совместим с \_LeftWrapper. 


    
## Public Types Documentation




### typedef AccessRefer 

```C++
using ScL::Feature::Detail::RightCompatibleWithLeftWrapperResolver< _LeftWrapper, _RightRefer >::AccessRefer =  RightHolderRefer;
```




<hr>



### typedef LeftWrapper 

```C++
using ScL::Feature::Detail::RightCompatibleWithLeftWrapperResolver< _LeftWrapper, _RightRefer >::LeftWrapper =  _LeftWrapper;
```




<hr>



### typedef RightHolder 

```C++
using ScL::Feature::Detail::RightCompatibleWithLeftWrapperResolver< _LeftWrapper, _RightRefer >::RightHolder =  typename RightWrapper::Holder;
```




<hr>



### typedef RightHolderRefer 

```C++
using ScL::Feature::Detail::RightCompatibleWithLeftWrapperResolver< _LeftWrapper, _RightRefer >::RightHolderRefer =  ::ScL::SimilarRefer<RightHolder, RightRefer>;
```




<hr>



### typedef RightRefer 

```C++
using ScL::Feature::Detail::RightCompatibleWithLeftWrapperResolver< _LeftWrapper, _RightRefer >::RightRefer =  _RightRefer;
```




<hr>



### typedef RightWrapper 

```C++
using ScL::Feature::Detail::RightCompatibleWithLeftWrapperResolver< _LeftWrapper, _RightRefer >::RightWrapper =  ::std::remove_reference_t<RightRefer>;
```




<hr>
## Public Functions Documentation




### function RightCompatibleWithLeftWrapperResolver 

```C++
inline ScL::Feature::Detail::RightCompatibleWithLeftWrapperResolver::RightCompatibleWithLeftWrapperResolver (
    RightRefer Right
) 
```




<hr>



### function resolve 

```C++
inline AccessRefer ScL::Feature::Detail::RightCompatibleWithLeftWrapperResolver::resolve () const
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/detail/resolver.h`

