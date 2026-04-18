

# Group scl\_feature\_type\_traits



[**Modules**](modules.md) **>** [**scl\_feature\_type\_traits**](group__scl__feature__type__traits.md)



_Type-level utilities for ScL Feature metaprogramming._ 








## Files

| Type | Name |
| ---: | :--- |
| file | [**has\_qualified\_method.h**](has__qualified__method_8h.md) <br>_Compile-time predicate macro for cv-ref qualifier detection._  |
| file | [**type\_traits.h**](type__traits_8h.md) <br>_ScL Feature type traits._  |








## Classes

| Type | Name |
| ---: | :--- |
| struct | [**scl::feature::executor\_trait**](structscl_1_1feature_1_1executor__trait.md) &lt;[**typename**](group__scl__feature__type__traits.md#variable-is_executor_v) [**T**](group__scl__feature__type__traits.md#variable-is_executor_v)&gt;<br>_Trait that provides access to the executor inside a wrapper._  |






## Public Attributes

| Type | Name |
| ---: | :--- |
|  constexpr bool | [**has\_execute\_v**](#variable-has_execute_v)   = `/* multi line expression */`<br>`true` _if_`ExecutorType` _has an_`execute()` _method whose first parameter type is exactly_`ExecutorRefer` _._ |
|  constexpr bool | [**has\_guard\_v**](#variable-has_guard_v)   = `/* multi line expression */`<br>`true` _if_`ExecutorType` _has a_`guard()` _method whose first (and only) parameter type is exactly_`ExecutorRefer` _._ |
|  constexpr bool | [**has\_unguard\_v**](#variable-has_unguard_v)   = `/* multi line expression */`<br>`true` _if_`ExecutorType` _has an_`unguard()` _method whose first (and only) parameter type is exactly_`ExecutorRefer` _._ |
|  constexpr bool | [**has\_value\_v**](#variable-has_value_v)   = `/* multi line expression */`<br>`true` _if_`ExecutorType` _has a_`value()` _method whose first (and only) parameter type is exactly_`ExecutorRefer` _._ |
|  constexpr bool | [**is\_compatible\_with\_part\_of\_v**](#variable-is_compatible_with_part_of_v)   = `/* multi line expression */`<br>_Checks whether_ `Expected` _(a wrapper) recursively contains a value that is compatible with_`Test` _(also a wrapper)._ |
|  constexpr bool | [**is\_compatible\_with\_v**](#variable-is_compatible_with_v)   = `/* multi line expression */`<br>_Checks whether_ `Test` _is compatible with (usable in place of)_`Expected` _._ |
|  constexpr bool | [**is\_convertible\_from\_v**](#variable-is_convertible_from_v)   = `/* multi line expression */`<br>_Checks whether_ `Target` _is convertible from_`Refer` _directly or through any level of the wrapper chain._ |
|  constexpr bool | [**is\_executor\_v**](#variable-is_executor_v)   = `/* multi line expression */`<br>`true` _if_`Type` _satisfies the executor interface._ |
|  constexpr bool | [**is\_guard\_noexcept\_v**](#variable-is_guard_noexcept_v)   = `/* multi line expression */`<br>`true` _if_`ExecutorType::guard()` _for_`ExecutorRefer` _either does not exist or is_`noexcept` _._ |
|  constexpr bool | [**is\_part\_compatible\_with\_v**](#variable-is_part_compatible_with_v)   = `/* multi line expression */`<br>_Checks whether_ `Test` _(a wrapper) recursively contains a value that is compatible with_`Expected` _(also a wrapper)._ |
|  constexpr bool | [**is\_unguard\_noexcept\_v**](#variable-is_unguard_noexcept_v)   = `/* multi line expression */`<br>`true` _if_`ExecutorType::unguard()` _for_`ExecutorRefer` _either does not exist or is_`noexcept` _._ |
|  constexpr bool | [**is\_wrapper\_v**](#variable-is_wrapper_v)   = `/* multi line expression */`<br>_Checks whether_ `Type` _is a_`wrapper` _specialization._ |











































## Macros

| Type | Name |
| ---: | :--- |
| define  | [**SCL\_HAS\_QUALIFIED\_METHOD**](group__scl__feature__type__traits.md#define-scl_has_qualified_method) (method, Type, ...) <br>_Compile-time predicate: checks whether_ `Type` _has a_**dedicated** _overload of_ `method` _whose cv-ref qualifiers exactly match those of_`Type` _._ |

## Public Attributes Documentation




### variable has\_execute\_v 

`true` _if_`ExecutorType` _has an_`execute()` _method whose first parameter type is exactly_`ExecutorRefer` _._
```
constexpr bool scl::feature::has_execute_v;
```



The callable parameter is probed as `void(*&)`() (lvalue-reference to function pointer) so that template argument deduction for `Func&&` collapses to an lvalue reference and the cast target type matches exactly. This enforces exact matching on the executor argument while remaining compatible with the universal-reference callable parameter required by the executor interface.




**Template parameters:**


* `ExecutorType` The executor class (cv-unqualified). 
* `ExecutorRefer` The cv-ref-qualified executor reference type. 




        

<hr>



### variable has\_guard\_v 

`true` _if_`ExecutorType` _has a_`guard()` _method whose first (and only) parameter type is exactly_`ExecutorRefer` _._
```
constexpr bool scl::feature::has_guard_v;
```



Detection uses a function-pointer cast, which enforces exact parameter matching — both template (via deduction from cast target) and non-template overloads are supported, but implicit conversions (e.g. binding an rvalue to `const&`) are rejected.




**Template parameters:**


* `ExecutorType` The executor class (cv-unqualified). 
* `ExecutorRefer` The cv-ref-qualified executor reference type. 




        

<hr>



### variable has\_unguard\_v 

`true` _if_`ExecutorType` _has an_`unguard()` _method whose first (and only) parameter type is exactly_`ExecutorRefer` _._
```
constexpr bool scl::feature::has_unguard_v;
```



Detection uses a function-pointer cast, which enforces exact parameter matching — both template (via deduction from cast target) and non-template overloads are supported, but implicit conversions (e.g. binding an rvalue to `const&`) are rejected.




**Template parameters:**


* `ExecutorType` The executor class (cv-unqualified). 
* `ExecutorRefer` The cv-ref-qualified executor reference type.  
* `ExecutorType` The executor class (cv-unqualified). 
* `ExecutorRefer` The cv-ref-qualified executor reference type. 




        

<hr>



### variable has\_value\_v 

`true` _if_`ExecutorType` _has a_`value()` _method whose first (and only) parameter type is exactly_`ExecutorRefer` _._
```
constexpr bool scl::feature::has_value_v;
```



Detection uses a function-pointer cast: the return type is deduced from a trial call, then `&ExecutorType::value` is cast to that exact pointer type. This rejects implicit conversions (e.g. binding an rvalue to `const&`) while correctly handling both template and non-template overloads.




**Template parameters:**


* `ExecutorType` The executor class (cv-unqualified). 
* `ExecutorRefer` The cv-ref-qualified executor reference type. 




        

<hr>



### variable is\_compatible\_with\_part\_of\_v 

_Checks whether_ `Expected` _(a wrapper) recursively contains a value that is compatible with_`Test` _(also a wrapper)._
```
constexpr bool scl::feature::is_compatible_with_part_of_v;
```



Peels layers off `Expected` one at a time; at each level checks whether the unwrapped value is compatible with the whole of `Test` via `is_compatible_with_v`. Returns `false` if either argument is not a `wrapper` specialization. cv-ref qualifiers are stripped from both arguments before the check (`remove_cvref_t`).




**Template parameters:**


* `Expected` Outer wrapper whose contents are inspected. 
* `Test` Wrapper to match against.


```
using W   = wrapper<int,                     feature::inplace::plain>;
using WW  = wrapper<W,                       feature::inplace::plain>;
using WWW = wrapper<WW,                      feature::inplace::plain>;

static_assert( is_compatible_with_part_of_v<WW,  W>);   // WW's inner value IS W
static_assert( is_compatible_with_part_of_v<WWW, W>);   // two levels deep
static_assert(!is_compatible_with_part_of_v<W,  WW>);   // W does not contain WW
static_assert(!is_compatible_with_part_of_v<int, W>);   // Expected not a wrapper
static_assert(!is_compatible_with_part_of_v<W, int>);   // Test not a wrapper
```
 


        

<hr>



### variable is\_compatible\_with\_v 

_Checks whether_ `Test` _is compatible with (usable in place of)_`Expected` _._
```
constexpr bool scl::feature::is_compatible_with_v;
```



For non-wrapper types the check is: `Test` is the same type as `Expected`, or `Test` is publicly derived from `Expected`. For `wrapper` specializations that share the same template-template argument the check is applied recursively to their value types. cv-ref qualifiers are stripped from both arguments before the check (`remove_cvref_t`).




**Template parameters:**


* `Expected` Target type. 
* `Test` Type to verify compatibility of.


```
using P1 = wrapper<int,    feature::inplace::plain>;
using P2 = wrapper<double, feature::inplace::plain>;
using U1 = wrapper<int,    feature::inplace::uninitialized>;

static_assert( is_compatible_with_v<P1, P1>);         // identical types
static_assert( is_compatible_with_v<P1, P1 const &>); // cv-ref stripped
static_assert(!is_compatible_with_v<P1, P2>);         // incompatible value types
static_assert(!is_compatible_with_v<P1, U1>);         // different template param
static_assert(!is_compatible_with_v<int, P1>);        // non-wrapper vs wrapper
static_assert( is_compatible_with_v<int, int>);       // same non-wrapper type
```
 


        

<hr>



### variable is\_convertible\_from\_v 

_Checks whether_ `Target` _is convertible from_`Refer` _directly or through any level of the wrapper chain._
```
constexpr bool scl::feature::is_convertible_from_v;
```



Extends `std::is_convertible` to wrapper chains:
* base case: `Refer` is directly convertible to `Target`, or
* recursive case: `Refer` is a wrapper and `Target` is convertible from the inner value reference type.




This is the condition under which `value_lock<Refer>::lock_for<Target>()` and `value_lock<Refer>::value_as<Target>()` are well-formed.




**Template parameters:**


* `Target` The desired reference type (cv-ref qualified). 
* `Refer` The starting reference type (outermost wrapper or plain value). 




        

<hr>



### variable is\_executor\_v 

`true` _if_`Type` _satisfies the executor interface._
```
constexpr bool scl::feature::is_executor_v;
```



The check requires that the following static methods are callable for the three primary value categories (`Type&`, `Type&&`, `Type` const&):



* `Type::value(Self&&)` — returns a reference to the held value.
* `Type::execute(Self&&, Func&&)` — invokes a callable in the executor's context; checked with a zero-argument `void(*)`().




Optional methods (`guard`, `unguard`) are not part of this check. Non-class types (e.g. `void`, scalars) always yield `false`. cv-ref qualifiers on `Type` are stripped before the check (`remove_cvref_t`).




**Template parameters:**


* `Type` Type to check (cv-ref qualifiers are stripped).



**See also:** scl::feature::concepts::executor

```
static_assert( is_executor_v<feature::inplace::plain<int>>);
static_assert( is_executor_v<feature::inplace::plain<int> const>);  // cv-ref stripped
static_assert(!is_executor_v<int>);
static_assert(!is_executor_v<void>);

template <typename T>
struct MyExecutor {
    using value_type = T;
    T m_value{};
    template <typename Self, typename Func>
    static constexpr decltype(auto) execute(Self&&, Func&& f) { return f(); }
    template <typename Self>
    static constexpr decltype(auto) value(Self&& self) { return forward_like<Self>(self.m_value); }
};
static_assert(is_executor_v<MyExecutor<int>>);
```
 


        

<hr>



### variable is\_guard\_noexcept\_v 

`true` _if_`ExecutorType::guard()` _for_`ExecutorRefer` _either does not exist or is_`noexcept` _._
```
constexpr bool scl::feature::is_guard_noexcept_v;
```





**Template parameters:**


* `ExecutorType` The executor class (cv-unqualified). 
* `ExecutorRefer` The cv-ref-qualified executor reference type. 




        

<hr>



### variable is\_part\_compatible\_with\_v 

_Checks whether_ `Test` _(a wrapper) recursively contains a value that is compatible with_`Expected` _(also a wrapper)._
```
constexpr bool scl::feature::is_part_compatible_with_v;
```



Peels layers off `Test` one at a time; at each level checks whether the unwrapped value is compatible with the whole of `Expected` via `is_compatible_with_v`. Returns `false` if either argument is not a `wrapper` specialization. cv-ref qualifiers are stripped from both arguments before the check (`remove_cvref_t`).




**Template parameters:**


* `Expected` Wrapper to match against. 
* `Test` Outer wrapper whose contents are inspected.


```
using W   = wrapper<int,                     feature::inplace::plain>;
using WW  = wrapper<W,                       feature::inplace::plain>;
using WWW = wrapper<WW,                      feature::inplace::plain>;

static_assert( is_part_compatible_with_v<W,  WW>);    // WW's inner value IS W
static_assert( is_part_compatible_with_v<W,  WWW>);   // two levels deep
static_assert(!is_part_compatible_with_v<WW, W>);     // W does not contain WW
static_assert(!is_part_compatible_with_v<int, W>);    // Expected not a wrapper
static_assert(!is_part_compatible_with_v<W, int>);    // Test not a wrapper
```
 


        

<hr>



### variable is\_unguard\_noexcept\_v 

`true` _if_`ExecutorType::unguard()` _for_`ExecutorRefer` _either does not exist or is_`noexcept` _._
```
constexpr bool scl::feature::is_unguard_noexcept_v;
```





**Template parameters:**


* `ExecutorType` The executor class (cv-unqualified). 
* `ExecutorRefer` The cv-ref-qualified executor reference type. 




        

<hr>



### variable is\_wrapper\_v 

_Checks whether_ `Type` _is a_`wrapper` _specialization._
```
constexpr bool scl::feature::is_wrapper_v;
```



cv-ref qualifiers on `Type` are stripped before the check (`remove_cvref_t`).




**Template parameters:**


* `Type` Type to check.


```
static_assert(!is_wrapper_v<int>);
static_assert( is_wrapper_v<wrapper<int, feature::inplace::plain>>);
static_assert( is_wrapper_v<wrapper<int, feature::inplace::plain> const>);  // cv-ref stripped
```
 


        

<hr>
## Macro Definition Documentation





### define SCL\_HAS\_QUALIFIED\_METHOD 

_Compile-time predicate: checks whether_ `Type` _has a_**dedicated** _overload of_ `method` _whose cv-ref qualifiers exactly match those of_`Type` _._
```
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
```
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


```
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

------------------------------


