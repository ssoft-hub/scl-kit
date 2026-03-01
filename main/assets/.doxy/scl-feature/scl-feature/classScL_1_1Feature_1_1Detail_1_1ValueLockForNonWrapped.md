

# Class ScL::Feature::Detail::ValueLockForNonWrapped

**template &lt;typename Refer\_&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Detail**](namespaceScL_1_1Feature_1_1Detail.md) **>** [**ValueLockForNonWrapped**](classScL_1_1Feature_1_1Detail_1_1ValueLockForNonWrapped.md)



_This is the WrapperLock specialization for non wrapped value. It does nothing around a value._ 

* `#include <value_lock.h>`

















## Public Types

| Type | Name |
| ---: | :--- |
| typedef typename WrapperLock::PointerAccess | [**PointerAccess**](#typedef-pointeraccess)  <br> |
| typedef Refer\_ | [**Refer**](#typedef-refer)  <br> |
| typedef typename WrapperLock::ValueAccess | [**ValueAccess**](#typedef-valueaccess)  <br> |
| typedef [**::ScL::Feature::WrapperLock**](namespaceScL_1_1Feature.md#typedef-wrapperlock)&lt; Refer\_ &gt; | [**WrapperLock**](#typedef-wrapperlock)  <br> |




















## Public Functions

| Type | Name |
| ---: | :--- |
|  constexpr | [**ValueLockForNonWrapped**](#function-valuelockfornonwrapped-34) (Refer refer) <br> |
|  constexpr | [**ValueLockForNonWrapped**](#function-valuelockfornonwrapped-44) (WrapperLock && other) <br> |
|  constexpr void | [**lock**](#function-lock) () noexcept<br> |
|  constexpr auto | [**lockFor**](#function-lockfor) () <br> |
|  constexpr PointerAccess | [**pointerAccess**](#function-pointeraccess) () const<br> |
|  constexpr void | [**unlock**](#function-unlock) () noexcept<br> |
|  constexpr ValueAccess | [**valueAccess**](#function-valueaccess) () const<br> |
|  constexpr auto | [**valueAccessFor**](#function-valueaccessfor) () noexcept const<br> |
|   | [**~ValueLockForNonWrapped**](#function-valuelockfornonwrapped) () <br> |




























## Public Types Documentation




### typedef PointerAccess 

```C++
using ScL::Feature::Detail::ValueLockForNonWrapped< Refer_ >::PointerAccess =  typename WrapperLock::PointerAccess;
```




<hr>



### typedef Refer 

```C++
using ScL::Feature::Detail::ValueLockForNonWrapped< Refer_ >::Refer =  Refer_;
```




<hr>



### typedef ValueAccess 

```C++
using ScL::Feature::Detail::ValueLockForNonWrapped< Refer_ >::ValueAccess =  typename WrapperLock::ValueAccess;
```




<hr>



### typedef WrapperLock 

```C++
using ScL::Feature::Detail::ValueLockForNonWrapped< Refer_ >::WrapperLock =  ::ScL::Feature::WrapperLock<Refer_>;
```




<hr>
## Public Functions Documentation




### function ValueLockForNonWrapped [3/4]

```C++
inline constexpr ScL::Feature::Detail::ValueLockForNonWrapped::ValueLockForNonWrapped (
    Refer refer
) 
```




<hr>



### function ValueLockForNonWrapped [4/4]

```C++
inline constexpr ScL::Feature::Detail::ValueLockForNonWrapped::ValueLockForNonWrapped (
    WrapperLock && other
) 
```




<hr>



### function lock 

```C++
inline constexpr void ScL::Feature::Detail::ValueLockForNonWrapped::lock () noexcept
```




<hr>



### function lockFor 

```C++
template<typename Type_>
inline constexpr auto ScL::Feature::Detail::ValueLockForNonWrapped::lockFor () 
```




<hr>



### function pointerAccess 

```C++
inline constexpr PointerAccess ScL::Feature::Detail::ValueLockForNonWrapped::pointerAccess () const
```




<hr>



### function unlock 

```C++
inline constexpr void ScL::Feature::Detail::ValueLockForNonWrapped::unlock () noexcept
```




<hr>



### function valueAccess 

```C++
inline constexpr ValueAccess ScL::Feature::Detail::ValueLockForNonWrapped::valueAccess () const
```




<hr>



### function valueAccessFor 

```C++
template<typename Type_>
inline constexpr auto ScL::Feature::Detail::ValueLockForNonWrapped::valueAccessFor () noexcept const
```




<hr>



### function ~ValueLockForNonWrapped 

```C++
inline ScL::Feature::Detail::ValueLockForNonWrapped::~ValueLockForNonWrapped () 
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/access/value_lock.h`

