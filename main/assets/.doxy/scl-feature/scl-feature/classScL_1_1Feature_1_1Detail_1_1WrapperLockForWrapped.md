

# Class ScL::Feature::Detail::WrapperLockForWrapped

**template &lt;typename \_Refer&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Detail**](namespaceScL_1_1Feature_1_1Detail.md) **>** [**WrapperLockForWrapped**](classScL_1_1Feature_1_1Detail_1_1WrapperLockForWrapped.md)



_This is the WrapperLock specialization for wrapped value. It activates a feature in the constructor and deactivate it in the destructor._ 

* `#include <wrapper_lock.h>`

















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
|  constexpr | [**WrapperLockForWrapped**](#function-wrapperlockforwrapped-33) (WrapperRefer refer) noexcept<br> |
|  constexpr HolderAccess | [**holderAccess**](#function-holderaccess) () noexcept const<br> |
|  constexpr void | [**lock**](#function-lock) () <br> |
|  constexpr void | [**unlock**](#function-unlock) () <br> |
|  constexpr WrapperRefer | [**valueAccess**](#function-valueaccess) () noexcept const<br> |
|  constexpr WrapperAccess | [**wrapperAccess**](#function-wrapperaccess) () noexcept const<br> |
|   | [**~WrapperLockForWrapped**](#function-wrapperlockforwrapped) () <br> |




























## Public Types Documentation




### typedef Holder 

```C++
using ScL::Feature::Detail::WrapperLockForWrapped< _Refer >::Holder =  typename Wrapper::Holder;
```




<hr>



### typedef HolderAccess 

```C++
using ScL::Feature::Detail::WrapperLockForWrapped< _Refer >::HolderAccess =  HolderRefer;
```




<hr>



### typedef HolderRefer 

```C++
using ScL::Feature::Detail::WrapperLockForWrapped< _Refer >::HolderRefer =  ::ScL::SimilarRefer<Holder, WrapperRefer>;
```




<hr>



### typedef Value 

```C++
using ScL::Feature::Detail::WrapperLockForWrapped< _Refer >::Value =  typename Wrapper::Value;
```




<hr>



### typedef ValueRefer 

```C++
using ScL::Feature::Detail::WrapperLockForWrapped< _Refer >::ValueRefer =  ::ScL::SimilarRefer<Value, WrapperRefer>;
```




<hr>



### typedef Wrapper 

```C++
using ScL::Feature::Detail::WrapperLockForWrapped< _Refer >::Wrapper =  ::std::decay_t<WrapperRefer>;
```




<hr>



### typedef WrapperAccess 

```C++
using ScL::Feature::Detail::WrapperLockForWrapped< _Refer >::WrapperAccess =  ValueRefer;
```




<hr>



### typedef WrapperRefer 

```C++
using ScL::Feature::Detail::WrapperLockForWrapped< _Refer >::WrapperRefer =  _Refer;
```




<hr>
## Public Functions Documentation




### function WrapperLockForWrapped [3/3]

```C++
inline constexpr ScL::Feature::Detail::WrapperLockForWrapped::WrapperLockForWrapped (
    WrapperRefer refer
) noexcept
```




<hr>



### function holderAccess 

```C++
inline constexpr HolderAccess ScL::Feature::Detail::WrapperLockForWrapped::holderAccess () noexcept const
```




<hr>



### function lock 

```C++
inline constexpr void ScL::Feature::Detail::WrapperLockForWrapped::lock () 
```




<hr>



### function unlock 

```C++
inline constexpr void ScL::Feature::Detail::WrapperLockForWrapped::unlock () 
```




<hr>



### function valueAccess 

```C++
inline constexpr WrapperRefer ScL::Feature::Detail::WrapperLockForWrapped::valueAccess () noexcept const
```




<hr>



### function wrapperAccess 

```C++
inline constexpr WrapperAccess ScL::Feature::Detail::WrapperLockForWrapped::wrapperAccess () noexcept const
```




<hr>



### function ~WrapperLockForWrapped 

```C++
inline ScL::Feature::Detail::WrapperLockForWrapped::~WrapperLockForWrapped () 
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/access/wrapper_lock.h`

