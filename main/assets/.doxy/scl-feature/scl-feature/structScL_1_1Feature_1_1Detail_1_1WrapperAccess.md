

# Struct ScL::Feature::Detail::WrapperAccess

**template &lt;typename \_WrapperRefer&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Detail**](namespaceScL_1_1Feature_1_1Detail.md) **>** [**WrapperAccess**](structScL_1_1Feature_1_1Detail_1_1WrapperAccess.md)






















## Public Types

| Type | Name |
| ---: | :--- |
| typedef typename Wrapper::Holder | [**Holder**](#typedef-holder)  <br> |
| typedef ::ScL::SimilarRefer&lt; Holder, WrapperRefer &gt; | [**HolderRefer**](#typedef-holderrefer)  <br> |
| typedef ::std::decay\_t&lt; WrapperRefer &gt; | [**Wrapper**](#typedef-wrapper)  <br> |
| typedef \_WrapperRefer | [**WrapperRefer**](#typedef-wrapperrefer)  <br> |






















## Public Static Functions

| Type | Name |
| ---: | :--- |
|  constexpr HolderRefer | [**holderRefer**](#function-holderrefer) (WrapperRefer refer) <br> |


























## Public Types Documentation




### typedef Holder 

```C++
using ScL::Feature::Detail::WrapperAccess< _WrapperRefer >::Holder =  typename Wrapper::Holder;
```




<hr>



### typedef HolderRefer 

```C++
using ScL::Feature::Detail::WrapperAccess< _WrapperRefer >::HolderRefer =  ::ScL::SimilarRefer<Holder, WrapperRefer>;
```




<hr>



### typedef Wrapper 

```C++
using ScL::Feature::Detail::WrapperAccess< _WrapperRefer >::Wrapper =  ::std::decay_t<WrapperRefer>;
```




<hr>



### typedef WrapperRefer 

```C++
using ScL::Feature::Detail::WrapperAccess< _WrapperRefer >::WrapperRefer =  _WrapperRefer;
```




<hr>
## Public Static Functions Documentation




### function holderRefer 

```C++
static inline constexpr HolderRefer ScL::Feature::Detail::WrapperAccess::holderRefer (
    WrapperRefer refer
) 
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/access/detail/holder_interface.h`

