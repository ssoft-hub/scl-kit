

# Group scl\_feature\_type\_traits



[**Modules**](modules.md) **>** [**scl\_feature\_type\_traits**](group__scl__feature__type__traits.md)



_Type-level utilities for ScL Feature metaprogramming._ 
















## Classes

| Type | Name |
| ---: | :--- |
| struct | [**scl::feature::is\_wrapper**](structscl_1_1feature_1_1is__wrapper.md) &lt;[**typename**](group__scl__feature__type__traits.md#variable-is_wrapper_v) [**T**](group__scl__feature__type__traits.md#variable-is_wrapper_v)&gt;<br>_Checks whether_ `T` _is a_`wrapper` _specialization._ |






## Public Attributes

| Type | Name |
| ---: | :--- |
|  constexpr bool | [**is\_wrapper\_v**](#variable-is_wrapper_v)   = `is\_wrapper&lt;T&gt;::value`<br>_Helper variable template for_ `is_wrapper` _._ |












































## Public Attributes Documentation




### variable is\_wrapper\_v 

_Helper variable template for_ `is_wrapper` _._
```
constexpr bool scl::feature::is_wrapper_v;
```





**Template parameters:**


* `T` Type to check.


```
static_assert(!is_wrapper_v<int>);
static_assert( is_wrapper_v<wrapper<int>>);
```
 


        

<hr>

------------------------------


