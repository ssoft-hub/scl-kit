

# File reflect.h



[**FileList**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**reflection**](dir_262f3534dca743723347393893d6556e.md) **>** [**reflect.h**](reflect_8h.md)

[Go to the source code of this file](reflect_8h_source.md)

_Primary template for the reflection mixin chain._ [More...](#detailed-description)

* `#include <scl/feature/reflection/method.h>`













## Namespaces

| Type | Name |
| ---: | :--- |
| namespace | [**scl**](namespacescl.md) <br>_Root namespace of the ScL project._  |
| namespace | [**feature**](namespacescl_1_1feature.md) <br>_Namespace of the ScL Feature module._  |


## Classes

| Type | Name |
| ---: | :--- |
| class | [**reflect**](classscl_1_1feature_1_1reflect.md) &lt;[**typename**](group__scl__feature__type__traits.md#variable-is_executor_v) [**Wrapper**](group__scl__feature__type__traits.md#variable-is_executor_v), [**typename**](group__scl__feature__type__traits.md#variable-is_executor_v) [**Executor**](group__scl__feature__type__traits.md#variable-is_executor_v), [**typename**](group__scl__feature__type__traits.md#variable-is_executor_v) [**Type**](group__scl__feature__type__traits.md#variable-is_executor_v)&gt;<br>_Primary (terminal) template for the reflection mixin chain._  |


















































## Detailed Description


Defines `scl::feature::reflect <Wrapper, Executor, Type>` — the CRTP mixin base that `detail::wrapper` inherits from to acquire all proxy members reflected for the held value type.


### How the chain works



`detail::wrapper<Value, Executor>` publicly inherits: 
```C++
reflect<wrapper<Value,Executor>, Executor<Value>, wrapper<Value,Executor>>
```



Two partial specialisations (defined in `detail/wrapper.h`) peel the `detail::wrapper` layer off the third parameter:



* **cv/ref-strip** — `detail::wrapper<QualifiedInner, E>` (where `QualifiedInner` carries cv/ref qualifiers) delegates to the unqualified form, collapsing all 12 variants into one rule.
* **Chain delegation** — `detail::wrapper<Value, E>` (unqualified inner) inherits from `reflect<Wrapper, Executor, Value>`, propagating all members reflected for `Value` up to the outer wrapper.




The **primary template** (this file) is the terminal case: when `Type` is neither a `detail::wrapper` specialisation nor any other specialised form, the class body is empty. User-provided specialisations extend this chain for concrete value types.



### Extending for a custom type



Specialise `reflect` for your value type. `SCL_REFLECT_TYPE` must appear first to introduce the `S_c_L_type_` / `S_c_L_executor_type_` aliases that `SCL_REFLECT_METHOD` depends on:



```C++
template <typename Wrapper, typename Executor>
class scl::feature::reflect<Wrapper, Executor, MyValue>
{
    SCL_REFLECT_TYPE(Wrapper, Executor)
    SCL_REFLECT_METHOD(my_method)
};
```
 



    

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/reflection/reflect.h`

