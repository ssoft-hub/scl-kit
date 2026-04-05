

# File executor.h



[**FileList**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**type\_traits**](dir_910e174fc0e8c8ed40843bba5172f2f4.md) **>** [**executor.h**](type__traits_2executor_8h.md)

[Go to the source code of this file](type__traits_2executor_8h_source.md)

_Executor type traits: interface detection and noexcept helpers._ [More...](#detailed-description)

* `#include <type_traits>`
* `#include <utility>`













## Namespaces

| Type | Name |
| ---: | :--- |
| namespace | [**scl**](namespacescl.md) <br>_Root namespace of the ScL project._  |
| namespace | [**feature**](namespacescl_1_1feature.md) <br>_Namespace of the ScL Feature module._  |




















































## Detailed Description


An _executor_ is a class template that implements the strategy used by `scl::wrapper` to store and access its value. The required interface is:



|Method   |Role    |
|-----|-----|
|`static value(Self&&)`   |Returns a reference to the held value.    |
|`static execute(Self&&, Func&&...)`   |Invokes `func` in the executor's context.   |






Optional methods recognized by the framework:



|Method   |Role    |
|-----|-----|
|`static guard(Self&&)`   |Acquires any guard (e.g., mutex lock).    |
|`static unguard(Self&&)`   |Releases the guard acquired by `guard()`.   |






`is_executor_v` detects whether a type satisfies this interface. `executor_trait` is a separate reflection customization point used by `SCL_REFLECT_METHOD` to locate the executor at runtime. 


    

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/type_traits/executor.h`

