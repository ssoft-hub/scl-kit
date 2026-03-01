

# Class ScL::Feature::ToolAdditionMixIn&lt; ::ScL::Feature::Detail::Wrapper&lt; \_Value, ::ScL::Feature::Inplace::Optional &gt; &gt;

**template &lt;typename \_Value&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**ToolAdditionMixIn&lt; ::ScL::Feature::Detail::Wrapper&lt; \_Value, ::ScL::Feature::Inplace::Optional &gt; &gt;**](classScL_1_1Feature_1_1ToolAdditionMixIn_3_01_1_1ScL_1_1Feature_1_1Detail_1_1Wrapper_3_01__Value7a1112ed2b930a9a1fc842c6d9900d2f.md)










































## Public Functions

| Type | Name |
| ---: | :--- |
|  constexpr ::std::enable\_if\_t&lt;::std::is\_constructible&lt; \_Value, \_Arguments &&... &gt;::value, MixInValue & &gt; | [**emplace**](#function-emplace-12) (\_Arguments &&... arguments) <br> |
|  constexpr ::std::enable\_if\_t&lt;::std::is\_constructible&lt; \_Value, \_Arguments &&... &gt;::value, MixInValue & &gt; | [**emplace**](#function-emplace-22) (std::initializer\_list&lt; \_Type &gt; list, \_Arguments &&... arguments) <br> |
|  constexpr bool | [**hasValue**](#function-hasvalue) () noexcept const<br> |
|  constexpr | [**operator bool**](#function-operator-bool) () noexcept const<br> |
|  constexpr void | [**reset**](#function-reset) () noexcept<br> |
|  constexpr void | [**swap**](#function-swap) ([**MixInWrapper**](classScL_1_1Feature_1_1Detail_1_1Wrapper.md) & other) noexcept<br> |
|  SCL\_OPTIONAL\_VALUE constexpr MixInValue const & | [**valueOr**](#function-valueor-13) (MixInValue const & value) noexcept const<br> |
|  constexpr MixInValue | [**valueOr**](#function-valueor-23) (\_Type && value) noexcept const<br> |
|  MixInValue | [**valueOr**](#function-valueor-33) (\_Type && value) noexcept<br> |




























## Public Functions Documentation




### function emplace [1/2]

```C++
template<typename... _Arguments>
inline constexpr ::std::enable_if_t<::std::is_constructible< _Value, _Arguments &&... >::value, MixInValue & > ScL::Feature::ToolAdditionMixIn< ::ScL::Feature::Detail::Wrapper< _Value, ::ScL::Feature::Inplace::Optional > >::emplace (
    _Arguments &&... arguments
) 
```




<hr>



### function emplace [2/2]

```C++
template<typename _Type, typename... _Arguments>
inline constexpr ::std::enable_if_t<::std::is_constructible< _Value, _Arguments &&... >::value, MixInValue & > ScL::Feature::ToolAdditionMixIn< ::ScL::Feature::Detail::Wrapper< _Value, ::ScL::Feature::Inplace::Optional > >::emplace (
    std::initializer_list< _Type > list,
    _Arguments &&... arguments
) 
```




<hr>



### function hasValue 

```C++
inline constexpr bool ScL::Feature::ToolAdditionMixIn< ::ScL::Feature::Detail::Wrapper< _Value, ::ScL::Feature::Inplace::Optional > >::hasValue () noexcept const
```




<hr>



### function operator bool 

```C++
inline explicit constexpr ScL::Feature::ToolAdditionMixIn< ::ScL::Feature::Detail::Wrapper< _Value, ::ScL::Feature::Inplace::Optional > >::operator bool () noexcept const
```




<hr>



### function reset 

```C++
inline constexpr void ScL::Feature::ToolAdditionMixIn< ::ScL::Feature::Detail::Wrapper< _Value, ::ScL::Feature::Inplace::Optional > >::reset () noexcept
```




<hr>



### function swap 

```C++
inline constexpr void ScL::Feature::ToolAdditionMixIn< ::ScL::Feature::Detail::Wrapper< _Value, ::ScL::Feature::Inplace::Optional > >::swap (
    MixInWrapper & other
) noexcept
```




<hr>



### function valueOr [1/3]

```C++
inline SCL_OPTIONAL_VALUE constexpr MixInValue const & ScL::Feature::ToolAdditionMixIn< ::ScL::Feature::Detail::Wrapper< _Value, ::ScL::Feature::Inplace::Optional > >::valueOr (
    MixInValue const & value
) noexcept const
```




<hr>



### function valueOr [2/3]

```C++
template<typename _Type, typename>
inline constexpr MixInValue ScL::Feature::ToolAdditionMixIn< ::ScL::Feature::Detail::Wrapper< _Value, ::ScL::Feature::Inplace::Optional > >::valueOr (
    _Type && value
) noexcept const
```




<hr>



### function valueOr [3/3]

```C++
template<typename _Type, typename>
inline MixInValue ScL::Feature::ToolAdditionMixIn< ::ScL::Feature::Detail::Wrapper< _Value, ::ScL::Feature::Inplace::Optional > >::valueOr (
    _Type && value
) noexcept
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/tool/inplace/optional.h`

