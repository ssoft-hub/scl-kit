

# Struct ScL::Feature::Detail::Guard::RangeTool::Holder

**template &lt;typename \_Iterator&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Detail**](namespaceScL_1_1Feature_1_1Detail.md) **>** [**Guard**](namespaceScL_1_1Feature_1_1Detail_1_1Guard.md) **>** [**RangeTool**](structScL_1_1Feature_1_1Detail_1_1Guard_1_1RangeTool.md) **>** [**Holder**](structScL_1_1Feature_1_1Detail_1_1Guard_1_1RangeTool_1_1Holder.md)






















## Public Types

| Type | Name |
| ---: | :--- |
| typedef \_Iterator | [**Iterator**](#typedef-iterator)  <br> |
| typedef [**::ScL::Feature::ValueGuard**](namespaceScL_1_1Feature.md#typedef-valueguard)&lt; RangeRefer &gt; | [**RangeGuard**](#typedef-rangeguard)  <br> |
| typedef Holder | [**ThisType**](#typedef-thistype)  <br> |




## Public Attributes

| Type | Name |
| ---: | :--- |
|  Iterator | [**m\_iterator**](#variable-m_iterator)  <br> |
|  RangeGuard | [**m\_range\_guard**](#variable-m_range_guard)  <br> |
















## Public Functions

| Type | Name |
| ---: | :--- |
|   | [**Holder**](#function-holder-13) (RangeRefer wrapper, \_Invocable invocable) <br> |
|   | [**Holder**](#function-holder-23) (ThisType && other) <br> |
|   | [**Holder**](#function-holder-33) (const ThisType & other) = delete<br> |


## Public Static Functions

| Type | Name |
| ---: | :--- |
|  constexpr decltype(auto) | [**value**](#function-value) (\_HolderRefer && holder) <br> |


























## Public Types Documentation




### typedef Iterator 

```C++
using ScL::Feature::Detail::Guard::RangeTool< _RangeRefer >::Holder< _Iterator >::Iterator =  _Iterator;
```




<hr>



### typedef RangeGuard 

```C++
using ScL::Feature::Detail::Guard::RangeTool< _RangeRefer >::Holder< _Iterator >::RangeGuard =  ::ScL::Feature::ValueGuard< RangeRefer >;
```




<hr>



### typedef ThisType 

```C++
using ScL::Feature::Detail::Guard::RangeTool< _RangeRefer >::Holder< _Iterator >::ThisType =  Holder;
```




<hr>
## Public Attributes Documentation




### variable m\_iterator 

```C++
Iterator ScL::Feature::Detail::Guard::RangeTool< _RangeRefer >::Holder< _Iterator >::m_iterator;
```




<hr>



### variable m\_range\_guard 

```C++
RangeGuard ScL::Feature::Detail::Guard::RangeTool< _RangeRefer >::Holder< _Iterator >::m_range_guard;
```




<hr>
## Public Functions Documentation




### function Holder [1/3]

```C++
template<typename _Invocable>
inline ScL::Feature::Detail::Guard::RangeTool::Holder::Holder (
    RangeRefer wrapper,
    _Invocable invocable
) 
```




<hr>



### function Holder [2/3]

```C++
inline ScL::Feature::Detail::Guard::RangeTool::Holder::Holder (
    ThisType && other
) 
```




<hr>



### function Holder [3/3]

```C++
ScL::Feature::Detail::Guard::RangeTool::Holder::Holder (
    const ThisType & other
) = delete
```




<hr>
## Public Static Functions Documentation




### function value 

```C++
template<typename _HolderRefer>
static inline constexpr decltype(auto) ScL::Feature::Detail::Guard::RangeTool::Holder::value (
    _HolderRefer && holder
) 
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/detail/range_tool.h`

