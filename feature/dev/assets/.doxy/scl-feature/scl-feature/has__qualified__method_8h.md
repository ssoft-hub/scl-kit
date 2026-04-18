

# File has\_qualified\_method.h



[**FileList**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**type\_traits**](dir_910e174fc0e8c8ed40843bba5172f2f4.md) **>** [**has\_qualified\_method.h**](has__qualified__method_8h.md)

[Go to the source code of this file](has__qualified__method_8h_source.md)

_Compile-time predicate macro for cv-ref qualifier detection._ 

* `#include <scl/utility/preprocessor/forward.h>`
* `#include <type_traits>`
































































## Macros

| Type | Name |
| ---: | :--- |
| define  | [**SCL\_HQM\_CALL**](has__qualified__method_8h.md#define-scl_hqm_call) (method, quals) `::std::declval&lt;Obj quals&gt;().method(::std::declval&lt;S\_c\_L\_Args\_&gt;()...)`<br> |
| define  | [**SCL\_HQM\_SAME**](has__qualified__method_8h.md#define-scl_hqm_same) (method, left\_quals, right\_quals) `/* multi line expression */`<br> |

## Macro Definition Documentation





### define SCL\_HQM\_CALL 

```C++
#define SCL_HQM_CALL (
    method,
    quals
) `::std::declval<Obj quals>().method(::std::declval<S_c_L_Args_>()...)`
```




<hr>



### define SCL\_HQM\_SAME 

```C++
#define SCL_HQM_SAME (
    method,
    left_quals,
    right_quals
) `/* multi line expression */`
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/type_traits/has_qualified_method.h`

