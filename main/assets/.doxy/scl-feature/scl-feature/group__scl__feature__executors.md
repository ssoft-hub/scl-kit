

# Group scl\_feature\_executors



[**Modules**](modules.md) **>** [**scl\_feature\_executors**](group__scl__feature__executors.md)



_Built-in executor strategies for_ `scl::wrapper` _._[More...](#detailed-description)








## Files

| Type | Name |
| ---: | :--- |
| file | [**executors.h**](executors_8h.md) <br>_ScL Feature built-in executor implementations._  |
| file | [**plain.h**](plain_8h.md) <br>_Executor that proxies calls directly to the held value with no overhead._  |
| file | [**uninitialized.h**](uninitialized_8h.md) <br>_Executor that holds a value in uninitialized aligned storage._  |








## Classes

| Type | Name |
| ---: | :--- |
| class | [**scl::feature::inplace::plain**](classscl_1_1feature_1_1inplace_1_1plain.md) &lt;[**typename**](group__scl__feature__type__traits.md#variable-is_executor_v) [**Value**](group__scl__feature__type__traits.md#variable-is_executor_v)&gt;<br>_Executor that proxies calls directly to the held value with no overhead._  |
| class | [**scl::feature::inplace::uninitialized**](classscl_1_1feature_1_1inplace_1_1uninitialized.md) &lt;[**typename**](group__scl__feature__type__traits.md#variable-is_executor_v) [**Value**](group__scl__feature__type__traits.md#variable-is_executor_v)&gt;<br>_Executor that holds_ `Value` _in uninitialized aligned storage._ |


















































## Detailed Description


An executor is a class template that controls how the wrapper stores the held value and dispatches method calls to it. Each executor must provide two static member function templates:



* `execute(self, func, args...)` — runs `func` with `args` and returns its result; may add cross-cutting behaviour around the call.
* `value(self)` — returns a reference to the held value, propagating the cv-ref qualifiers of `self`.





|Executor   |Storage   |Overhead    |
|-----|-----|-----|
|`scl::feature::inplace::plain`   |in-place, direct   |none    |
|`scl::feature::inplace::uninitialized`   |in-place, raw aligned storage   |none   |






    

------------------------------


