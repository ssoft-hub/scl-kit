

# File expand\_macros.h



[**FileList**](files.md) **>** [**module**](dir_a7b0466279106ea0b8f86f609f621680.md) **>** [**utility**](dir_cca185d4009e66bf68ef58b617abaf60.md) **>** [**src**](dir_ab13fdfb8e4c1ff98b437eee9f69d35c.md) **>** [**scl**](dir_ca45970a26780365ec2accbdb8d8d4fe.md) **>** [**utility**](dir_76f6b7cf5a6cf438d50211f1abeeaae6.md) **>** [**preprocessor**](dir_a3b1215870dd7b05435314af8f203f78.md) **>** [**expand\_macros.h**](expand__macros_8h.md)

[Go to the source code of this file](expand__macros_8h_source.md)

_Provides a utility macro for forcing the expansion of other macros._ [More...](#detailed-description)

































































## Macros

| Type | Name |
| ---: | :--- |
| define  | [**SCL\_EXPAND**](expand__macros_8h.md#define-scl_expand) (...) `\_\_VA\_ARGS\_\_`<br>_Identity macro that forwards variadic arguments unchanged and can force expansion of nested macros._  |

## Detailed Description


Provides small helper macros for token forwarding and macro expansion in C++ codebases. These macros operate at preprocessing time and do not introduce runtime overhead. 


    
## Macro Definition Documentation





### define SCL\_EXPAND 

_Identity macro that forwards variadic arguments unchanged and can force expansion of nested macros._ 
```C++
#define SCL_EXPAND (
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





```C++
// Example 1: Forwarding arguments to a function call
#define CALL(fn, ...) fn(__VA_ARGS__)

int add(int a, int b) { return a + b; }
int result = CALL(add, SCL_EXPAND(1, 2)); // expands to add(1, 2)

// Example 2: Forcing expansion for template parameter lists
#define BASIC_TYPES int, long, double

template <typename... Ts>
struct type_list {};

using tl = type_list<SCL_EXPAND(BASIC_TYPES)>; // expands to type_list<int, long, double>

// Example 3: Chaining macros that produce comma-separated tokens
#define MAKE_PAIR(a, b) a, b
auto p = std::pair<SCL_EXPAND(MAKE_PAIR(int, double))>{1, 2.0};

// Example 4: Forwarding arguments through another macro layer
#define FORWARD_TO_EMPLACE(obj, ...) obj.emplace_back(__VA_ARGS__)

std::vector<std::pair<int, std::string>> v;
FORWARD_TO_EMPLACE(v, SCL_EXPAND(42, "answer")); // emplace_back(42, "answer")
```





**Warning:**


* Be mindful of operator precedence; if you need grouping, use parentheses in the call sites.
* Since macros are global, avoid generic names to reduce collision risk (SCL\_ prefix is used for this reason). 







        

<hr>

------------------------------
The documentation for this class was generated from the following file `module/utility/src/scl/utility/preprocessor/expand_macros.h`

