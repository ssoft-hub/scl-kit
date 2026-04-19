

# Namespace scl



[**Namespace List**](namespaces.md) **>** [**scl**](namespacescl.md)



_Root namespace of SCL project._ 






































## Public Functions

| Type | Name |
| ---: | :--- |
|  decltype(auto) | [**forward\_like**](#function-forward_like) (T && t) noexcept<br>_Forwards a value with the cv-ref qualifiers of_ `Base` _applied to_`T` _'s type, matching ::std::forward\_like semantics._ |




























## Public Functions Documentation




### function forward\_like 

_Forwards a value with the cv-ref qualifiers of_ `Base` _applied to_`T` _'s type, matching ::std::forward\_like semantics._
```C++
template<typename Base, typename T>
decltype(auto) scl::forward_like (
    T && t
) noexcept
```



Example: `forward_like <const T&, x>(some_val)` will forward `some_val` as a `const` lvalue reference if `T` is const. 


        

<hr>

------------------------------
The documentation for this class was generated from the following file `module/utility/src/scl/utility.h`

