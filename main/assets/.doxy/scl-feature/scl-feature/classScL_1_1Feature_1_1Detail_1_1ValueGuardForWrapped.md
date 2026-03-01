

# Class ScL::Feature::Detail::ValueGuardForWrapped

**template &lt;typename \_Refer&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Detail**](namespaceScL_1_1Feature_1_1Detail.md) **>** [**ValueGuardForWrapped**](classScL_1_1Feature_1_1Detail_1_1ValueGuardForWrapped.md)



_This is the ValueGuard specialization for multi wrapped value. It activates all features in the constructor and deactivate them in the destructor._ 

* `#include <value_guard.h>`

















## Public Types

| Type | Name |
| ---: | :--- |
| typedef typename Wrapper::Holder | [**Holder**](#typedef-holder)  <br> |
| typedef ::ScL::SimilarRefer&lt; Holder, WrapperRefer &gt; | [**HolderRefer**](#typedef-holderrefer)  <br> |
| typedef typename ValueGuard::PointerAccess | [**PointerAccess**](#typedef-pointeraccess)  <br> |
| typedef typename Wrapper::Value | [**Value**](#typedef-value)  <br> |
| typedef typename ValueGuard::ValueAccess | [**ValueAccess**](#typedef-valueaccess)  <br> |
| typedef [**::ScL::Feature::ValueGuard**](namespaceScL_1_1Feature.md#typedef-valueguard)&lt; ValueRefer &gt; | [**ValueGuard**](#typedef-valueguard)  <br> |
| typedef ::ScL::SimilarRefer&lt; Value, WrapperRefer &gt; | [**ValueRefer**](#typedef-valuerefer)  <br> |
| typedef ::std::decay\_t&lt; WrapperRefer &gt; | [**Wrapper**](#typedef-wrapper)  <br> |
| typedef typename WrapperGuard::WrapperAccess | [**WrapperAccess**](#typedef-wrapperaccess)  <br> |
| typedef [**::ScL::Feature::WrapperGuard**](namespaceScL_1_1Feature.md#typedef-wrapperguard)&lt; WrapperRefer &gt; | [**WrapperGuard**](#typedef-wrapperguard)  <br> |
| typedef \_Refer | [**WrapperRefer**](#typedef-wrapperrefer)  <br> |




















## Public Functions

| Type | Name |
| ---: | :--- |
|  constexpr | [**ValueGuardForWrapped**](#function-valueguardforwrapped-34) (WrapperRefer refer) <br> |
|  constexpr | [**ValueGuardForWrapped**](#function-valueguardforwrapped-44) (WrapperGuard && other) <br> |
|  constexpr PointerAccess | [**pointerAccess**](#function-pointeraccess) () const<br> |
|  constexpr ValueAccess | [**valueAccess**](#function-valueaccess) () const<br> |
|  constexpr WrapperAccess | [**wrapperAccess**](#function-wrapperaccess) () const<br> |




























## Public Types Documentation




### typedef Holder 

```C++
using ScL::Feature::Detail::ValueGuardForWrapped< _Refer >::Holder =  typename Wrapper::Holder;
```




<hr>



### typedef HolderRefer 

```C++
using ScL::Feature::Detail::ValueGuardForWrapped< _Refer >::HolderRefer =  ::ScL::SimilarRefer<Holder, WrapperRefer>;
```




<hr>



### typedef PointerAccess 

```C++
using ScL::Feature::Detail::ValueGuardForWrapped< _Refer >::PointerAccess =  typename ValueGuard::PointerAccess;
```




<hr>



### typedef Value 

```C++
using ScL::Feature::Detail::ValueGuardForWrapped< _Refer >::Value =  typename Wrapper::Value;
```




<hr>



### typedef ValueAccess 

```C++
using ScL::Feature::Detail::ValueGuardForWrapped< _Refer >::ValueAccess =  typename ValueGuard::ValueAccess;
```




<hr>



### typedef ValueGuard 

```C++
using ScL::Feature::Detail::ValueGuardForWrapped< _Refer >::ValueGuard =  ::ScL::Feature::ValueGuard<ValueRefer>;
```




<hr>



### typedef ValueRefer 

```C++
using ScL::Feature::Detail::ValueGuardForWrapped< _Refer >::ValueRefer =  ::ScL::SimilarRefer<Value, WrapperRefer>;
```




<hr>



### typedef Wrapper 

```C++
using ScL::Feature::Detail::ValueGuardForWrapped< _Refer >::Wrapper =  ::std::decay_t<WrapperRefer>;
```




<hr>



### typedef WrapperAccess 

```C++
using ScL::Feature::Detail::ValueGuardForWrapped< _Refer >::WrapperAccess =  typename WrapperGuard::WrapperAccess;
```




<hr>



### typedef WrapperGuard 

```C++
using ScL::Feature::Detail::ValueGuardForWrapped< _Refer >::WrapperGuard =  ::ScL::Feature::WrapperGuard<WrapperRefer>;
```




<hr>



### typedef WrapperRefer 

```C++
using ScL::Feature::Detail::ValueGuardForWrapped< _Refer >::WrapperRefer =  _Refer;
```




<hr>
## Public Functions Documentation




### function ValueGuardForWrapped [3/4]

```C++
inline constexpr ScL::Feature::Detail::ValueGuardForWrapped::ValueGuardForWrapped (
    WrapperRefer refer
) 
```




<hr>



### function ValueGuardForWrapped [4/4]

```C++
inline constexpr ScL::Feature::Detail::ValueGuardForWrapped::ValueGuardForWrapped (
    WrapperGuard && other
) 
```




<hr>



### function pointerAccess 

```C++
inline constexpr PointerAccess ScL::Feature::Detail::ValueGuardForWrapped::pointerAccess () const
```




<hr>



### function valueAccess 

```C++
inline constexpr ValueAccess ScL::Feature::Detail::ValueGuardForWrapped::valueAccess () const
```




<hr>



### function wrapperAccess 

```C++
inline constexpr WrapperAccess ScL::Feature::Detail::ValueGuardForWrapped::wrapperAccess () const
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/access/value_guard.h`

