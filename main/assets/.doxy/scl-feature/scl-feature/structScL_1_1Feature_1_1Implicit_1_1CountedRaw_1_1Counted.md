

# Struct ScL::Feature::Implicit::CountedRaw::Counted

**template &lt;typename \_Value&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Implicit**](namespaceScL_1_1Feature_1_1Implicit.md) **>** [**CountedRaw**](structScL_1_1Feature_1_1Implicit_1_1CountedRaw.md) **>** [**Counted**](structScL_1_1Feature_1_1Implicit_1_1CountedRaw_1_1Counted.md)








Inherits the following classes: ScL::Feature::Implicit::CountedRaw< _Counter >::BaseCounted














## Public Types

| Type | Name |
| ---: | :--- |
| typedef BaseCounted | [**ParentType**](#typedef-parenttype)  <br> |
| typedef Counted&lt; \_Value &gt; | [**ThisType**](#typedef-thistype)  <br> |
| typedef typename ParentType::TypeId | [**TypeId**](#typedef-typeid)  <br> |
| typedef \_Value | [**Value**](#typedef-value)  <br> |




## Public Attributes

| Type | Name |
| ---: | :--- |
|  Value | [**m\_value**](#variable-m_value)  <br> |
















## Public Functions

| Type | Name |
| ---: | :--- |
|   | [**Counted**](#function-counted) (\_Arguments &&... arguments) <br> |
| virtual BaseCounted \* | [**clone**](#function-clone) () override const<br> |
| virtual TypeId | [**typeId**](#function-typeid) () noexcept override const<br> |




























## Public Types Documentation




### typedef ParentType 

```C++
using ScL::Feature::Implicit::CountedRaw< _Counter >::Counted< _Value >::ParentType =  BaseCounted;
```




<hr>



### typedef ThisType 

```C++
using ScL::Feature::Implicit::CountedRaw< _Counter >::Counted< _Value >::ThisType =  Counted<_Value>;
```




<hr>



### typedef TypeId 

```C++
using ScL::Feature::Implicit::CountedRaw< _Counter >::Counted< _Value >::TypeId =  typename ParentType::TypeId;
```




<hr>



### typedef Value 

```C++
using ScL::Feature::Implicit::CountedRaw< _Counter >::Counted< _Value >::Value =  _Value;
```




<hr>
## Public Attributes Documentation




### variable m\_value 

```C++
Value ScL::Feature::Implicit::CountedRaw< _Counter >::Counted< _Value >::m_value;
```




<hr>
## Public Functions Documentation




### function Counted 

```C++
template<typename... _Arguments>
inline ScL::Feature::Implicit::CountedRaw::Counted::Counted (
    _Arguments &&... arguments
) 
```




<hr>



### function clone 

```C++
inline virtual BaseCounted * ScL::Feature::Implicit::CountedRaw::Counted::clone () override const
```




<hr>



### function typeId 

```C++
inline virtual TypeId ScL::Feature::Implicit::CountedRaw::Counted::typeId () noexcept override const
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/tool/implicit/raw.h`

