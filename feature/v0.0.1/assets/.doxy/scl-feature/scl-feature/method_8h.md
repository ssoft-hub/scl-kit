

# File method.h



[**FileList**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**reflection**](dir_262f3534dca743723347393893d6556e.md) **>** [**method.h**](method_8h.md)

[Go to the source code of this file](method_8h_source.md)

_Compile-time method reflection macros for wrapper types._ [More...](#detailed-description)

* `#include <scl/feature/reflection/type.h>`
* `#include <scl/feature/type_traits/executor.h>`
* `#include <scl/feature/type_traits/has_qualified_method.h>`
* `#include <scl/utility/preprocessor/forward.h>`
* `#include <type_traits>`
* `#include <utility>`
































































## Macros

| Type | Name |
| ---: | :--- |
| define  | [**SCL\_REFLECT\_METHOD**](method_8h.md#define-scl_reflect_method) (method) `/* multi line expression */`<br>_Generates proxy methods that reflect_ `method` _from the wrapped object through the executor, for all 8 cv-ref qualifier combinations._ |
| define  | [**SCL\_REFLECT\_METHOD\_BASE**](method_8h.md#define-scl_reflect_method_base) (method, cv\_ref) `/* multi line expression */`<br> |
| define  | [**SCL\_REFLECT\_METHOD\_HELPER**](method_8h.md#define-scl_reflect_method_helper) (method, CALLER, cv\_ref) `/* multi line expression */`<br> |
| define  | [**SCL\_REFLECT\_TEMPLATE\_METHOD\_BASE**](method_8h.md#define-scl_reflect_template_method_base) (method, CALLER, cv\_ref) `/* multi line expression */`<br> |
| define  | [**SCL\_VALUE\_ACCESS**](method_8h.md#define-scl_value_access) (cv\_ref) `/* multi line expression */`<br> |
| define  | [**SCL\_VALUE\_DECLVAL**](method_8h.md#define-scl_value_declval) (cv\_ref) `S\_c\_L\_executor\_type\_::value(::std::declval&lt;S\_c\_L\_executor\_type\_ cv\_ref&gt;())`<br> |

## Detailed Description


Provides macros to automatically generate proxy methods that forward calls from a wrapper class to the held object through an executor, preserving cv-ref qualifiers exactly.


The executor is located at runtime via `scl::feature::executor_trait`, which must be specialized for each wrapper type.




**
**


* Declare the wrapper type with `SCL_REFLECT_TYPE(Type,Member)` (after the executor member declaration).
* Specialize `scl::feature::executor_trait` for the wrapper type.
* The executor type must provide a static `value(exec)` method that returns a reference to the wrapped object.






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





### define SCL\_REFLECT\_METHOD 

_Generates proxy methods that reflect_ `method` _from the wrapped object through the executor, for all 8 cv-ref qualifier combinations._
```C++
#define SCL_REFLECT_METHOD (
    method
) `/* multi line expression */`
```



For each of the 8 cv-ref qualifiers (`&`, `&&`, `const&`, `const&&`, `volatile&`, `volatile&&`, `const` `volatile&`, `const` `volatile&&`) two overloads are generated:
* one with **deduced** template arguments — `template<typename`... A\_r\_g\_s\_\_&gt;
* one with **explicit** template arguments — `template<typename\` P\_a\_r\_a\_m\_\_,\ typename... P\_a\_r\_a\_m\_s\_\_,\ typename... A\_r\_g\_s\_\_&gt;




This gives 16 overloads in total (2 × 8).




**
**

The executor is obtained at runtime via `scl::feature::executor_trait <WrapperType>::executor(self)`. The default trait returns `self.m_executor`. Specialize the trait for types that store the executor differently.


The wrapped value is then obtained by calling `Executor::value(executor_ref)`.




**
**

Each overload is constrained by two `requires` clauses:
* The wrapped object's `method` must be callable with the given arguments for the particular cv-ref qualification.
* `SCL_HAS_QUALIFIED_METHOD` must confirm that the wrapped object has a **dedicated** overload for that qualifier (not an implicit cv-widening fallback). This prevents, for example, a `const&` proxy from being generated when only a mutable `&` overload exists on the target.






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


Internally this is handled by a helper struct (`METHOD_S_c_L_caller_`) generated inside the enclosing class. The struct wraps the ``.template `method<`...&gt; call inside a static function template whose object parameter (`O_b_j___`) is dependent. This ensures that the `template` keyword appears only in a **dependent** context, so the compiler defers name lookup to instantiation time. Without this indirection, ``.template `foo<`...&gt; on a **non-dependent** type where `foo` is not a template would be a hard parse error (not SFINAE), even inside a `requires` expression.


When `method` is **not** a template, the helper struct's `call` function fails to instantiate (SFINAE via trailing return type), the `requires` clause evaluates to `false`, and the explicit-template-args overload is silently discarded.




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

    SCL_REFLECT_METHOD(get)      // 16 overloads, constrained to &, const&, &&
    SCL_REFLECT_METHOD(convert)  // 16 overloads, only const& survives constraints
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



**See also:** [**SCL\_REFLECT\_TYPE**](type_8h.md#define-scl_reflect_type) 


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



### define SCL\_REFLECT\_METHOD\_HELPER 

```C++
#define SCL_REFLECT_METHOD_HELPER (
    method,
    CALLER,
    cv_ref
) `/* multi line expression */`
```




<hr>



### define SCL\_REFLECT\_TEMPLATE\_METHOD\_BASE 

```C++
#define SCL_REFLECT_TEMPLATE_METHOD_BASE (
    method,
    CALLER,
    cv_ref
) `/* multi line expression */`
```




<hr>



### define SCL\_VALUE\_ACCESS 

```C++
#define SCL_VALUE_ACCESS (
    cv_ref
) `/* multi line expression */`
```




<hr>



### define SCL\_VALUE\_DECLVAL 

```C++
#define SCL_VALUE_DECLVAL (
    cv_ref
) `S_c_L_executor_type_::value(::std::declval<S_c_L_executor_type_ cv_ref>())`
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/reflection/method.h`

