

# File type.h



[**FileList**](files.md) **>** [**meta**](dir_85c7392cbdcb0ae852d6674ea46dde19.md) **>** [**type.h**](type_8h.md)

[Go to the source code of this file](type_8h_source.md)

_Traits for compile-time type name extraction (C++20)._ [More...](#detailed-description)

* `#include <string_view>`













## Namespaces

| Type | Name |
| ---: | :--- |
| namespace | [**scl**](namespacescl.md) <br>_Root namespace of ScL project._  |


## Classes

| Type | Name |
| ---: | :--- |
| struct | [**p8qim3n2a\_t**](structp8qim3n2a__t.md) <br> |


















































## Detailed Description



* [**scl::type\_name&lt;T&gt;**](group__scl__utility__meta.md#function-type_name): Extracts the fully qualified name of the template type T. Automatically normalizes compiler-specific output by stripping 'class'/'struct'/'union' prefixes on MSVC.
* [**scl::type\_short\_name&lt;T&gt;**](group__scl__utility__meta.md#function-type_short_name): Extracts only the unqualified identifier of the type T. Strips all leading namespace and class scope qualifiers. 




    

------------------------------
The documentation for this class was generated from the following file `module/utility/src/scl/utility/meta/type.h`

