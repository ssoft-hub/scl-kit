

# Struct ScL::Feature::Detail::Guard::RightTool::Holder

**template &lt;typename \_Type&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Detail**](namespaceScL_1_1Feature_1_1Detail.md) **>** [**Guard**](namespaceScL_1_1Feature_1_1Detail_1_1Guard.md) **>** [**RightTool**](structScL_1_1Feature_1_1Detail_1_1Guard_1_1RightTool.md) **>** [**Holder**](structScL_1_1Feature_1_1Detail_1_1Guard_1_1RightTool_1_1Holder.md)






















## Public Types

| Type | Name |
| ---: | :--- |
| typedef Holder | [**ThisType**](#typedef-thistype)  <br> |
| typedef \_Type | [**Value**](#typedef-value)  <br> |
| typedef ::ScL::SimilarRefer&lt; typename ::std::decay\_t&lt; WrapperRefer &gt;::Value, WrapperRefer &gt; | [**ValueRefer**](#typedef-valuerefer)  <br> |
| typedef [**::ScL::Feature::WrapperGuard**](namespaceScL_1_1Feature.md#typedef-wrapperguard)&lt; WrapperRefer &gt; | [**WrapperGuard**](#typedef-wrapperguard)  <br> |




## Public Attributes

| Type | Name |
| ---: | :--- |
|  WrapperGuard | [**m\_feature\_guard**](#variable-m_feature_guard)  <br> |
|  Value | [**m\_result**](#variable-m_result)  <br> |
















## Public Functions

| Type | Name |
| ---: | :--- |
|   | [**Holder**](#function-holder-13) (Invokable && invokable, LeftRefer left, WrapperRefer wrapper) <br> |
|   | [**Holder**](#function-holder-23) (ThisType && other) = delete<br> |
|   | [**Holder**](#function-holder-33) (ThisType const & other) = delete<br> |


## Public Static Functions

| Type | Name |
| ---: | :--- |
|  constexpr ::ScL::SimilarRefer&lt; Value, \_HolderRefer && &gt; | [**value**](#function-value) (\_HolderRefer && holder) <br> |


























## Public Types Documentation




### typedef ThisType 

```C++
using ScL::Feature::Detail::Guard::RightTool< _Invokable, _LeftRefer, _WrapperRefer >::Holder< _Type >::ThisType =  Holder;
```




<hr>



### typedef Value 

```C++
using ScL::Feature::Detail::Guard::RightTool< _Invokable, _LeftRefer, _WrapperRefer >::Holder< _Type >::Value =  _Type;
```




<hr>



### typedef ValueRefer 

```C++
using ScL::Feature::Detail::Guard::RightTool< _Invokable, _LeftRefer, _WrapperRefer >::Holder< _Type >::ValueRefer =  ::ScL::SimilarRefer<typename ::std::decay_t<WrapperRefer>::Value, WrapperRefer>;
```




<hr>



### typedef WrapperGuard 

```C++
using ScL::Feature::Detail::Guard::RightTool< _Invokable, _LeftRefer, _WrapperRefer >::Holder< _Type >::WrapperGuard =  ::ScL::Feature::WrapperGuard<WrapperRefer>;
```




<hr>
## Public Attributes Documentation




### variable m\_feature\_guard 

```C++
WrapperGuard ScL::Feature::Detail::Guard::RightTool< _Invokable, _LeftRefer, _WrapperRefer >::Holder< _Type >::m_feature_guard;
```




<hr>



### variable m\_result 

```C++
Value ScL::Feature::Detail::Guard::RightTool< _Invokable, _LeftRefer, _WrapperRefer >::Holder< _Type >::m_result;
```




<hr>
## Public Functions Documentation




### function Holder [1/3]

```C++
inline ScL::Feature::Detail::Guard::RightTool::Holder::Holder (
    Invokable && invokable,
    LeftRefer left,
    WrapperRefer wrapper
) 
```




<hr>



### function Holder [2/3]

```C++
ScL::Feature::Detail::Guard::RightTool::Holder::Holder (
    ThisType && other
) = delete
```




<hr>



### function Holder [3/3]

```C++
ScL::Feature::Detail::Guard::RightTool::Holder::Holder (
    ThisType const & other
) = delete
```




<hr>
## Public Static Functions Documentation




### function value 

```C++
template<typename _HolderRefer, typename>
static inline constexpr ::ScL::SimilarRefer< Value, _HolderRefer && > ScL::Feature::Detail::Guard::RightTool::Holder::value (
    _HolderRefer && holder
) 
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/detail/operator_tool.h`

