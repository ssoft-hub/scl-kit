

# Class scl::feature::inplace::plain

**template &lt;[**typename**](group__scl__feature__type__traits.md#variable-is_wrapper_v) [**Value**](group__scl__feature__type__traits.md#variable-is_wrapper_v)&gt;**



[**ClassList**](annotated.md) **>** [**feature**](namespacescl_1_1feature.md) **>** [**inplace**](namespacescl_1_1feature_1_1inplace.md) **>** [**plain**](classscl_1_1feature_1_1inplace_1_1plain.md)



_Executor that proxies calls directly to the held value with no overhead._ [More...](#detailed-description)

* `#include <plain.h>`

















## Public Types

| Type | Name |
| ---: | :--- |
| typedef [**Value**](group__scl__feature__type__traits.md#variable-is_wrapper_v) | [**value\_type**](#typedef-value_type)  <br> |




















## Public Functions

| Type | Name |
| ---: | :--- |
|  [**constexpr**](group__scl__feature__type__traits.md#variable-is_wrapper_v) | [**plain**](#function-plain) ([**Args**](group__scl__feature__type__traits.md#variable-is_wrapper_v) &&... args) <br> |




























## Detailed Description


Stores `Value` in-place without indirection or additional wrapping. Serves as the default executor when none is specified.




**Template parameters:**


* `Value` The wrapped value type.


```C++
wrapper<int, feature::inplace::plain> w{42};
```
 


    
## Public Types Documentation




### typedef value\_type 

```C++
using scl::feature::inplace::plain< Value >::value_type =  Value;
```




<hr>
## Public Functions Documentation




### function plain 

```C++
template<typename... Args>
inline explicit constexpr feature::inplace::plain::plain (
    Args &&... args
) 
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/inplace/plain.h`

