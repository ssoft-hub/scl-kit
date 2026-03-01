

# Struct ScL::Feature::Inplace::Optional::Holder

**template &lt;typename \_Value&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Inplace**](namespaceScL_1_1Feature_1_1Inplace.md) **>** [**Optional**](structScL_1_1Feature_1_1Inplace_1_1Optional.md) **>** [**Holder**](structScL_1_1Feature_1_1Inplace_1_1Optional_1_1Holder.md)




















## Classes

| Type | Name |
| ---: | :--- |
| struct | [**Empty**](structScL_1_1Feature_1_1Inplace_1_1Optional_1_1Holder_1_1Empty.md) <br> |


## Public Types

| Type | Name |
| ---: | :--- |
| typedef Holder&lt; \_Value &gt; | [**ThisType**](#typedef-thistype)  <br> |
| typedef \_Value | [**Value**](#typedef-value)  <br> |




## Public Attributes

| Type | Name |
| ---: | :--- |
|  union ScL::Feature::Inplace::Optional::Holder | [**Holder**](#variable-holder)  <br> |
|  Empty | [**m\_empty**](#variable-m_empty)  <br> |
|  bool | [**m\_is\_exists**](#variable-m_is_exists)   = `{}`<br> |
|  Value | [**m\_value**](#variable-m_value)  <br> |
















## Public Functions

| Type | Name |
| ---: | :--- |
|  constexpr | [**Holder**](#function-holder-118) () <br> |
|   | [**Holder**](#function-holder-218) (\_Arguments &&... arguments) <br> |
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
|  auto | [**construct**](#function-construct) (\_Arguments &&... \_arguments) noexcept<br> |
|  auto | [**reset**](#function-reset) () noexcept<br> |
|   | [**~Holder**](#function-holder) () <br> |


## Public Static Functions

| Type | Name |
| ---: | :--- |
|  constexpr decltype(auto) | [**value**](#function-value) (\_HolderRefer && holder) <br> |


























## Public Types Documentation




### typedef ThisType 

```C++
using ScL::Feature::Inplace::Optional::Holder< _Value >::ThisType =  Holder<_Value>;
```




<hr>



### typedef Value 

```C++
using ScL::Feature::Inplace::Optional::Holder< _Value >::Value =  _Value;
```




<hr>
## Public Attributes Documentation




### variable Holder 

```C++
union ScL::Feature::Inplace::Optional::Holder ScL::Feature::Inplace::Optional::Holder< _Value >;
```




<hr>



### variable m\_empty 

```C++
Empty ScL::Feature::Inplace::Optional::Holder< _Value >::m_empty;
```




<hr>



### variable m\_is\_exists 

```C++
bool ScL::Feature::Inplace::Optional::Holder< _Value >::m_is_exists;
```




<hr>



### variable m\_value 

```C++
Value ScL::Feature::Inplace::Optional::Holder< _Value >::m_value;
```




<hr>
## Public Functions Documentation




### function Holder [1/18]

```C++
inline constexpr ScL::Feature::Inplace::Optional::Holder::Holder () 
```




<hr>



### function Holder [2/18]

```C++
template<typename... _Arguments>
inline ScL::Feature::Inplace::Optional::Holder::Holder (
    _Arguments &&... arguments
) 
```




<hr>



### function Holder [3/18]

```C++
inline constexpr ScL::Feature::Inplace::Optional::Holder::Holder (
    ThisType && other
) noexcept
```




<hr>



### function Holder [4/18]

```C++
inline constexpr ScL::Feature::Inplace::Optional::Holder::Holder (
    ThisType const && other
) noexcept
```




<hr>



### function Holder [5/18]

```C++
inline constexpr ScL::Feature::Inplace::Optional::Holder::Holder (
    ThisType volatile && other
) noexcept
```




<hr>



### function Holder [6/18]

```C++
inline constexpr ScL::Feature::Inplace::Optional::Holder::Holder (
    ThisType const volatile && other
) noexcept
```




<hr>



### function Holder [7/18]

```C++
inline constexpr ScL::Feature::Inplace::Optional::Holder::Holder (
    ThisType & other
) noexcept
```




<hr>



### function Holder [8/18]

```C++
inline constexpr ScL::Feature::Inplace::Optional::Holder::Holder (
    ThisType const & other
) noexcept
```




<hr>



### function Holder [9/18]

```C++
inline constexpr ScL::Feature::Inplace::Optional::Holder::Holder (
    ThisType volatile & other
) noexcept
```




<hr>



### function Holder [10/18]

```C++
inline constexpr ScL::Feature::Inplace::Optional::Holder::Holder (
    ThisType const volatile & other
) noexcept
```




<hr>



### function Holder [11/18]

```C++
template<typename _OtherValue>
inline constexpr ScL::Feature::Inplace::Optional::Holder::Holder (
    Holder< _OtherValue > && other
) noexcept
```




<hr>



### function Holder [12/18]

```C++
template<typename _OtherValue>
inline constexpr ScL::Feature::Inplace::Optional::Holder::Holder (
    Holder< _OtherValue > const && other
) noexcept
```




<hr>



### function Holder [13/18]

```C++
template<typename _OtherValue>
inline constexpr ScL::Feature::Inplace::Optional::Holder::Holder (
    Holder< _OtherValue > volatile && other
) noexcept
```




<hr>



### function Holder [14/18]

```C++
template<typename _OtherValue>
inline constexpr ScL::Feature::Inplace::Optional::Holder::Holder (
    Holder< _OtherValue > const volatile && other
) noexcept
```




<hr>



### function Holder [15/18]

```C++
template<typename _OtherValue>
inline constexpr ScL::Feature::Inplace::Optional::Holder::Holder (
    Holder< _OtherValue > & other
) noexcept
```




<hr>



### function Holder [16/18]

```C++
template<typename _OtherValue>
inline constexpr ScL::Feature::Inplace::Optional::Holder::Holder (
    Holder< _OtherValue > const & other
) noexcept
```




<hr>



### function Holder [17/18]

```C++
template<typename _OtherValue>
inline constexpr ScL::Feature::Inplace::Optional::Holder::Holder (
    Holder< _OtherValue > volatile & other
) noexcept
```




<hr>



### function Holder [18/18]

```C++
template<typename _OtherValue>
inline constexpr ScL::Feature::Inplace::Optional::Holder::Holder (
    Holder< _OtherValue > const volatile & other
) noexcept
```




<hr>



### function construct 

```C++
template<typename... _Arguments>
inline auto ScL::Feature::Inplace::Optional::Holder::construct (
    _Arguments &&... _arguments
) noexcept
```




<hr>



### function reset 

```C++
inline auto ScL::Feature::Inplace::Optional::Holder::reset () noexcept
```




<hr>



### function ~Holder 

```C++
inline ScL::Feature::Inplace::Optional::Holder::~Holder () 
```




<hr>
## Public Static Functions Documentation




### function value 

```C++
template<typename _HolderRefer>
static inline constexpr decltype(auto) ScL::Feature::Inplace::Optional::Holder::value (
    _HolderRefer && holder
) 
```



Access to internal value of Holder for any king of referencies. 


        

<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/tool/inplace/optional.h`

