
# Class List


Here are the classes, structs, unions and interfaces with brief descriptions:

* **namespace** [**scl**](namespacescl.md) _Root namespace of the ScL project._     
    * **namespace** [**feature**](namespacescl_1_1feature.md) _Namespace of the ScL Feature module._     
        * **namespace** [**concepts**](namespacescl_1_1feature_1_1concepts.md) _C++20 concepts for ScL Feature types._ 
        * **struct** [**executor\_trait**](structscl_1_1feature_1_1executor__trait.md) _Trait that provides access to the executor inside a wrapper._ 
        * **namespace** [**inplace**](namespacescl_1_1feature_1_1inplace.md)     
            * **class** [**plain**](classscl_1_1feature_1_1inplace_1_1plain.md) _Executor that proxies calls directly to the held value with no overhead._     
            * **class** [**uninitialized**](classscl_1_1feature_1_1inplace_1_1uninitialized.md) _Executor that holds_ `Value` _in uninitialized aligned storage._    
        * **class** [**reflect**](classscl_1_1feature_1_1reflect.md) _Primary (terminal) template for the reflection mixin chain._ 
        * **class** [**reflect&lt; Wrapper, Executor, detail::wrapper&lt; QualifiedInner, OuterExecutor &gt; &gt;**](classscl_1_1feature_1_1reflect_3_01Wrapper_00_01Executor_00_01detail_1_1wrapper_3_01QualifiedInner_00_01OuterExecutor_01_4_01_4.md) _Strips cv/ref qualifiers from a cv/ref-qualified inner wrapper._ 
        * **class** [**reflect&lt; Wrapper, Executor, detail::wrapper&lt; Value, OuterExecutor &gt; &gt;**](classscl_1_1feature_1_1reflect_3_01Wrapper_00_01Executor_00_01detail_1_1wrapper_3_01Value_00_01OuterExecutor_01_4_01_4.md) _Reflection chain for a plain (non-nested) wrapper._ 
* **namespace** [**std**](namespacestd.md) 

