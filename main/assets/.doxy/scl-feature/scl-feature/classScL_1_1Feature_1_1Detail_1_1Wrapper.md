

# Class ScL::Feature::Detail::Wrapper

**template &lt;typename \_Value, typename \_Tool&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Detail**](namespaceScL_1_1Feature_1_1Detail.md) **>** [**Wrapper**](classScL_1_1Feature_1_1Detail_1_1Wrapper.md)



[More...](#detailed-description)

* `#include <wrapper.h>`



Inherits the following classes: ScL::Feature::MixIn< Wrapper< _Value, _Tool >, _Tool::template Holder< _Value > >














## Public Types

| Type | Name |
| ---: | :--- |
| typedef Value | [**Data**](#typedef-data)  <br> |
| typedef typename Tool::template Holder&lt; \_Value &gt; | [**Holder**](#typedef-holder)  <br> |
| typedef \_Tool | [**Tool**](#typedef-tool)  <br> |
| typedef \_Value | [**Value**](#typedef-value)  <br> |




















## Public Functions

| Type | Name |
| ---: | :--- |
|  constexpr | [**Wrapper**](#function-wrapper-12) (\_Arguments &&... arguments) noexcept<br>_Конструктор инициализации значения по заданным параметрам_  |
|  constexpr | [**Wrapper**](#function-wrapper-22) (::std::initializer\_list&lt; \_Type &gt; list, \_Arguments &&... arguments) noexcept<br> |
|  SCL\_CONSTRUCTOR\_FOR\_THIS\_WRAPPER SCL\_CONSTRUCTOR\_FOR\_OTHER\_WRAPPER decltype(auto) | [**operator&lt;&lt;**](#function-operator) (Value &(\*)(Value &) right) <br> |




























## Detailed Description


Класс для формирования экземпляра значения \_Value, наделенными дополнительными свойствами. Дополнительные свойства реализуются посредством функциональности \_Tool. 


    
## Public Types Documentation




### typedef Data 

```C++
using ScL::Feature::Detail::Wrapper< _Value, _Tool >::Data =  Value;
```




<hr>



### typedef Holder 

```C++
using ScL::Feature::Detail::Wrapper< _Value, _Tool >::Holder =  typename Tool::template Holder<_Value>;
```




<hr>



### typedef Tool 

```C++
using ScL::Feature::Detail::Wrapper< _Value, _Tool >::Tool =  _Tool;
```




<hr>



### typedef Value 

```C++
using ScL::Feature::Detail::Wrapper< _Value, _Tool >::Value =  _Value;
```




<hr>
## Public Functions Documentation




### function Wrapper [1/2]

_Конструктор инициализации значения по заданным параметрам_ 
```C++
template<typename... _Arguments, typename>
inline constexpr ScL::Feature::Detail::Wrapper::Wrapper (
    _Arguments &&... arguments
) noexcept
```




<hr>



### function Wrapper [2/2]

```C++
template<typename _Type, typename... _Arguments, typename>
inline constexpr ScL::Feature::Detail::Wrapper::Wrapper (
    ::std::initializer_list< _Type > list,
    _Arguments &&... arguments
) noexcept
```




<hr>



### function operator&lt;&lt; 

```C++
template<typename... _Arguments, typename>
inline SCL_CONSTRUCTOR_FOR_THIS_WRAPPER SCL_CONSTRUCTOR_FOR_OTHER_WRAPPER decltype(auto) ScL::Feature::Detail::Wrapper::operator<< (
    Value &(*)(Value &) right
) 
```




<hr>## Friends Documentation





### friend WrapperAccess 

```C++
template<typename>
struct ScL::Feature::Detail::Wrapper::WrapperAccess (
    ::ScL::Feature::Detail::WrapperAccess
) 
```




<hr>



### friend ToolAdditionMixIn 

```C++
template<typename>
class ScL::Feature::Detail::Wrapper::ToolAdditionMixIn (
    ::ScL::Feature::ToolAdditionMixIn
) 
```




<hr>



### friend ToolReflectionMixIn 

```C++
template<typename, typename, typename>
class ScL::Feature::Detail::Wrapper::ToolReflectionMixIn (
    ::ScL::Feature::ToolReflectionMixIn
) 
```




<hr>



### friend ValueReflectionMixIn 

```C++
template<typename, typename, typename>
class ScL::Feature::Detail::Wrapper::ValueReflectionMixIn (
    ::ScL::Feature::ValueReflectionMixIn
) 
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/detail/wrapper.h`

