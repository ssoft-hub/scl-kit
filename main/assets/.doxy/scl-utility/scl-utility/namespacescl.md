

# Namespace scl



[**Namespace List**](namespaces.md) **>** [**scl**](namespacescl.md)



_Root namespace of ScL project._ 














## Namespaces

| Type | Name |
| ---: | :--- |
| namespace | [**preprocessor**](namespacescl_1_1preprocessor.md) <br> |




## Public Types

| Type | Name |
| ---: | :--- |
| typedef decltype(::std::declval&lt; Type &gt;()(::std::declval&lt; Arguments &gt;()...)) | [**call\_operation**](#typedef-call_operation)  <br> |
| typedef [**::scl::detected\_t**](group__scl__utility__type__traits.md#typedef-detected_t)&lt; call\_operation, Arguments... &gt; | [**call\_t**](#typedef-call_t)  <br> |
| typedef decltype(::std::declval&lt; Type &gt;()[::std::declval&lt; Argument &gt;()]) | [**subscript\_operation**](#typedef-subscript_operation)  <br> |
| typedef [**::scl::detected\_t**](group__scl__utility__type__traits.md#typedef-detected_t)&lt; subscript\_operation, Arguments... &gt; | [**subscript\_t**](#typedef-subscript_t)  <br> |




## Public Attributes

| Type | Name |
| ---: | :--- |
|  constexpr auto | [**has\_call\_v**](#variable-has_call_v)   = `[**::scl::is\_detected\_v**](group__scl__utility__type__traits.md#variable-is_detected_v)&lt;call\_operation, Arguments...&gt;`<br> |
|  constexpr auto | [**has\_subscript\_v**](#variable-has_subscript_v)   = `[**::scl::is\_detected\_v**](group__scl__utility__type__traits.md#variable-is_detected_v)&lt;subscript\_operation, Arguments...&gt;`<br> |












































## Public Types Documentation




### typedef call\_operation 

```C++
using scl::call_operation = typedef decltype(::std::declval<Type>()(::std::declval<Arguments>()...));
```




<hr>



### typedef call\_t 

```C++
using scl::call_t = typedef ::scl::detected_t<call_operation, Arguments...>;
```




<hr>



### typedef subscript\_operation 

```C++
using scl::subscript_operation = typedef decltype(::std::declval<Type>()[::std::declval<Argument>()]);
```




<hr>



### typedef subscript\_t 

```C++
using scl::subscript_t = typedef ::scl::detected_t<subscript_operation, Arguments...>;
```




<hr>
## Public Attributes Documentation




### variable has\_call\_v 

```C++
constexpr auto scl::has_call_v;
```




<hr>



### variable has\_subscript\_v 

```C++
constexpr auto scl::has_subscript_v;
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/utility/src/scl/utility.h`

