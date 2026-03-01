

# Struct ScL::Feature::Detail::Guard::BothTool::Holder

**template &lt;typename \_Type&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Detail**](namespaceScL_1_1Feature_1_1Detail.md) **>** [**Guard**](namespaceScL_1_1Feature_1_1Detail_1_1Guard.md) **>** [**BothTool**](structScL_1_1Feature_1_1Detail_1_1Guard_1_1BothTool.md) **>** [**Holder**](structScL_1_1Feature_1_1Detail_1_1Guard_1_1BothTool_1_1Holder.md)






















## Public Types

| Type | Name |
| ---: | :--- |
| typedef ::ScL::SimilarRefer&lt; typename ::std::decay\_t&lt; LeftWrapperRefer &gt;::Value, LeftWrapperRefer &gt; | [**LeftValueRefer**](#typedef-leftvaluerefer)  <br> |
| typedef [**::ScL::Feature::WrapperGuard**](namespaceScL_1_1Feature.md#typedef-wrapperguard)&lt; LeftWrapperRefer &gt; | [**LeftWrapperGuard**](#typedef-leftwrapperguard)  <br> |
| typedef ::ScL::SimilarRefer&lt; typename ::std::decay\_t&lt; RightWrapperRefer &gt;::Value, RightWrapperRefer &gt; | [**RightValueRefer**](#typedef-rightvaluerefer)  <br> |
| typedef [**::ScL::Feature::WrapperGuard**](namespaceScL_1_1Feature.md#typedef-wrapperguard)&lt; RightWrapperRefer &gt; | [**RightWrapperGuard**](#typedef-rightwrapperguard)  <br> |
| typedef Holder | [**ThisType**](#typedef-thistype)  <br> |
| typedef \_Type | [**Value**](#typedef-value)  <br> |




## Public Attributes

| Type | Name |
| ---: | :--- |
|  LeftWrapperGuard | [**m\_left\_feature\_guard**](#variable-m_left_feature_guard)  <br> |
|  Value | [**m\_result**](#variable-m_result)  <br> |
|  RightWrapperGuard | [**m\_right\_feature\_guard**](#variable-m_right_feature_guard)  <br> |
















## Public Functions

| Type | Name |
| ---: | :--- |
|   | [**Holder**](#function-holder-13) (Invokable && invokable, LeftWrapperRefer left, RightWrapperRefer right) <br> |
|   | [**Holder**](#function-holder-23) (ThisType && other) = delete<br> |
|   | [**Holder**](#function-holder-33) (ThisType const & other) = delete<br> |


## Public Static Functions

| Type | Name |
| ---: | :--- |
|  constexpr ::ScL::SimilarRefer&lt; Value, \_HolderRefer && &gt; | [**value**](#function-value) (\_HolderRefer && holder) <br> |


























## Public Types Documentation




### typedef LeftValueRefer 

```C++
using ScL::Feature::Detail::Guard::BothTool< _Invokable, _LeftWrapperRefer, _RightWrapperRefer >::Holder< _Type >::LeftValueRefer =  ::ScL::SimilarRefer< typename ::std::decay_t<LeftWrapperRefer>::Value, LeftWrapperRefer>;
```




<hr>



### typedef LeftWrapperGuard 

```C++
using ScL::Feature::Detail::Guard::BothTool< _Invokable, _LeftWrapperRefer, _RightWrapperRefer >::Holder< _Type >::LeftWrapperGuard =  ::ScL::Feature::WrapperGuard<LeftWrapperRefer>;
```




<hr>



### typedef RightValueRefer 

```C++
using ScL::Feature::Detail::Guard::BothTool< _Invokable, _LeftWrapperRefer, _RightWrapperRefer >::Holder< _Type >::RightValueRefer =  ::ScL::SimilarRefer< typename ::std::decay_t<RightWrapperRefer>::Value, RightWrapperRefer>;
```




<hr>



### typedef RightWrapperGuard 

```C++
using ScL::Feature::Detail::Guard::BothTool< _Invokable, _LeftWrapperRefer, _RightWrapperRefer >::Holder< _Type >::RightWrapperGuard =  ::ScL::Feature::WrapperGuard<RightWrapperRefer>;
```




<hr>



### typedef ThisType 

```C++
using ScL::Feature::Detail::Guard::BothTool< _Invokable, _LeftWrapperRefer, _RightWrapperRefer >::Holder< _Type >::ThisType =  Holder;
```




<hr>



### typedef Value 

```C++
using ScL::Feature::Detail::Guard::BothTool< _Invokable, _LeftWrapperRefer, _RightWrapperRefer >::Holder< _Type >::Value =  _Type;
```




<hr>
## Public Attributes Documentation




### variable m\_left\_feature\_guard 

```C++
LeftWrapperGuard ScL::Feature::Detail::Guard::BothTool< _Invokable, _LeftWrapperRefer, _RightWrapperRefer >::Holder< _Type >::m_left_feature_guard;
```




<hr>



### variable m\_result 

```C++
Value ScL::Feature::Detail::Guard::BothTool< _Invokable, _LeftWrapperRefer, _RightWrapperRefer >::Holder< _Type >::m_result;
```




<hr>



### variable m\_right\_feature\_guard 

```C++
RightWrapperGuard ScL::Feature::Detail::Guard::BothTool< _Invokable, _LeftWrapperRefer, _RightWrapperRefer >::Holder< _Type >::m_right_feature_guard;
```




<hr>
## Public Functions Documentation




### function Holder [1/3]

```C++
inline ScL::Feature::Detail::Guard::BothTool::Holder::Holder (
    Invokable && invokable,
    LeftWrapperRefer left,
    RightWrapperRefer right
) 
```




<hr>



### function Holder [2/3]

```C++
ScL::Feature::Detail::Guard::BothTool::Holder::Holder (
    ThisType && other
) = delete
```




<hr>



### function Holder [3/3]

```C++
ScL::Feature::Detail::Guard::BothTool::Holder::Holder (
    ThisType const & other
) = delete
```




<hr>
## Public Static Functions Documentation




### function value 

```C++
template<typename _HolderRefer, typename>
static inline constexpr ::ScL::SimilarRefer< Value, _HolderRefer && > ScL::Feature::Detail::Guard::BothTool::Holder::value (
    _HolderRefer && holder
) 
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/detail/operator_tool.h`

