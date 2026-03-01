

# Struct ScL::Feature::Inplace::Uninitialized::Holder

**template &lt;typename \_Value&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Inplace**](namespaceScL_1_1Feature_1_1Inplace.md) **>** [**Uninitialized**](structScL_1_1Feature_1_1Inplace_1_1Uninitialized.md) **>** [**Holder**](structScL_1_1Feature_1_1Inplace_1_1Uninitialized_1_1Holder.md)






















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
|  constexpr | [**Holder**](#function-holder) () <br> |


## Public Static Functions

| Type | Name |
| ---: | :--- |
|  constexpr decltype(auto) | [**value**](#function-value) (\_HolderRefer && holder) <br> |


























## Public Types Documentation




### typedef ThisType 

```C++
using ScL::Feature::Inplace::Uninitialized::Holder< _Value >::ThisType =  Holder<_Value>;
```




<hr>



### typedef Value 

```C++
using ScL::Feature::Inplace::Uninitialized::Holder< _Value >::Value =  _Value;
```




<hr>
## Public Attributes Documentation




### variable m\_value 

```C++
Value ScL::Feature::Inplace::Uninitialized::Holder< _Value >::m_value;
```




<hr>
## Public Functions Documentation




### function Holder 

```C++
inline constexpr ScL::Feature::Inplace::Uninitialized::Holder::Holder () 
```




<hr>
## Public Static Functions Documentation




### function value 

```C++
template<typename _HolderRefer>
static inline constexpr decltype(auto) ScL::Feature::Inplace::Uninitialized::Holder::value (
    _HolderRefer && holder
) 
```



Access to internal value of Holder for any king of referencies. 


        

<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/tool/inplace/uninitialized.h`

