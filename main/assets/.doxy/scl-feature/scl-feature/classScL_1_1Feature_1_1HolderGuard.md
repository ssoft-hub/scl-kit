

# Class ScL::Feature::HolderGuard

**template &lt;typename \_HolderRefer&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**HolderGuard**](classScL_1_1Feature_1_1HolderGuard.md)






















## Public Types

| Type | Name |
| ---: | :--- |
| typedef ::std::decay\_t&lt; HolderRefer &gt; | [**Holder**](#typedef-holder)  <br> |
| typedef \_HolderRefer | [**HolderRefer**](#typedef-holderrefer)  <br> |




















## Public Functions

| Type | Name |
| ---: | :--- |
|   | [**HolderGuard**](#function-holderguard-99) (HolderRefer holder) <br> |
|   | [**~HolderGuard**](#function-holderguard) () <br> |




























## Public Types Documentation




### typedef Holder 

```C++
using ScL::Feature::HolderGuard< _HolderRefer >::Holder =  ::std::decay_t<HolderRefer>;
```




<hr>



### typedef HolderRefer 

```C++
using ScL::Feature::HolderGuard< _HolderRefer >::HolderRefer =  _HolderRefer;
```




<hr>
## Public Functions Documentation




### function HolderGuard [9/9]

```C++
inline ScL::Feature::HolderGuard::HolderGuard (
    HolderRefer holder
) 
```




<hr>



### function ~HolderGuard 

```C++
inline ScL::Feature::HolderGuard::~HolderGuard () 
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/access/holder_guard.h`

