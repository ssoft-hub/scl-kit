

# File type.h



[**FileList**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**reflection**](dir_262f3534dca743723347393893d6556e.md) **>** [**type.h**](type_8h.md)

[Go to the source code of this file](type_8h_source.md)

_Macro for declaring the wrapper type used by reflection macros._ 

* `#include <type_traits>`
































































## Macros

| Type | Name |
| ---: | :--- |
| define  | [**SCL\_REFLECT\_TYPE**](type_8h.md#define-scl_reflect_type) (Type, Member) `/* multi line expression */`<br>_Declares the wrapper type for use by_ `SCL_REFLECT_METHOD` _._ |

## Macro Definition Documentation





### define SCL\_REFLECT\_TYPE 

_Declares the wrapper type for use by_ `SCL_REFLECT_METHOD` _._
```C++
#define SCL_REFLECT_TYPE (
    Type,
    Member
) `/* multi line expression */`
```



Must appear inside the class body **after** the executor member declaration and **before** any `SCL_REFLECT_METHOD` invocations.


A specialization of `scl::feature::executor_trait` must also be provided for `Type`.




**
**


```C++
SCL_REFLECT_TYPE(MyWrapper, m_executor);
```





**Parameters:**


* `Type` The unqualified class name. 
* `Member` Executor data member name.



**See also:** [**scl::feature::executor\_trait**](structscl_1_1feature_1_1executor__trait.md) 



        

<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/reflection/type.h`

