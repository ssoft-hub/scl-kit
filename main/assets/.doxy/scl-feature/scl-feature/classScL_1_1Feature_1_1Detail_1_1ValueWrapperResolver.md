

# Class ScL::Feature::Detail::ValueWrapperResolver

**template &lt;typename \_LeftWrapper, typename \_RightRefer&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Detail**](namespaceScL_1_1Feature_1_1Detail.md) **>** [**ValueWrapperResolver**](classScL_1_1Feature_1_1Detail_1_1ValueWrapperResolver.md)



[More...](#detailed-description)

* `#include <resolver.h>`

















## Public Types

| Type | Name |
| ---: | :--- |
| typedef typename RightValueGuard::ValueRefer | [**AccessRefer**](#typedef-accessrefer)  <br> |
| typedef \_LeftWrapper | [**LeftWrapper**](#typedef-leftwrapper)  <br> |
| typedef \_RightRefer | [**RightRefer**](#typedef-rightrefer)  <br> |
| typedef [**::ScL::Feature::ValueGuard**](namespaceScL_1_1Feature.md#typedef-valueguard)&lt; RightRefer &gt; | [**RightValueGuard**](#typedef-rightvalueguard)  <br> |




















## Public Functions

| Type | Name |
| ---: | :--- |
|   | [**ValueWrapperResolver**](#function-valuewrapperresolver) (RightRefer right) <br> |
|  AccessRefer | [**resolve**](#function-resolve) () const<br> |




























## Detailed Description


Используется, если \_LeftWrapper не совместим с \_Right. 


    
## Public Types Documentation




### typedef AccessRefer 

```C++
using ScL::Feature::Detail::ValueWrapperResolver< _LeftWrapper, _RightRefer >::AccessRefer =  typename RightValueGuard::ValueRefer;
```




<hr>



### typedef LeftWrapper 

```C++
using ScL::Feature::Detail::ValueWrapperResolver< _LeftWrapper, _RightRefer >::LeftWrapper =  _LeftWrapper;
```




<hr>



### typedef RightRefer 

```C++
using ScL::Feature::Detail::ValueWrapperResolver< _LeftWrapper, _RightRefer >::RightRefer =  _RightRefer;
```




<hr>



### typedef RightValueGuard 

```C++
using ScL::Feature::Detail::ValueWrapperResolver< _LeftWrapper, _RightRefer >::RightValueGuard =  ::ScL::Feature::ValueGuard<RightRefer>;
```




<hr>
## Public Functions Documentation




### function ValueWrapperResolver 

```C++
inline ScL::Feature::Detail::ValueWrapperResolver::ValueWrapperResolver (
    RightRefer right
) 
```




<hr>



### function resolve 

```C++
inline AccessRefer ScL::Feature::Detail::ValueWrapperResolver::resolve () const
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/detail/resolver.h`

