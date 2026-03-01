

# Class ScL::Feature::Detail::RightCompatibleWithPartOfLeftWrapperResolver

**template &lt;typename \_LeftWrapper, typename \_RightRefer&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Detail**](namespaceScL_1_1Feature_1_1Detail.md) **>** [**RightCompatibleWithPartOfLeftWrapperResolver**](classScL_1_1Feature_1_1Detail_1_1RightCompatibleWithPartOfLeftWrapperResolver.md)



[More...](#detailed-description)

* `#include <resolver.h>`

















## Public Types

| Type | Name |
| ---: | :--- |
| typedef RightRefer | [**AccessRefer**](#typedef-accessrefer)  <br> |
| typedef \_LeftWrapper | [**LeftWrapper**](#typedef-leftwrapper)  <br> |
| typedef \_RightRefer | [**RightRefer**](#typedef-rightrefer)  <br> |




















## Public Functions

| Type | Name |
| ---: | :--- |
|   | [**RightCompatibleWithPartOfLeftWrapperResolver**](#function-rightcompatiblewithpartofleftwrapperresolver) (RightRefer right) <br> |
|  AccessRefer | [**resolve**](#function-resolve) () const<br> |




























## Detailed Description


Используется, если \_Right совместим c вложенной частью \_LeftWrapper. 


    
## Public Types Documentation




### typedef AccessRefer 

```C++
using ScL::Feature::Detail::RightCompatibleWithPartOfLeftWrapperResolver< _LeftWrapper, _RightRefer >::AccessRefer =  RightRefer;
```




<hr>



### typedef LeftWrapper 

```C++
using ScL::Feature::Detail::RightCompatibleWithPartOfLeftWrapperResolver< _LeftWrapper, _RightRefer >::LeftWrapper =  _LeftWrapper;
```




<hr>



### typedef RightRefer 

```C++
using ScL::Feature::Detail::RightCompatibleWithPartOfLeftWrapperResolver< _LeftWrapper, _RightRefer >::RightRefer =  _RightRefer;
```




<hr>
## Public Functions Documentation




### function RightCompatibleWithPartOfLeftWrapperResolver 

```C++
inline ScL::Feature::Detail::RightCompatibleWithPartOfLeftWrapperResolver::RightCompatibleWithPartOfLeftWrapperResolver (
    RightRefer right
) 
```




<hr>



### function resolve 

```C++
inline AccessRefer ScL::Feature::Detail::RightCompatibleWithPartOfLeftWrapperResolver::resolve () const
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/detail/resolver.h`

