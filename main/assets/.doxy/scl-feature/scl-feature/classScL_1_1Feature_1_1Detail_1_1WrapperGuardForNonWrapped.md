

# Class ScL::Feature::Detail::WrapperGuardForNonWrapped

**template &lt;typename \_Refer&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Detail**](namespaceScL_1_1Feature_1_1Detail.md) **>** [**WrapperGuardForNonWrapped**](classScL_1_1Feature_1_1Detail_1_1WrapperGuardForNonWrapped.md)



_This is the WrapperGuard specialization for non wrapped value. It does nothing around a value._ 

* `#include <wrapper_guard.h>`

















## Public Types

| Type | Name |
| ---: | :--- |
| typedef ::std::add\_pointer\_t&lt; ::std::remove\_reference\_t&lt; Refer &gt; &gt; | [**Pointer**](#typedef-pointer)  <br> |
| typedef Pointer | [**PointerAccess**](#typedef-pointeraccess)  <br> |
| typedef \_Refer | [**Refer**](#typedef-refer)  <br> |
| typedef Refer | [**ValueAccess**](#typedef-valueaccess)  <br> |




















## Public Functions

| Type | Name |
| ---: | :--- |
|  constexpr | [**WrapperGuardForNonWrapped**](#function-wrapperguardfornonwrapped-33) (Refer refer) <br> |
|  constexpr PointerAccess | [**pointerAccess**](#function-pointeraccess) () const<br> |
|  constexpr ValueAccess | [**valueAccess**](#function-valueaccess) () const<br> |




























## Public Types Documentation




### typedef Pointer 

```C++
using ScL::Feature::Detail::WrapperGuardForNonWrapped< _Refer >::Pointer =  ::std::add_pointer_t< ::std::remove_reference_t<Refer> >;
```




<hr>



### typedef PointerAccess 

```C++
using ScL::Feature::Detail::WrapperGuardForNonWrapped< _Refer >::PointerAccess =  Pointer;
```




<hr>



### typedef Refer 

```C++
using ScL::Feature::Detail::WrapperGuardForNonWrapped< _Refer >::Refer =  _Refer;
```




<hr>



### typedef ValueAccess 

```C++
using ScL::Feature::Detail::WrapperGuardForNonWrapped< _Refer >::ValueAccess =  Refer;
```




<hr>
## Public Functions Documentation




### function WrapperGuardForNonWrapped [3/3]

```C++
inline constexpr ScL::Feature::Detail::WrapperGuardForNonWrapped::WrapperGuardForNonWrapped (
    Refer refer
) 
```




<hr>



### function pointerAccess 

```C++
inline constexpr PointerAccess ScL::Feature::Detail::WrapperGuardForNonWrapped::pointerAccess () const
```




<hr>



### function valueAccess 

```C++
inline constexpr ValueAccess ScL::Feature::Detail::WrapperGuardForNonWrapped::valueAccess () const
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/access/wrapper_guard.h`

