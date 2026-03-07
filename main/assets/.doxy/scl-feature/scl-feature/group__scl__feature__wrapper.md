

# Group scl\_feature\_wrapper



[**Modules**](modules.md) **>** [**scl\_feature\_wrapper**](group__scl__feature__wrapper.md)



_Composable value wrapper with pluggable executor strategy._ [More...](#detailed-description)














## Namespaces

| Type | Name |
| ---: | :--- |
| namespace | [**scl**](namespacescl.md) <br>_Root namespace of the ScL project._  |
| namespace | [**scl::feature**](namespacescl_1_1feature.md) <br>_Namespace of the ScL Feature module._  |




## Public Types

| Type | Name |
| ---: | :--- |
| typedef ::std::conditional\_t&lt; sizeof...(Executors)==0, typename ::scl::feature::detail::wrapper\_fold&lt; Value, [**::scl::feature::inplace::plain**](classscl_1_1feature_1_1inplace_1_1plain.md) &gt;::type, typename ::scl::feature::detail::wrapper\_fold&lt; Value, Executors... &gt;::type &gt; | [**wrapper**](#typedef-wrapper)  <br>_Composable proxy wrapper that delegates to_ `Value` _through executors._ |
















































## Detailed Description


A `wrapper<Value, Executors...>` proxies method calls to the held `Value` through a chain of _executors_. Each executor is a class template that can transparently add cross-cutting properties such as copy-on-write semantics, thread safety, or deferred invocation without modifying the wrapped type. Multiple executors are composed via left-fold; adjacent duplicates are collapsed automatically. 


    
## Public Types Documentation




### typedef wrapper 

_Composable proxy wrapper that delegates to_ `Value` _through executors._
```
using scl::wrapper = typedef ::std::conditional_t<sizeof...(Executors) == 0, typename ::scl::feature::detail::wrapper_fold<Value, ::scl::feature::inplace::plain>::type, typename ::scl::feature::detail::wrapper_fold<Value, Executors...>::type>;
```



Each executor is a class template `E` such that `E<Value>` proxies method calls and may add cross-cutting behaviour (e.g. COW, thread safety, deferred invocation). Executors are composed left-to-right; adjacent duplicates in the list are collapsed. Defaults to `feature::inplace::plain` — a zero-overhead direct proxy — when no executor is specified.




**Template parameters:**


* `Value` The wrapped value type. 
* `Executors` Zero or more executor class templates.


```
wrapper<int> a{42};                                   // feature::inplace::plain (default)
wrapper<int, feature::inplace::plain> b{42};          // explicit plain
wrapper<int, feature::inplace::uninitialized> c{};    // deferred construction
```
 


        

<hr>

------------------------------


