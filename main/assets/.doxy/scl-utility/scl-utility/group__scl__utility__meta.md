

# Group scl\_utility\_meta



[**Modules**](modules.md) **>** [**scl\_utility\_meta**](group__scl__utility__meta.md)



_Meta-level utilities for C++._ 








## Files

| Type | Name |
| ---: | :--- |
| file | [**enum.h**](enum_8h.md) <br>_Compile-time enumeration introspection utilities (C++20)._  |
| file | [**symbol.h**](symbol_8h.md) <br>_Compile-time symbol (function, method, property) name extraction (C++20)._  |
| file | [**type.h**](type_8h.md) <br>_Traits for compile-time type name extraction (C++20)._  |






























## Public Functions

| Type | Name |
| ---: | :--- |
|  requires ::std::is\_enum\_v&lt; decltype(V)&gt;constexpr ::std::string\_view | [**enum\_name**](#function-enum_name) () noexcept<br>_Retrieves the qualified string name of an enum member at compile-time._  |
|  requires ::std::is\_enum\_v&lt; decltype(V)&gt;constexpr ::std::string\_view | [**enum\_short\_name**](#function-enum_short_name) () noexcept<br>_Retrieves the short string name of an enum member at compile-time._  |
|  constexpr ::std::string\_view | [**symbol\_name**](#function-symbol_name) () noexcept<br>_Retrieves the qualified string name of a symbol at compile-time._  |
|  constexpr ::std::string\_view | [**symbol\_short\_name**](#function-symbol_short_name) () noexcept<br>_Retrieves the short string name of a symbol at compile-time._  |
|  constexpr auto | [**type\_name**](#function-type_name) () noexcept<br>_Retrieves the string name of the template type T at compile-time._  |
|  constexpr auto | [**type\_short\_name**](#function-type_short_name) () noexcept<br>_Retrieves the short name of the template type T at compile-time._  |




























## Public Functions Documentation




### function enum\_name 

_Retrieves the qualified string name of an enum member at compile-time._ 
```
template<auto V>
requires ::std::is_enum_v< decltype(V)>constexpr ::std::string_view enum_name () noexcept
```





**Template parameters:**


* `V` The enum value whose name needs to be extracted. 



**Returns:**

A ::std::string\_view containing the qualified name of the enum member.


Extracts the enum member name from the function signature. On MSVC, it automatically removes the 'enum ' prefix for consistency.




**Note:**

The result usually includes the enum type name (e.g., "Color::Red") depending on how the enum was defined and the compiler used.



```
enum class Color { Red };
constexpr auto name = ::scl::enum_name<Color::Red>(); // Returns "Color::Red"
```
 


        

<hr>



### function enum\_short\_name 

_Retrieves the short string name of an enum member at compile-time._ 
```
template<auto V>
requires ::std::is_enum_v< decltype(V)>constexpr ::std::string_view enum_short_name () noexcept
```





**Template parameters:**


* `V` The enum value. 



**Returns:**

A ::std::string\_view containing only the member name (e.g., "Red").


This is a convenience wrapper that takes the result of [**scl::enum\_name&lt;V&gt;()**](group__scl__utility__meta.md#function-enum_name) and strips all type and namespace qualifiers.



```
namespace gfx { enum class Mode { Fast }; }
constexpr auto name = ::scl::enum_short_name<gfx::Mode::Fast>(); // Returns "Fast"
```
 


        

<hr>



### function symbol\_name 

_Retrieves the qualified string name of a symbol at compile-time._ 
```
template<auto S>
constexpr ::std::string_view symbol_name () noexcept
```





**Template parameters:**


* `S` Pointer to the symbol (global function, class method, or data member). 



**Returns:**

A ::std::string\_view containing the qualified name of the symbol.


This function extracts the symbol name from the decorated signature and performs aggressive cleanup of compiler-specific artifacts such as:
* Address operators ('&')
* Parentheses used for grouping (common on MSVC for global variables)
* Leading and trailing whitespace





```
struct Processor { void run() {} };
constexpr auto name = ::scl::symbol_name<&Processor::run>(); // "Processor::run"

int global_var = 0;
constexpr auto var_name = ::scl::symbol_name<&global_var>(); // "global_var"
```
 


        

<hr>



### function symbol\_short\_name 

_Retrieves the short string name of a symbol at compile-time._ 
```
template<auto S>
constexpr ::std::string_view symbol_short_name () noexcept
```





**Template parameters:**


* `S` Pointer to the symbol. 



**Returns:**

A ::std::string\_view containing only the symbol identifier (e.g., "run").


Strips all namespace and class qualifiers from the result of [**scl::symbol\_name&lt;S&gt;()**](group__scl__utility__meta.md#function-symbol_name). Ideal for reflection-like tasks where only the member name is required.



```
namespace sys { struct Clock { static void tick() {} }; }
constexpr auto name = ::scl::symbol_short_name<sys::Clock::tick>(); // "tick"
```
 


        

<hr>



### function type\_name 

_Retrieves the string name of the template type T at compile-time._ 
```
template<typename T>
constexpr auto type_name () noexcept
```





**Template parameters:**


* `T` The type whose name needs to be extracted. 



**Returns:**

A ::std::string\_view containing the human-readable name of the type.


This function uses compiler-specific macros (`__FUNCSIG__` on MSVC and `__PRETTY_FUNCTION__` on GCC/Clang) to extract the type name from the decorated function signature. The result is evaluated at compile-time.




**Note:**

On MSVC, the output includes 'struct ', 'class ', 'union ' keywords as part of the type name (e.g., "struct MyType" instead of "MyType"). This differs from GCC/Clang which omit these keywords.



```
struct MyType {};
constexpr auto name = ::scl::type_name<MyType>();
// MSVC: Returns "struct MyType"
// GCC/Clang: Returns "MyType"
constexpr auto int_name = ::scl::type_name<int>(); // Returns "int" on all compilers
```
 


        

<hr>



### function type\_short\_name 

_Retrieves the short name of the template type T at compile-time._ 
```
template<typename T>
constexpr auto type_short_name () noexcept
```





**Template parameters:**


* `T` The type whose name needs to be extracted. 



**Returns:**

A ::std::string\_view containing the name of the type without namespaces, class qualifiers, or template arguments.


This function first extracts the full name using [**scl::type\_name&lt;T&gt;()**](group__scl__utility__meta.md#function-type_name), then strips all leading namespace and class scopes by finding the last '::' delimiter, and finally removes template arguments by cutting off everything from '&lt;' onwards.



```
namespace app::core {
    template<typename T> struct Task {};
}
constexpr auto full = ::scl::type_name<app::core::Task<int>>();  // "app::core::Task<int>"
constexpr auto name = ::scl::type_short_name<app::core::Task<int>>(); // "Task"
```
 


        

<hr>

------------------------------


