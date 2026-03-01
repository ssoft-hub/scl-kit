

# File operator.h



[**FileList**](files.md) **>** [**detail**](dir_b3eb4ac5eceab19e0dcca8b4c96aaf20.md) **>** [**operator.h**](operator_8h.md)

[Go to the source code of this file](operator_8h_source.md)



* `#include "binary_operator.h"`
* `#include "unary_operator.h"`
* `#include <scl/feature/access/holder_guard.h>`
* `#include <scl/feature/access/value_pointer.h>`
* `#include <scl/utility/preprocessor.h>`
































































## Macros

| Type | Name |
| ---: | :--- |
| define  | [**SCL\_ADDRESS\_OF\_OPERATOR**](operator_8h.md#define-scl_address_of_operator) (symbol) `/* multi line expression */`<br> |
| define  | [**SCL\_ADDRESS\_OF\_OPERATOR\_PROTOTYPE**](operator_8h.md#define-scl_address_of_operator_prototype) (symbol, this\_refer) `/* multi line expression */`<br> |
| define  | [**SCL\_ASSIGNMENT\_OPERATOR\_FOR\_THIS**](operator_8h.md#define-scl_assignment_operator_for_this) (symbol, Invokable) <br> |
| define  | [**SCL\_BINARY\_OPERATOR\_FOR\_ANY**](operator_8h.md#define-scl_binary_operator_for_any) (symbol, Invokable) `/* multi line expression */`<br> |
| define  | [**SCL\_BINARY\_OPERATOR\_PROTOTYPE\_FOR\_ANY**](operator_8h.md#define-scl_binary_operator_prototype_for_any) (symbol, this\_refer, Invokable) `/* multi line expression */`<br> |
| define  | [**SCL\_BINARY\_OPERATOR\_PROTOTYPE\_FOR\_THIS**](operator_8h.md#define-scl_binary_operator_prototype_for_this) (symbol, this\_refer, other\_refer, Invokable) `/* multi line expression */`<br> |
| define  | [**SCL\_CONSTRUCTOR\_FOR\_OTHER\_WRAPPER**](operator_8h.md#define-scl_constructor_for_other_wrapper)  `/* multi line expression */`<br> |
| define  | [**SCL\_CONSTRUCTOR\_FOR\_OTHER\_WRAPPER\_PROTOTYPE**](operator_8h.md#define-scl_constructor_for_other_wrapper_prototype) (other\_refer) `/* multi line expression */`<br> |
| define  | [**SCL\_CONSTRUCTOR\_FOR\_THIS\_WRAPPER**](operator_8h.md#define-scl_constructor_for_this_wrapper)  `/* multi line expression */`<br> |
| define  | [**SCL\_CONSTRUCTOR\_FOR\_THIS\_WRAPPER\_PROTOTYPE**](operator_8h.md#define-scl_constructor_for_this_wrapper_prototype) (other\_refer) `/* multi line expression */`<br> |
| define  | [**SCL\_CONSTRUCTOR\_FOR\_THIS\_WRAPPER\_PROTOTYPE\_V2**](operator_8h.md#define-scl_constructor_for_this_wrapper_prototype_v2) (other\_refer) `/* multi line expression */`<br> |
| define  | [**SCL\_DEREFERENCE\_OPERATOR**](operator_8h.md#define-scl_dereference_operator) (symbol) `/* multi line expression */`<br> |
| define  | [**SCL\_DEREFERENCE\_OPERATOR\_PROTOTYPE**](operator_8h.md#define-scl_dereference_operator_prototype) (symbol, this\_refer) `/* multi line expression */`<br> |
| define  | [**SCL\_FEATURE\_OPERATOR\_H**](operator_8h.md#define-scl_feature_operator_h)  <br> |
| define  | [**SCL\_GLOBAL\_BINARY\_OPERATOR**](operator_8h.md#define-scl_global_binary_operator) (symbol, Invokable) `/* multi line expression */`<br> |
| define  | [**SCL\_GLOBAL\_BINARY\_OPERATOR\_SPECIALIZATION**](operator_8h.md#define-scl_global_binary_operator_specialization) (Invokable) `/* multi line expression */`<br> |
| define  | [**SCL\_POSTFIX\_UNARY\_OPERATOR\_PROTOTYPE\_WITH\_ARGUMENT**](operator_8h.md#define-scl_postfix_unary_operator_prototype_with_argument) (symbol, this\_refer, Invokable) `/* multi line expression */`<br> |
| define  | [**SCL\_POSTFIX\_UNARY\_OPERATOR\_PROTOTYPE\_WITH\_ARGUMENTS**](operator_8h.md#define-scl_postfix_unary_operator_prototype_with_arguments) (symbol, this\_refer, Invokable) `/* multi line expression */`<br> |
| define  | [**SCL\_POSTFIX\_UNARY\_OPERATOR\_PROTOTYPE\_WITH\_INT**](operator_8h.md#define-scl_postfix_unary_operator_prototype_with_int) (symbol, this\_refer, Invokable) `/* multi line expression */`<br> |
| define  | [**SCL\_POSTFIX\_UNARY\_OPERATOR\_WITH\_ARGUMENT**](operator_8h.md#define-scl_postfix_unary_operator_with_argument) (symbol, Invokable) `/* multi line expression */`<br> |
| define  | [**SCL\_POSTFIX\_UNARY\_OPERATOR\_WITH\_ARGUMENTS**](operator_8h.md#define-scl_postfix_unary_operator_with_arguments) (symbol, Invokable) `/* multi line expression */`<br> |
| define  | [**SCL\_POSTFIX\_UNARY\_OPERATOR\_WITH\_INT**](operator_8h.md#define-scl_postfix_unary_operator_with_int) (symbol, Invokable) `/* multi line expression */`<br> |
| define  | [**SCL\_PREFIX\_UNARY\_OPERATOR**](operator_8h.md#define-scl_prefix_unary_operator) (symbol, Invokable) `/* multi line expression */`<br> |
| define  | [**SCL\_PREFIX\_UNARY\_OPERATOR\_PROTOTYPE**](operator_8h.md#define-scl_prefix_unary_operator_prototype) (symbol, this\_refer, Invokable) `/* multi line expression */`<br> |

## Macro Definition Documentation





### define SCL\_ADDRESS\_OF\_OPERATOR 

```C++
#define SCL_ADDRESS_OF_OPERATOR (
    symbol
) `/* multi line expression */`
```




<hr>



### define SCL\_ADDRESS\_OF\_OPERATOR\_PROTOTYPE 

```C++
#define SCL_ADDRESS_OF_OPERATOR_PROTOTYPE (
    symbol,
    this_refer
) `/* multi line expression */`
```




<hr>



### define SCL\_ASSIGNMENT\_OPERATOR\_FOR\_THIS 

```C++
#define SCL_ASSIGNMENT_OPERATOR_FOR_THIS (
    symbol,
    Invokable
) 
```




<hr>



### define SCL\_BINARY\_OPERATOR\_FOR\_ANY 

```C++
#define SCL_BINARY_OPERATOR_FOR_ANY (
    symbol,
    Invokable
) `/* multi line expression */`
```




<hr>



### define SCL\_BINARY\_OPERATOR\_PROTOTYPE\_FOR\_ANY 

```C++
#define SCL_BINARY_OPERATOR_PROTOTYPE_FOR_ANY (
    symbol,
    this_refer,
    Invokable
) `/* multi line expression */`
```




<hr>



### define SCL\_BINARY\_OPERATOR\_PROTOTYPE\_FOR\_THIS 

```C++
#define SCL_BINARY_OPERATOR_PROTOTYPE_FOR_THIS (
    symbol,
    this_refer,
    other_refer,
    Invokable
) `/* multi line expression */`
```




<hr>



### define SCL\_CONSTRUCTOR\_FOR\_OTHER\_WRAPPER 

```C++
#define SCL_CONSTRUCTOR_FOR_OTHER_WRAPPER `/* multi line expression */`
```




<hr>



### define SCL\_CONSTRUCTOR\_FOR\_OTHER\_WRAPPER\_PROTOTYPE 

```C++
#define SCL_CONSTRUCTOR_FOR_OTHER_WRAPPER_PROTOTYPE (
    other_refer
) `/* multi line expression */`
```




<hr>



### define SCL\_CONSTRUCTOR\_FOR\_THIS\_WRAPPER 

```C++
#define SCL_CONSTRUCTOR_FOR_THIS_WRAPPER `/* multi line expression */`
```




<hr>



### define SCL\_CONSTRUCTOR\_FOR\_THIS\_WRAPPER\_PROTOTYPE 

```C++
#define SCL_CONSTRUCTOR_FOR_THIS_WRAPPER_PROTOTYPE (
    other_refer
) `/* multi line expression */`
```




<hr>



### define SCL\_CONSTRUCTOR\_FOR\_THIS\_WRAPPER\_PROTOTYPE\_V2 

```C++
#define SCL_CONSTRUCTOR_FOR_THIS_WRAPPER_PROTOTYPE_V2 (
    other_refer
) `/* multi line expression */`
```




<hr>



### define SCL\_DEREFERENCE\_OPERATOR 

```C++
#define SCL_DEREFERENCE_OPERATOR (
    symbol
) `/* multi line expression */`
```




<hr>



### define SCL\_DEREFERENCE\_OPERATOR\_PROTOTYPE 

```C++
#define SCL_DEREFERENCE_OPERATOR_PROTOTYPE (
    symbol,
    this_refer
) `/* multi line expression */`
```




<hr>



### define SCL\_FEATURE\_OPERATOR\_H 

```C++
#define SCL_FEATURE_OPERATOR_H 
```




<hr>



### define SCL\_GLOBAL\_BINARY\_OPERATOR 

```C++
#define SCL_GLOBAL_BINARY_OPERATOR (
    symbol,
    Invokable
) `/* multi line expression */`
```




<hr>



### define SCL\_GLOBAL\_BINARY\_OPERATOR\_SPECIALIZATION 

```C++
#define SCL_GLOBAL_BINARY_OPERATOR_SPECIALIZATION (
    Invokable
) `/* multi line expression */`
```




<hr>



### define SCL\_POSTFIX\_UNARY\_OPERATOR\_PROTOTYPE\_WITH\_ARGUMENT 

```C++
#define SCL_POSTFIX_UNARY_OPERATOR_PROTOTYPE_WITH_ARGUMENT (
    symbol,
    this_refer,
    Invokable
) `/* multi line expression */`
```




<hr>



### define SCL\_POSTFIX\_UNARY\_OPERATOR\_PROTOTYPE\_WITH\_ARGUMENTS 

```C++
#define SCL_POSTFIX_UNARY_OPERATOR_PROTOTYPE_WITH_ARGUMENTS (
    symbol,
    this_refer,
    Invokable
) `/* multi line expression */`
```




<hr>



### define SCL\_POSTFIX\_UNARY\_OPERATOR\_PROTOTYPE\_WITH\_INT 

```C++
#define SCL_POSTFIX_UNARY_OPERATOR_PROTOTYPE_WITH_INT (
    symbol,
    this_refer,
    Invokable
) `/* multi line expression */`
```




<hr>



### define SCL\_POSTFIX\_UNARY\_OPERATOR\_WITH\_ARGUMENT 

```C++
#define SCL_POSTFIX_UNARY_OPERATOR_WITH_ARGUMENT (
    symbol,
    Invokable
) `/* multi line expression */`
```




<hr>



### define SCL\_POSTFIX\_UNARY\_OPERATOR\_WITH\_ARGUMENTS 

```C++
#define SCL_POSTFIX_UNARY_OPERATOR_WITH_ARGUMENTS (
    symbol,
    Invokable
) `/* multi line expression */`
```




<hr>



### define SCL\_POSTFIX\_UNARY\_OPERATOR\_WITH\_INT 

```C++
#define SCL_POSTFIX_UNARY_OPERATOR_WITH_INT (
    symbol,
    Invokable
) `/* multi line expression */`
```




<hr>



### define SCL\_PREFIX\_UNARY\_OPERATOR 

```C++
#define SCL_PREFIX_UNARY_OPERATOR (
    symbol,
    Invokable
) `/* multi line expression */`
```




<hr>



### define SCL\_PREFIX\_UNARY\_OPERATOR\_PROTOTYPE 

```C++
#define SCL_PREFIX_UNARY_OPERATOR_PROTOTYPE (
    symbol,
    this_refer,
    Invokable
) `/* multi line expression */`
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/detail/operator.h`

