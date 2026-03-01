

# Struct ScL::Feature::Implicit::CountedRaw::BaseCounted



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Implicit**](namespaceScL_1_1Feature_1_1Implicit.md) **>** [**CountedRaw**](structScL_1_1Feature_1_1Implicit_1_1CountedRaw.md) **>** [**BaseCounted**](structScL_1_1Feature_1_1Implicit_1_1CountedRaw_1_1BaseCounted.md)










Inherited by the following classes: [ScL::Feature::Implicit::CountedRaw::Counted](structScL_1_1Feature_1_1Implicit_1_1CountedRaw_1_1Counted.md)












## Public Types

| Type | Name |
| ---: | :--- |
| typedef \_Counter | [**Counter**](#typedef-counter)  <br> |
| typedef std::size\_t | [**TypeId**](#typedef-typeid)  <br> |




## Public Attributes

| Type | Name |
| ---: | :--- |
|  Counter | [**m\_counter**](#variable-m_counter)  <br> |
















## Public Functions

| Type | Name |
| ---: | :--- |
|   | [**BaseCounted**](#function-basecounted) () <br> |
| virtual BaseCounted \* | [**clone**](#function-clone) () const = 0<br> |
| virtual TypeId | [**typeId**](#function-typeid) () noexcept const = 0<br> |
| virtual  | [**~BaseCounted**](#function-basecounted) () <br> |




























## Public Types Documentation




### typedef Counter 

```C++
using ScL::Feature::Implicit::CountedRaw< _Counter >::BaseCounted::Counter =  _Counter;
```




<hr>



### typedef TypeId 

```C++
using ScL::Feature::Implicit::CountedRaw< _Counter >::BaseCounted::TypeId =  std::size_t;
```




<hr>
## Public Attributes Documentation




### variable m\_counter 

```C++
Counter ScL::Feature::Implicit::CountedRaw< _Counter >::BaseCounted::m_counter;
```




<hr>
## Public Functions Documentation




### function BaseCounted 

```C++
inline ScL::Feature::Implicit::CountedRaw::BaseCounted::BaseCounted () 
```




<hr>



### function clone 

```C++
virtual BaseCounted * ScL::Feature::Implicit::CountedRaw::BaseCounted::clone () const = 0
```




<hr>



### function typeId 

```C++
virtual TypeId ScL::Feature::Implicit::CountedRaw::BaseCounted::typeId () noexcept const = 0
```




<hr>



### function ~BaseCounted 

```C++
inline virtual ScL::Feature::Implicit::CountedRaw::BaseCounted::~BaseCounted () 
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/tool/implicit/raw.h`

