

# Struct scl::hash::djb2\_hasher



[**ClassList**](annotated.md) **>** [**scl**](namespacescl.md) **>** [**hash**](namespacescl_1_1hash.md) **>** [**djb2\_hasher**](structscl_1_1hash_1_1djb2__hasher.md)



_Callable wrapper around_ [_**djb2**_](namespacescl_1_1hash.md#function-djb2) _for use with_[_**scl::hash::key**_](structscl_1_1hash_1_1key.md) _._

* `#include <djb2.h>`

















## Public Types

| Type | Name |
| ---: | :--- |
| typedef ::std::uint64\_t | [**result\_type**](#typedef-result_type)  <br> |




















## Public Functions

| Type | Name |
| ---: | :--- |
|  requires ::std::convertible\_to&lt;::std::ranges::range\_value\_t&lt; Range &gt;, ::std::uint8\_t &gt; constexpr result\_type | [**operator()**](#function-operator) (Range const & range) noexcept const<br> |




























## Public Types Documentation




### typedef result\_type 

```C++
using scl::hash::djb2_hasher::result_type =  ::std::uint64_t;
```




<hr>
## Public Functions Documentation




### function operator() 

```C++
template<::std::ranges::range Range>
inline requires ::std::convertible_to<::std::ranges::range_value_t< Range >, ::std::uint8_t > constexpr result_type scl::hash::djb2_hasher::operator() (
    Range const & range
) noexcept const
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/utility/src/scl/utility/hash/djb2.h`

