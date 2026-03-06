

ScL Feature



## Overview



ScL Feature is a header-only C++20 module providing a composable wrapper type that adds orthogonal features to any user-defined type without modifying it. It is part of the ScL Toolkit.



## Quick start



Include the umbrella header and link against the CMake target: 
```
target_link_libraries(your_target PRIVATE scl::feature)
```
 
```
#include <scl/feature.h>

scl::feature::wrapper<int> w{42};
```




## Features




* **Wrapper** — `scl::feature::wrapper<Value, Tools...>`, a composable adapter with orthogonal tool-based features.
* **Type traits** ([**ScL Feature Type Traits**](group__scl__feature__type__traits.md)) — `is_wrapper` and related metaprogramming utilities.
* **Concepts** ([**ScL Feature Concepts**](group__scl__feature__concepts.md)) — C++20 concepts such as `concepts::wrapper_type`. 





    


