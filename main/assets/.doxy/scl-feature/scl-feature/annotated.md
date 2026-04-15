
# Class List


Here are the classes, structs, unions and interfaces with brief descriptions:

* **namespace** [**scl**](namespacescl.md) _Root namespace of the ScL project._     
    * **namespace** [**feature**](namespacescl_1_1feature.md) _Namespace of the ScL Feature module._     
        * **namespace** [**concepts**](namespacescl_1_1feature_1_1concepts.md) _C++20 concepts for ScL Feature types._ 
        * **struct** [**executor\_trait**](structscl_1_1feature_1_1executor__trait.md) _Trait that provides access to the executor inside a wrapper._ 
        * **namespace** [**inplace**](namespacescl_1_1feature_1_1inplace.md)     
            * **class** [**plain**](classscl_1_1feature_1_1inplace_1_1plain.md) _Executor that proxies calls directly to the held value with no overhead._     
            * **class** [**uninitialized**](classscl_1_1feature_1_1inplace_1_1uninitialized.md) _Executor that holds_ `Value` _in uninitialized aligned storage._    
        * **class** [**methods\_reflection**](classscl_1_1feature_1_1methods__reflection.md) _TODO: to make docs._ 
        * **class** [**methods\_reflection&lt; Wrapper, Executor, detail::wrapper&lt; QualifiedInner, OuterExecutor &gt; &gt;**](classscl_1_1feature_1_1methods__reflection_3_01Wrapper_00_01Executor_00_01detail_1_1wrapper_3_017e67822b7ef392bfca477912a301ec6c.md) _Strips cv/ref qualifiers from a cv/ref-qualified inner wrapper._ 
        * **class** [**methods\_reflection&lt; Wrapper, Executor, detail::wrapper&lt; Value, OuterExecutor &gt; &gt;**](classscl_1_1feature_1_1methods__reflection_3_01Wrapper_00_01Executor_00_01detail_1_1wrapper_3_011ede5f50bef484fca1e7f095cf68932a.md) _Reflection chain for a plain (non-nested) wrapper._ 
* **namespace** [**std**](namespacestd.md) 

