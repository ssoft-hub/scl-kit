

# File operator.h



[**FileList**](files.md) **>** [**detection**](dir_7ae4f81ae30c9db8975b98cdcb7060a6.md) **>** [**operator.h**](operator_8h.md)

[Go to the source code of this file](operator_8h_source.md)

_Operator detection traits: compile-time aliases and value checks (Detection Idiom)_ [More...](#detailed-description)

* `#include <scl/utility/preprocessor/forward.h>`
* `#include <scl/utility/type_traits/detection.h>`
* `#include <scl/utility/type_traits/member_like.h>`













## Namespaces

| Type | Name |
| ---: | :--- |
| namespace | [**scl**](namespacescl.md) <br>_Root namespace of ScL project._  |



















































## Macros

| Type | Name |
| ---: | :--- |
| define  | [**SCL\_DETAIL\_ARGUMENTS\_OPERATOR\_DETECTION**](operator_8h.md#define-scl_detail_arguments_operator_detection) (op, name) `/* multi line expression */`<br> |
| define  | [**SCL\_DETAIL\_ARROW\_OPERATOR\_DETECTION**](operator_8h.md#define-scl_detail_arrow_operator_detection) (op, name) `/* multi line expression */`<br> |
| define  | [**SCL\_DETAIL\_BINARY\_OPERATOR\_DETECTION**](operator_8h.md#define-scl_detail_binary_operator_detection) (op, name) `/* multi line expression */`<br> |
| define  | [**SCL\_DETAIL\_POSTFIX\_UNARY\_OPERATOR\_DETECTION**](operator_8h.md#define-scl_detail_postfix_unary_operator_detection) (op, name) <br> |
| define  | [**SCL\_DETAIL\_PREFIX\_UNARY\_OPERATOR\_DETECTION**](operator_8h.md#define-scl_detail_prefix_unary_operator_detection) (op, name) `/* multi line expression */`<br> |

## Detailed Description


This header declares a comprehensive suite of compile-time detection aliases and constexpr values for C++ operators using the Detection Idiom (N4502), implemented with `decltype` and `std::declval`.


For each supported operator, the following symbols are provided (expanded via internal macros in the non-Doxygen branch of this header; documented here for Doxygen users):



* Operation (expression) aliases:
  * `name_operation<...>`: SFINAE-friendly alias representing the operator expression (built-in or free function).
  * `has_name_v<...>`: constexpr boolean; true if `name_operation<...>` is well-formed.
  * `name_t<...>`: alias to the detected expression type, or `scl::nonesuch` on failure.


* Member detection aliases:
  * `name_member_operation<Type, ...>`: alias representing `std::declval<Type>().operator op(...)`.
  * `has_name_member_v<...>`: constexpr boolean; true if the member-form expression is well-formed.
  * `name_member_t<...>`: alias to the detected result type for the member-form expression, or `scl::nonesuch`.


* Exact member detection aliases:
  * `name_member_exact_operation<Type, ...>`: alias using pointer-to-member to require an actual class member with the exact signature implied by the non-exact member operation (including ref-qualifiers via `scl::member_function_like_t`).
  * `has_name_member_exact_v<...>`: constexpr boolean; true if the pointer-to-member expression is well-formed.
  * `name_member_exact_t<...>`: alias to the detected result type for the exact member expression, or `scl::nonesuch`.






Operators covered:
* Prefix unary: `&` (address\_of), `*` (indirection), `+` (unary\_plus), `-` (unary\_minus), `++` (prefix\_increment), `--` (prefix\_decrement), `~` (bitwise\_not), `!` (logical\_not)
* Postfix unary: `++` (postfix\_increment), `--` (postfix\_decrement)
* Binary comparisons: `==` (equal\_to), `!=` (not\_equal\_to), `<` (less), `<=` (less\_equal), `>` (greater), `>=` (greater\_equal)
* Binary arithmetic/bitwise: `*` (multiply), `/` (divide), `%` (modulo), `+` (plus), `-` (minus), `<<` (left\_shift), `>>` (right\_shift), `&` (bitwise\_and), `|` (bitwise\_or), `^` (bitwise\_xor)
* Logical binary: `&&` (logical\_and), `||` (logical\_or)
* Assignment: `=` (assign), `+=` (plus\_assign), `-=` (minus\_assign), `*=` (multiply\_assign), `/=` (divide\_assign), `%=` (modulo\_assign), `<<=` (left\_shift\_assign), `>>=` (right\_shift\_assign), `&=` (bitwise\_and\_assign), `|=` (bitwise\_or\_assign), `^=` (bitwise\_xor\_assign)
* Special: `->*` (arrow\_to\_pointer), `->` (arrow), `,` (comma), `[]` (subscript), `()` (call)




Implementation notes:
* All public symbols live in the `scl` namespace.
* Detection is implemented via alias templates using `decltype` and `std::declval`.
* Exact member detection uses pointer-to-member and `scl::member_function_like_t` to enforce exact signature and ref-qualifiers. 




    
## Macro Definition Documentation





### define SCL\_DETAIL\_ARGUMENTS\_OPERATOR\_DETECTION 

```C++
#define SCL_DETAIL_ARGUMENTS_OPERATOR_DETECTION (
    op,
    name
) `/* multi line expression */`
```




<hr>



### define SCL\_DETAIL\_ARROW\_OPERATOR\_DETECTION 

```C++
#define SCL_DETAIL_ARROW_OPERATOR_DETECTION (
    op,
    name
) `/* multi line expression */`
```




<hr>



### define SCL\_DETAIL\_BINARY\_OPERATOR\_DETECTION 

```C++
#define SCL_DETAIL_BINARY_OPERATOR_DETECTION (
    op,
    name
) `/* multi line expression */`
```




<hr>



### define SCL\_DETAIL\_POSTFIX\_UNARY\_OPERATOR\_DETECTION 

```C++
#define SCL_DETAIL_POSTFIX_UNARY_OPERATOR_DETECTION (
    op,
    name
) 
```




<hr>



### define SCL\_DETAIL\_PREFIX\_UNARY\_OPERATOR\_DETECTION 

```C++
#define SCL_DETAIL_PREFIX_UNARY_OPERATOR_DETECTION (
    op,
    name
) `/* multi line expression */`
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/utility/src/scl/utility/type_traits/detection/operator.h`

