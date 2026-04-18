

# Struct scl::hash::siphash\_key



[**ClassList**](annotated.md) **>** [**scl**](namespacescl.md) **>** [**hash**](namespacescl_1_1hash.md) **>** [**siphash\_key**](structscl_1_1hash_1_1siphash__key.md)



_128-bit secret key for SipHash._ [More...](#detailed-description)

* `#include <siphash.h>`





















## Public Attributes

| Type | Name |
| ---: | :--- |
|  ::std::uint64\_t | [**k0**](#variable-k0)   = `{}`<br> |
|  ::std::uint64\_t | [**k1**](#variable-k1)   = `{}`<br> |












































## Detailed Description


For **hash-flooding protection** (e.g. in `std::unordered_map`), initialise with a random value at program startup. For **compile-time identifiers** and `switch`/`case` dispatch, a fixed key is sufficient. 


    
## Public Attributes Documentation




### variable k0 

```C++
::std::uint64_t scl::hash::siphash_key::k0;
```




<hr>



### variable k1 

```C++
::std::uint64_t scl::hash::siphash_key::k1;
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/utility/src/scl/utility/hash/siphash.h`

