

# Namespace scl::hash



[**Namespace List**](namespaces.md) **>** [**scl**](namespacescl.md) **>** [**hash**](namespacescl_1_1hash.md)


















## Namespaces

| Type | Name |
| ---: | :--- |
| namespace | [**concepts**](namespacescl_1_1hash_1_1concepts.md) <br> |


## Classes

| Type | Name |
| ---: | :--- |
| struct | [**djb2\_hasher**](structscl_1_1hash_1_1djb2__hasher.md) <br>_Callable wrapper around_ [_**djb2**_](namespacescl_1_1hash.md#function-djb2) _for use with_[_**scl::hash::key**_](structscl_1_1hash_1_1key.md) _._ |
| struct | [**fnv1a\_hasher**](structscl_1_1hash_1_1fnv1a__hasher.md) <br>_Callable wrapper around_ [_**fnv1a**_](namespacescl_1_1hash.md#function-fnv1a) _for use with_[_**scl::hash::key**_](structscl_1_1hash_1_1key.md) _._ |
| struct | [**jenkins\_ota\_hasher**](structscl_1_1hash_1_1jenkins__ota__hasher.md) <br>_Callable wrapper around_ [_**jenkins\_ota**_](namespacescl_1_1hash.md#function-jenkins_ota) _for use with_[_**scl::hash::key**_](structscl_1_1hash_1_1key.md) _._ |
| struct | [**key**](structscl_1_1hash_1_1key.md) &lt;Hasher&gt;<br>_Strongly-typed FNV-1a hash digest parameterized by a hash function._  |
| struct | [**sdbm\_hasher**](structscl_1_1hash_1_1sdbm__hasher.md) <br>_Callable wrapper around_ [_**sdbm**_](namespacescl_1_1hash.md#function-sdbm) _for use with_[_**scl::hash::key**_](structscl_1_1hash_1_1key.md) _._ |
| struct | [**siphash\_hasher**](structscl_1_1hash_1_1siphash__hasher.md) &lt;Key&gt;<br>_Callable wrapper around_ [_**siphash**_](namespacescl_1_1hash.md#function-siphash) _for use with_[_**scl::hash::key**_](structscl_1_1hash_1_1key.md) _._ |
| struct | [**siphash\_key**](structscl_1_1hash_1_1siphash__key.md) <br>_128-bit secret key for SipHash._  |






## Public Attributes

| Type | Name |
| ---: | :--- |
|  [**siphash\_key**](structscl_1_1hash_1_1siphash__key.md) | [**siphash\_default\_key**](#variable-siphash_default_key)   = `/* multi line expression */`<br>_Default key for non-security-sensitive use._  |
















## Public Functions

| Type | Name |
| ---: | :--- |
|  requires ::std::convertible\_to&lt;::std::ranges::range\_value\_t&lt; Range &gt;, ::std::uint8\_t &gt;constexpr ::std::uint64\_t | [**djb2**](#function-djb2) (Range const & range, ::std::uint64\_t h=5381ull) <br>_Computes a djb2a 64-bit hash over an arbitrary byte range._  |
|  requires ::std::convertible\_to&lt;::std::ranges::range\_value\_t&lt; Range &gt;, ::std::uint8\_t &gt;constexpr ::std::uint64\_t | [**fnv1a**](#function-fnv1a) (Range const & range, ::std::uint64\_t h=14695981039346656037ull) <br>_Computes an FNV-1a 64-bit hash over an arbitrary byte range._  |
|  requires ::std::convertible\_to&lt;::std::ranges::range\_value\_t&lt; Range &gt;, ::std::uint8\_t &gt;constexpr ::std::uint32\_t | [**jenkins\_ota**](#function-jenkins_ota) (Range const & range) <br>_Computes a Jenkins one-at-a-time (OTA) 32-bit hash._  |
|  requires ::std::convertible\_to&lt;::std::ranges::range\_value\_t&lt; Range &gt;, ::std::uint8\_t &gt;constexpr ::std::uint64\_t | [**sdbm**](#function-sdbm) (Range const & range, ::std::uint64\_t h=0ull) <br>_Computes an SDBM 64-bit hash over an arbitrary byte range._  |
|  requires ::std::convertible\_to&lt;::std::ranges::range\_value\_t&lt; Range &gt;, ::std::uint8\_t &gt;constexpr ::std::uint64\_t | [**siphash**](#function-siphash) (Range const & range, [**siphash\_key**](structscl_1_1hash_1_1siphash__key.md) const key=[**siphash\_default\_key**](namespacescl_1_1hash.md#variable-siphash_default_key)) <br>_Computes a SipHash-2-4 64-bit hash over an arbitrary byte range._  |




























## Public Attributes Documentation




### variable siphash\_default\_key 

_Default key for non-security-sensitive use._ 
```C++
siphash_key scl::hash::siphash_default_key;
```



These are the standard test-vector key bytes from the SipHash paper (Aumasson & Bernstein, 2012): bytes 0x00–0x0f in little-endian order. **Do not use this key where hash-flooding resistance is required.** 


        

<hr>
## Public Functions Documentation




### function djb2 

_Computes a djb2a 64-bit hash over an arbitrary byte range._ 
```C++
template<::std::ranges::range Range>
requires ::std::convertible_to<::std::ranges::range_value_t< Range >, ::std::uint8_t >constexpr ::std::uint64_t scl::hash::djb2 (
    Range const & range,
    ::std::uint64_t h=5381ull
) 
```



Implements the XOR variant of Daniel J. Bernstein's djb2 hash (sometimes written as djb2a or "xor" variant). For each element `c:` 
```C++
h = h * 33 ^ static_cast<std::uint8_t>(c);
// equivalently: h = ((h << 5) + h) ^ c
```



djb2a differs from plain djb2 (which uses `+` instead of `^`) in that the XOR step provides better avalanche behaviour for similar inputs.


The function is `constexpr`, allowing compile-time hash computation.




**Note:**

**Chaining:** pass the result of a previous call as `h:` 
```C++
auto h = scl::hash::djb2(first_range);
h     = scl::hash::djb2(second_range, h);
```





**Template parameters:**


* `Range` Any type satisfying `std::ranges::range` whose elements are convertible to `std::uint8_t` — e.g. a string literal, `std::string_view`, `std::string`, `std::span<std::byte>`. 



**Parameters:**


* `range` Input range to hash. 



**Note:**

String literals (e.g. `"hello"`) include the null terminator in the hash. Use `std::string_view{"hello"}` to hash only the characters. 




**Parameters:**


* `h` Initial hash value. Defaults to the traditional djb2 seed `5381`. 



**Returns:**

64-bit djb2a digest of the input range.




**
**


```C++
constexpr auto h = scl::hash::djb2("hello");
static_assert(h != 0);
```
 





        

<hr>



### function fnv1a 

_Computes an FNV-1a 64-bit hash over an arbitrary byte range._ 
```C++
template<::std::ranges::range Range>
requires ::std::convertible_to<::std::ranges::range_value_t< Range >, ::std::uint8_t >constexpr ::std::uint64_t scl::hash::fnv1a (
    Range const & range,
    ::std::uint64_t h=14695981039346656037ull
) 
```



Implements the FNV-1a variant of the Fowler-Noll-Vo non-cryptographic hash algorithm with 64-bit width. For each element `c` in the range, the algorithm applies: 
```C++
h ^= static_cast<std::uint8_t>(c);
h *= FNV_prime;  // 1099511628211
```



The function is `constexpr`, allowing compile-time hash computation.




**Note:**

**Chaining:** pass the result of a previous call as `h` to hash several ranges into a single digest: 
```C++
auto h = scl::hash::fnv1a(first_range);
h     = scl::hash::fnv1a(second_range, h);
```





**Template parameters:**


* `Range` Any type satisfying `std::ranges::range` whose elements are convertible to `std::uint8_t` — e.g. a string literal, `std::string_view`, `std::string`, `std::span<std::byte>`. 



**Parameters:**


* `range` Input range to hash. 



**Note:**

String literals (e.g. `"hello"`) include the null terminator in the hash. Use `std::string_view{"hello"}` to hash only the characters. 




**Parameters:**


* `h` Initial hash value (offset basis). Defaults to the standard FNV-1a 64-bit offset basis `14695981039346656037` (`0xcbf29ce484222325`). An empty range leaves `h` unchanged and returns it as-is. 



**Returns:**

64-bit FNV-1a digest of the input range.




**
**


```C++
constexpr auto h = scl::hash::fnv1a("hello");
static_assert(h != 0);
```
 





        

<hr>



### function jenkins\_ota 

_Computes a Jenkins one-at-a-time (OTA) 32-bit hash._ 
```C++
template<::std::ranges::range Range>
requires ::std::convertible_to<::std::ranges::range_value_t< Range >, ::std::uint8_t >constexpr ::std::uint32_t scl::hash::jenkins_ota (
    Range const & range
) 
```



Implements Bob Jenkins' one-at-a-time hash algorithm. Each byte is mixed into the accumulator with bit-shifts and XOR operations, followed by a finalization step that ensures full avalanche: 
```C++
// Per-byte mixing:
h += static_cast<std::uint8_t>(c);
h += h << 10;
h ^= h >> 6;

// Finalization:
h += h << 3;
h ^= h >> 11;
h += h << 15;
```





**Note:**

Jenkins OAT is a **32-bit** algorithm by definition. It returns `std::uint32_t`, unlike the 64-bit algorithms in this module. Use [**scl::hash::fnv1a**](namespacescl_1_1hash.md#function-fnv1a) or [**scl::hash::djb2**](namespacescl_1_1hash.md#function-djb2) when a 64-bit digest is required.


The function is `constexpr`, allowing compile-time hash computation.




**Template parameters:**


* `Range` Any type satisfying `std::ranges::range` whose elements are convertible to `std::uint8_t` — e.g. a string literal, `std::string_view`, `std::string`, `std::span<std::byte>`. 



**Parameters:**


* `range` Input range to hash. 



**Note:**

String literals (e.g. `"hello"`) include the null terminator in the hash. Use `std::string_view{"hello"}` to hash only the characters. 




**Returns:**

32-bit Jenkins OAT digest of the input range.




**
**


```C++
constexpr auto h = scl::hash::jenkins_ota("hello");
static_assert(h != 0);
```
 





        

<hr>



### function sdbm 

_Computes an SDBM 64-bit hash over an arbitrary byte range._ 
```C++
template<::std::ranges::range Range>
requires ::std::convertible_to<::std::ranges::range_value_t< Range >, ::std::uint8_t >constexpr ::std::uint64_t scl::hash::sdbm (
    Range const & range,
    ::std::uint64_t h=0ull
) 
```



Implements the SDBM hash algorithm (originating from the sdbm database library). For each element `c:` 
```C++
h = static_cast<std::uint8_t>(c) + (h << 6) + (h << 16) - h;
```



SDBM is known for good distribution across short keys and is widely used in database and compiler applications.


The function is `constexpr`, allowing compile-time hash computation.




**Note:**

**Chaining:** pass the result of a previous call as `h:` 
```C++
auto h = scl::hash::sdbm(first_range);
h     = scl::hash::sdbm(second_range, h);
```





**Template parameters:**


* `Range` Any type satisfying `std::ranges::range` whose elements are convertible to `std::uint8_t` — e.g. a string literal, `std::string_view`, `std::string`, `std::span<std::byte>`. 



**Parameters:**


* `range` Input range to hash. 



**Note:**

String literals (e.g. `"hello"`) include the null terminator in the hash. Use `std::string_view{"hello"}` to hash only the characters. 




**Parameters:**


* `h` Initial hash value. Defaults to `0`. 



**Returns:**

64-bit SDBM digest of the input range.




**
**


```C++
constexpr auto h = scl::hash::sdbm("hello");
static_assert(h != 0);
```
 





        

<hr>



### function siphash 

_Computes a SipHash-2-4 64-bit hash over an arbitrary byte range._ 
```C++
template<::std::ranges::range Range>
requires ::std::convertible_to<::std::ranges::range_value_t< Range >, ::std::uint8_t >constexpr ::std::uint64_t scl::hash::siphash (
    Range const & range,
    siphash_key const key=siphash_default_key
) 
```



SipHash-2-4 (2 compression rounds, 4 finalization rounds) is a fast, short-input hash with a 128-bit secret key. It was designed by Jean-Philippe Aumasson and Daniel J. Bernstein specifically to replace ad-hoc string hash functions in hash tables, providing both good distribution and resistance to hash-flooding attacks.


It is used as the default string hash in Python (≥ 3.4), Rust, Ruby, and Perl.


The algorithm processes input in 8-byte (64-bit) little-endian blocks: 
```C++
// Compression (c = 2 rounds per block):
v3 ^= block;
SipRound × 2;
v0 ^= block;

// Finalization (d = 4 rounds):
v2 ^= 0xff;
SipRound × 4;
return v0 ^ v1 ^ v2 ^ v3;
```



The function is `constexpr`, allowing compile-time hash computation.




**Template parameters:**


* `Range` Any type satisfying `std::ranges::range` whose elements are convertible to `std::uint8_t` — e.g. a string literal, `std::string_view`, `std::string`, `std::span<std::byte>`. 



**Parameters:**


* `range` Input range to hash. 



**Note:**

String literals (e.g. `"hello"`) include the null terminator in the hash. Use `std::string_view{"hello"}` to hash only the characters. 




**Parameters:**


* `key` 128-bit secret key. Defaults to [**siphash\_default\_key**](namespacescl_1_1hash.md#variable-siphash_default_key). For security-sensitive use, provide a randomly generated key. 



**Returns:**

64-bit SipHash-2-4 digest.




**
**


```C++
constexpr scl::hash::siphash_key my_key{0xdeadbeefcafeull, 0xabad1deaull};
constexpr auto h = scl::hash::siphash("hello", my_key);
static_assert(h != 0);
```





**See also:** [https://www.131002.net/siphash/](https://www.131002.net/siphash/) — original paper and reference vectors 



        

<hr>

------------------------------
The documentation for this class was generated from the following file `module/utility/src/scl/utility/hash/djb2.h`

