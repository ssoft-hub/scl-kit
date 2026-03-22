

# Struct scl::feature::executor\_trait

**template &lt;[**typename**](group__scl__feature__type__traits.md#variable-is_wrapper_v) [**T**](group__scl__feature__type__traits.md#variable-is_wrapper_v)&gt;**



[**ClassList**](annotated.md) **>** [**feature**](namespacescl_1_1feature.md) **>** [**executor\_trait**](structscl_1_1feature_1_1executor__trait.md)



_Trait that provides access to the executor inside a wrapper._ [More...](#detailed-description)


































































## Detailed Description


No default implementation. Each wrapper type must provide a specialization with a static `executor(Self&&)` method that returns a reference to the executor, preserving cv-ref qualifiers.




**Template parameters:**


* `T` The wrapper type (cv-ref stripped). 




    

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/type_traits/executor.h`

