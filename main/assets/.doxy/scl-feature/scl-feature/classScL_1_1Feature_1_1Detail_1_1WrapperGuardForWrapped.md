

# Class ScL::Feature::Detail::WrapperGuardForWrapped

**template &lt;typename \_Refer&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Detail**](namespaceScL_1_1Feature_1_1Detail.md) **>** [**WrapperGuardForWrapped**](classScL_1_1Feature_1_1Detail_1_1WrapperGuardForWrapped.md)



_This is the WrapperGuard specialization for wrapped value. It activates a feature in the constructor and deactivate it in the destructor._ 

* `#include <wrapper_guard.h>`

















## Public Types

| Type | Name |
| ---: | :--- |
| typedef typename Wrapper::Holder | [**Holder**](#typedef-holder)  <br> |
| typedef HolderRefer | [**HolderAccess**](#typedef-holderaccess)  <br> |
| typedef ::ScL::SimilarRefer&lt; Holder, WrapperRefer &gt; | [**HolderRefer**](#typedef-holderrefer)  <br> |
| typedef typename Wrapper::Value | [**Value**](#typedef-value)  <br> |
| typedef ::ScL::SimilarRefer&lt; Value, WrapperRefer &gt; | [**ValueRefer**](#typedef-valuerefer)  <br> |
| typedef ::std::decay\_t&lt; WrapperRefer &gt; | [**Wrapper**](#typedef-wrapper)  <br> |
| typedef ValueRefer | [**WrapperAccess**](#typedef-wrapperaccess)  <br> |
| typedef \_Refer | [**WrapperRefer**](#typedef-wrapperrefer)  <br> |




















## Public Functions

| Type | Name |
| ---: | :--- |
|  constexpr | [**WrapperGuardForWrapped**](#function-wrapperguardforwrapped-33) (WrapperRefer refer) noexcept<br> |
|  constexpr HolderAccess | [**holderAccess**](#function-holderaccess) () noexcept const<br> |
|  constexpr WrapperAccess | [**wrapperAccess**](#function-wrapperaccess) () noexcept const<br> |
|   | [**~WrapperGuardForWrapped**](#function-wrapperguardforwrapped) () <br> |




























## Public Types Documentation




### typedef Holder 

```C++
using ScL::Feature::Detail::WrapperGuardForWrapped< _Refer >::Holder =  typename Wrapper::Holder;
```




<hr>



### typedef HolderAccess 

```C++
using ScL::Feature::Detail::WrapperGuardForWrapped< _Refer >::HolderAccess =  HolderRefer;
```




<hr>



### typedef HolderRefer 

```C++
using ScL::Feature::Detail::WrapperGuardForWrapped< _Refer >::HolderRefer =  ::ScL::SimilarRefer<Holder, WrapperRefer>;
```




<hr>



### typedef Value 

```C++
using ScL::Feature::Detail::WrapperGuardForWrapped< _Refer >::Value =  typename Wrapper::Value;
```




<hr>



### typedef ValueRefer 

```C++
using ScL::Feature::Detail::WrapperGuardForWrapped< _Refer >::ValueRefer =  ::ScL::SimilarRefer<Value, WrapperRefer>;
```




<hr>



### typedef Wrapper 

```C++
using ScL::Feature::Detail::WrapperGuardForWrapped< _Refer >::Wrapper =  ::std::decay_t<WrapperRefer>;
```




<hr>



### typedef WrapperAccess 

```C++
using ScL::Feature::Detail::WrapperGuardForWrapped< _Refer >::WrapperAccess =  ValueRefer;
```




<hr>



### typedef WrapperRefer 

```C++
using ScL::Feature::Detail::WrapperGuardForWrapped< _Refer >::WrapperRefer =  _Refer;
```




<hr>
## Public Functions Documentation




### function WrapperGuardForWrapped [3/3]

```C++
inline constexpr ScL::Feature::Detail::WrapperGuardForWrapped::WrapperGuardForWrapped (
    WrapperRefer refer
) noexcept
```




<hr>



### function holderAccess 

```C++
inline constexpr HolderAccess ScL::Feature::Detail::WrapperGuardForWrapped::holderAccess () noexcept const
```




<hr>



### function wrapperAccess 

```C++
inline constexpr WrapperAccess ScL::Feature::Detail::WrapperGuardForWrapped::wrapperAccess () noexcept const
```




<hr>



### function ~WrapperGuardForWrapped 

```C++
inline ScL::Feature::Detail::WrapperGuardForWrapped::~WrapperGuardForWrapped () 
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/access/wrapper_guard.h`

