

# Class ScL::Feature::Detail::ValueGuardForNonWrapped

**template &lt;typename \_Refer&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Detail**](namespaceScL_1_1Feature_1_1Detail.md) **>** [**ValueGuardForNonWrapped**](classScL_1_1Feature_1_1Detail_1_1ValueGuardForNonWrapped.md)



_This is the WrapperGuard specialization for non wrapped value. It does nothing around a value._ 

* `#include <value_guard.h>`

















## Public Types

| Type | Name |
| ---: | :--- |
| typedef typename WrapperGuard::PointerAccess | [**PointerAccess**](#typedef-pointeraccess)  <br> |
| typedef \_Refer | [**Refer**](#typedef-refer)  <br> |
| typedef typename WrapperGuard::ValueAccess | [**ValueAccess**](#typedef-valueaccess)  <br> |
| typedef [**::ScL::Feature::WrapperGuard**](namespaceScL_1_1Feature.md#typedef-wrapperguard)&lt; \_Refer &gt; | [**WrapperGuard**](#typedef-wrapperguard)  <br> |




















## Public Functions

| Type | Name |
| ---: | :--- |
|  constexpr | [**ValueGuardForNonWrapped**](#function-valueguardfornonwrapped-34) (Refer refer) <br> |
|  constexpr | [**ValueGuardForNonWrapped**](#function-valueguardfornonwrapped-44) (WrapperGuard && other) <br> |
|  constexpr PointerAccess | [**pointerAccess**](#function-pointeraccess) () const<br> |
|  constexpr ValueAccess | [**valueAccess**](#function-valueaccess) () const<br> |




























## Public Types Documentation




### typedef PointerAccess 

```C++
using ScL::Feature::Detail::ValueGuardForNonWrapped< _Refer >::PointerAccess =  typename WrapperGuard::PointerAccess;
```




<hr>



### typedef Refer 

```C++
using ScL::Feature::Detail::ValueGuardForNonWrapped< _Refer >::Refer =  _Refer;
```




<hr>



### typedef ValueAccess 

```C++
using ScL::Feature::Detail::ValueGuardForNonWrapped< _Refer >::ValueAccess =  typename WrapperGuard::ValueAccess;
```




<hr>



### typedef WrapperGuard 

```C++
using ScL::Feature::Detail::ValueGuardForNonWrapped< _Refer >::WrapperGuard =  ::ScL::Feature::WrapperGuard<_Refer>;
```




<hr>
## Public Functions Documentation




### function ValueGuardForNonWrapped [3/4]

```C++
inline constexpr ScL::Feature::Detail::ValueGuardForNonWrapped::ValueGuardForNonWrapped (
    Refer refer
) 
```




<hr>



### function ValueGuardForNonWrapped [4/4]

```C++
inline constexpr ScL::Feature::Detail::ValueGuardForNonWrapped::ValueGuardForNonWrapped (
    WrapperGuard && other
) 
```




<hr>



### function pointerAccess 

```C++
inline constexpr PointerAccess ScL::Feature::Detail::ValueGuardForNonWrapped::pointerAccess () const
```




<hr>



### function valueAccess 

```C++
inline constexpr ValueAccess ScL::Feature::Detail::ValueGuardForNonWrapped::valueAccess () const
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/access/value_guard.h`

