

# Struct ScL::Feature::Guard::Featured::Holder

**template &lt;typename \_Value&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Guard**](namespaceScL_1_1Feature_1_1Guard.md) **>** [**Featured**](structScL_1_1Feature_1_1Guard_1_1Featured.md) **>** [**Holder**](structScL_1_1Feature_1_1Guard_1_1Featured_1_1Holder.md)






















## Public Types

| Type | Name |
| ---: | :--- |
| typedef Holder&lt; \_Value &gt; | [**ThisType**](#typedef-thistype)  <br> |
| typedef \_Value | [**Value**](#typedef-value)  <br> |
| typedef [**::ScL::Feature::ValueGuard**](namespaceScL_1_1Feature.md#typedef-valueguard)&lt; WrapperRefer &gt; | [**ValueGuard**](#typedef-valueguard)  <br> |




## Public Attributes

| Type | Name |
| ---: | :--- |
|  ValueGuard | [**m\_value\_guard**](#variable-m_value_guard)  <br> |
















## Public Functions

| Type | Name |
| ---: | :--- |
|   | [**Holder**](#function-holder) (WrapperRefer refer) <br> |


## Public Static Functions

| Type | Name |
| ---: | :--- |
|  constexpr decltype(auto) | [**value**](#function-value) (\_HolderRefer && holder) <br>_Access to internal value of Holder for any king of referencies._  |


























## Public Types Documentation




### typedef ThisType 

```C++
using ScL::Feature::Guard::Featured< _Wrapper >::Holder< _Value >::ThisType =  Holder<_Value>;
```




<hr>



### typedef Value 

```C++
using ScL::Feature::Guard::Featured< _Wrapper >::Holder< _Value >::Value =  _Value;
```




<hr>



### typedef ValueGuard 

```C++
using ScL::Feature::Guard::Featured< _Wrapper >::Holder< _Value >::ValueGuard =  ::ScL::Feature::ValueGuard<WrapperRefer>;
```




<hr>
## Public Attributes Documentation




### variable m\_value\_guard 

```C++
ValueGuard ScL::Feature::Guard::Featured< _Wrapper >::Holder< _Value >::m_value_guard;
```




<hr>
## Public Functions Documentation




### function Holder 

```C++
inline ScL::Feature::Guard::Featured::Holder::Holder (
    WrapperRefer refer
) 
```




<hr>
## Public Static Functions Documentation




### function value 

_Access to internal value of Holder for any king of referencies._ 
```C++
template<typename _HolderRefer, typename>
static inline constexpr decltype(auto) ScL::Feature::Guard::Featured::Holder::value (
    _HolderRefer && holder
) 
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/tool/guard/featured.h`

