

# Struct scl::feature::is\_wrapper

**template &lt;[**typename**](group__scl__feature__type__traits.md#variable-is_wrapper_v) [**T**](group__scl__feature__type__traits.md#variable-is_wrapper_v)&gt;**



[**ClassList**](annotated.md) **>** [**feature**](namespacescl_1_1feature.md) **>** [**is\_wrapper**](structscl_1_1feature_1_1is__wrapper.md)



_Checks whether_ `T` _is a_`wrapper` _specialization._[More...](#detailed-description)

* `#include <wrapper.h>`



Inherits the following classes: scl::feature::detail::is_wrapper<::std::remove_cv_t< T > >






























































## Detailed Description


cv-qualifiers are stripped before the check.




**Template parameters:**


* `T` Type to check.


```C++
static_assert(!is_wrapper<int>::value);
static_assert( is_wrapper<wrapper<int>>::value);
static_assert( is_wrapper<wrapper<int> const>::value);  // cv stripped
```
 


    

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/type_traits/wrapper.h`

