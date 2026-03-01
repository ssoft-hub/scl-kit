

# Struct ScL::Feature::Detail::Caster

**template &lt;ConceptReference Ref\_&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Detail**](namespaceScL_1_1Feature_1_1Detail.md) **>** [**Caster**](structScL_1_1Feature_1_1Detail_1_1Caster.md)








Inherits the following classes: ScL::Feature::Detail::CastMixIn< Caster< Ref_ >, Ref_ >














## Public Types

| Type | Name |
| ---: | :--- |
| typedef [**::ScL::Feature::ValueLock**](namespaceScL_1_1Feature.md#typedef-valuelock)&lt; Refer &gt; | [**Locker**](#typedef-locker)  <br> |
| typedef Ref\_ | [**Refer**](#typedef-refer)  <br> |




## Public Attributes

| Type | Name |
| ---: | :--- |
|  Locker | [**m\_locker**](#variable-m_locker)  <br> |
















## Public Functions

| Type | Name |
| ---: | :--- |
|   | [**Caster**](#function-caster) (Refer refer) <br> |
|  Type\_ | [**reference**](#function-reference) () <br> |




























## Public Types Documentation




### typedef Locker 

```C++
using ScL::Feature::Detail::Caster< Ref_ >::Locker =  ::ScL::Feature::ValueLock<Refer>;
```




<hr>



### typedef Refer 

```C++
using ScL::Feature::Detail::Caster< Ref_ >::Refer =  Ref_;
```




<hr>
## Public Attributes Documentation




### variable m\_locker 

```C++
Locker ScL::Feature::Detail::Caster< Ref_ >::m_locker;
```




<hr>
## Public Functions Documentation




### function Caster 

```C++
inline ScL::Feature::Detail::Caster::Caster (
    Refer refer
) 
```




<hr>



### function reference 

```C++
template<ConceptReference Type_>
inline Type_ ScL::Feature::Detail::Caster::reference () 
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/cast.h`

