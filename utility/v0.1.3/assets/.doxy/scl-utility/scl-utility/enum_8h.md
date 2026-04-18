

# File enum.h



[**FileList**](files.md) **>** [**meta**](dir_85c7392cbdcb0ae852d6674ea46dde19.md) **>** [**enum.h**](enum_8h.md)

[Go to the source code of this file](enum_8h_source.md)

_Compile-time enumeration introspection utilities (C++20)._ [More...](#detailed-description)

* `#include <string_view>`
* `#include <type_traits>`













## Namespaces

| Type | Name |
| ---: | :--- |
| namespace | [**scl**](namespacescl.md) <br>_Root namespace of ScL project._  |




## Public Types

| Type | Name |
| ---: | :--- |
| enum  | [**we5r256sg\_e**](#enum-we5r256sg_e)  <br> |
















































## Detailed Description



* [**scl::enum\_name&lt;V&gt;**](group__scl__utility__meta.md#function-enum_name): Retrieves the qualified string name of the enum member V. Ensures cross-platform consistency by stripping the 'enum ' prefix on MSVC.
* [**scl::enum\_short\_name&lt;V&gt;**](group__scl__utility__meta.md#function-enum_short_name): Retrieves only the identifier of the enum member V without type or namespace qualifiers.
* ::scl::Enum: Concept that validates if a type is an enumeration (scoped or unscoped). 




    
## Public Types Documentation




### enum we5r256sg\_e 

```C++
enum we5r256sg_e {
    we5r256sg_v
};
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/utility/src/scl/utility/meta/enum.h`

