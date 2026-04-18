

# Namespace scl::feature



[**Namespace List**](namespaces.md) **>** [**feature**](namespacescl_1_1feature.md)



_Namespace of the ScL Feature module._ 














## Namespaces

| Type | Name |
| ---: | :--- |
| namespace | [**concepts**](namespacescl_1_1feature_1_1concepts.md) <br>_C++20 concepts for ScL Feature types._  |
| namespace | [**inplace**](namespacescl_1_1feature_1_1inplace.md) <br> |


## Classes

| Type | Name |
| ---: | :--- |
| struct | [**executor\_trait**](structscl_1_1feature_1_1executor__trait.md) &lt;[**typename**](group__scl__feature__type__traits.md#variable-is_executor_v) [**T**](group__scl__feature__type__traits.md#variable-is_executor_v)&gt;<br>_Trait that provides access to the executor inside a wrapper._  |
| class | [**reflect**](classscl_1_1feature_1_1reflect.md) &lt;[**typename**](group__scl__feature__type__traits.md#variable-is_executor_v) [**Wrapper**](group__scl__feature__type__traits.md#variable-is_executor_v), [**typename**](group__scl__feature__type__traits.md#variable-is_executor_v) [**Executor**](group__scl__feature__type__traits.md#variable-is_executor_v), [**typename**](group__scl__feature__type__traits.md#variable-is_executor_v) [**Type**](group__scl__feature__type__traits.md#variable-is_executor_v)&gt;<br>_Primary (terminal) template for the reflection mixin chain._  |
| class | [**reflect&lt; Wrapper, Executor, detail::wrapper&lt; QualifiedInner, OuterExecutor &gt; &gt;**](classscl_1_1feature_1_1reflect_3_01Wrapper_00_01Executor_00_01detail_1_1wrapper_3_01QualifiedInner_00_01OuterExecutor_01_4_01_4.md) &lt;[**typename**](group__scl__feature__type__traits.md#variable-is_executor_v) [**Wrapper**](group__scl__feature__type__traits.md#variable-is_executor_v), [**typename**](group__scl__feature__type__traits.md#variable-is_executor_v) [**Executor**](group__scl__feature__type__traits.md#variable-is_executor_v), [**typename**](group__scl__feature__type__traits.md#variable-is_executor_v) [**QualifiedInner**](group__scl__feature__type__traits.md#variable-is_executor_v), OuterExecutor&gt;<br>_Strips cv/ref qualifiers from a cv/ref-qualified inner wrapper._  |
| class | [**reflect&lt; Wrapper, Executor, detail::wrapper&lt; Value, OuterExecutor &gt; &gt;**](classscl_1_1feature_1_1reflect_3_01Wrapper_00_01Executor_00_01detail_1_1wrapper_3_01Value_00_01OuterExecutor_01_4_01_4.md) &lt;[**typename**](group__scl__feature__type__traits.md#variable-is_executor_v) [**Wrapper**](group__scl__feature__type__traits.md#variable-is_executor_v), [**typename**](group__scl__feature__type__traits.md#variable-is_executor_v) [**Executor**](group__scl__feature__type__traits.md#variable-is_executor_v), [**typename**](group__scl__feature__type__traits.md#variable-is_executor_v) [**Value**](group__scl__feature__type__traits.md#variable-is_executor_v), OuterExecutor&gt;<br>_Reflection chain for a plain (non-nested) wrapper._  |



















































------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature.h`

