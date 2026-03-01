

# Class ScL::Feature::Detail::ValueLockForWrapped

**template &lt;typename Refer\_&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Detail**](namespaceScL_1_1Feature_1_1Detail.md) **>** [**ValueLockForWrapped**](classScL_1_1Feature_1_1Detail_1_1ValueLockForWrapped.md)



_This is the ValueLock specialization for multi wrapped value. It activates all features in the constructor and deactivate them in the destructor._ 

* `#include <value_lock.h>`

















## Public Types

| Type | Name |
| ---: | :--- |
| typedef typename Wrapper::Holder | [**Holder**](#typedef-holder)  <br> |
| typedef ::ScL::SimilarRefer&lt; Holder, WrapperRefer &gt; | [**HolderRefer**](#typedef-holderrefer)  <br> |
| typedef typename ValueLock::PointerAccess | [**PointerAccess**](#typedef-pointeraccess)  <br> |
| typedef typename Wrapper::Value | [**Value**](#typedef-value)  <br> |
| typedef typename ValueLock::ValueAccess | [**ValueAccess**](#typedef-valueaccess)  <br> |
| typedef [**::ScL::Feature::ValueLock**](namespaceScL_1_1Feature.md#typedef-valuelock)&lt; ValueRefer &gt; | [**ValueLock**](#typedef-valuelock)  <br> |
| typedef ::ScL::SimilarRefer&lt; Value, WrapperRefer &gt; | [**ValueRefer**](#typedef-valuerefer)  <br> |
| typedef ::std::decay\_t&lt; WrapperRefer &gt; | [**Wrapper**](#typedef-wrapper)  <br> |
| typedef typename WrapperLock::WrapperAccess | [**WrapperAccess**](#typedef-wrapperaccess)  <br> |
| typedef [**::ScL::Feature::WrapperLock**](namespaceScL_1_1Feature.md#typedef-wrapperlock)&lt; WrapperRefer &gt; | [**WrapperLock**](#typedef-wrapperlock)  <br> |
| typedef Refer\_ | [**WrapperRefer**](#typedef-wrapperrefer)  <br> |




















## Public Functions

| Type | Name |
| ---: | :--- |
|  constexpr | [**ValueLockForWrapped**](#function-valuelockforwrapped-34) (WrapperRefer refer) <br> |
|  constexpr | [**ValueLockForWrapped**](#function-valuelockforwrapped-44) (WrapperLock && other) <br> |
|  constexpr void | [**lock**](#function-lock) () <br> |
|  constexpr void | [**lockFor**](#function-lockfor) () <br> |
|  constexpr PointerAccess | [**pointerAccess**](#function-pointeraccess) () const<br> |
|  constexpr void | [**unlock**](#function-unlock) () <br> |
|  constexpr ValueAccess | [**valueAccess**](#function-valueaccess) () const<br> |
|  constexpr Type\_ | [**valueAccessFor**](#function-valueaccessfor) () const<br> |
|  constexpr WrapperAccess | [**wrapperAccess**](#function-wrapperaccess) () const<br> |
|   | [**~ValueLockForWrapped**](#function-valuelockforwrapped) () <br> |




























## Public Types Documentation




### typedef Holder 

```C++
using ScL::Feature::Detail::ValueLockForWrapped< Refer_ >::Holder =  typename Wrapper::Holder;
```




<hr>



### typedef HolderRefer 

```C++
using ScL::Feature::Detail::ValueLockForWrapped< Refer_ >::HolderRefer =  ::ScL::SimilarRefer<Holder, WrapperRefer>;
```




<hr>



### typedef PointerAccess 

```C++
using ScL::Feature::Detail::ValueLockForWrapped< Refer_ >::PointerAccess =  typename ValueLock::PointerAccess;
```




<hr>



### typedef Value 

```C++
using ScL::Feature::Detail::ValueLockForWrapped< Refer_ >::Value =  typename Wrapper::Value;
```




<hr>



### typedef ValueAccess 

```C++
using ScL::Feature::Detail::ValueLockForWrapped< Refer_ >::ValueAccess =  typename ValueLock::ValueAccess;
```




<hr>



### typedef ValueLock 

```C++
using ScL::Feature::Detail::ValueLockForWrapped< Refer_ >::ValueLock =  ::ScL::Feature::ValueLock<ValueRefer>;
```




<hr>



### typedef ValueRefer 

```C++
using ScL::Feature::Detail::ValueLockForWrapped< Refer_ >::ValueRefer =  ::ScL::SimilarRefer<Value, WrapperRefer>;
```




<hr>



### typedef Wrapper 

```C++
using ScL::Feature::Detail::ValueLockForWrapped< Refer_ >::Wrapper =  ::std::decay_t<WrapperRefer>;
```




<hr>



### typedef WrapperAccess 

```C++
using ScL::Feature::Detail::ValueLockForWrapped< Refer_ >::WrapperAccess =  typename WrapperLock::WrapperAccess;
```




<hr>



### typedef WrapperLock 

```C++
using ScL::Feature::Detail::ValueLockForWrapped< Refer_ >::WrapperLock =  ::ScL::Feature::WrapperLock<WrapperRefer>;
```




<hr>



### typedef WrapperRefer 

```C++
using ScL::Feature::Detail::ValueLockForWrapped< Refer_ >::WrapperRefer =  Refer_;
```




<hr>
## Public Functions Documentation




### function ValueLockForWrapped [3/4]

```C++
inline constexpr ScL::Feature::Detail::ValueLockForWrapped::ValueLockForWrapped (
    WrapperRefer refer
) 
```




<hr>



### function ValueLockForWrapped [4/4]

```C++
inline constexpr ScL::Feature::Detail::ValueLockForWrapped::ValueLockForWrapped (
    WrapperLock && other
) 
```




<hr>



### function lock 

```C++
inline constexpr void ScL::Feature::Detail::ValueLockForWrapped::lock () 
```




<hr>



### function lockFor 

```C++
template<typename Type_>
inline constexpr void ScL::Feature::Detail::ValueLockForWrapped::lockFor () 
```




<hr>



### function pointerAccess 

```C++
inline constexpr PointerAccess ScL::Feature::Detail::ValueLockForWrapped::pointerAccess () const
```




<hr>



### function unlock 

```C++
inline constexpr void ScL::Feature::Detail::ValueLockForWrapped::unlock () 
```




<hr>



### function valueAccess 

```C++
inline constexpr ValueAccess ScL::Feature::Detail::ValueLockForWrapped::valueAccess () const
```




<hr>



### function valueAccessFor 

```C++
template<typename Type_>
inline constexpr Type_ ScL::Feature::Detail::ValueLockForWrapped::valueAccessFor () const
```




<hr>



### function wrapperAccess 

```C++
inline constexpr WrapperAccess ScL::Feature::Detail::ValueLockForWrapped::wrapperAccess () const
```




<hr>



### function ~ValueLockForWrapped 

```C++
inline ScL::Feature::Detail::ValueLockForWrapped::~ValueLockForWrapped () 
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/access/value_lock.h`

