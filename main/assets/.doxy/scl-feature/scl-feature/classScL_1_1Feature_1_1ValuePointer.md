

# Class ScL::Feature::ValuePointer

**template &lt;typename \_WrapperRefer&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**ValuePointer**](classScL_1_1Feature_1_1ValuePointer.md)



[More...](#detailed-description)

* `#include <value_pointer.h>`

















## Public Types

| Type | Name |
| ---: | :--- |
| typedef typename ValueGuard::PointerAccess | [**PointerAccess**](#typedef-pointeraccess)  <br> |
| typedef typename ValueGuard::ValueAccess | [**ValueAccess**](#typedef-valueaccess)  <br> |
| typedef [**::ScL::Feature::ValueGuard**](namespaceScL_1_1Feature.md#typedef-valueguard)&lt; WrapperRefer &gt; | [**ValueGuard**](#typedef-valueguard)  <br> |
| typedef \_WrapperRefer | [**WrapperRefer**](#typedef-wrapperrefer)  <br> |




















## Public Functions

| Type | Name |
| ---: | :--- |
|   | [**ValuePointer**](#function-valuepointer-23) ([**ThisType**](classScL_1_1Feature_1_1ValuePointer.md) && other) <br> |
|   | [**ValuePointer**](#function-valuepointer-33) ([**ThisType**](classScL_1_1Feature_1_1ValuePointer.md) const &) = delete<br> |
|  ValueAccess | [**operator\***](#function-operator) () const<br> |
|  decltype(auto) | [**operator-&gt;**](#function-operator-) () const<br> |
|  void | [**operator=**](#function-operator_1) ([**ThisType**](classScL_1_1Feature_1_1ValuePointer.md) const &) = delete<br> |




























## Detailed Description


Указатель на экземпляр вложенного в Wrapper базового значения, к которому применены все особенности, реализуемые посредством используемых Wrapper. 


    
## Public Types Documentation




### typedef PointerAccess 

```C++
using ScL::Feature::ValuePointer< _WrapperRefer >::PointerAccess =  typename ValueGuard::PointerAccess;
```




<hr>



### typedef ValueAccess 

```C++
using ScL::Feature::ValuePointer< _WrapperRefer >::ValueAccess =  typename ValueGuard::ValueAccess;
```




<hr>



### typedef ValueGuard 

```C++
using ScL::Feature::ValuePointer< _WrapperRefer >::ValueGuard =  ::ScL::Feature::ValueGuard<WrapperRefer>;
```




<hr>



### typedef WrapperRefer 

```C++
using ScL::Feature::ValuePointer< _WrapperRefer >::WrapperRefer =  _WrapperRefer;
```




<hr>
## Public Functions Documentation




### function ValuePointer [2/3]

```C++
inline ScL::Feature::ValuePointer::ValuePointer (
    ThisType && other
) 
```




<hr>



### function ValuePointer [3/3]

```C++
ScL::Feature::ValuePointer::ValuePointer (
    ThisType const &
) = delete
```




<hr>



### function operator\* 

```C++
inline ValueAccess ScL::Feature::ValuePointer::operator* () const
```




<hr>



### function operator-&gt; 

```C++
inline decltype(auto) ScL::Feature::ValuePointer::operator-> () const
```




<hr>



### function operator= 

```C++
void ScL::Feature::ValuePointer::operator= (
    ThisType const &
) = delete
```




<hr>## Friends Documentation





### friend Wrapper 

```C++
template<typename, typename>
class ScL::Feature::ValuePointer::Wrapper (
    ::ScL::Feature::Detail::Wrapper
) 
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/access/value_pointer.h`

