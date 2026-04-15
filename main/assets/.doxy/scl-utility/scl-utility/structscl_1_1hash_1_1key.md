

# Struct scl::hash::key

**template &lt;concepts::byte\_hasher Hasher&gt;**



[**ClassList**](annotated.md) **>** [**scl**](namespacescl.md) **>** [**hash**](namespacescl_1_1hash.md) **>** [**key**](structscl_1_1hash_1_1key.md)



_Strongly-typed hash digest parameterized by a hash function._ [More...](#detailed-description)

* `#include <key.h>`

















## Public Types

| Type | Name |
| ---: | :--- |
| typedef Hasher | [**hasher\_type**](#typedef-hasher_type)  <br>_The hasher type used to produce this digest._  |
| typedef typename Hasher::result\_type | [**value\_type**](#typedef-value_type)  <br>_Underlying integer type — deduced from the hasher's_ `result_type` _._ |




## Public Attributes

| Type | Name |
| ---: | :--- |
|  [**value\_type**](structscl_1_1hash_1_1key.md#typedef-value_type) | [**value**](#variable-value)   = `{}`<br>_Raw digest value._  |
















## Public Functions

| Type | Name |
| ---: | :--- |
|  constexpr | [**key**](#function-key) (Range const & range) noexcept<br>_Constructs the digest by hashing_ `range` _with_`Hasher` _._ |
|  constexpr | [**operator value\_type**](#function-operator-value_type) () noexcept const<br>_Implicit conversion to the raw integer digest._  |




























## Detailed Description


Wraps the digest produced by `Hasher` in a named type, preventing accidental mixing of raw integers with hash values. The `value_type` and width of the digest are derived automatically from the hasher's return type:



|Hasher   |`value_type`    |
|-----|-----|
|`fnv1a_hasher`   |`std::uint64_t`    |
|`djb2_hasher`   |`std::uint64_t`    |
|`sdbm_hasher`   |`std::uint64_t`    |
|`siphash_hasher <Key>`   |`std::uint64_t`    |
|`jenkins_ota_hasher`   |`std::uint32_t`   |






Key properties:
* \*\*`constexpr`\*\* — digest computed at compile time.
* **Comparable** — `==`, `!=`, `<`, `<=`, `>`, `>=` via defaulted `<=>`.
* \*\*`switch`/`case` label\*\* — implicit conversion to `value_type` enables string-dispatching without `if`-`else` chains.
* **STL-compatible** — `std::hash<key<Hasher>>` is specialised for use in `std::unordered_map` / `std::unordered_set`.






**Template parameters:**


* `Hasher` A type satisfying scl::hash::byte\_hasher. Defaults to `fnv1a_hasher`.



**
**


```C++
constexpr scl::hash::key id{"my_event"};
static_assert(id == scl::hash::key{"my_event"});
static_assert(id != scl::hash::key{"other"});
```





**
**


```C++
constexpr scl::hash::siphash_key my_key{0xdeadbeefull, 0xcafebabeull};
using sip_key = scl::hash::key<scl::hash::siphash_hasher<my_key>>;
constexpr sip_key id{"my_event"};
```





**
**


```C++
int handle(scl::hash::key<> cmd) {
    switch (cmd) {
        case scl::hash::key<>{"start"}: return 1;
        case scl::hash::key<>{"stop"}:  return 2;
        default: return 0;
    }
}
```
 





    
## Public Types Documentation




### typedef hasher\_type 

_The hasher type used to produce this digest._ 
```C++
using scl::hash::key< Hasher >::hasher_type =  Hasher;
```




<hr>



### typedef value\_type 

_Underlying integer type — deduced from the hasher's_ `result_type` _._
```C++
using scl::hash::key< Hasher >::value_type =  typename Hasher::result_type;
```




<hr>
## Public Attributes Documentation




### variable value 

_Raw digest value._ 
```C++
value_type scl::hash::key< Hasher >::value;
```




<hr>
## Public Functions Documentation




### function key 

_Constructs the digest by hashing_ `range` _with_`Hasher` _._
```C++
template<::std::ranges::range Range>
inline explicit constexpr scl::hash::key::key (
    Range const & range
) noexcept
```





**Template parameters:**


* `Range` Any type satisfying `std::ranges::range` whose elements are convertible to `std::uint8_t`. 



**Parameters:**


* `range` Input range (e.g. `std::string`, `std::span<std::byte>`). 




        

<hr>



### function operator value\_type 

_Implicit conversion to the raw integer digest._ 
```C++
inline constexpr scl::hash::key::operator value_type () noexcept const
```




<hr>## Friends Documentation





### friend operator&lt;=&gt; 

_Three-way comparison (generates ==, !=, &lt;, &lt;=, &gt;, &gt;=)._ 
```C++
constexpr auto scl::hash::key::operator<=> (
    key const &,
    key const &
) noexcept
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/utility/src/scl/utility/hash/key.h`

