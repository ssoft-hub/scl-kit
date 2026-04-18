

# File overload\_cast.h



[**FileList**](files.md) **>** [**module**](dir_a7b0466279106ea0b8f86f609f621680.md) **>** [**utility**](dir_cca185d4009e66bf68ef58b617abaf60.md) **>** [**src**](dir_ab13fdfb8e4c1ff98b437eee9f69d35c.md) **>** [**scl**](dir_ca45970a26780365ec2accbdb8d8d4fe.md) **>** [**utility**](dir_76f6b7cf5a6cf438d50211f1abeeaae6.md) **>** [**type\_traits**](dir_ee84acd7aed8e5e3b0eed877408f2d18.md) **>** [**overload\_cast.h**](overload__cast_8h.md)

[Go to the source code of this file](overload__cast_8h_source.md)

_Utility for disambiguating function and member function overloads._ [More...](#detailed-description)

* `#include <type_traits>`













## Namespaces

| Type | Name |
| ---: | :--- |
| namespace | [**scl**](namespacescl.md) <br>_Root namespace of ScL project._  |




















































## Detailed Description


This file provides the `overload_cast` variable template, which simplifies the process of selecting a specific signature from a set of overloaded functions or member functions.


It is particularly useful when taking the address of a function that has multiple overloads differing by:
* Argument types.
* Const, volatile, or const-qualifiers volatile.
* Reference qualifiers (lvalue & or rvalue &&).
* Noexcept specifications.




By using `overload_cast<Args...>(ptr)`, the compiler can explicitly identify the intended overload without the need for verbose and error-prone manual `static_cast` to function pointer types. 


    

------------------------------
The documentation for this class was generated from the following file `module/utility/src/scl/utility/type_traits/overload_cast.h`

