

# Group scl\_utility\_type\_traits



[**Modules**](modules.md) **>** [**scl\_utility\_type\_traits**](group__scl__utility__type__traits.md)



_Type-level utilities for C++ metaprogramming._ 








## Files

| Type | Name |
| ---: | :--- |
| file | [**forward\_like.h**](forward__like_8h.md) <br>_Helpers for forwarding objects with combined cv/ref qualifiers (_ `forward_like_t` _)._ |
| file | [**member\_like.h**](member__like_8h.md) <br>_Traits to build pointers to class members (C++20)._  |










## Public Types

| Type | Name |
| ---: | :--- |
| typedef scl::detail::add\_reference\_like\_t&lt; Base, scl::detail::add\_cv\_from\_t&lt; Base, ::std::remove\_reference\_t&lt; Type &gt; &gt; &gt; | [**forward\_like\_t**](#typedef-forward_like_t)  <br>_Make a type_ `Type` _"look like"_`Base` _for cv-ref qualifiers (matches ::std::forward\_like rules)._ |
| typedef typename ::scl::detail::member\_function\_like&lt; Type, Signature &gt;::type | [**member\_function\_like\_t**](#typedef-member_function_like_t)  <br>_Pointer-to-member-function type for class Type and function Signature, where the member function's cv/ref qualifiers are copied from Type._  |
| typedef typename ::scl::detail::member\_like&lt; Type, Member &gt;::type | [**member\_like\_t**](#typedef-member_like_t)  <br>_Generic pointer-to-member type selector for class Type and Member._  |
| typedef typename ::scl::detail::member\_property\_like&lt; Type, Member &gt;::type | [**member\_property\_like\_t**](#typedef-member_property_like_t)  <br>_Pointer-to-data-member type for class Type and member type Member._  |
















































## Public Types Documentation




### typedef forward\_like\_t 

_Make a type_ `Type` _"look like"_`Base` _for cv-ref qualifiers (matches ::std::forward\_like rules)._
```
using scl::forward_like_t =  scl::detail::add_reference_like_t<Base,
        scl::detail::add_cv_from_t<Base, ::std::remove_reference_t<Type>>>;
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



### typedef member\_function\_like\_t 

_Pointer-to-member-function type for class Type and function Signature, where the member function's cv/ref qualifiers are copied from Type._ 
```
using scl::member_function_like_t =  typename ::scl::detail::member_function_like<Type, Signature>::type;
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
using scl::member_like_t =  typename ::scl::detail::member_like<Type, Member>::type;
```



Selects the appropriate pointer-to-member type based on whether Member is a function type.
* If Member is a function type like `Result(Arguments...)` or `Result(Arguments...) noexcept`, this aliases to [**scl::member\_function\_like\_t&lt;Type, Member&gt;**](group__scl__utility__type__traits.md#typedef-member_function_like_t), producing: `Result (::std::remove_cvref_t<Type>::*)(Arguments...) [cv] [ref] [noexcept]` where:
  * [cv]/[ref] are mirrored from Type (const/volatile and &/&&),
  * [noexcept] is mirrored from T.


* Otherwise, it aliases to [**scl::member\_property\_like\_t&lt;Type, Member&gt;**](group__scl__utility__type__traits.md#typedef-member_property_like_t), producing: `Member (::std::remove_cvref_t<Type>::*)` (see [**member\_property\_like\_t**](group__scl__utility__type__traits.md#typedef-member_property_like_t) for details on how object qualifiers may affect Member).






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
using scl::member_property_like_t =  typename ::scl::detail::member_property_like<Type, Member>::type;
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

------------------------------


