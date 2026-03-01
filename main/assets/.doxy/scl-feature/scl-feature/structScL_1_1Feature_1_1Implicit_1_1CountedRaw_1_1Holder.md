

# Struct ScL::Feature::Implicit::CountedRaw::Holder

**template &lt;typename \_Value&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Implicit**](namespaceScL_1_1Feature_1_1Implicit.md) **>** [**CountedRaw**](structScL_1_1Feature_1_1Implicit_1_1CountedRaw.md) **>** [**Holder**](structScL_1_1Feature_1_1Implicit_1_1CountedRaw_1_1Holder.md)




















## Classes

| Type | Name |
| ---: | :--- |
| struct | [**Empty**](structScL_1_1Feature_1_1Implicit_1_1CountedRaw_1_1Holder_1_1Empty.md) <br> |


## Public Types

| Type | Name |
| ---: | :--- |
| typedef Value \* | [**Access**](#typedef-access)  <br> |
| typedef BaseCounted \* | [**CountedPointer**](#typedef-countedpointer)  <br> |
| typedef Counted&lt; Value &gt; | [**CountedValue**](#typedef-countedvalue)  <br> |
| typedef Holder&lt; \_Value &gt; | [**ThisType**](#typedef-thistype)  <br> |
| typedef \_Value | [**Value**](#typedef-value)  <br> |
| typedef ::ScL::Feature::HolderGuard&lt; ThisType & &gt; | [**WritableGuard**](#typedef-writableguard)  <br> |




## Public Attributes

| Type | Name |
| ---: | :--- |
|  Access | [**m\_access**](#variable-m_access)  <br> |
|  CountedPointer | [**m\_pointer**](#variable-m_pointer)  <br> |
















## Public Functions

| Type | Name |
| ---: | :--- |
|   | [**Holder**](#function-holder-118) (Empty) <br> |
|   | [**Holder**](#function-holder-218) (\_Arguments &&... arguments) <br> |
|   | [**Holder**](#function-holder-318) (ThisType && other) <br> |
|   | [**Holder**](#function-holder-418) (ThisType const && other) <br> |
|   | [**Holder**](#function-holder-518) (ThisType volatile && other) <br> |
|   | [**Holder**](#function-holder-618) (ThisType const volatile && other) <br> |
|   | [**Holder**](#function-holder-718) (ThisType & other) <br> |
|   | [**Holder**](#function-holder-818) (ThisType const & other) <br> |
|   | [**Holder**](#function-holder-918) (ThisType volatile & other) <br> |
|   | [**Holder**](#function-holder-1018) (ThisType const volatile & other) <br> |
|   | [**Holder**](#function-holder-1118) (Holder&lt; \_OtherValue &gt; && other) <br> |
|   | [**Holder**](#function-holder-1218) (Holder&lt; \_OtherValue &gt; const && other) <br> |
|   | [**Holder**](#function-holder-1318) (Holder&lt; \_OtherValue &gt; volatile && other) <br> |
|   | [**Holder**](#function-holder-1418) (Holder&lt; \_OtherValue &gt; const volatile && other) <br> |
|   | [**Holder**](#function-holder-1518) (Holder&lt; \_OtherValue &gt; & other) <br> |
|   | [**Holder**](#function-holder-1618) (Holder&lt; \_OtherValue &gt; const & other) <br> |
|   | [**Holder**](#function-holder-1718) (Holder&lt; \_OtherValue &gt; volatile & other) <br> |
|   | [**Holder**](#function-holder-1818) (Holder&lt; \_OtherValue &gt; const volatile & other) <br> |
|  void | [**decrement**](#function-decrement) () <br> |
|  void | [**increment**](#function-increment) () <br> |
|   | [**~Holder**](#function-holder) () <br> |


## Public Static Functions

| Type | Name |
| ---: | :--- |
|  constexpr void | [**guard**](#function-guard) (\_HolderRefer && holder) <br> |
|  decltype(auto) | [**operatorAssignment**](#function-operatorassignment) (\_LeftWrapperRefer && left, \_RightWrapperRefer && right) <br> |
|  constexpr decltype(auto) | [**value**](#function-value) (\_HolderRefer && holder) <br> |


























## Public Types Documentation




### typedef Access 

```C++
using ScL::Feature::Implicit::CountedRaw< _Counter >::Holder< _Value >::Access =  Value *;
```




<hr>



### typedef CountedPointer 

```C++
using ScL::Feature::Implicit::CountedRaw< _Counter >::Holder< _Value >::CountedPointer =  BaseCounted *;
```




<hr>



### typedef CountedValue 

```C++
using ScL::Feature::Implicit::CountedRaw< _Counter >::Holder< _Value >::CountedValue =  Counted<Value>;
```




<hr>



### typedef ThisType 

```C++
using ScL::Feature::Implicit::CountedRaw< _Counter >::Holder< _Value >::ThisType =  Holder<_Value>;
```




<hr>



### typedef Value 

```C++
using ScL::Feature::Implicit::CountedRaw< _Counter >::Holder< _Value >::Value =  _Value;
```




<hr>



### typedef WritableGuard 

```C++
using ScL::Feature::Implicit::CountedRaw< _Counter >::Holder< _Value >::WritableGuard =  ::ScL::Feature::HolderGuard<ThisType &>;
```




<hr>
## Public Attributes Documentation




### variable m\_access 

```C++
Access ScL::Feature::Implicit::CountedRaw< _Counter >::Holder< _Value >::m_access;
```




<hr>



### variable m\_pointer 

```C++
CountedPointer ScL::Feature::Implicit::CountedRaw< _Counter >::Holder< _Value >::m_pointer;
```




<hr>
## Public Functions Documentation




### function Holder [1/18]

```C++
inline ScL::Feature::Implicit::CountedRaw::Holder::Holder (
    Empty
) 
```




<hr>



### function Holder [2/18]

```C++
template<typename... _Arguments>
inline ScL::Feature::Implicit::CountedRaw::Holder::Holder (
    _Arguments &&... arguments
) 
```




<hr>



### function Holder [3/18]

```C++
inline ScL::Feature::Implicit::CountedRaw::Holder::Holder (
    ThisType && other
) 
```




<hr>



### function Holder [4/18]

```C++
inline ScL::Feature::Implicit::CountedRaw::Holder::Holder (
    ThisType const && other
) 
```




<hr>



### function Holder [5/18]

```C++
inline ScL::Feature::Implicit::CountedRaw::Holder::Holder (
    ThisType volatile && other
) 
```




<hr>



### function Holder [6/18]

```C++
inline ScL::Feature::Implicit::CountedRaw::Holder::Holder (
    ThisType const volatile && other
) 
```




<hr>



### function Holder [7/18]

```C++
inline ScL::Feature::Implicit::CountedRaw::Holder::Holder (
    ThisType & other
) 
```




<hr>



### function Holder [8/18]

```C++
inline ScL::Feature::Implicit::CountedRaw::Holder::Holder (
    ThisType const & other
) 
```




<hr>



### function Holder [9/18]

```C++
inline ScL::Feature::Implicit::CountedRaw::Holder::Holder (
    ThisType volatile & other
) 
```




<hr>



### function Holder [10/18]

```C++
inline ScL::Feature::Implicit::CountedRaw::Holder::Holder (
    ThisType const volatile & other
) 
```




<hr>



### function Holder [11/18]

```C++
template<typename _OtherValue>
inline ScL::Feature::Implicit::CountedRaw::Holder::Holder (
    Holder< _OtherValue > && other
) 
```




<hr>



### function Holder [12/18]

```C++
template<typename _OtherValue>
inline ScL::Feature::Implicit::CountedRaw::Holder::Holder (
    Holder< _OtherValue > const && other
) 
```




<hr>



### function Holder [13/18]

```C++
template<typename _OtherValue>
inline ScL::Feature::Implicit::CountedRaw::Holder::Holder (
    Holder< _OtherValue > volatile && other
) 
```




<hr>



### function Holder [14/18]

```C++
template<typename _OtherValue>
inline ScL::Feature::Implicit::CountedRaw::Holder::Holder (
    Holder< _OtherValue > const volatile && other
) 
```




<hr>



### function Holder [15/18]

```C++
template<typename _OtherValue>
inline ScL::Feature::Implicit::CountedRaw::Holder::Holder (
    Holder< _OtherValue > & other
) 
```




<hr>



### function Holder [16/18]

```C++
template<typename _OtherValue>
inline ScL::Feature::Implicit::CountedRaw::Holder::Holder (
    Holder< _OtherValue > const & other
) 
```




<hr>



### function Holder [17/18]

```C++
template<typename _OtherValue>
inline ScL::Feature::Implicit::CountedRaw::Holder::Holder (
    Holder< _OtherValue > volatile & other
) 
```




<hr>



### function Holder [18/18]

```C++
template<typename _OtherValue>
inline ScL::Feature::Implicit::CountedRaw::Holder::Holder (
    Holder< _OtherValue > const volatile & other
) 
```




<hr>



### function decrement 

```C++
inline void ScL::Feature::Implicit::CountedRaw::Holder::decrement () 
```




<hr>



### function increment 

```C++
inline void ScL::Feature::Implicit::CountedRaw::Holder::increment () 
```




<hr>



### function ~Holder 

```C++
inline ScL::Feature::Implicit::CountedRaw::Holder::~Holder () 
```




<hr>
## Public Static Functions Documentation




### function guard 

```C++
template<typename _HolderRefer, typename>
static inline constexpr void ScL::Feature::Implicit::CountedRaw::Holder::guard (
    _HolderRefer && holder
) 
```



Guard internal value of Holder for any not constant referencies. 


        

<hr>



### function operatorAssignment 

```C++
template<typename _LeftWrapperRefer, typename _RightWrapperRefer, typename>
static inline decltype(auto) ScL::Feature::Implicit::CountedRaw::Holder::operatorAssignment (
    _LeftWrapperRefer && left,
    _RightWrapperRefer && right
) 
```



Assignment operation between compatible Holders. Specialization of operation enabled if left is not constant reference and any kind of right. 


        

<hr>



### function value 

```C++
template<typename _HolderRefer>
static inline constexpr decltype(auto) ScL::Feature::Implicit::CountedRaw::Holder::value (
    _HolderRefer && holder
) 
```



Access to internal value of Holder for any king of referencies. 


        

<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/tool/implicit/raw.h`

