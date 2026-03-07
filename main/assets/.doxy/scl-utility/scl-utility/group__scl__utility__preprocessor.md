

# Group scl\_utility\_preprocessor



[**Modules**](modules.md) **>** [**scl\_utility\_preprocessor**](group__scl__utility__preprocessor.md)



_Helper macros for the C/C++ preprocessor._ [More...](#detailed-description)








## Files

| Type | Name |
| ---: | :--- |
| file | [**counter.h**](counter_8h.md) <br>_Implements a compile-time counter mechanism._  |
| file | [**forward.h**](forward_8h.md) <br>_Provides a utility macro for forcing the expansion of other macros._  |

























































## Macros

| Type | Name |
| ---: | :--- |
| define  | [**SCL\_COUNTER\_NEXT**](group__scl__utility__preprocessor.md#define-scl_counter_next) (Tag) `/* multi line expression */`<br>_Increments a compile-time counter._  |
| define  | [**SCL\_COUNTER\_VALUE**](group__scl__utility__preprocessor.md#define-scl_counter_value) (Tag) <br>_Reads the current value of a compile-time counter._  |
| define  | [**SCL\_FORWARD**](group__scl__utility__preprocessor.md#define-scl_forward) (...) `\_\_VA\_ARGS\_\_`<br>_Identity macro that forwards variadic arguments unchanged and can force expansion of nested macros._  |

## Detailed Description



* Utilities for macro expansion and safe forwarding of tokens.
* Building blocks for more complex preprocessor metaprogramming patterns.
* Designed to be portable and minimal. 




    
## Macro Definition Documentation





### define SCL\_COUNTER\_NEXT 

_Increments a compile-time counter._ 
```
#define SCL_COUNTER_NEXT (
    Tag
) `/* multi line expression */`
```



This macro defines a new `crumb` function overload in the `scl` namespace. This new function is a better match for overload resolution for a specific bit-rank, effectively "setting" that bit and incrementing the counter's value for subsequent reads via `SCL_COUNTER_VALUE`.




**Parameters:**


* `Tag` The unique identifier for the counter to increment. Can be a template type.


```
struct MyCounterTag1 {};

// The counter starts at 0 before any increments
constexpr auto val1_0 = SCL_COUNTER_VALUE(MyCounterTag1);
static_assert(val1_0, 0);

SCL_COUNTER_NEXT(MyCounterTag1)
constexpr auto val1_1 = SCL_COUNTER_VALUE(MyCounterTag1);
static_assert(val1_1, 1);

SCL_COUNTER_NEXT(MyCounterTag1)
constexpr auto val1_2 = SCL_COUNTER_VALUE(MyCounterTag1);
static_assert(val1_2, 2);
```
 


        

<hr>



### define SCL\_COUNTER\_VALUE 

_Reads the current value of a compile-time counter._ 
```
#define SCL_COUNTER_VALUE (
    Tag
) 
```



This macro constructs the counter's value by checking for `crumb` overloads for each bit from 0 to 31. It chains `SCL_COUNTER_CRUMB` calls, where each call resolves to the most specific `crumb` function available for its rank.




**Parameters:**


* `Tag` The unique identifier for the counter. Can be a template type. 



**Returns:**

A `constexpr` value of type `std::uint_fast32_t`.



```
template <typename T>
struct TemplateTag {};
 
// The SCL_FORWARD macro is crucial here
constexpr auto tpl_val_0 = SCL_COUNTER_VALUE(TemplateTag<int>);
static_assert(tpl_val_0 == 0);

SCL_COUNTER_NEXT(TemplateTag<int>)
constexpr auto tpl_val_1 = SCL_COUNTER_VALUE(TemplateTag<int>);
static_assert(tpl_val_1 == 1);

// A different specialization of the same template tag should be a different counter
constexpr auto tpl_val_float_0 = SCL_COUNTER_VALUE(TemplateTag<float>);
static_assert(tpl_val_float_0 == 0);
```
 


        

<hr>



### define SCL\_FORWARD 

_Identity macro that forwards variadic arguments unchanged and can force expansion of nested macros._ 
```
#define SCL_FORWARD (
    ...
) `__VA_ARGS__`
```



This macro simply expands to its variadic arguments. It is useful when:
* You need to forward comma-separated tokens as-is into another macro, function call, or template parameter list.
* You want to force expansion in macro chaining scenarios where another macro yields comma-separated tokens.






**Parameters:**


* `...` Variadic tokens to forward unchanged.



**Note:**


* This macro does not add parentheses or alter tokenization; it only forwards tokens.
* It is safe to use in both C and C++ code. In C++ contexts, it is commonly used with template parameter packs and function calls.





```
// Example 1: Forwarding arguments to a function call
#define CALL(fn, ...) fn(__VA_ARGS__)

int add(int a, int b) { return a + b; }
int result = CALL(add, SCL_FORWARD(1, 2)); // expands to add(1, 2)

// Example 2: Forcing expansion for template parameter lists
#define BASIC_TYPES int, long, double

template <typename... Ts>
struct type_list {};

using tl = type_list<SCL_FORWARD(BASIC_TYPES)>; // expands to type_list<int, long, double>

// Example 3: Chaining macros that produce comma-separated tokens
#define MAKE_PAIR(a, b) a, b
auto p = std::pair<SCL_FORWARD(MAKE_PAIR(int, double))>{1, 2.0};

// Example 4: Forwarding arguments through another macro layer
#define FORWARD_TO_EMPLACE(obj, ...) obj.emplace_back(__VA_ARGS__)

std::vector<std::pair<int, std::string>> v;
FORWARD_TO_EMPLACE(v, SCL_FORWARD(42, "answer")); // emplace_back(42, "answer")
```





**Warning:**


* Be mindful of operator precedence; if you need grouping, use parentheses in the call sites.
* Since macros are global, avoid generic names to reduce collision risk (SCL\_ prefix is used for this reason). 







        

<hr>

------------------------------


