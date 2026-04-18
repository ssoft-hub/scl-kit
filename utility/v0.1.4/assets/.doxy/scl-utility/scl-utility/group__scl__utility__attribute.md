

# Group scl\_utility\_attribute



[**Modules**](modules.md) **>** [**scl\_utility\_attribute**](group__scl__utility__attribute.md)



_Portable macros for compiler-specific attributes and optimizer hints._ [More...](#detailed-description)








## Files

| Type | Name |
| ---: | :--- |
| file | [**assume.h**](assume_8h.md) <br>_Optimizer hint macros: SCL\_ASSUME and SCL\_UNREACHABLE._  |
| file | [**deprecated.h**](deprecated_8h.md) <br>_Deprecation annotation macros: SCL\_DEPRECATED and SCL\_DEPRECATED\_MSG._  |
| file | [**fallthrough.h**](fallthrough_8h.md) <br>_Intentional switch fall-through annotation macro: SCL\_FALLTHROUGH._  |
| file | [**hotcold.h**](hotcold_8h.md) <br>_Function-frequency hint macros: SCL\_HOT and SCL\_COLD._  |
| file | [**indeterminate.h**](indeterminate_8h.md) <br>_Indeterminate-value annotation macro: SCL\_INDETERMINATE._  |
| file | [**inline.h**](inline_8h.md) <br>_Force-inline and no-inline function annotation macros._  |
| file | [**lifetimebound.h**](lifetimebound_8h.md) <br>_Lifetime-bound parameter annotation macro: SCL\_LIFETIMEBOUND._  |
| file | [**likely.h**](likely_8h.md) <br>_Branch-prediction hint macros: SCL\_LIKELY, SCL\_UNLIKELY, SCL\_LIKELY\_EXPR, SCL\_UNLIKELY\_EXPR._  |
| file | [**maybe\_unused.h**](maybe__unused_8h.md) <br>_Suppress unused-entity warnings: SCL\_MAYBE\_UNUSED._  |
| file | [**no\_unique\_address.h**](no__unique__address_8h.md) <br>_Portable [[no\_unique\_address]] attribute macro._  |
| file | [**nodiscard.h**](nodiscard_8h.md) <br>_Warn-on-discard annotation macros: SCL\_NODISCARD and SCL\_NODISCARD\_MSG._  |
| file | [**noreturn.h**](noreturn_8h.md) <br>_Non-returning function annotation macro: SCL\_NORETURN._  |
| file | [**unsequenced.h**](unsequenced_8h.md) <br>_Pure-function annotation macros: SCL\_UNSEQUENCED and SCL\_REPRODUCIBLE._  |

























































## Macros

| Type | Name |
| ---: | :--- |
| define  | [**SCL\_ASSUME**](group__scl__utility__attribute.md#define-scl_assume) (expr) `((void)(expr))`<br>_Informs the optimizer that_ `expr` _is always true at this point._ |
| define  | [**SCL\_COLD**](group__scl__utility__attribute.md#define-scl_cold)  <br>_Marks a function as called rarely (cold path)._  |
| define  | [**SCL\_DEPRECATED**](group__scl__utility__attribute.md#define-scl_deprecated)  <br>_Marks a declaration as deprecated._  |
| define  | [**SCL\_DEPRECATED\_MSG**](group__scl__utility__attribute.md#define-scl_deprecated_msg) (msg) <br>_Marks a declaration as deprecated with a custom message._  |
| define  | [**SCL\_FALLTHROUGH**](group__scl__utility__attribute.md#define-scl_fallthrough)  `((void)0)`<br>_Suppresses the implicit fall-through warning in a_ `switch` _statement._ |
| define  | [**SCL\_FORCE\_INLINE**](group__scl__utility__attribute.md#define-scl_force_inline)  `inline`<br>_Requests that the compiler always inline the decorated function._  |
| define  | [**SCL\_HOT**](group__scl__utility__attribute.md#define-scl_hot)  <br>_Marks a function as called frequently (hot path)._  |
| define  | [**SCL\_INDETERMINATE**](group__scl__utility__attribute.md#define-scl_indeterminate)  <br>_Explicitly marks a variable as having an indeterminate value, opting in to uninitialised storage for performance._  |
| define  | [**SCL\_LIFETIMEBOUND**](group__scl__utility__attribute.md#define-scl_lifetimebound)  <br>_Marks a function parameter (or implicit_ `*this` _) as lifetime-bound to the return value._ |
| define  | [**SCL\_LIKELY**](group__scl__utility__attribute.md#define-scl_likely)  <br>_Statement attribute that marks a branch as likely to be taken._  |
| define  | [**SCL\_LIKELY\_EXPR**](group__scl__utility__attribute.md#define-scl_likely_expr) (expr) `(!!(expr))`<br>_Expression wrapper that hints the optimizer_ `expr` _is usually true._ |
| define  | [**SCL\_MAYBE\_UNUSED**](group__scl__utility__attribute.md#define-scl_maybe_unused)  <br>_Suppresses compiler warnings about unused variables, parameters, functions, and types._  |
| define  | [**SCL\_NODISCARD**](group__scl__utility__attribute.md#define-scl_nodiscard)  <br>_Warns if the return value of a function (or an object of a type) is discarded by the caller._  |
| define  | [**SCL\_NODISCARD\_MSG**](group__scl__utility__attribute.md#define-scl_nodiscard_msg) (msg) <br>_Like_ [_**SCL\_NODISCARD**_](group__scl__utility__attribute.md#define-scl_nodiscard) _but includes a custom message in the diagnostic._ |
| define  | [**SCL\_NOINLINE**](group__scl__utility__attribute.md#define-scl_noinline)  <br>_Requests that the compiler never inline the decorated function._  |
| define  | [**SCL\_NORETURN**](group__scl__utility__attribute.md#define-scl_noreturn)  <br>_Marks a function that never returns to its caller._  |
| define  | [**SCL\_NO\_UNIQUE\_ADDRESS**](group__scl__utility__attribute.md#define-scl_no_unique_address)  <br>_Portable [[no\_unique\_address]] (C++20)._  |
| define  | [**SCL\_REPRODUCIBLE**](group__scl__utility__attribute.md#define-scl_reproducible) (...) `\_\_VA\_ARGS\_\_`<br>_Wrapping macro that marks a function as having no observable side effects but which may read mutable global or pointer-reachable memory — calls with identical visible state may be deduplicated._  |
| define  | [**SCL\_UNLIKELY**](group__scl__utility__attribute.md#define-scl_unlikely)  <br>_Statement attribute that marks a branch as unlikely to be taken._  |
| define  | [**SCL\_UNLIKELY\_EXPR**](group__scl__utility__attribute.md#define-scl_unlikely_expr) (expr) `(!!(expr))`<br>_Expression wrapper that hints the optimizer_ `expr` _is usually false._ |
| define  | [**SCL\_UNREACHABLE**](group__scl__utility__attribute.md#define-scl_unreachable) () `((void)0)`<br>_Marks the current location as unreachable code._  |
| define  | [**SCL\_UNSEQUENCED**](group__scl__utility__attribute.md#define-scl_unsequenced) (...) `\_\_VA\_ARGS\_\_`<br>_Wrapping macro that marks a function as having no observable side effects and reading no mutable global state — calls may be freely reordered, deduplicated, or eliminated._  |

## Detailed Description



* Layout control: SCL\_NO\_UNIQUE\_ADDRESS.
* Optimizer hints: SCL\_ASSUME, SCL\_UNREACHABLE.
* Inlining control: SCL\_FORCE\_INLINE, SCL\_NOINLINE.
* Control flow: SCL\_NORETURN, SCL\_FALLTHROUGH.
* Diagnostics: SCL\_DEPRECATED, SCL\_DEPRECATED\_MSG, SCL\_NODISCARD, SCL\_NODISCARD\_MSG, SCL\_MAYBE\_UNUSED.
* Branch prediction: SCL\_LIKELY, SCL\_UNLIKELY, SCL\_LIKELY\_EXPR, SCL\_UNLIKELY\_EXPR.
* Pure functions: SCL\_UNSEQUENCED, SCL\_REPRODUCIBLE.
* Uninitialised storage: SCL\_INDETERMINATE.
* Function frequency: SCL\_HOT, SCL\_COLD.
* Lifetime safety: SCL\_LIFETIMEBOUND.
* All macros degrade gracefully on unknown compilers. 




    
## Macro Definition Documentation





### define SCL\_ASSUME 

_Informs the optimizer that_ `expr` _is always true at this point._
```
#define SCL_ASSUME (
    expr
) `((void)(expr))`
```



On most compilers `expr` is **not** evaluated at runtime. Do NOT pass expressions with side effects.


Detection order:
* `__has_cpp_attribute(assume)` (C++23): ``[[assume(expr)]] — standard form, forward-compatible
* MSVC native (not Clang-cl): `__assume(expr)` 
* `__has_builtin(__builtin_assume)` (Clang): `__builtin_assume(expr)` 
* `__has_attribute(assume)` (GCC13+, C++20-compatible extension): `__attribute__`((assume(expr)))
* `__has_builtin(__builtin_unreachable)` (GCC&lt;13 fallback): ``(static\_cast&lt;bool&gt;(expr) ? (void)0 : \_\_builtin\_unreachable())
* Fallback: ``((void)(expr))






**Parameters:**


* `expr` A boolean expression assumed to be always true.


```
void process(int* p) {
    SCL_ASSUME(p != nullptr);
    *p = 42; // optimizer may elide null-check
}
```
 


        

<hr>



### define SCL\_COLD 

_Marks a function as called rarely (cold path)._ 
```
#define SCL_COLD 
```



Instructs the compiler to optimise the function for size rather than speed and to place it in a cold section of the binary, away from hot code. Branches toward a `SCL_COLD` call site are implicitly biased as unlikely. Combines naturally with [**SCL\_NOINLINE**](group__scl__utility__attribute.md#define-scl_noinline) and [**SCL\_NORETURN**](group__scl__utility__attribute.md#define-scl_noreturn).


Detection order:
* `__has_cpp_attribute(gnu::cold)` (GCC, Clang): ``[[gnu::cold]]
* `__has_attribute(cold)` (GCC, Clang older): `__attribute__((cold))` 
* Fallback: empty (no hint)





```
SCL_COLD SCL_NOINLINE void report_oom(std::size_t requested);

SCL_COLD SCL_NORETURN void fatal(const char* msg);
```
 


        

<hr>



### define SCL\_DEPRECATED 

_Marks a declaration as deprecated._ 
```
#define SCL_DEPRECATED 
```



Causes the compiler to emit a warning whenever the decorated entity is used. Apply before the entity: function, class, variable, enum, typedef, etc.


Detection order:
* `__has_cpp_attribute(deprecated)` (C++14): ``[[deprecated]]
* MSVC native (not Clang-cl): `__declspec(deprecated)` 
* `__has_attribute(deprecated)` (GCC, Clang): `__attribute__((deprecated))` 
* Fallback: empty (no annotation; no warning emitted)





```
SCL_DEPRECATED void old_api();

SCL_DEPRECATED struct LegacyHandle { int fd; };
```
 


        

<hr>



### define SCL\_DEPRECATED\_MSG 

_Marks a declaration as deprecated with a custom message._ 
```
#define SCL_DEPRECATED_MSG (
    msg
) 
```



Like [**SCL\_DEPRECATED**](group__scl__utility__attribute.md#define-scl_deprecated) but includes a string literal `msg` in the compiler diagnostic. On compilers that do not support message-bearing deprecation the macro falls back to [**SCL\_DEPRECATED**](group__scl__utility__attribute.md#define-scl_deprecated) (warning without message).


Detection order:
* `__has_cpp_attribute(deprecated)` (C++14): ``[[deprecated(msg)]]
* MSVC native (not Clang-cl): `__declspec(deprecated(msg))` 
* `__has_attribute(deprecated)` (GCC, Clang): `__attribute__`((deprecated(msg)))
* Fallback: empty






**Parameters:**


* `msg` A string literal describing the deprecation reason.


```
SCL_DEPRECATED_MSG("Use new_api() instead") void old_api();
```
 


        

<hr>



### define SCL\_FALLTHROUGH 

_Suppresses the implicit fall-through warning in a_ `switch` _statement._
```
#define SCL_FALLTHROUGH `((void)0)`
```



Place as a statement at the end of a `case` body that intentionally falls through to the next `case`. This silences `-Wimplicit-fallthrough` and the equivalent MSVC warning C26819.


Detection order:
* `__has_cpp_attribute(fallthrough)` (C++17): ``[[fallthrough]]
* `__has_attribute(fallthrough)` (GCC ≥ 7, Clang pre-C++17): `__attribute__((fallthrough))` 
* Fallback: ``((void)0) — silent no-op





```
switch (code) {
case 1:
    prepare();
    SCL_FALLTHROUGH;
case 2:
    execute();
    break;
}
```
 


        

<hr>



### define SCL\_FORCE\_INLINE 

_Requests that the compiler always inline the decorated function._ 
```
#define SCL_FORCE_INLINE `inline`
```



Place before the return type: `SCL_FORCE_INLINE` int foo() { ... } The GCC/Clang branch embeds `inline` in the expansion — do not add it manually.


Detection order:
* MSVC native (not Clang-cl): `__forceinline` 
* `__has_cpp_attribute(gnu::always_inline)` (GCC, Clang): ``[[gnu::always\_inline]] inline
* Fallback: `inline` 





```
SCL_FORCE_INLINE int add(int a, int b) { return a + b; }
```
 


        

<hr>



### define SCL\_HOT 

_Marks a function as called frequently (hot path)._ 
```
#define SCL_HOT 
```



Instructs the compiler to optimise the function more aggressively and place it in a section of the binary that improves instruction-cache locality for hot code. Branches toward a `SCL_HOT` call site are implicitly biased as likely.


Detection order:
* `__has_cpp_attribute(gnu::hot)` (GCC, Clang): ``[[gnu::hot]]
* `__has_attribute(hot)` (GCC, Clang older): `__attribute__((hot))` 
* Fallback: empty (no hint)





```
SCL_HOT void dispatch(const Event& e);

SCL_HOT int lookup(std::uint32_t key);
```
 


        

<hr>



### define SCL\_INDETERMINATE 

_Explicitly marks a variable as having an indeterminate value, opting in to uninitialised storage for performance._ 
```
#define SCL_INDETERMINATE 
```



Corresponds to the C++26 ``[[indeterminate]] attribute. Apply it to a variable declaration to tell the compiler that the initial value is intentionally indeterminate — suppressing any mandatory zero- or default-initialisation that would otherwise be inserted.


Reading the value before writing to it is **undefined** behaviour. Use only when the variable is unconditionally written before its first read.


Detection order:
* `__has_cpp_attribute(indeterminate)` (C++26): ``[[indeterminate]]
* Fallback: empty (variable is initialised normally; no UB, no benefit)





```
void fill(float* dst, float val, std::size_t n) {
    SCL_INDETERMINATE float tmp;  // no zero-init; written unconditionally
    tmp = val * 2.0f;
    for (std::size_t i = 0; i < n; ++i)
        dst[i] = tmp;
}
```
 


        

<hr>



### define SCL\_LIFETIMEBOUND 

_Marks a function parameter (or implicit_ `*this` _) as lifetime-bound to the return value._
```
#define SCL_LIFETIMEBOUND 
```



When applied to a parameter, the compiler warns if the returned reference or pointer outlives the annotated argument (dangling reference detection at compile time).


**Placement** — after the parameter declaration or after the cv-qualifier of a member function: 
```
// Parameter
std::string_view first(const std::string& s SCL_LIFETIMEBOUND);

// Member function (*this is lifetimebound to return value)
class Builder {
    Builder& set(int v) SCL_LIFETIMEBOUND;
};
```



Detection order:
* `__has_cpp_attribute(clang::lifetimebound)` (Clang): ``[[clang::lifetimebound]]
* `__has_attribute(lifetimebound)` (Clang older): `__attribute__((lifetimebound))` 
* Fallback: empty (no lifetime analysis; no warning)






**Note:**

GCC and MSVC do not currently support this attribute. The fallback is always empty on those compilers.



```
const int& clamp(const int& v SCL_LIFETIMEBOUND,
                 const int& lo SCL_LIFETIMEBOUND,
                 const int& hi SCL_LIFETIMEBOUND);

// Dangling reference — Clang warns with SCL_LIFETIMEBOUND:
const int& r = clamp(42, 0, 100);  // temporary args destroyed
```
 


        

<hr>



### define SCL\_LIKELY 

_Statement attribute that marks a branch as likely to be taken._ 
```
#define SCL_LIKELY 
```



Portable wrapper for the C++20 ``[[likely]] statement attribute. Apply it before a statement in an `if` branch or before a label in a `switch` to guide the optimizer's branch-layout decisions.


Detection order:
* `__has_cpp_attribute(likely)` (C++20): ``[[likely]]
* Fallback: empty (no hint; compiles without effect)





```
// if branch
if (condition) SCL_LIKELY { fast_path(); }

// switch label
switch (x) {
SCL_LIKELY case 0: ...
}
```
 


        

<hr>



### define SCL\_LIKELY\_EXPR 

_Expression wrapper that hints the optimizer_ `expr` _is usually true._
```
#define SCL_LIKELY_EXPR (
    expr
) `(!!(expr))`
```



Wraps a boolean or integer expression and returns its value unchanged. On GCC and Clang the hint is communicated via `__builtin_expect`. On MSVC (which uses profile-guided optimisation) the expression passes through unmodified.


Detection order:
* `__has_builtin(__builtin_expect)` (GCC, Clang): `__builtin_expect`(!!(expr), 1)
* Fallback: ``(!!(expr))






**Parameters:**


* `expr` An expression convertible to `bool` (or `int`).


```
if (SCL_LIKELY_EXPR(ptr != nullptr)) {
    // fast path — branch predictor biased here
}
```
 


        

<hr>



### define SCL\_MAYBE\_UNUSED 

_Suppresses compiler warnings about unused variables, parameters, functions, and types._ 
```
#define SCL_MAYBE_UNUSED 
```



Apply to any named entity that may legitimately go unused depending on build configuration (e.g., debug-only variables, platform-specific params, assert-only values).


Detection order:
* `__has_cpp_attribute(maybe_unused)` (C++17): ``[[maybe\_unused]]
* `__has_attribute(unused)` (GCC, Clang pre-C++17): `__attribute__((unused))` 
* Fallback: empty (warning may still fire)





```
void process(int value, SCL_MAYBE_UNUSED int debug_flags) {
    // debug_flags used only in debug builds
    assert(debug_flags >= 0);
    (void)value;
}

SCL_MAYBE_UNUSED static void helper() { ... }
```
 


        

<hr>



### define SCL\_NODISCARD 

_Warns if the return value of a function (or an object of a type) is discarded by the caller._ 
```
#define SCL_NODISCARD 
```



Apply to a function declaration or to a class/struct/enum declaration.


Detection order:
* `__has_cpp_attribute(nodiscard)` ≥ 201907L (C++20): ``[[nodiscard]]
* `__has_cpp_attribute(nodiscard)` (C++17): ``[[nodiscard]]
* `__has_attribute(warn_unused_result)` (GCC, Clang pre-C++17): `__attribute__((warn_unused_result))` 
* Fallback: empty (no warning emitted)





```
SCL_NODISCARD bool try_connect(const char* host);

SCL_NODISCARD struct ErrorCode { int value; };
```
 


        

<hr>



### define SCL\_NODISCARD\_MSG 

_Like_ [_**SCL\_NODISCARD**_](group__scl__utility__attribute.md#define-scl_nodiscard) _but includes a custom message in the diagnostic._
```
#define SCL_NODISCARD_MSG (
    msg
) 
```



The message `msg` is a string literal describing why the return value must not be ignored. On compilers where the message form is unavailable the macro falls back to [**SCL\_NODISCARD**](group__scl__utility__attribute.md#define-scl_nodiscard) (warning without message).


Detection order:
* `__has_cpp_attribute(nodiscard)` ≥ 201907L (C++20): ``[[nodiscard(msg)]]
* `__has_cpp_attribute(nodiscard)` (C++17) or earlier fallback: `SCL_NODISCARD` (message silently dropped)






**Parameters:**


* `msg` A string literal stating the discard consequence.


```
SCL_NODISCARD_MSG("ignoring the error code leaks resources")
ErrorCode write(int fd, const void* buf, std::size_t n);
```
 


        

<hr>



### define SCL\_NOINLINE 

_Requests that the compiler never inline the decorated function._ 
```
#define SCL_NOINLINE 
```



Place before the return type: `SCL_NOINLINE` void cold\_path();


Detection order:
* MSVC native (not Clang-cl): `__declspec(noinline)` 
* `__has_cpp_attribute(gnu::noinline)` (GCC, Clang): ``[[gnu::noinline]]
* Fallback: empty (function compiles without hint)





```
SCL_NOINLINE void cold_path();
```
 


        

<hr>



### define SCL\_NORETURN 

_Marks a function that never returns to its caller._ 
```
#define SCL_NORETURN 
```



Apply before the return type. The compiler may assume that any call to a `SCL_NORETURN` function is a dead end and optimize accordingly. If a decorated function does return, the behaviour is **undefined**.


Typical uses: `std::terminate` wrappers, `throw` helpers, infinite-loop entry points.


Detection order:
* `__has_cpp_attribute(noreturn)` (C++11): ``[[noreturn]] — standard form
* MSVC native (not Clang-cl): `__declspec(noreturn)` 
* `__has_attribute(noreturn)` (GCC, Clang): `__attribute__((noreturn))` 
* Fallback: empty (no annotation; compiler warning may fire)





```
SCL_NORETURN void fatal(const char* msg);

int divide(int a, int b) {
    if (b == 0) fatal("division by zero");
    return a / b;  // no "not all paths return" warning
}
```
 


        

<hr>



### define SCL\_NO\_UNIQUE\_ADDRESS 

_Portable [[no\_unique\_address]] (C++20)._ 
```
#define SCL_NO_UNIQUE_ADDRESS 
```



Detection uses `__has_cpp_attribute` to select the right spelling:
* `__has_cpp_attribute(no_unique_address)`  ``[[no\_unique\_address]]
* `__has_cpp_attribute(msvc::no_unique_address)`  ``[[msvc::no\_unique\_address]]
* Fallback: empty (no layout optimisation; EBO not guaranteed)




MSVC &lt; 19.30 (VS2019 16.9) does not recognise the standard spelling, so step1 returns 0 and step2 picks up the vendor form. Clang-cl supports the standard attribute; `__has_cpp_attribute` returns non-zero for it and the vendor form is never needed.



```
struct Empty {};
struct S { SCL_NO_UNIQUE_ADDRESS Empty e; int value; };
static_assert(sizeof(S) == sizeof(int));
```
 


        

<hr>



### define SCL\_REPRODUCIBLE 

_Wrapping macro that marks a function as having no observable side effects but which may read mutable global or pointer-reachable memory — calls with identical visible state may be deduplicated._ 
```
#define SCL_REPRODUCIBLE (
    ...
) `__VA_ARGS__`
```



Corresponds to the C++26 ``[[reproducible]] attribute and the GCC/Clang ``[[gnu::pure]] / `__attribute__((pure))` extensions. Weaker than SCL\_UNSEQUENCED: the function may read global or pointer-reachable memory but must not modify any state observable outside it.


**Usage — wrap the entire return-type + declarator:** 
```
SCL_REPRODUCIBLE(std::size_t strlen_safe(const char* s));
SCL_REPRODUCIBLE(bool is_sorted(const int* data, std::size_t n));
```



Detection order:
* `__has_cpp_attribute(reproducible)` (C++26): ``[[reproducible]] suffix — `__VA_ARGS__` ``[[reproducible]]
* `__has_cpp_attribute(gnu::pure)` (GCC, Clang): ``[[gnu::pure]] prefix
* `__has_attribute(pure)` (GCC, Clang older): `__attribute__((pure))` prefix
* Fallback: identity — no annotation 




        

<hr>



### define SCL\_UNLIKELY 

_Statement attribute that marks a branch as unlikely to be taken._ 
```
#define SCL_UNLIKELY 
```



Portable wrapper for the C++20 ``[[unlikely]] statement attribute.


Detection order:
* `__has_cpp_attribute(unlikely)` (C++20): ``[[unlikely]]
* Fallback: empty





```
if (error) SCL_UNLIKELY { handle_error(); }

switch (x) {
SCL_UNLIKELY default: ...
}
```
 


        

<hr>



### define SCL\_UNLIKELY\_EXPR 

_Expression wrapper that hints the optimizer_ `expr` _is usually false._
```
#define SCL_UNLIKELY_EXPR (
    expr
) `(!!(expr))`
```



Like [**SCL\_LIKELY\_EXPR**](group__scl__utility__attribute.md#define-scl_likely_expr) but biases the branch predictor toward the false (zero) outcome.


Detection order:
* `__has_builtin(__builtin_expect)` (GCC, Clang): `__builtin_expect`(!!(expr), 0)
* Fallback: ``(!!(expr))






**Parameters:**


* `expr` An expression convertible to `bool` (or `int`).


```
if (SCL_UNLIKELY_EXPR(error_code != 0)) {
    handle_error(error_code);
}
```
 


        

<hr>



### define SCL\_UNREACHABLE 

_Marks the current location as unreachable code._ 
```
#define SCL_UNREACHABLE (
    
) `((void)0)`
```



Invoking this macro in a code path that IS reached is undefined behaviour. Use it to suppress "not all control paths return a value" warnings and to guide the optimizer in dead-code elimination.


Detection order:
* MSVC native (not Clang-cl): `__assume(false)` 
* `__has_builtin(__builtin_unreachable)` (GCC, Clang): `__builtin_unreachable()` 
* Fallback: ``((void)0)





```
int f(Color c) {
    switch (c) {
    case Color::Red:   return 1;
    case Color::Green: return 2;
    }
    SCL_UNREACHABLE();
}
```
 


        

<hr>



### define SCL\_UNSEQUENCED 

_Wrapping macro that marks a function as having no observable side effects and reading no mutable global state — calls may be freely reordered, deduplicated, or eliminated._ 
```
#define SCL_UNSEQUENCED (
    ...
) `__VA_ARGS__`
```



Corresponds to the GCC/Clang ``[[gnu::const]] / `__attribute__((const))` extension, which is the pre-C++26 equivalent of ``[[unsequenced]].


**Usage — wrap the entire return-type + declarator:** 
```
SCL_UNSEQUENCED(int square(int x)) { return x * x; }
SCL_UNSEQUENCED(std::size_t popcount(std::uint64_t v));
```



The macro inserts the attribute in the position appropriate for each form: 
```
int square(int x) [[unsequenced]] { ... }        // C++26  (suffix)
[[gnu::const]] int square(int x) { ... }         // GCC / Clang (prefix)
__attribute__((const)) int square(int x) { ... } // older GCC / Clang
            int square(int x) { ... }            // MSVC / unknown
```



On C++26 the attribute is appended as a suffix after `__VA_ARGS__` and before the function body — the body `{` ... } is not part of the macro argument, so the expansion is valid in both declaration and definition.


A function decorated with `SCL_UNSEQUENCED` must satisfy all of:
* Does not modify any state observable outside the function.
* Does not read any mutable global or thread-local state.
* Return value depends solely on the arguments.




Because calls may be deduplicated, do **not** pass arguments with side effects (e.g. `f`(++i)).


Detection order:
* `__has_cpp_attribute(unsequenced)` (C++26): ``[[unsequenced]] suffix — `__VA_ARGS__` ``[[unsequenced]]
* `__has_cpp_attribute(gnu::const)` (GCC, Clang): ``[[gnu::const]] prefix — ``[[gnu::const]] `__VA_ARGS__` 
* `__has_attribute(const)` (GCC, Clang older): `__attribute__((const))` prefix
* Fallback: identity — no annotation 




        

<hr>

------------------------------


