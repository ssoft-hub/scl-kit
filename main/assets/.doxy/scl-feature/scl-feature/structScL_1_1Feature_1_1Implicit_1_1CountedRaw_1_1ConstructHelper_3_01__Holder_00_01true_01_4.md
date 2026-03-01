

# Struct ScL::Feature::Implicit::CountedRaw::ConstructHelper&lt; \_Holder, true &gt;

**template &lt;typename \_Holder&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Implicit**](namespaceScL_1_1Feature_1_1Implicit.md) **>** [**CountedRaw**](structScL_1_1Feature_1_1Implicit_1_1CountedRaw.md) **>** [**ConstructHelper&lt; \_Holder, true &gt;**](structScL_1_1Feature_1_1Implicit_1_1CountedRaw_1_1ConstructHelper_3_01__Holder_00_01true_01_4.md)






















## Public Types

| Type | Name |
| ---: | :--- |
| typedef typename \_Holder::Access | [**Access**](#typedef-access)  <br> |
| typedef typename \_Holder::CountedPointer | [**CountedPointer**](#typedef-countedpointer)  <br> |






















## Public Static Functions

| Type | Name |
| ---: | :--- |
|  Access | [**access**](#function-access) (CountedPointer) <br> |
|  CountedPointer | [**makePointer**](#function-makepointer) (\_Arguments && ...) <br> |


























## Public Types Documentation




### typedef Access 

```C++
using ScL::Feature::Implicit::CountedRaw< _Counter >::ConstructHelper< _Holder, true >::Access =  typename _Holder::Access;
```




<hr>



### typedef CountedPointer 

```C++
using ScL::Feature::Implicit::CountedRaw< _Counter >::ConstructHelper< _Holder, true >::CountedPointer =  typename _Holder::CountedPointer;
```




<hr>
## Public Static Functions Documentation




### function access 

```C++
static inline Access ScL::Feature::Implicit::CountedRaw::ConstructHelper< _Holder, true >::access (
    CountedPointer
) 
```




<hr>



### function makePointer 

```C++
template<typename... _Arguments>
static inline CountedPointer ScL::Feature::Implicit::CountedRaw::ConstructHelper< _Holder, true >::makePointer (
    _Arguments && ...
) 
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/tool/implicit/raw.h`

