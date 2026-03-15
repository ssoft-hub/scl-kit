

# Namespace scl::feature



[**Namespace List**](namespaces.md) **>** [**feature**](namespacescl_1_1feature.md)



_Namespace of the ScL Feature module._ 














## Namespaces

| Type | Name |
| ---: | :--- |
| namespace | [**concepts**](namespacescl_1_1feature_1_1concepts.md) <br>_C++20 concepts for ScL Feature types._  |
| namespace | [**inplace**](namespacescl_1_1feature_1_1inplace.md) <br> |




## Public Types

| Type | Name |
| ---: | :--- |
| typedef detail::wrapper\_guard&lt; [**Refer**](group__scl__feature__type__traits.md#variable-is_wrapper_v), [**::scl::feature::is\_wrapper\_v**](group__scl__feature__type__traits.md#variable-is_wrapper_v)&lt;::std::remove\_cvref\_t&lt; [**Refer**](group__scl__feature__type__traits.md#variable-is_wrapper_v) &gt; &gt; ? detail::wrapper\_guard\_case::wrapper :detail::wrapper\_guard\_case::value &gt; | [**wrapper\_guard**](#typedef-wrapper_guard)  <br>_RAII guard providing access to the value held by a wrapper or a plain reference._  |
















































## Public Types Documentation




### typedef wrapper\_guard 

_RAII guard providing access to the value held by a wrapper or a plain reference._ 
```C++
using scl::feature::wrapper_guard = typedef detail::wrapper_guard<Refer, ::scl::feature::is_wrapper_v<::std::remove_cvref_t<Refer> > ? detail::wrapper_guard_case::wrapper : detail::wrapper_guard_case::value>;
```



For wrapper types calls `guard()` on the executor at construction and `unguard()` at destruction (both are no-ops if the executor does not define them). Exposes `value()` to reach the stored value with the same cv- and ref-qualifiers as the incoming reference.


For non-wrapper types simply holds the reference; no guard/unguard is performed.




**Template parameters:**


* `Refer` Reference type — either `wrapper<V,E>` cv-ref or a plain value cv-ref.


```C++
wrapper<int, feature::inplace::plain> w{42};
feature::wrapper_guard<decltype(w) &> g{w};
// g.value() == 42
```
 


        

<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature.h`

