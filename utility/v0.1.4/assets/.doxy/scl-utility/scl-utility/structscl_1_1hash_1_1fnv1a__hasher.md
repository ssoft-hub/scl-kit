

# Struct scl::hash::fnv1a\_hasher



[**ClassList**](annotated.md) **>** [**scl**](namespacescl.md) **>** [**hash**](namespacescl_1_1hash.md) **>** [**fnv1a\_hasher**](structscl_1_1hash_1_1fnv1a__hasher.md)



_Callable wrapper around_ [_**fnv1a**_](group__scl__utility__hash.md#function-fnv1a) _for use with_[_**scl::hash::key**_](structscl_1_1hash_1_1key.md) _._

* `#include <fnv1a.h>`

















## Public Types

| Type | Name |
| ---: | :--- |
| typedef ::std::uint64\_t | [**result\_type**](#typedef-result_type)  <br> |




















## Public Functions

| Type | Name |
| ---: | :--- |
|  result\_type | [**operator()**](#function-operator) (Range const & range) noexcept const<br> |




























## Public Types Documentation




### typedef result\_type 

```C++
using scl::hash::fnv1a_hasher::result_type =  ::std::uint64_t;
```




<hr>
## Public Functions Documentation




### function operator() 

```C++
template<::std::ranges::range Range>
inline result_type scl::hash::fnv1a_hasher::operator() (
    Range const & range
) noexcept const
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/utility/src/scl/utility/hash/fnv1a.h`

