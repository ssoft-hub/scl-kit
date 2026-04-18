

# File method.h



[**FileList**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**reflection**](dir_262f3534dca743723347393893d6556e.md) **>** [**method.h**](method_8h.md)

[Go to the source code of this file](method_8h_source.md)

_Compile-time method reflection macros for wrapper types._ [More...](#detailed-description)

* `#include <scl/feature/reflection/access.h>`
* `#include <scl/feature/reflection/type.h>`
* `#include <scl/feature/type_traits/executor.h>`
* `#include <scl/feature/type_traits/has_qualified_method.h>`
* `#include <scl/feature/wrapper_cast.h>`
* `#include <scl/utility/preprocessor/forward.h>`
* `#include <type_traits>`
* `#include <utility>`
































































## Macros

| Type | Name |
| ---: | :--- |
| define  | [**SCL\_EXECUTE\_OVERRIDED**](method_8h.md#define-scl_execute_overrided) (method, cv\_ref) `/* multi line expression */`<br> |
| define  | [**SCL\_EXECUTE\_TEMPLATE\_OVERRIDED**](method_8h.md#define-scl_execute_template_overrided) (caller, cv\_ref) `/* multi line expression */`<br> |
| define  | [**SCL\_EXECUTOR\_METHOD\_OVERRIDED**](method_8h.md#define-scl_executor_method_overrided) (method, cv\_ref) `/* multi line expression */`<br> |
| define  | [**SCL\_REFLECT\_METHOD**](method_8h.md#define-scl_reflect_method) (method) `/* multi line expression */`<br>_Generates proxy methods that reflect_ `method` _from the wrapped object through the executor, for all 8 cv-ref qualifier combinations._ |
| define  | [**SCL\_REFLECT\_METHOD\_BASE**](method_8h.md#define-scl_reflect_method_base) (method, cv\_ref) `/* multi line expression */`<br> |
| define  | [**SCL\_REFLECT\_METHOD\_CALLER**](method_8h.md#define-scl_reflect_method_caller) (method) `/* multi line expression */`<br> |
| define  | [**SCL\_REFLECT\_METHOD\_EXECUTOR\_OVERRIDE\_BASE**](method_8h.md#define-scl_reflect_method_executor_override_base) (method, cv\_ref) `/* multi line expression */`<br> |
| define  | [**SCL\_REFLECT\_METHOD\_EXEC\_HELPERS**](method_8h.md#define-scl_reflect_method_exec_helpers) (method) `/* multi line expression */`<br> |
| define  | [**SCL\_REFLECT\_METHOD\_HELPER**](method_8h.md#define-scl_reflect_method_helper) (method, caller, cv\_ref) `/* multi line expression */`<br> |
| define  | [**SCL\_REFLECT\_METHOD\_QUALS**](method_8h.md#define-scl_reflect_method_quals) (method) `/* multi line expression */`<br> |
| define  | [**SCL\_REFLECT\_TEMPLATE\_METHOD\_BASE**](method_8h.md#define-scl_reflect_template_method_base) (method, caller, cv\_ref) `/* multi line expression */`<br> |

## Detailed Description


Provides macros to automatically generate proxy methods that forward calls from a wrapper class to the held object through an executor, preserving cv-ref qualifiers exactly.


Every generated overload dispatches through `Executor::execute` so that executor strategies (e.g. locking executors) can intercept every call.


The executor is located at runtime via `scl::feature::executor_trait`, which must be specialized for each wrapper type.




**
**


* Declare the wrapper type with `SCL_REFLECT_TYPE(Type,Member)` (after the executor member declaration).
* Specialize `scl::feature::executor_trait` for the wrapper type.
* The executor type must provide:
  * a static `value(exec)` method that returns a reference to the wrapped object; and
  * a static `execute(exec, callable, args...)` method that invokes `callable(args...)` in the executor's context and returns its result.








**
**


```C++
struct MyWrapper;
template <>
struct scl::feature::executor_trait<MyWrapper> {
    template <typename Self>
    static constexpr decltype(auto) executor(Self && self)
    { return ::scl::forward_like<Self>(self.m_exec); }
};
struct MyWrapper {
    Executor m_exec;
    SCL_REFLECT_TYPE(MyWrapper, m_exec);

    SCL_REFLECT_METHOD(foo)
    SCL_REFLECT_METHOD(bar)
};
```
 





    
## Macro Definition Documentation





### define SCL\_EXECUTE\_OVERRIDED 

```C++
#define SCL_EXECUTE_OVERRIDED (
    method,
    cv_ref
) `/* multi line expression */`
```




<hr>



### define SCL\_EXECUTE\_TEMPLATE\_OVERRIDED 

```C++
#define SCL_EXECUTE_TEMPLATE_OVERRIDED (
    caller,
    cv_ref
) `/* multi line expression */`
```




<hr>



### define SCL\_EXECUTOR\_METHOD\_OVERRIDED 

```C++
#define SCL_EXECUTOR_METHOD_OVERRIDED (
    method,
    cv_ref
) `/* multi line expression */`
```




<hr>



### define SCL\_REFLECT\_METHOD 

_Generates proxy methods that reflect_ `method` _from the wrapped object through the executor, for all 8 cv-ref qualifier combinations._
```C++
#define SCL_REFLECT_METHOD (
    method
) `/* multi line expression */`
```



For each of the 8 cv-ref qualifiers (`&`, `&&`, `const&`, `const&&`, `volatile&`, `volatile&&`, `const` `volatile&`, `const` `volatile&&`) three overloads are generated:
* one **executor-override** overload — `template<typename`... A\_r\_g\_s\_\_&gt;, active when `Executor::method_##method` exists
* one **execute-path** overload — `template<typename`... A\_r\_g\_s\_\_&gt;, active when no executor override is found
* one with **explicit** template arguments — `template<typename\` P\_a\_r\_a\_m\_\_,\ typename... P\_a\_r\_a\_m\_s\_\_,\ typename... A\_r\_g\_s\_\_&gt;




This gives 24 overloads in total (3 × 8); the executor-override and execute-path overloads are mutually exclusive via their `requires` clauses, so at most 16 are active for any given executor.




**
**

If the executor provides a static `method_##method(Executor cv_ref, args...)` member whose first parameter matches the wrapper's cv-ref qualification **exactly** (detected via a function-pointer cast, the same technique as `has_execute_v`), the reflected method calls that member directly, bypassing `Executor::execute`. This lets the executor provide a custom implementation for specific methods.


If no such member exists, the execute-path overload is activated instead.




**
**

When no executor override is found, the call is routed through `Executor::execute(exec, callable, args...)` so that executor strategies (e.g. locking, tracing) can intercept it. The callable receives the same `args`... and invokes the method on the wrapped value.


The executor is obtained at runtime via `scl::feature::executor_trait <WrapperType>::executor(self)`. There is no default implementation of `executor_trait` — every wrapper type must provide an explicit specialization.


The wrapped value is then obtained by calling `Executor::value(executor_ref)`.




**
**

Each non-template overload has one `requires` clause with two conditions:
* The wrapped object's `method` must be callable with the given arguments (after `scl::wrapper_cast`) for the particular cv-ref qualification.
* `SCL_HAS_QUALIFIED_METHOD` must confirm that the wrapped object has a **dedicated** overload for that qualifier (not an implicit cv-widening fallback). This prevents, for example, a `const&` proxy from being generated when only a mutable `&` overload exists on the target.




Explicit-template overloads use `method##_S_c_L_template_quals_` for qualifier discrimination instead of `method##_S_c_L_quals_`. The struct template forwards to `SCL_HAS_QUALIFIED_METHOD` with the token sequence `template` `method<P`,Ps...&gt; (assembled via `SCL_FORWARD`) so it works even for purely-template methods where deduction without explicit arguments would fail — see `SCL_REFLECT_TEMPLATE_METHOD_BASE` for details.




**
**

Because `SCL_HAS_QUALIFIED_METHOD` relies on return-type discrimination, overloads of the target method with different cv-ref qualifiers **must** return different types. If two overloads return the same type, the macro will produce a false negative. 
```C++
struct Good {
    short get() &;       // short ≠ int → distinguishable
    int   get() const &;
};
struct Bad {
    int get() &;         // int == int → macro cannot distinguish
    int get() const &;
};
```





**
**

If `method` is a template on the wrapped object (e.g. `template<typename\` T&gt;\ T\ convert()), users can call the reflected method with explicit template arguments: `wrapper.convert<double>`().


Internally this is handled by two helper constructs generated inside the enclosing class by `SCL_REFLECT_METHOD_CALLER` and `SCL_REFLECT_METHOD_QUALS:` 



* `method##_S_c_L_caller_` — a struct whose static `call<P`,Ps...&gt;(obj, args...) wraps the ``.template `method<P`,Ps...&gt;(args...) call. The object parameter (`O_b_j___`) is dependent, so the `template` keyword appears only in a **dependent** context and name lookup is deferred to instantiation. Without this indirection, ``.template `foo<`...&gt; on a non-dependent type would be a hard parse error (not SFINAE) when `foo` is not a template.
* `method##_S_c_L_quals_` — a variable template that computes the qualifier-discrimination predicate for the deduced-args overload.
* `method##_S_c_L_template_quals_` — a struct template parameterised over `<P`,Ps...&gt; with an inner `value<V`,As...&gt; variable template. Delegates to `SCL_HAS_QUALIFIED_METHOD` with the token sequence `template` `method<P`,Ps...&gt; so that the predicate evaluates the method call with concrete template arguments, handling purely-template methods that do not have any deduction-friendly non-template overload.




When `method` is **not** a template, the `call` function fails to instantiate (SFINAE via trailing return type), the `requires` clause evaluates to `false`, and the explicit-template-args overload is silently discarded.




**
**


```C++
struct Target {
    short get() &;
    int   get() const &;
    float get() &&;

    template <typename T>
    T convert() const &;
};

struct MyWrapper;
template <>
struct scl::feature::executor_trait<MyWrapper> {
    template <typename Self>
    static constexpr decltype(auto) executor(Self && self)
    { return ::scl::forward_like<Self>(self.m_executor); }
};
struct MyWrapper {
    ::scl::feature::inplace::plain<Target> m_executor;
    SCL_REFLECT_TYPE(MyWrapper, m_executor);

    explicit MyWrapper(int v) : m_executor{v} {}

    SCL_REFLECT_METHOD(get)      // 24 generated (3×8), active for &, const&, &&
    SCL_REFLECT_METHOD(convert)  // 24 generated (3×8), only const& survives constraints
};

MyWrapper w{42};
w.get();                // calls Target::get() &  → short(42)

MyWrapper const cw{42};
cw.get();               // calls Target::get() const &  → int(92)

MyWrapper{42}.get();    // calls Target::get() &&  → float(142)

cw.convert<double>();   // calls Target::convert<double>() const &  → 42.0
```





**Parameters:**


* `method` Unqualified method name (plain identifier).



**See also:** [**SCL\_REFLECT\_TYPE**](group__scl__feature__reflection.md#define-scl_reflect_type) 


**See also:** [**scl::feature::executor\_trait**](structscl_1_1feature_1_1executor__trait.md) 



        

<hr>



### define SCL\_REFLECT\_METHOD\_BASE 

```C++
#define SCL_REFLECT_METHOD_BASE (
    method,
    cv_ref
) `/* multi line expression */`
```




<hr>



### define SCL\_REFLECT\_METHOD\_CALLER 

```C++
#define SCL_REFLECT_METHOD_CALLER (
    method
) `/* multi line expression */`
```




<hr>



### define SCL\_REFLECT\_METHOD\_EXECUTOR\_OVERRIDE\_BASE 

```C++
#define SCL_REFLECT_METHOD_EXECUTOR_OVERRIDE_BASE (
    method,
    cv_ref
) `/* multi line expression */`
```




<hr>



### define SCL\_REFLECT\_METHOD\_EXEC\_HELPERS 

```C++
#define SCL_REFLECT_METHOD_EXEC_HELPERS (
    method
) `/* multi line expression */`
```




<hr>



### define SCL\_REFLECT\_METHOD\_HELPER 

```C++
#define SCL_REFLECT_METHOD_HELPER (
    method,
    caller,
    cv_ref
) `/* multi line expression */`
```




<hr>



### define SCL\_REFLECT\_METHOD\_QUALS 

```C++
#define SCL_REFLECT_METHOD_QUALS (
    method
) `/* multi line expression */`
```




<hr>



### define SCL\_REFLECT\_TEMPLATE\_METHOD\_BASE 

```C++
#define SCL_REFLECT_TEMPLATE_METHOD_BASE (
    method,
    caller,
    cv_ref
) `/* multi line expression */`
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/reflection/method.h`

