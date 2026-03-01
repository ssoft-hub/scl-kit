

# Class ScL::Feature::Detail::WrapperLockForNonWrapped

**template &lt;typename \_Refer&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Detail**](namespaceScL_1_1Feature_1_1Detail.md) **>** [**WrapperLockForNonWrapped**](classScL_1_1Feature_1_1Detail_1_1WrapperLockForNonWrapped.md)



_This is the WrapperLock specialization for non wrapped value. It does nothing around a value._ 

* `#include <wrapper_lock.h>`

















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
|  constexpr | [**WrapperLockForNonWrapped**](#function-wrapperlockfornonwrapped-33) (Refer refer) <br> |
|  constexpr void | [**lock**](#function-lock) () <br> |
|  constexpr PointerAccess | [**pointerAccess**](#function-pointeraccess) () const<br> |
|  constexpr void | [**unlock**](#function-unlock) () <br> |
|  constexpr ValueAccess | [**valueAccess**](#function-valueaccess) () const<br> |




























## Public Types Documentation




### typedef Pointer 

```C++
using ScL::Feature::Detail::WrapperLockForNonWrapped< _Refer >::Pointer =  ::std::add_pointer_t< ::std::remove_reference_t<Refer> >;
```




<hr>



### typedef PointerAccess 

```C++
using ScL::Feature::Detail::WrapperLockForNonWrapped< _Refer >::PointerAccess =  Pointer;
```




<hr>



### typedef Refer 

```C++
using ScL::Feature::Detail::WrapperLockForNonWrapped< _Refer >::Refer =  _Refer;
```




<hr>



### typedef ValueAccess 

```C++
using ScL::Feature::Detail::WrapperLockForNonWrapped< _Refer >::ValueAccess =  Refer;
```




<hr>
## Public Functions Documentation




### function WrapperLockForNonWrapped [3/3]

```C++
inline constexpr ScL::Feature::Detail::WrapperLockForNonWrapped::WrapperLockForNonWrapped (
    Refer refer
) 
```




<hr>



### function lock 

```C++
inline constexpr void ScL::Feature::Detail::WrapperLockForNonWrapped::lock () 
```




<hr>



### function pointerAccess 

```C++
inline constexpr PointerAccess ScL::Feature::Detail::WrapperLockForNonWrapped::pointerAccess () const
```




<hr>



### function unlock 

```C++
inline constexpr void ScL::Feature::Detail::WrapperLockForNonWrapped::unlock () 
```




<hr>



### function valueAccess 

```C++
inline constexpr ValueAccess ScL::Feature::Detail::WrapperLockForNonWrapped::valueAccess () const
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/access/wrapper_lock.h`

