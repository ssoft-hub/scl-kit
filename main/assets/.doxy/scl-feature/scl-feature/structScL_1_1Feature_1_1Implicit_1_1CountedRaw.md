

# Struct ScL::Feature::Implicit::CountedRaw

**template &lt;typename \_Counter&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Implicit**](namespaceScL_1_1Feature_1_1Implicit.md) **>** [**CountedRaw**](structScL_1_1Feature_1_1Implicit_1_1CountedRaw.md)



[More...](#detailed-description)

* `#include <raw.h>`















## Classes

| Type | Name |
| ---: | :--- |
| struct | [**BaseCounted**](structScL_1_1Feature_1_1Implicit_1_1CountedRaw_1_1BaseCounted.md) <br> |
| struct | [**ConstructHelper**](structScL_1_1Feature_1_1Implicit_1_1CountedRaw_1_1ConstructHelper.md) &lt;typename \_Holder, abstract\_case&gt;<br> |
| struct | [**ConstructHelper&lt; \_Holder, false &gt;**](structScL_1_1Feature_1_1Implicit_1_1CountedRaw_1_1ConstructHelper_3_01__Holder_00_01false_01_4.md) &lt;typename \_Holder&gt;<br> |
| struct | [**ConstructHelper&lt; \_Holder, true &gt;**](structScL_1_1Feature_1_1Implicit_1_1CountedRaw_1_1ConstructHelper_3_01__Holder_00_01true_01_4.md) &lt;typename \_Holder&gt;<br> |
| struct | [**Counted**](structScL_1_1Feature_1_1Implicit_1_1CountedRaw_1_1Counted.md) &lt;typename \_Value&gt;<br> |
| struct | [**Holder**](structScL_1_1Feature_1_1Implicit_1_1CountedRaw_1_1Holder.md) &lt;typename \_Value&gt;<br> |
























## Public Static Functions

| Type | Name |
| ---: | :--- |
|  decltype(auto) | [**dynamicCast**](#function-dynamiccast) (\_RightWrapperRefer && right) noexcept<br> |
|  bool | [**isA**](#function-isa) (\_WrapperRefer && wrapper) noexcept<br> |
|  bool | [**isEmpty**](#function-isempty) (\_WrapperRefer && wrapper) noexcept<br> |
|  bool | [**isKindOf**](#function-iskindof) (\_WrapperRefer && wrapper) noexcept<br> |
|  decltype(auto) | [**staticCast**](#function-staticcast) (\_RightWrapperRefer && right) noexcept<br> |
|  typename::std::decay\_t&lt; \_WrapperRefer &gt;::TypeId | [**typeId**](#function-typeid) (\_WrapperRefer && wrapper) noexcept<br> |


























## Detailed Description


Инструмент для формирования значения в "куче" на основе raw указателя. Реализует технику ленивых вычислений, когда копирование экземпляра значения происходит только в момент доступа к неконстантному экземпляру. 


    
## Public Static Functions Documentation




### function dynamicCast 

```C++
template<typename _LeftWrapper, typename _RightWrapperRefer>
static inline decltype(auto) ScL::Feature::Implicit::CountedRaw::dynamicCast (
    _RightWrapperRefer && right
) noexcept
```




<hr>



### function isA 

```C++
template<typename _TestWrapper, typename _WrapperRefer>
static inline bool ScL::Feature::Implicit::CountedRaw::isA (
    _WrapperRefer && wrapper
) noexcept
```




<hr>



### function isEmpty 

```C++
template<typename _WrapperRefer>
static inline bool ScL::Feature::Implicit::CountedRaw::isEmpty (
    _WrapperRefer && wrapper
) noexcept
```




<hr>



### function isKindOf 

```C++
template<typename _TestWrapper, typename _WrapperRefer>
static inline bool ScL::Feature::Implicit::CountedRaw::isKindOf (
    _WrapperRefer && wrapper
) noexcept
```




<hr>



### function staticCast 

```C++
template<typename _LeftWrapper, typename _RightWrapperRefer>
static inline decltype(auto) ScL::Feature::Implicit::CountedRaw::staticCast (
    _RightWrapperRefer && right
) noexcept
```




<hr>



### function typeId 

```C++
template<typename _WrapperRefer>
static inline typename::std::decay_t< _WrapperRefer >::TypeId ScL::Feature::Implicit::CountedRaw::typeId (
    _WrapperRefer && wrapper
) noexcept
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/tool/implicit/raw.h`

