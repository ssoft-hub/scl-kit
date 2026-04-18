

# Group scl\_utility\_type\_traits



[**Modules**](modules.md) **>** [**scl\_utility\_type\_traits**](group__scl__utility__type__traits.md)



_Type-level utilities for C++ metaprogramming._ 








## Files

| Type | Name |
| ---: | :--- |
| file | [**detection.h**](detection_8h.md) <br>_Implementation of C++ Standard Proposal N4502 - Detection Idiom._  |
| file | [**forward\_like.h**](forward__like_8h.md) <br>_Helpers for forwarding objects with combined cv/ref qualifiers (_ `forward_like_t` _)._ |
| file | [**member\_like.h**](member__like_8h.md) <br>_Traits to build pointers to class members (C++20)._  |
| file | [**method.h**](method_8h.md) <br>_Provides macros for generating member function detection traits._  |
| file | [**operator.h**](operator_8h.md) <br>_Operator detection traits: compile-time aliases and value checks (Detection Idiom)_  |
| file | [**overload\_cast.h**](overload__cast_8h.md) <br>_Utility for disambiguating function and member function overloads._  |










## Public Types

| Type | Name |
| ---: | :--- |
| typedef detail::detector&lt; Default, void, Operation, Arguments... &gt; | [**detected\_or**](#typedef-detected_or)  <br>_Helper for getting detected type or a default._  |
| typedef typename detected\_or&lt; Default, Operation, Arguments... &gt;::type | [**detected\_or\_t**](#typedef-detected_or_t)  <br>_Gets the type of Operation&lt;Arguments...&gt; or Default if ill-formed._  |
| typedef typename detail::detector&lt; void, void, Operation, Arguments... &gt;::type | [**detected\_t**](#typedef-detected_t)  <br>_Gets the type of Operation&lt;Arguments...&gt; or void if ill-formed._  |
| typedef ::scl::detail::add\_reference\_like\_t&lt; Base, ::scl::detail::add\_cv\_from\_t&lt; Base, ::std::remove\_reference\_t&lt; Type &gt; &gt; &gt; | [**forward\_like\_t**](#typedef-forward_like_t)  <br>_Make a type_ `Type` _"look like"_`Base` _for cv-ref qualifiers (matches ::std::forward\_like rules)._ |
| typedef typename detail::detector&lt; void, void, Operation, Arguments... &gt;::value\_t | [**is\_detected**](#typedef-is_detected)  <br>_Detects whether Operation&lt;Arguments...&gt; is a valid expression._  |
| typedef ::std::is\_convertible&lt; detected\_t&lt; Operation, Arguments... &gt;, To &gt; | [**is\_detected\_convertible**](#typedef-is_detected_convertible)  <br>_Checks if Operation&lt;Arguments... &gt; is convertible to To._  |
| typedef ::std::is\_same&lt; Expected, detected\_t&lt; Operation, Arguments... &gt; &gt; | [**is\_detected\_exact**](#typedef-is_detected_exact)  <br>_Checks if Operation&lt;Arguments...&gt; results in exactly Expected type._  |
| typedef typename ::scl::detail::member\_function\_like&lt; Type, Signature &gt;::type | [**member\_function\_like\_t**](#typedef-member_function_like_t)  <br>_Pointer-to-member-function type for class Type and function Signature, where the member function's cv/ref qualifiers are copied from Type._  |
| typedef typename ::scl::detail::member\_like&lt; Type, Member &gt;::type | [**member\_like\_t**](#typedef-member_like_t)  <br>_Generic pointer-to-member type selector for class Type and Member._  |
| typedef typename ::scl::detail::member\_property\_like&lt; Type, Member &gt;::type | [**member\_property\_like\_t**](#typedef-member_property_like_t)  <br>_Pointer-to-data-member type for class Type and member type Member._  |




## Public Attributes

| Type | Name |
| ---: | :--- |
|  constexpr bool | [**is\_detected\_convertible\_v**](#variable-is_detected_convertible_v)   = `is\_detected\_convertible&lt;To, Operation, Arguments...&gt;::value`<br>_Variable template version of is\_detected\_convertible._  |
|  constexpr bool | [**is\_detected\_exact\_v**](#variable-is_detected_exact_v)   = `is\_detected\_exact&lt;Expected, Operation, Arguments...&gt;::value`<br>_Variable template version of is\_detected\_exact._  |
|  constexpr bool | [**is\_detected\_v**](#variable-is_detected_v)   = `is\_detected&lt;Operation, Arguments...&gt;::value`<br>_Variable template version of is\_detected._  |
|  constexpr detail::overload\_cast&lt; Args... &gt; | [**overload\_cast**](#variable-overload_cast)   = `{}`<br>_A helper utility to select a specific overload of a function or member function._  |
















## Public Functions

| Type | Name |
| ---: | :--- |
|  constexpr decltype(auto) | [**forward\_like**](#function-forward_like) (T && t) noexcept<br>_Forwards a value with the cv-ref qualifiers of_ `Base` _applied to_`T` _'s type, matching ::std::forward\_like semantics._ |



























## Macros

| Type | Name |
| ---: | :--- |
| define  | [**SCL\_FUNCTION\_DETECTION**](group__scl__utility__type__traits.md#define-scl_function_detection) (name) `/* multi line expression */`<br>_Generates a suite of traits to detect the existence of a specific free function._  |
| define  | [**SCL\_METHOD\_DETECTION**](group__scl__utility__type__traits.md#define-scl_method_detection) (name) <br>_Generates a suite of traits to detect the existence of a specific member method._  |

## Public Types Documentation




### typedef detected\_or 

_Helper for getting detected type or a default._ 
```
using scl::detected_or = typedef detail::detector<Default, void, Operation, Arguments...>;
```





**Template parameters:**


* `Default` Type to use if detection fails 
* `Operation` Template to instantiate 
* `Arguments` Arguments for the template

Provides nested type 'type' which is either Operation&lt;Arguments...&gt; if well-formed, or Default otherwise. 


        

<hr>



### typedef detected\_or\_t 

_Gets the type of Operation&lt;Arguments...&gt; or Default if ill-formed._ 
```
using scl::detected_or_t = typedef typename detected_or<Default, Operation, Arguments...>::type;
```





**Template parameters:**


* `Default` Type to use if detection fails 
* `Operation` Template to instantiate 
* `Arguments` Arguments for the template


```
using result = detected_or_t<int, has_foo_t, MyClass>;
```
 


        

<hr>



### typedef detected\_t 

_Gets the type of Operation&lt;Arguments...&gt; or void if ill-formed._ 
```
using scl::detected_t = typedef typename detail::detector<void, void, Operation, Arguments...>::type;
```





**Template parameters:**


* `Operation` Template to instantiate 
* `Arguments` Arguments for the template


```
using result = detected_t<has_foo_t, MyClass>;
```
 


        

<hr>



### typedef forward\_like\_t 

_Make a type_ `Type` _"look like"_`Base` _for cv-ref qualifiers (matches ::std::forward\_like rules)._
```
using scl::forward_like_t = typedef ::scl::detail::add_reference_like_t<Base, ::scl::detail::add_cv_from_t<Base, ::std::remove_reference_t<Type> >>;
```





**Template parameters:**


* `Base` Type providing qualifiers/ref to propagate. 
* `Type` Type to which qualifiers/ref are applied.

Semantics:
* CV-qualifiers: Applies `const` and `volatile` from `Base` onto `remove_reference_t<Type>`. (i.e. union of qualifiers, not replacement)
* Reference: Applies reference category of `Base` (if any). If `Base` is lvalue ref, result is lvalue ref; if rvalue ref, rvalue ref; else no reference. Reference is omitted for void.






**
**


```
using P0 = forward_like_t<int const &, double>            // double const &
using P1 = forward_like_t<int &&, float const>            // float const &&
using P2 = forward_like_t<int volatile, char>             // char volatile
using P3 = forward_like_t<int const volatile &, short>    // short const volatile &
using P4 = forward_like_t<int, double&&>                  // double
```
 





        

<hr>



### typedef is\_detected 

_Detects whether Operation&lt;Arguments...&gt; is a valid expression._ 
```
using scl::is_detected = typedef typename detail::detector<void, void, Operation, Arguments...>::value_t;
```





**Template parameters:**


* `Operation` Template to instantiate 
* `Arguments` Arguments for the template

Alias to std::true\_type if Operation&lt;Arguments...&gt; is well-formed, std::false\_type otherwise.



```
template <typename T>
using has_foo_t = decltype(std::declval<T>().foo());

static_assert(is_detected<has_foo_t, MyClass>::value);
```
 


        

<hr>



### typedef is\_detected\_convertible 

_Checks if Operation&lt;Arguments... &gt; is convertible to To._ 
```
using scl::is_detected_convertible = typedef ::std::is_convertible<detected_t<Operation, Arguments...>, To>;
```





**Template parameters:**


* `To` Target type for conversion 
* `Operation` Template to instantiate 
* `Arguments` Arguments for the template


```
static_assert(is_detected_convertible<double, get_value_t, MyClass>::value);
```
 


        

<hr>



### typedef is\_detected\_exact 

_Checks if Operation&lt;Arguments...&gt; results in exactly Expected type._ 
```
using scl::is_detected_exact = typedef ::std::is_same<Expected, detected_t<Operation, Arguments...> >;
```





**Template parameters:**


* `Expected` The type to compare against 
* `Operation` Template to instantiate 
* `Arguments` Arguments for the template


```
static_assert(is_detected_exact<int, get_value_type_t, MyClass>::value);
```
 


        

<hr>



### typedef member\_function\_like\_t 

_Pointer-to-member-function type for class Type and function Signature, where the member function's cv/ref qualifiers are copied from Type._ 
```
using scl::member_function_like_t = typedef typename ::scl::detail::member_function_like<Type, Signature>::type;
```





**Template parameters:**


* `Type` Object type whose cv/ref qualifiers will be mirrored onto the member function. The class type itself is decayed with ::::std::remove\_cvref\_t before forming the pointer-to-member. 
* `Signature` Non-static member function signature as a function type, e.g. `Result(Arguments...)` or `Result(Arguments...) noexcept`.



**
**


```
struct Foo {};
using P0 = scl::member_function_like_t<Foo, void(int)>;           // void (Foo::*)(int)
using P1 = scl::member_function_like_t<Foo&, void(int)>;          // void (Foo::*)(int) &
using P2 = scl::member_function_like_t<Foo const, void(int)>;     // void (Foo::*)(int) const
using P3 = scl::member_function_like_t<Foo const&&, void() noexcept>; // void (Foo::*)() const && noexcept
```
 





        

<hr>



### typedef member\_like\_t 

_Generic pointer-to-member type selector for class Type and Member._ 
```
using scl::member_like_t = typedef typename ::scl::detail::member_like<Type, Member>::type;
```



Selects the appropriate pointer-to-member type based on whether Member is a function type.
* If Member is a function type like `Result(Arguments...)` or `Result(Arguments...) noexcept`, this aliases to [**scl::member\_function\_like\_t&lt;Type, Member&gt;**](group__scl__utility__type__traits.md#typedef-member_function_like_t), producing: `Result (::std::remove_cvref_t<Type>::*)(Arguments...) [cv] [ref] [noexcept]` where:
  * [cv]/[ref] are mirrored from Type (const/volatile and &/&&),
  * [noexcept] is mirrored from T.


* Otherwise, it aliases to [**scl::member\_property\_like\_t&lt;Type, Member&gt;**](group__scl__utility__type__traits.md#typedef-member_property_like_t), producing: `Member (::std::remove_cvref_t<Type>::*)` (see member\_property\_like\_t for details on how object qualifiers may affect Member).






**Template parameters:**


* `Type` Class (object) type whose cv/ref qualifiers are mirrored for member functions. The class itself is decayed with ::std::remove\_cvref\_t before forming the pointer type. 
* `Member` Either a function type (for member functions) or a non-function type (for data members).



**
**


```
struct Foo {};

// Function members
using M0 = scl::member_like_t<Foo, void(int)>;              // void (Foo::*)(int)
using M1 = scl::member_like_t<Foo const&, void() noexcept>; // void (Foo::*)() const & noexcept

// Data members
using M2 = scl::member_like_t<Foo, int>;        // int Foo::*
using M3 = scl::member_like_t<Foo const, int>;  // int const Foo::*
```
 





        

<hr>



### typedef member\_property\_like\_t 

_Pointer-to-data-member type for class Type and member type Member._ 
```
using scl::member_property_like_t = typedef typename ::scl::detail::member_property_like<Type, Member>::type;
```



Forms the type `Member (::std::remove_cvref_t<Type>::*)`. Object cv/ref qualifiers do not change the pointer type for data members; they only affect access expressions.




**
**


```
using P0 = scl::member_property_like_t<Foo, int>;         // int Foo::*
using P1 = scl::member_property_like_t<Foo const&, int>;  // int const & Foo::*
using P2 = scl::member_property_like_t<Foo, int const>;   // int Foo::*
```
 





        

<hr>
## Public Attributes Documentation




### variable is\_detected\_convertible\_v 

_Variable template version of is\_detected\_convertible._ 
```
constexpr bool scl::is_detected_convertible_v;
```





**Template parameters:**


* `To` Target type for conversion 
* `Operation` Template to instantiate 
* `Arguments` Arguments for the template 




        

<hr>



### variable is\_detected\_exact\_v 

_Variable template version of is\_detected\_exact._ 
```
constexpr bool scl::is_detected_exact_v;
```





**Template parameters:**


* `Expected` The type to compare against 
* `Operation` Template to instantiate 
* `Arguments` Arguments for the template 




        

<hr>



### variable is\_detected\_v 

_Variable template version of is\_detected._ 
```
constexpr bool scl::is_detected_v;
```





**Template parameters:**


* `Operation` Template to instantiate 
* `Arguments` Arguments for the template


```
if constexpr (is_detected_v<has_foo_t, MyClass>) { ... }
```
 


        

<hr>



### variable overload\_cast 

_A helper utility to select a specific overload of a function or member function._ 
```
constexpr detail::overload_cast<Args...> scl::overload_cast;
```



This template class provides a set of call operators that disambiguate overloaded functions based on their argument types (Args...) and qualifiers (const, volatile, lvalue/rvalue references, and noexcept).




**Template parameters:**


* `Args` The exact argument types used to identify the desired overload.


```
struct X {
  void foo(int) &;
  void foo(double) const &;
  void foo(int) const &&;
};

void bar(int);
void bar(double) noexcept;

auto pf1 = overload_cast<int>(&X::foo);        // selects void foo(int) &
auto pf2 = overload_cast<double>(&X::foo);     // selects void foo(double) const &
auto f1  = overload_cast<int>(&bar);           // selects void bar(int)
auto f2  = overload_cast<double>(&bar);        // selects void bar(double) noexcept
```
 


        

<hr>
## Public Functions Documentation




### function forward\_like 

_Forwards a value with the cv-ref qualifiers of_ `Base` _applied to_`T` _'s type, matching ::std::forward\_like semantics._
```
template<typename Base, typename T>
constexpr decltype(auto) forward_like (
    T && t
) noexcept
```



Example: `forward_like<const T&, x>(some_val)` will forward `some_val` as a `const` lvalue reference if `T` is const. 


        

<hr>
## Macro Definition Documentation





### define SCL\_FUNCTION\_DETECTION 

_Generates a suite of traits to detect the existence of a specific free function._ 
```
#define SCL_FUNCTION_DETECTION (
    name
) `/* multi line expression */`
```



For a given name `foo`, this macro generates:



* **Basic Detection** (Supports ADL):
  * `foo_function_operation<Args...>`: The detection alias using `foo(declval<Args>()...)`.
  * `has_foo_function_v<Args...>`: Boolean constant.
  * `foo_function_t<Args...>`: Resulting return type.


* **Exact Detection** (Checks for a specific symbol pointer):
  * `foo_function_exact_operation<Args...>`: Uses `&foo` to verify a specific function exists.
  * `has_foo_function_exact_v<Args...>`: Boolean constant.
  * `foo_function_exact_t<Args...>`: Resulting return type.








**Parameters:**


* `name` The name of the function to detect.



**Warning:**

CRITICAL: This macro MUST be invoked AFTER the target function has been declared. Since the macro expansion takes the address of the function (&name), the symbol must be visible to the compiler at the point of expansion, or a compilation error will occur. 





        

<hr>



### define SCL\_METHOD\_DETECTION 

_Generates a suite of traits to detect the existence of a specific member method._ 
```
#define SCL_METHOD_DETECTION (
    name
) 
```



For a given name `foo`, this macro generates:



* **Basic Detection** (Checks if `val.foo(args...)` is valid):
  * `foo_method_operation<Type, Args...>`: The detection alias.
  * `has_foo_method_v<Type, Args...>`: Boolean constant.
  * `foo_method_t<Type, Args...>`: Resulting return type (or nonesuch).


* **Exact Member Detection** (Checks `&Type::foo` existence and ref-qualifiers):
  * `foo_method_exact_operation<Type, Args...>`: The exact detection alias.
  * `has_foo_method_exact_v<Type, Args...>`: Boolean constant.
  * `foo_method_exact_t<Type, Args...>`: Resulting return type.


* **Basic Static Detection** (Checks if `Type::foo(args...)` is valid):
  * `foo_static_method_operation<Type, Args...>`: The detection alias.
  * `has_foo_static_method_v<Type, Args...>`: Boolean constant.
  * `foo_static_method_t<Type, Args...>`: Resulting return type (or nonesuch).


* **Exact Static Member Detection** (Checks `&Type::foo` existence):
  * `foo_static_method_exact_operation<Type, Args...>`: The exact detection alias.
  * `has_foo_static_method_exact_v<Type, Args...>`: Boolean constant.
  * `foo_static_method_exact_t<Type, Args...>`: Resulting return type.








**Parameters:**


* `name` The name of the member function to detect. 




        

<hr>

------------------------------


