

# Struct scl::hash::jenkins\_ota\_hasher



[**ClassList**](annotated.md) **>** [**scl**](namespacescl.md) **>** [**hash**](namespacescl_1_1hash.md) **>** [**jenkins\_ota\_hasher**](structscl_1_1hash_1_1jenkins__ota__hasher.md)



_Callable wrapper around_ [_**jenkins\_ota**_](group__scl__utility__hash.md#function-jenkins_ota) _for use with_[_**scl::hash::key**_](structscl_1_1hash_1_1key.md) _._[More...](#detailed-description)

* `#include <jenkins_ota.h>`

















## Public Types

| Type | Name |
| ---: | :--- |
| typedef ::std::uint32\_t | [**result\_type**](#typedef-result_type)  <br> |




















## Public Functions

| Type | Name |
| ---: | :--- |
|  result\_type | [**operator()**](#function-operator) (Range const & range) noexcept const<br> |




























## Detailed Description




**Note:**

`value_type` deduced as `std::uint32_t` (Jenkins OAT is 32-bit). 





    
## Public Types Documentation




### typedef result\_type 

```C++
using scl::hash::jenkins_ota_hasher::result_type =  ::std::uint32_t;
```




<hr>
## Public Functions Documentation




### function operator() 

```C++
template<::std::ranges::range Range>
inline result_type scl::hash::jenkins_ota_hasher::operator() (
    Range const & range
) noexcept const
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/utility/src/scl/utility/hash/jenkins_ota.h`

