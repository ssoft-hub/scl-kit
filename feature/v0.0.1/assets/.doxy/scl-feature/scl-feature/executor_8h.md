

# File executor.h



[**FileList**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**type\_traits**](dir_910e174fc0e8c8ed40843bba5172f2f4.md) **>** [**executor.h**](executor_8h.md)

[Go to the source code of this file](executor_8h_source.md)

_Customization point for locating the executor inside a wrapper type._ [More...](#detailed-description)














## Namespaces

| Type | Name |
| ---: | :--- |
| namespace | [**scl**](namespacescl.md) <br>_Root namespace of the ScL project._  |
| namespace | [**feature**](namespacescl_1_1feature.md) <br>_Namespace of the ScL Feature module._  |




















































## Detailed Description


`executor_trait` maps a wrapper type to its executor member. There is no default implementation — specialize for each wrapper type: 
```C++
template <>
struct scl::feature::executor_trait<MyWrapper>
{
    template <typename Self>
    static constexpr decltype(auto) executor(Self && self)
    {
        return ::scl::forward_like<Self>(self.m_impl);
    }
};
```





**Template parameters:**


* `T` The wrapper type (cv-ref stripped). 




    

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/type_traits/executor.h`

