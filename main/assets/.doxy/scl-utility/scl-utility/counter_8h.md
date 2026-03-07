

# File counter.h



[**FileList**](files.md) **>** [**module**](dir_a7b0466279106ea0b8f86f609f621680.md) **>** [**utility**](dir_cca185d4009e66bf68ef58b617abaf60.md) **>** [**src**](dir_ab13fdfb8e4c1ff98b437eee9f69d35c.md) **>** [**scl**](dir_ca45970a26780365ec2accbdb8d8d4fe.md) **>** [**utility**](dir_76f6b7cf5a6cf438d50211f1abeeaae6.md) **>** [**preprocessor**](dir_a3b1215870dd7b05435314af8f203f78.md) **>** [**counter.h**](counter_8h.md)

[Go to the source code of this file](counter_8h_source.md)

_Implements a compile-time counter mechanism._ [More...](#detailed-description)

* `#include <scl/utility/preprocessor/forward.h>`
* `#include <cstdint>`
* `#include <type_traits>`













## Namespaces

| Type | Name |
| ---: | :--- |
| namespace | [**scl**](namespacescl.md) <br>_Root namespace of ScL project._  |
| namespace | [**preprocessor**](namespacescl_1_1preprocessor.md) <br> |



















































## Macros

| Type | Name |
| ---: | :--- |
| define  | [**SCL\_COUNTER\_CRUMB**](counter_8h.md#define-scl_counter_crumb) (Tag, rank, acc) `/* multi line expression */`<br> |

## Detailed Description


This file provides a set of macros and templates to create and increment counters that are evaluated at compile time. This technique is based on function overloading and argument-dependent lookup (ADL). It's useful for generating unique IDs or counting occurrences of something within a translation unit during compilation.




**See also:** [https://stackoverflow.com/a/6174263/1190123](https://stackoverflow.com/a/6174263/1190123) 



    
## Macro Definition Documentation





### define SCL\_COUNTER\_CRUMB 

```C++
#define SCL_COUNTER_CRUMB (
    Tag,
    rank,
    acc
) `/* multi line expression */`
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/utility/src/scl/utility/preprocessor/counter.h`

