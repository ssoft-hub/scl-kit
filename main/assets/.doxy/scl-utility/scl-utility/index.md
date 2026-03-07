

ScL.Utility



## Overview



ScL.Utility is a header-only C++20 module providing common utilities not available in the standard library. It is part of the ScL Toolkit and has no external dependencies.



## Quick start



Include the umbrella header and link against the CMake target: 
```
target_link_libraries(your_target PRIVATE scl::utility)
```
 
```
#include <scl/utility.h>

static_assert(scl::type_name<int>() == "int");
```




## Features




* **Meta** ([**ScL Meta Infos**](group__scl__utility__meta.md)) — compile-time type, enum, and symbol name extraction without RTTI.
* **Preprocessor** ([**ScL Preprocessor Utilities (C++)**](group__scl__utility__preprocessor.md)) — macro utilities including token forwarding (SCL\_FORWARD) and a compile-time counter (SCL\_COUNTER\_VALUE / SCL\_COUNTER\_NEXT).
* **Type traits** ([**ScL Type Traits**](group__scl__utility__type__traits.md)) — detection idiom, forward\_like, member pointer decomposition, and overload\_cast. 





    


