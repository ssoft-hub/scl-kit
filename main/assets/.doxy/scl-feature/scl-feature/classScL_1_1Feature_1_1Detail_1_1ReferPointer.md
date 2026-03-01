

# Class ScL::Feature::Detail::ReferPointer

**template &lt;typename \_Refer&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Detail**](namespaceScL_1_1Feature_1_1Detail.md) **>** [**ReferPointer**](classScL_1_1Feature_1_1Detail_1_1ReferPointer.md)



[More...](#detailed-description)

* `#include <refer_pointer.h>`

















## Public Types

| Type | Name |
| ---: | :--- |
| typedef ::std::add\_pointer\_t&lt; Value &gt; | [**RawPointer**](#typedef-rawpointer)  <br> |
| typedef \_Refer | [**Refer**](#typedef-refer)  <br> |
| typedef ::std::remove\_reference\_t&lt; Refer &gt; | [**Value**](#typedef-value)  <br> |




















## Public Functions

| Type | Name |
| ---: | :--- |
|  constexpr | [**ReferPointer**](#function-referpointer-33) (Refer refer) <br> |
|  constexpr Refer | [**operator\***](#function-operator) () const<br> |
|  constexpr RawPointer | [**operator-&gt;**](#function-operator-) () const<br> |




























## Detailed Description


Указатель на ссылку экземпляра значения, который ведет себя как "сырой" указатель (raw pointer), независимо от того переопределен ли оператор & у типа значения или нет. По умолчанию значение указателя нулевое. В случае перемещения указателя, производится операция swap. 


    
## Public Types Documentation




### typedef RawPointer 

```C++
using ScL::Feature::Detail::ReferPointer< _Refer >::RawPointer =  ::std::add_pointer_t<Value>;
```




<hr>



### typedef Refer 

```C++
using ScL::Feature::Detail::ReferPointer< _Refer >::Refer =  _Refer;
```




<hr>



### typedef Value 

```C++
using ScL::Feature::Detail::ReferPointer< _Refer >::Value =  ::std::remove_reference_t<Refer>;
```




<hr>
## Public Functions Documentation




### function ReferPointer [3/3]

```C++
inline constexpr ScL::Feature::Detail::ReferPointer::ReferPointer (
    Refer refer
) 
```




<hr>



### function operator\* 

```C++
inline constexpr Refer ScL::Feature::Detail::ReferPointer::operator* () const
```




<hr>



### function operator-&gt; 

```C++
inline constexpr RawPointer ScL::Feature::Detail::ReferPointer::operator-> () const
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/access/detail/refer_pointer.h`

