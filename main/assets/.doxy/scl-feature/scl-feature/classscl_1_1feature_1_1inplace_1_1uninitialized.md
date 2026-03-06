

# Class scl::feature::inplace::uninitialized

**template &lt;[**typename**](group__scl__feature__type__traits.md#variable-is_wrapper_v) [**Value**](group__scl__feature__type__traits.md#variable-is_wrapper_v)&gt;**



[**ClassList**](annotated.md) **>** [**feature**](namespacescl_1_1feature.md) **>** [**inplace**](namespacescl_1_1feature_1_1inplace.md) **>** [**uninitialized**](classscl_1_1feature_1_1inplace_1_1uninitialized.md)



_Executor that holds_ `Value` _in uninitialized aligned storage._[More...](#detailed-description)

* `#include <uninitialized.h>`

















## Public Types

| Type | Name |
| ---: | :--- |
| typedef [**Value**](group__scl__feature__type__traits.md#variable-is_wrapper_v) | [**value\_type**](#typedef-value_type)  <br> |
















































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

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/inplace/uninitialized.h`

