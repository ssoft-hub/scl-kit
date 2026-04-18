

# File access.h



[**FileList**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**reflection**](dir_262f3534dca743723347393893d6556e.md) **>** [**access.h**](access_8h.md)

[Go to the source code of this file](access_8h_source.md)

_Internal accessor macros for executor and value access in reflected methods._ 

* `#include <scl/feature/type_traits/executor.h>`
* `#include <type_traits>`
































































## Macros

| Type | Name |
| ---: | :--- |
| define  | [**SCL\_EXECUTOR\_ACCESS**](access_8h.md#define-scl_executor_access) (cv\_ref) `[**::scl::feature::executor\_trait**](structscl_1_1feature_1_1executor__trait.md)&lt;S\_c\_L\_type\_&gt;::executor(static\_cast&lt;S\_c\_L\_type\_ cv\_ref&gt;(\*this))`<br> |
| define  | [**SCL\_VALUE\_ACCESS**](access_8h.md#define-scl_value_access) (cv\_ref) `S\_c\_L\_executor\_type\_::value(SCL\_EXECUTOR\_ACCESS(cv\_ref))`<br> |
| define  | [**SCL\_VALUE\_DECLVAL**](access_8h.md#define-scl_value_declval) (cv\_ref) `S\_c\_L\_executor\_type\_::value(::std::declval&lt;S\_c\_L\_executor\_type\_ cv\_ref&gt;())`<br> |

## Macro Definition Documentation





### define SCL\_EXECUTOR\_ACCESS 

```C++
#define SCL_EXECUTOR_ACCESS (
    cv_ref
) `::scl::feature::executor_trait <S_c_L_type_>::executor(static_cast<S_c_L_type_ cv_ref>(*this))`
```




<hr>



### define SCL\_VALUE\_ACCESS 

```C++
#define SCL_VALUE_ACCESS (
    cv_ref
) `S_c_L_executor_type_::value(SCL_EXECUTOR_ACCESS(cv_ref))`
```




<hr>



### define SCL\_VALUE\_DECLVAL 

```C++
#define SCL_VALUE_DECLVAL (
    cv_ref
) `S_c_L_executor_type_::value(::std::declval<S_c_L_executor_type_ cv_ref>())`
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/reflection/access.h`

