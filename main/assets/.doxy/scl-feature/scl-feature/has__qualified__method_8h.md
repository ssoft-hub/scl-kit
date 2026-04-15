

# File has\_qualified\_method.h



[**FileList**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**type\_traits**](dir_910e174fc0e8c8ed40843bba5172f2f4.md) **>** [**has\_qualified\_method.h**](has__qualified__method_8h.md)

[Go to the source code of this file](has__qualified__method_8h_source.md)

_Compile-time predicate macro for cv-ref qualifier detection._ 

* `#include <scl/utility/preprocessor/forward.h>`
* `#include <type_traits>`
































































## Macros

| Type | Name |
| ---: | :--- |
| define  | [**SCL\_HAS\_QUALIFIED\_METHOD**](has__qualified__method_8h.md#define-scl_has_qualified_method) (method, Type, ...) <br>_Compile-time predicate: checks whether_ `Type` _has a_**dedicated** _overload of_`method` _whose cv-ref qualifiers exactly match those of_`Type` _._ |
| define  | [**SCL\_HQM\_CALL**](has__qualified__method_8h.md#define-scl_hqm_call) (method, quals) `::std::declval&lt;Obj quals&gt;().method(::std::declval&lt;S\_c\_L\_Args\_&gt;()...)`<br> |
| define  | [**SCL\_HQM\_SAME**](has__qualified__method_8h.md#define-scl_hqm_same) (method, left\_quals, right\_quals) `/* multi line expression */`<br> |

## Macro Definition Documentation





### define SCL\_HAS\_QUALIFIED\_METHOD 

_Compile-time predicate: checks whether_ `Type` _has a_**dedicated** _overload of_`method` _whose cv-ref qualifiers exactly match those of_`Type` _._
```C++
#define SCL_HAS_QUALIFIED_METHOD (
    method,
    Type,
    ...
) 
```



In C++ a method qualified as `const&` is implicitly callable on a mutable lvalue, because a mutable reference converts to a const one. A simple `requires` expression therefore cannot distinguish "the
class has a @c const& overload" from "the class has a mutable @c &
overload that is also callable on @c const&".


This macro solves the problem by comparing **return types** of calls with different cv-ref qualifiers. If the return types differ, the class must have separate overloads; if they are the same, the call is assumed to go through implicit cv-widening and the predicate returns `false`.




**
**

For each value category (lvalue / rvalue) the macro:
* Checks callability for all 4 cv combinations (`mutable`, `const`, `volatile`, `const` `volatile`).
* For each pair where the "narrower" qualifier is callable through a "wider" one, compares `decltype` of the two calls. If both return the same type, the narrower call is considered implicit — the overload does not exist for that qualifier.
* For the rvalue `const` case an additional **cross-category** check is performed (see MSVC note below).






**
**

Return-type comparisons (`::std::is_same_v`) are placed inside `if` `constexpr` blocks that first verify callability, ensuring `decltype` is never evaluated on an ill-formed call expression. This avoids the Clang limitation where `requires` `{` `requires` `EXPR`; `}` inside a constexpr-evaluated lambda body is rejected.




**
**

Overloads of the same method name with different cv-ref qualifiers **must** have different return types. If two overloads return the same type, the macro cannot tell them apart and will produce a false negative (report no dedicated overload where one exists). 
```C++
struct Good {
    bool  foo() &;        // bool  ≠ int  → distinguishable
    int   foo() const &;
};
struct Bad {
    int foo() &;          // int == int → indistinguishable!
    int foo() const &;
};
```





**
**

`volatile` overloads follow the same return-type discrimination rules. If the class has both `volatile&` and `const` `volatile&` overloads, their return types must also differ.




**
**

A method without any ref-qualifier (e.g. `void` foo() const) is callable on both lvalues and rvalues. The macro treats such methods as having dedicated overloads for **both** categories, provided the return-type discrimination passes.




**
**

MSVC (as a non-standard extension, enabled by default) allows `const&` ref-qualified member functions to be called on rvalues. This means `can_rv_c` will be `true` even when no `const&&` overload exists. To compensate, the macro performs a **cross-category** return-type comparison: it checks whether the return type of calling through `const&&` differs from calling through `const&`. If they match and no `mutable/const` rvalue return-type difference exists, the `const&&` call is deemed implicit and the predicate returns `false`.




**
**


```C++
struct Target {
    bool  get() &;
    int   get() const &;
    float get() &&;
};

// true  — dedicated & overload exists (bool ≠ int)
static_assert( SCL_HAS_QUALIFIED_METHOD(get, Target &));
// true  — dedicated const& overload exists
static_assert( SCL_HAS_QUALIFIED_METHOD(get, Target const &));
// true  — dedicated && overload exists
static_assert( SCL_HAS_QUALIFIED_METHOD(get, Target &&));
// false — no const&& overload; const& is called implicitly
static_assert(!SCL_HAS_QUALIFIED_METHOD(get, Target const &&));
```





**Parameters:**


* `method` Unqualified method name (may contain `template` keyword for explicit template arguments). 
* `Type` A cv-ref qualified type, e.g. `const` MyClass &. 
* `...` Parameter types for the method call (may be empty). 




        

<hr>



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

