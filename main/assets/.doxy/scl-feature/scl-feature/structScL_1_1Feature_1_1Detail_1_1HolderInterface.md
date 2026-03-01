

# Struct ScL::Feature::Detail::HolderInterface



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Detail**](namespaceScL_1_1Feature_1_1Detail.md) **>** [**HolderInterface**](structScL_1_1Feature_1_1Detail_1_1HolderInterface.md)












































## Public Static Functions

| Type | Name |
| ---: | :--- |
|  constexpr bool | [**doesGuardStaticMethodExist**](#function-doesguardstaticmethodexist) () <br> |
|  constexpr bool | [**doesUnguardStaticMethodExist**](#function-doesunguardstaticmethodexist) () <br> |
|  constexpr bool | [**doesValueStaticMethodExist**](#function-doesvaluestaticmethodexist) () <br> |
|  constexpr void | [**guard**](#function-guard) (\_HolderRefer holder) <br> |
|  constexpr void | [**unguard**](#function-unguard) (\_HolderRefer holder) <br> |
|  constexpr decltype(auto) | [**value**](#function-value) (\_HolderRefer holder) <br> |


























## Public Static Functions Documentation




### function doesGuardStaticMethodExist 

```C++
template<typename... _Arguments>
static inline constexpr bool ScL::Feature::Detail::HolderInterface::doesGuardStaticMethodExist () 
```




<hr>



### function doesUnguardStaticMethodExist 

```C++
template<typename... _Arguments>
static inline constexpr bool ScL::Feature::Detail::HolderInterface::doesUnguardStaticMethodExist () 
```




<hr>



### function doesValueStaticMethodExist 

```C++
template<typename... _Arguments>
static inline constexpr bool ScL::Feature::Detail::HolderInterface::doesValueStaticMethodExist () 
```




<hr>



### function guard 

```C++
template<typename _HolderRefer, typename>
static inline constexpr void ScL::Feature::Detail::HolderInterface::guard (
    _HolderRefer holder
) 
```




<hr>



### function unguard 

```C++
template<typename _HolderRefer, typename>
static inline constexpr void ScL::Feature::Detail::HolderInterface::unguard (
    _HolderRefer holder
) 
```




<hr>



### function value 

```C++
template<typename _HolderRefer, typename>
static inline constexpr decltype(auto) ScL::Feature::Detail::HolderInterface::value (
    _HolderRefer holder
) 
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/access/detail/holder_interface.h`

