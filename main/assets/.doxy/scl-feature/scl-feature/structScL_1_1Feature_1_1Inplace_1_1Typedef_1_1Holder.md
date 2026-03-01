

# Struct ScL::Feature::Inplace::Typedef::Holder

**template &lt;typename \_Value&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Inplace**](namespaceScL_1_1Feature_1_1Inplace.md) **>** [**Typedef**](structScL_1_1Feature_1_1Inplace_1_1Typedef.md) **>** [**Holder**](structScL_1_1Feature_1_1Inplace_1_1Typedef_1_1Holder.md)






















## Public Types

| Type | Name |
| ---: | :--- |
| typedef Holder&lt; \_Value &gt; | [**ThisType**](#typedef-thistype)  <br> |
| typedef \_Value | [**Value**](#typedef-value)  <br> |




## Public Attributes

| Type | Name |
| ---: | :--- |
|  Value | [**m\_value**](#variable-m_value)  <br> |
















## Public Functions

| Type | Name |
| ---: | :--- |
|  constexpr | [**Holder**](#function-holder-117) (\_Arguments &&... arguments) <br> |
|  constexpr | [**Holder**](#function-holder-217) (ThisType && other) <br> |
|  constexpr | [**Holder**](#function-holder-317) (ThisType const && other) <br> |
|  constexpr | [**Holder**](#function-holder-417) (ThisType volatile && other) <br> |
|  constexpr | [**Holder**](#function-holder-517) (ThisType const volatile && other) <br> |
|  constexpr | [**Holder**](#function-holder-617) (ThisType & other) <br> |
|  constexpr | [**Holder**](#function-holder-717) (ThisType const & other) <br> |
|  constexpr | [**Holder**](#function-holder-817) (ThisType volatile & other) <br> |
|  constexpr | [**Holder**](#function-holder-917) (ThisType const volatile & other) <br> |
|  constexpr | [**Holder**](#function-holder-1017) (Holder&lt; \_OtherValue &gt; && other) <br> |
|  constexpr | [**Holder**](#function-holder-1117) (Holder&lt; \_OtherValue &gt; const && other) <br> |
|  constexpr | [**Holder**](#function-holder-1217) (Holder&lt; \_OtherValue &gt; volatile && other) <br> |
|  constexpr | [**Holder**](#function-holder-1317) (Holder&lt; \_OtherValue &gt; const volatile && other) <br> |
|  constexpr | [**Holder**](#function-holder-1417) (Holder&lt; \_OtherValue &gt; & other) <br> |
|  constexpr | [**Holder**](#function-holder-1517) (Holder&lt; \_OtherValue &gt; const & other) <br> |
|  constexpr | [**Holder**](#function-holder-1617) (Holder&lt; \_OtherValue &gt; volatile & other) <br> |
|  constexpr | [**Holder**](#function-holder-1717) (Holder&lt; \_OtherValue &gt; const volatile & other) <br> |


## Public Static Functions

| Type | Name |
| ---: | :--- |
|  constexpr decltype(auto) | [**value**](#function-value) (\_HolderRefer && holder) <br> |


























## Public Types Documentation




### typedef ThisType 

```C++
using ScL::Feature::Inplace::Typedef< _Tag >::Holder< _Value >::ThisType =  Holder<_Value>;
```




<hr>



### typedef Value 

```C++
using ScL::Feature::Inplace::Typedef< _Tag >::Holder< _Value >::Value =  _Value;
```




<hr>
## Public Attributes Documentation




### variable m\_value 

```C++
Value ScL::Feature::Inplace::Typedef< _Tag >::Holder< _Value >::m_value;
```




<hr>
## Public Functions Documentation




### function Holder [1/17]

```C++
template<typename... _Arguments>
inline constexpr ScL::Feature::Inplace::Typedef::Holder::Holder (
    _Arguments &&... arguments
) 
```




<hr>



### function Holder [2/17]

```C++
inline constexpr ScL::Feature::Inplace::Typedef::Holder::Holder (
    ThisType && other
) 
```




<hr>



### function Holder [3/17]

```C++
inline constexpr ScL::Feature::Inplace::Typedef::Holder::Holder (
    ThisType const && other
) 
```




<hr>



### function Holder [4/17]

```C++
inline constexpr ScL::Feature::Inplace::Typedef::Holder::Holder (
    ThisType volatile && other
) 
```




<hr>



### function Holder [5/17]

```C++
inline constexpr ScL::Feature::Inplace::Typedef::Holder::Holder (
    ThisType const volatile && other
) 
```




<hr>



### function Holder [6/17]

```C++
inline constexpr ScL::Feature::Inplace::Typedef::Holder::Holder (
    ThisType & other
) 
```




<hr>



### function Holder [7/17]

```C++
inline constexpr ScL::Feature::Inplace::Typedef::Holder::Holder (
    ThisType const & other
) 
```




<hr>



### function Holder [8/17]

```C++
inline constexpr ScL::Feature::Inplace::Typedef::Holder::Holder (
    ThisType volatile & other
) 
```




<hr>



### function Holder [9/17]

```C++
inline constexpr ScL::Feature::Inplace::Typedef::Holder::Holder (
    ThisType const volatile & other
) 
```




<hr>



### function Holder [10/17]

```C++
template<typename _OtherValue>
inline constexpr ScL::Feature::Inplace::Typedef::Holder::Holder (
    Holder< _OtherValue > && other
) 
```




<hr>



### function Holder [11/17]

```C++
template<typename _OtherValue>
inline constexpr ScL::Feature::Inplace::Typedef::Holder::Holder (
    Holder< _OtherValue > const && other
) 
```




<hr>



### function Holder [12/17]

```C++
template<typename _OtherValue>
inline constexpr ScL::Feature::Inplace::Typedef::Holder::Holder (
    Holder< _OtherValue > volatile && other
) 
```




<hr>



### function Holder [13/17]

```C++
template<typename _OtherValue>
inline constexpr ScL::Feature::Inplace::Typedef::Holder::Holder (
    Holder< _OtherValue > const volatile && other
) 
```




<hr>



### function Holder [14/17]

```C++
template<typename _OtherValue>
inline constexpr ScL::Feature::Inplace::Typedef::Holder::Holder (
    Holder< _OtherValue > & other
) 
```




<hr>



### function Holder [15/17]

```C++
template<typename _OtherValue>
inline constexpr ScL::Feature::Inplace::Typedef::Holder::Holder (
    Holder< _OtherValue > const & other
) 
```




<hr>



### function Holder [16/17]

```C++
template<typename _OtherValue>
inline constexpr ScL::Feature::Inplace::Typedef::Holder::Holder (
    Holder< _OtherValue > volatile & other
) 
```




<hr>



### function Holder [17/17]

```C++
template<typename _OtherValue>
inline constexpr ScL::Feature::Inplace::Typedef::Holder::Holder (
    Holder< _OtherValue > const volatile & other
) 
```




<hr>
## Public Static Functions Documentation




### function value 

```C++
template<typename _HolderRefer>
static inline constexpr decltype(auto) ScL::Feature::Inplace::Typedef::Holder::value (
    _HolderRefer && holder
) 
```



Access to internal value of Holder for any king of referencies. 


        

<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/tool/inplace/typedef.h`

