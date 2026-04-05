

# Namespace scl



[**Namespace List**](namespaces.md) **>** [**scl**](namespacescl.md)



_Root namespace of the ScL project._ 














## Namespaces

| Type | Name |
| ---: | :--- |
| namespace | [**feature**](namespacescl_1_1feature.md) <br>_Namespace of the ScL Feature module._  |




## Public Types

| Type | Name |
| ---: | :--- |
| typedef ::scl::feature::detail::value\_lock&lt; Refer &gt; | [**value\_lock**](#typedef-value_lock)  <br> |
| typedef ::std::conditional\_t&lt; sizeof...(Executors)==0, typename ::scl::feature::detail::wrapper\_fold&lt; Value, [**::scl::feature::inplace::plain**](classscl_1_1feature_1_1inplace_1_1plain.md) &gt;::type, typename ::scl::feature::detail::wrapper\_fold&lt; Value, Executors... &gt;::type &gt; | [**wrapper**](#typedef-wrapper)  <br> |
| typedef ::scl::feature::detail::wrapper\_caster&lt; Refer &gt; | [**wrapper\_caster**](#typedef-wrapper_caster)  <br> |
| typedef ::scl::feature::detail::wrapper\_guard&lt; Refer &gt; | [**wrapper\_guard**](#typedef-wrapper_guard)  <br> |
| typedef ::scl::feature::detail::wrapper\_lock&lt; Refer &gt; | [**wrapper\_lock**](#typedef-wrapper_lock)  <br> |




















## Public Functions

| Type | Name |
| ---: | :--- |
|  constexpr decltype(auto) | [**wrapper\_cast**](#function-wrapper_cast) (Type && w) noexcept<br> |




























## Public Types Documentation




### typedef value\_lock 

```C++
using scl::value_lock = typedef ::scl::feature::detail::value_lock<Refer>;
```




<hr>



### typedef wrapper 

```C++
using scl::wrapper = typedef ::std::conditional_t<sizeof...(Executors) == 0, typename ::scl::feature::detail::wrapper_fold<Value, ::scl::feature::inplace::plain>::type, typename ::scl::feature::detail::wrapper_fold<Value, Executors...>::type>;
```




<hr>



### typedef wrapper\_caster 

```C++
using scl::wrapper_caster = typedef ::scl::feature::detail::wrapper_caster<Refer>;
```




<hr>



### typedef wrapper\_guard 

```C++
using scl::wrapper_guard = typedef ::scl::feature::detail::wrapper_guard<Refer>;
```




<hr>



### typedef wrapper\_lock 

```C++
using scl::wrapper_lock = typedef ::scl::feature::detail::wrapper_lock<Refer>;
```




<hr>
## Public Functions Documentation




### function wrapper\_cast 

```C++
template<typename Type>
constexpr decltype(auto) scl::wrapper_cast (
    Type && w
) noexcept
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature.h`

