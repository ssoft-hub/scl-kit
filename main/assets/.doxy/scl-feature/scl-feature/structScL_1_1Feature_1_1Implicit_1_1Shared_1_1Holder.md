

# Struct ScL::Feature::Implicit::Shared::Holder

**template &lt;typename \_Value&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Implicit**](namespaceScL_1_1Feature_1_1Implicit.md) **>** [**Shared**](structScL_1_1Feature_1_1Implicit_1_1Shared.md) **>** [**Holder**](structScL_1_1Feature_1_1Implicit_1_1Shared_1_1Holder.md)






















## Public Types

| Type | Name |
| ---: | :--- |
| typedef ::std::shared\_ptr&lt; Value &gt; | [**Pointer**](#typedef-pointer)  <br> |
| typedef Holder&lt; \_Value &gt; | [**ThisType**](#typedef-thistype)  <br> |
| typedef \_Value | [**Value**](#typedef-value)  <br> |
| typedef ::ScL::Feature::HolderGuard&lt; ThisType & &gt; | [**WritableGuard**](#typedef-writableguard)  <br> |




## Public Attributes

| Type | Name |
| ---: | :--- |
|  Pointer | [**m\_pointer**](#variable-m_pointer)  <br> |
















## Public Functions

| Type | Name |
| ---: | :--- |
|   | [**Holder**](#function-holder-19) (\_Arguments &&... arguments) <br> |
|   | [**Holder**](#function-holder-29) (ThisType && other) <br> |
|   | [**Holder**](#function-holder-39) (ThisType const && other) <br> |
|   | [**Holder**](#function-holder-49) (ThisType & other) <br> |
|   | [**Holder**](#function-holder-59) (ThisType const & other) <br> |
|   | [**Holder**](#function-holder-69) (Holder&lt; \_OtherValue &gt; && other) <br> |
|   | [**Holder**](#function-holder-79) (Holder&lt; \_OtherValue &gt; const && other) <br> |
|   | [**Holder**](#function-holder-89) (Holder&lt; \_OtherValue &gt; & other) <br> |
|   | [**Holder**](#function-holder-99) (Holder&lt; \_OtherValue &gt; const & other) <br> |
|   | [**~Holder**](#function-holder) () <br> |


## Public Static Functions

| Type | Name |
| ---: | :--- |
|  constexpr void | [**guard**](#function-guard) (\_HolderRefer && holder) <br> |
|  decltype(auto) | [**operatorAssignment**](#function-operatorassignment) (\_LeftWrapperRefer && left, \_RightWrapperRefer && right) <br> |
|  constexpr decltype(auto) | [**value**](#function-value) (\_HolderRefer && holder) <br> |


























## Public Types Documentation




### typedef Pointer 

```C++
using ScL::Feature::Implicit::Shared::Holder< _Value >::Pointer =  ::std::shared_ptr<Value>;
```




<hr>



### typedef ThisType 

```C++
using ScL::Feature::Implicit::Shared::Holder< _Value >::ThisType =  Holder<_Value>;
```




<hr>



### typedef Value 

```C++
using ScL::Feature::Implicit::Shared::Holder< _Value >::Value =  _Value;
```




<hr>



### typedef WritableGuard 

```C++
using ScL::Feature::Implicit::Shared::Holder< _Value >::WritableGuard =  ::ScL::Feature::HolderGuard<ThisType &>;
```




<hr>
## Public Attributes Documentation




### variable m\_pointer 

```C++
Pointer ScL::Feature::Implicit::Shared::Holder< _Value >::m_pointer;
```




<hr>
## Public Functions Documentation




### function Holder [1/9]

```C++
template<typename... _Arguments>
inline ScL::Feature::Implicit::Shared::Holder::Holder (
    _Arguments &&... arguments
) 
```




<hr>



### function Holder [2/9]

```C++
inline ScL::Feature::Implicit::Shared::Holder::Holder (
    ThisType && other
) 
```




<hr>



### function Holder [3/9]

```C++
inline ScL::Feature::Implicit::Shared::Holder::Holder (
    ThisType const && other
) 
```




<hr>



### function Holder [4/9]

```C++
inline ScL::Feature::Implicit::Shared::Holder::Holder (
    ThisType & other
) 
```




<hr>



### function Holder [5/9]

```C++
inline ScL::Feature::Implicit::Shared::Holder::Holder (
    ThisType const & other
) 
```




<hr>



### function Holder [6/9]

```C++
template<typename _OtherValue>
inline ScL::Feature::Implicit::Shared::Holder::Holder (
    Holder< _OtherValue > && other
) 
```




<hr>



### function Holder [7/9]

```C++
template<typename _OtherValue>
inline ScL::Feature::Implicit::Shared::Holder::Holder (
    Holder< _OtherValue > const && other
) 
```




<hr>



### function Holder [8/9]

```C++
template<typename _OtherValue>
inline ScL::Feature::Implicit::Shared::Holder::Holder (
    Holder< _OtherValue > & other
) 
```




<hr>



### function Holder [9/9]

```C++
template<typename _OtherValue>
inline ScL::Feature::Implicit::Shared::Holder::Holder (
    Holder< _OtherValue > const & other
) 
```




<hr>



### function ~Holder 

```C++
inline ScL::Feature::Implicit::Shared::Holder::~Holder () 
```




<hr>
## Public Static Functions Documentation




### function guard 

```C++
template<typename _HolderRefer, typename>
static inline constexpr void ScL::Feature::Implicit::Shared::Holder::guard (
    _HolderRefer && holder
) 
```



Guard internal value of Holder for any not constant referencies. 


        

<hr>



### function operatorAssignment 

```C++
template<typename _LeftWrapperRefer, typename _RightWrapperRefer, typename>
static inline decltype(auto) ScL::Feature::Implicit::Shared::Holder::operatorAssignment (
    _LeftWrapperRefer && left,
    _RightWrapperRefer && right
) 
```



Assignment operation between compatible Holders. Specialization of operation enabled if left is not constant reference and any kind of right. 


        

<hr>



### function value 

```C++
template<typename _HolderRefer, typename>
static inline constexpr decltype(auto) ScL::Feature::Implicit::Shared::Holder::value (
    _HolderRefer && holder
) 
```



Access to internal value of Holder for any king of referencies (except volatile). 


        

<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/tool/implicit/shared.h`

