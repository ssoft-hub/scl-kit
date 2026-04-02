

# Struct scl::hash::siphash\_hasher

**template &lt;[**siphash\_key**](structscl_1_1hash_1_1siphash__key.md) Key&gt;**



[**ClassList**](annotated.md) **>** [**scl**](namespacescl.md) **>** [**hash**](namespacescl_1_1hash.md) **>** [**siphash\_hasher**](structscl_1_1hash_1_1siphash__hasher.md)



_Callable wrapper around_ [_**siphash**_](namespacescl_1_1hash.md#function-siphash) _for use with_[_**scl::hash::key**_](structscl_1_1hash_1_1key.md) _._[More...](#detailed-description)

* `#include <siphash.h>`

















## Public Types

| Type | Name |
| ---: | :--- |
| typedef ::std::uint64\_t | [**result\_type**](#typedef-result_type)  <br> |




















## Public Functions

| Type | Name |
| ---: | :--- |
|  requires ::std::convertible\_to&lt;::std::ranges::range\_value\_t&lt; Range &gt;, ::std::uint8\_t &gt; constexpr result\_type | [**operator()**](#function-operator) (Range const & range) noexcept const<br> |




























## Detailed Description


The secret key is embedded as a non-type template parameter, so two instantiations with different keys are distinct types.




**Template parameters:**


* `Key` 128-bit SipHash key. Defaults to [**siphash\_default\_key**](namespacescl_1_1hash.md#variable-siphash_default_key). 




    
## Public Types Documentation




### typedef result\_type 

```C++
using scl::hash::siphash_hasher< Key >::result_type =  ::std::uint64_t;
```




<hr>
## Public Functions Documentation




### function operator() 

```C++
template<::std::ranges::range Range>
inline requires ::std::convertible_to<::std::ranges::range_value_t< Range >, ::std::uint8_t > constexpr result_type scl::hash::siphash_hasher::operator() (
    Range const & range
) noexcept const
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/utility/src/scl/utility/hash/siphash.h`

