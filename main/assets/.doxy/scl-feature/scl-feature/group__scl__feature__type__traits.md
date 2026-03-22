

# Group scl\_feature\_type\_traits



[**Modules**](modules.md) **>** [**scl\_feature\_type\_traits**](group__scl__feature__type__traits.md)



_Type-level utilities for ScL Feature metaprogramming._ 
















## Classes

| Type | Name |
| ---: | :--- |
| struct | [**scl::feature::executor\_trait**](structscl_1_1feature_1_1executor__trait.md) &lt;[**typename**](group__scl__feature__type__traits.md#variable-is_wrapper_v) [**T**](group__scl__feature__type__traits.md#variable-is_wrapper_v)&gt;<br>_Trait that provides access to the executor inside a wrapper._  |






## Public Attributes

| Type | Name |
| ---: | :--- |
|  constexpr bool | [**is\_compatible\_with\_part\_of\_v**](#variable-is_compatible_with_part_of_v)   = `/* multi line expression */`<br>_Checks whether_ `Expected` _(a wrapper) recursively contains a value that is compatible with_`Test` _(also a wrapper)._ |
|  constexpr bool | [**is\_compatible\_with\_v**](#variable-is_compatible_with_v)   = `/* multi line expression */`<br>_Checks whether_ `Test` _is compatible with (usable in place of)_`Expected` _._ |
|  constexpr bool | [**is\_part\_compatible\_with\_v**](#variable-is_part_compatible_with_v)   = `/* multi line expression */`<br>_Checks whether_ `Test` _(a wrapper) recursively contains a value that is compatible with_`Expected` _(also a wrapper)._ |
|  constexpr bool | [**is\_wrapper\_v**](#variable-is_wrapper_v)   = `/* multi line expression */`<br>_Checks whether_ `Type` _is a_`wrapper` _specialization._ |












































## Public Attributes Documentation




### variable is\_compatible\_with\_part\_of\_v 

_Checks whether_ `Expected` _(a wrapper) recursively contains a value that is compatible with_`Test` _(also a wrapper)._
```
constexpr bool scl::feature::is_compatible_with_part_of_v;
```



Peels layers off `Expected` one at a time; at each level checks whether the unwrapped value is compatible with the whole of `Test` via `is_compatible_with_v`. Returns `false` if either argument is not a `wrapper` specialization. cv-qualifiers are stripped from both arguments before the check.




**Template parameters:**


* `Expected` Outer wrapper whose contents are inspected. 
* `Test` Wrapper to match against.


```
using W   = wrapper<int,                     feature::inplace::plain>;
using WW  = wrapper<W,                       feature::inplace::plain>;
using WWW = wrapper<WW,                      feature::inplace::plain>;

static_assert( is_compatible_with_part_of_v<WW,  W>);   // WW's inner value IS W
static_assert( is_compatible_with_part_of_v<WWW, W>);   // two levels deep
static_assert(!is_compatible_with_part_of_v<W,  WW>);   // W does not contain WW
static_assert(!is_compatible_with_part_of_v<int, W>);   // Expected not a wrapper
static_assert(!is_compatible_with_part_of_v<W, int>);   // Test not a wrapper
```
 


        

<hr>



### variable is\_compatible\_with\_v 

_Checks whether_ `Test` _is compatible with (usable in place of)_`Expected` _._
```
constexpr bool scl::feature::is_compatible_with_v;
```



For non-wrapper types the check is: `Test` is the same type as `Expected`, or `Test` is publicly derived from `Expected`. For `wrapper` specializations that share the same template-template argument the check is applied recursively to their value types. cv-qualifiers are stripped from both arguments before the check.




**Template parameters:**


* `Expected` Target type. 
* `Test` Type to verify compatibility of.


```
using P1 = wrapper<int,    feature::inplace::plain>;
using P2 = wrapper<double, feature::inplace::plain>;
using U1 = wrapper<int,    feature::inplace::uninitialized>;

static_assert( is_compatible_with_v<P1, P1>);    // identical types
static_assert(!is_compatible_with_v<P1, P2>);    // incompatible value types
static_assert(!is_compatible_with_v<P1, U1>);    // different template param
static_assert(!is_compatible_with_v<int, P1>);   // non-wrapper vs wrapper
static_assert( is_compatible_with_v<int, int>);  // same non-wrapper type
```
 


        

<hr>



### variable is\_part\_compatible\_with\_v 

_Checks whether_ `Test` _(a wrapper) recursively contains a value that is compatible with_`Expected` _(also a wrapper)._
```
constexpr bool scl::feature::is_part_compatible_with_v;
```



Peels layers off `Test` one at a time; at each level checks whether the unwrapped value is compatible with the whole of `Expected` via `is_compatible_with_v`. Returns `false` if either argument is not a `wrapper` specialization. cv-qualifiers are stripped from both arguments before the check.




**Template parameters:**


* `Expected` Wrapper to match against. 
* `Test` Outer wrapper whose contents are inspected.


```
using W   = wrapper<int,                     feature::inplace::plain>;
using WW  = wrapper<W,                       feature::inplace::plain>;
using WWW = wrapper<WW,                      feature::inplace::plain>;

static_assert( is_part_compatible_with_v<W,  WW>);    // WW's inner value IS W
static_assert( is_part_compatible_with_v<W,  WWW>);   // two levels deep
static_assert(!is_part_compatible_with_v<WW, W>);     // W does not contain WW
static_assert(!is_part_compatible_with_v<int, W>);    // Expected not a wrapper
static_assert(!is_part_compatible_with_v<W, int>);    // Test not a wrapper
```
 


        

<hr>



### variable is\_wrapper\_v 

_Checks whether_ `Type` _is a_`wrapper` _specialization._
```
constexpr bool scl::feature::is_wrapper_v;
```



cv-qualifiers on `Type` are stripped before the check.




**Template parameters:**


* `Type` Type to check.


```
static_assert(!is_wrapper_v<int>);
static_assert( is_wrapper_v<wrapper<int>>);
static_assert( is_wrapper_v<wrapper<int> const>);  // cv stripped
```
 


        

<hr>

------------------------------


