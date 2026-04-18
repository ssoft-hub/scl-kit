

# Class scl::feature::inplace::uninitialized

**template &lt;[**typename**](group__scl__feature__type__traits.md#variable-is_executor_v) [**Value**](group__scl__feature__type__traits.md#variable-is_executor_v)&gt;**



[**ClassList**](annotated.md) **>** [**feature**](namespacescl_1_1feature.md) **>** [**inplace**](namespacescl_1_1feature_1_1inplace.md) **>** [**uninitialized**](classscl_1_1feature_1_1inplace_1_1uninitialized.md)



_Executor that holds_ `Value` _in uninitialized aligned storage._[More...](#detailed-description)

* `#include <uninitialized.h>`

















## Public Types

| Type | Name |
| ---: | :--- |
| typedef [**Value**](group__scl__feature__type__traits.md#variable-is_executor_v) | [**value\_type**](#typedef-value_type)  <br> |




















## Public Functions

| Type | Name |
| ---: | :--- |
|  [**constexpr**](group__scl__feature__type__traits.md#variable-is_executor_v) | [**uninitialized**](#function-uninitialized) () noexcept<br> |


## Public Static Functions

| Type | Name |
| ---: | :--- |
|  [**constexpr**](group__scl__feature__type__traits.md#variable-is_executor_v) [**decltype**](group__scl__feature__type__traits.md#variable-is_executor_v)([**auto**](group__scl__feature__type__traits.md#variable-is_executor_v)) | [**execute**](#function-execute) ([**Self**](group__scl__feature__type__traits.md#variable-is_executor_v) && self, [**Func**](group__scl__feature__type__traits.md#variable-is_executor_v) && func, [**Args**](group__scl__feature__type__traits.md#variable-is_executor_v) &&... args) <br> |
|  [**constexpr**](group__scl__feature__type__traits.md#variable-is_executor_v) [**decltype**](group__scl__feature__type__traits.md#variable-is_executor_v)([**auto**](group__scl__feature__type__traits.md#variable-is_executor_v)) | [**value**](#function-value) ([**Self**](group__scl__feature__type__traits.md#variable-is_executor_v) && self) <br> |


























## Detailed Description


Provides correctly sized and aligned storage without constructing or destroying the object automatically, enabling deferred initialization.




**Template parameters:**


* `Value` The wrapped value type.


```C++
wrapper<int, feature::inplace::uninitialized> w{};
```
 


    
## Public Types Documentation




### typedef value\_type 

```C++
using scl::feature::inplace::uninitialized< Value >::value_type =  Value;
```




<hr>
## Public Functions Documentation




### function uninitialized 

```C++
constexpr feature::inplace::uninitialized::uninitialized () noexcept
```




<hr>
## Public Static Functions Documentation




### function execute 

```C++
template<typename  Self, typename  Func, typename... Args>
static inline constexpr  decltype ( auto ) feature::inplace::uninitialized::execute (
    Self && self,
    Func && func,
    Args &&... args
) 
```




<hr>



### function value 

```C++
template<typename  Self>
static inline constexpr  decltype ( auto ) feature::inplace::uninitialized::value (
    Self && self
) 
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/inplace/uninitialized.h`

