

# Struct ScL::Feature::Tool::PropertyReflection::Holder

**template &lt;typename Value\_&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Tool**](namespaceScL_1_1Feature_1_1Tool.md) **>** [**PropertyReflection**](structScL_1_1Feature_1_1Tool_1_1PropertyReflection.md) **>** [**Holder**](structScL_1_1Feature_1_1Tool_1_1PropertyReflection_1_1Holder.md)






















## Public Types

| Type | Name |
| ---: | :--- |
| typedef Type WrappedType::\* | [**Property**](#typedef-property)  <br> |
| typedef Holder&lt; Value\_ &gt; | [**ThisType**](#typedef-thistype)  <br> |
| typedef ::std::remove\_reference\_t&lt; Value &gt; | [**Type**](#typedef-type)  <br> |
| typedef Value\_ | [**Value**](#typedef-value)  <br> |
| typedef ::std::remove\_reference\_t&lt; WrappedValue &gt; | [**WrappedType**](#typedef-wrappedtype)  <br> |
| typedef typename WrapperHolder::Value | [**WrappedValue**](#typedef-wrappedvalue)  <br> |
| typedef WrapperHolder\_ | [**WrapperHolder**](#typedef-wrapperholder)  <br> |
| typedef WrapperHolder \* | [**WrapperHolderPointer**](#typedef-wrapperholderpointer)  <br> |




## Public Attributes

| Type | Name |
| ---: | :--- |
|  WrapperHolderPointer | [**m\_holder**](#variable-m_holder)  <br> |
|  Property | [**m\_property**](#variable-m_property)  <br> |
















## Public Functions

| Type | Name |
| ---: | :--- |
|  constexpr | [**Holder**](#function-holder) (WrapperHolderPointer holder, Property property) <br> |


## Public Static Functions

| Type | Name |
| ---: | :--- |
|  constexpr decltype(auto) | [**baseValue**](#function-basevalue) (\_HolderRefer && holder) <br> |
|  constexpr void | [**guard**](#function-guard) (\_HolderRefer && holder) <br> |
|  constexpr void | [**unguard**](#function-unguard) (\_HolderRefer && holder) <br> |
|  constexpr decltype(auto) | [**value**](#function-value) (\_HolderRefer && holder) <br> |


























## Public Types Documentation




### typedef Property 

```C++
using ScL::Feature::Tool::PropertyReflection< WrapperHolder_ >::Holder< Value_ >::Property =  Type WrappedType::*;
```




<hr>



### typedef ThisType 

```C++
using ScL::Feature::Tool::PropertyReflection< WrapperHolder_ >::Holder< Value_ >::ThisType =  Holder<Value_>;
```




<hr>



### typedef Type 

```C++
using ScL::Feature::Tool::PropertyReflection< WrapperHolder_ >::Holder< Value_ >::Type =  ::std::remove_reference_t<Value>;
```




<hr>



### typedef Value 

```C++
using ScL::Feature::Tool::PropertyReflection< WrapperHolder_ >::Holder< Value_ >::Value =  Value_;
```




<hr>



### typedef WrappedType 

```C++
using ScL::Feature::Tool::PropertyReflection< WrapperHolder_ >::Holder< Value_ >::WrappedType =  ::std::remove_reference_t<WrappedValue>;
```




<hr>



### typedef WrappedValue 

```C++
using ScL::Feature::Tool::PropertyReflection< WrapperHolder_ >::Holder< Value_ >::WrappedValue =  typename WrapperHolder::Value;
```




<hr>



### typedef WrapperHolder 

```C++
using ScL::Feature::Tool::PropertyReflection< WrapperHolder_ >::Holder< Value_ >::WrapperHolder =  WrapperHolder_;
```




<hr>



### typedef WrapperHolderPointer 

```C++
using ScL::Feature::Tool::PropertyReflection< WrapperHolder_ >::Holder< Value_ >::WrapperHolderPointer =  WrapperHolder *;
```




<hr>
## Public Attributes Documentation




### variable m\_holder 

```C++
WrapperHolderPointer ScL::Feature::Tool::PropertyReflection< WrapperHolder_ >::Holder< Value_ >::m_holder;
```




<hr>



### variable m\_property 

```C++
Property ScL::Feature::Tool::PropertyReflection< WrapperHolder_ >::Holder< Value_ >::m_property;
```




<hr>
## Public Functions Documentation




### function Holder 

```C++
inline constexpr ScL::Feature::Tool::PropertyReflection::Holder::Holder (
    WrapperHolderPointer holder,
    Property property
) 
```




<hr>
## Public Static Functions Documentation




### function baseValue 

```C++
template<typename _HolderRefer>
static inline constexpr decltype(auto) ScL::Feature::Tool::PropertyReflection::Holder::baseValue (
    _HolderRefer && holder
) 
```




<hr>



### function guard 

```C++
template<typename _HolderRefer>
static inline constexpr void ScL::Feature::Tool::PropertyReflection::Holder::guard (
    _HolderRefer && holder
) 
```




<hr>



### function unguard 

```C++
template<typename _HolderRefer>
static inline constexpr void ScL::Feature::Tool::PropertyReflection::Holder::unguard (
    _HolderRefer && holder
) 
```




<hr>



### function value 

```C++
template<typename _HolderRefer>
static inline constexpr decltype(auto) ScL::Feature::Tool::PropertyReflection::Holder::value (
    _HolderRefer && holder
) 
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/detail/property_reflection.h`

