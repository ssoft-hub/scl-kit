

# Struct ScL::Feature::Reference::Raw::Holder

**template &lt;typename \_Value&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Reference**](namespaceScL_1_1Feature_1_1Reference.md) **>** [**Raw**](structScL_1_1Feature_1_1Reference_1_1Raw.md) **>** [**Holder**](structScL_1_1Feature_1_1Reference_1_1Raw_1_1Holder.md)






















## Public Types

| Type | Name |
| ---: | :--- |
| typedef Holder&lt; \_Value &gt; | [**ThisType**](#typedef-thistype)  <br> |
| typedef \_Value | [**Value**](#typedef-value)  <br> |
| typedef Value \* | [**ValuePtr**](#typedef-valueptr)  <br> |




## Public Attributes

| Type | Name |
| ---: | :--- |
|  ValuePtr | [**m\_value\_ptr**](#variable-m_value_ptr)  <br> |
















## Public Functions

| Type | Name |
| ---: | :--- |
|   | [**Holder**](#function-holder-118) (Value && other) = delete<br> |
|  constexpr | [**Holder**](#function-holder-218) (Value & other) noexcept<br> |
|  constexpr | [**Holder**](#function-holder-318) (ThisType && other) noexcept<br> |
|  constexpr | [**Holder**](#function-holder-418) (ThisType const && other) noexcept<br> |
|  constexpr | [**Holder**](#function-holder-518) (ThisType volatile && other) noexcept<br> |
|  constexpr | [**Holder**](#function-holder-618) (ThisType const volatile && other) noexcept<br> |
|  constexpr | [**Holder**](#function-holder-718) (ThisType & other) noexcept<br> |
|  constexpr | [**Holder**](#function-holder-818) (ThisType const & other) noexcept<br> |
|  constexpr | [**Holder**](#function-holder-918) (ThisType volatile & other) noexcept<br> |
|  constexpr | [**Holder**](#function-holder-1018) (ThisType const volatile & other) noexcept<br> |
|  constexpr | [**Holder**](#function-holder-1118) (Holder&lt; \_OtherValue &gt; && other) noexcept<br> |
|  constexpr | [**Holder**](#function-holder-1218) (Holder&lt; \_OtherValue &gt; const && other) noexcept<br> |
|  constexpr | [**Holder**](#function-holder-1318) (Holder&lt; \_OtherValue &gt; volatile && other) noexcept<br> |
|  constexpr | [**Holder**](#function-holder-1418) (Holder&lt; \_OtherValue &gt; const volatile && other) noexcept<br> |
|  constexpr | [**Holder**](#function-holder-1518) (Holder&lt; \_OtherValue &gt; & other) noexcept<br> |
|  constexpr | [**Holder**](#function-holder-1618) (Holder&lt; \_OtherValue &gt; const & other) noexcept<br> |
|  constexpr | [**Holder**](#function-holder-1718) (Holder&lt; \_OtherValue &gt; volatile & other) noexcept<br> |
|  constexpr | [**Holder**](#function-holder-1818) (Holder&lt; \_OtherValue &gt; const volatile & other) noexcept<br> |


## Public Static Functions

| Type | Name |
| ---: | :--- |
|  constexpr decltype(auto) | [**value**](#function-value) (\_HolderRefer && holder) noexcept<br> |


























## Public Types Documentation




### typedef ThisType 

```C++
using ScL::Feature::Reference::Raw::Holder< _Value >::ThisType =  Holder<_Value>;
```




<hr>



### typedef Value 

```C++
using ScL::Feature::Reference::Raw::Holder< _Value >::Value =  _Value;
```




<hr>



### typedef ValuePtr 

```C++
using ScL::Feature::Reference::Raw::Holder< _Value >::ValuePtr =  Value *;
```




<hr>
## Public Attributes Documentation




### variable m\_value\_ptr 

```C++
ValuePtr ScL::Feature::Reference::Raw::Holder< _Value >::m_value_ptr;
```




<hr>
## Public Functions Documentation




### function Holder [1/18]

```C++
ScL::Feature::Reference::Raw::Holder::Holder (
    Value && other
) = delete
```




<hr>



### function Holder [2/18]

```C++
inline constexpr ScL::Feature::Reference::Raw::Holder::Holder (
    Value & other
) noexcept
```




<hr>



### function Holder [3/18]

```C++
inline constexpr ScL::Feature::Reference::Raw::Holder::Holder (
    ThisType && other
) noexcept
```




<hr>



### function Holder [4/18]

```C++
inline constexpr ScL::Feature::Reference::Raw::Holder::Holder (
    ThisType const && other
) noexcept
```




<hr>



### function Holder [5/18]

```C++
inline constexpr ScL::Feature::Reference::Raw::Holder::Holder (
    ThisType volatile && other
) noexcept
```




<hr>



### function Holder [6/18]

```C++
inline constexpr ScL::Feature::Reference::Raw::Holder::Holder (
    ThisType const volatile && other
) noexcept
```




<hr>



### function Holder [7/18]

```C++
inline constexpr ScL::Feature::Reference::Raw::Holder::Holder (
    ThisType & other
) noexcept
```




<hr>



### function Holder [8/18]

```C++
inline constexpr ScL::Feature::Reference::Raw::Holder::Holder (
    ThisType const & other
) noexcept
```




<hr>



### function Holder [9/18]

```C++
inline constexpr ScL::Feature::Reference::Raw::Holder::Holder (
    ThisType volatile & other
) noexcept
```




<hr>



### function Holder [10/18]

```C++
inline constexpr ScL::Feature::Reference::Raw::Holder::Holder (
    ThisType const volatile & other
) noexcept
```




<hr>



### function Holder [11/18]

```C++
template<typename _OtherValue>
inline constexpr ScL::Feature::Reference::Raw::Holder::Holder (
    Holder< _OtherValue > && other
) noexcept
```




<hr>



### function Holder [12/18]

```C++
template<typename _OtherValue>
inline constexpr ScL::Feature::Reference::Raw::Holder::Holder (
    Holder< _OtherValue > const && other
) noexcept
```




<hr>



### function Holder [13/18]

```C++
template<typename _OtherValue>
inline constexpr ScL::Feature::Reference::Raw::Holder::Holder (
    Holder< _OtherValue > volatile && other
) noexcept
```




<hr>



### function Holder [14/18]

```C++
template<typename _OtherValue>
inline constexpr ScL::Feature::Reference::Raw::Holder::Holder (
    Holder< _OtherValue > const volatile && other
) noexcept
```




<hr>



### function Holder [15/18]

```C++
template<typename _OtherValue>
inline constexpr ScL::Feature::Reference::Raw::Holder::Holder (
    Holder< _OtherValue > & other
) noexcept
```




<hr>



### function Holder [16/18]

```C++
template<typename _OtherValue>
inline constexpr ScL::Feature::Reference::Raw::Holder::Holder (
    Holder< _OtherValue > const & other
) noexcept
```




<hr>



### function Holder [17/18]

```C++
template<typename _OtherValue>
inline constexpr ScL::Feature::Reference::Raw::Holder::Holder (
    Holder< _OtherValue > volatile & other
) noexcept
```




<hr>



### function Holder [18/18]

```C++
template<typename _OtherValue>
inline constexpr ScL::Feature::Reference::Raw::Holder::Holder (
    Holder< _OtherValue > const volatile & other
) noexcept
```




<hr>
## Public Static Functions Documentation




### function value 

```C++
template<typename _HolderRefer>
static inline constexpr decltype(auto) ScL::Feature::Reference::Raw::Holder::value (
    _HolderRefer && holder
) noexcept
```



Access to internal value of Holder for any king of referencies. 


        

<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/tool/reference/raw.h`

