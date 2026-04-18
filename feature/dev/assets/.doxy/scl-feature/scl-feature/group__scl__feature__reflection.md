

# Group scl\_feature\_reflection



[**Modules**](modules.md) **>** [**scl\_feature\_reflection**](group__scl__feature__reflection.md)



_Compile-time reflection for wrapper types._ [More...](#detailed-description)








## Files

| Type | Name |
| ---: | :--- |
| file | [**access.h**](access_8h.md) <br>_Internal accessor macros for executor and value access in reflected methods._  |
| file | [**method.h**](method_8h.md) <br>_Compile-time method reflection macros for wrapper types._  |
| file | [**reflect.h**](reflect_8h.md) <br>_Primary template for the reflection mixin chain._  |
| file | [**reflection.h**](reflection_8h.md) <br>_ScL Feature compile-time method reflection utilities._  |
| file | [**type.h**](type_8h.md) <br>_Macro for declaring the wrapper type used by reflection macros._  |








## Classes

| Type | Name |
| ---: | :--- |
| class | [**scl::feature::reflect**](classscl_1_1feature_1_1reflect.md) &lt;[**typename**](group__scl__feature__type__traits.md#variable-is_executor_v) [**Wrapper**](group__scl__feature__type__traits.md#variable-is_executor_v), [**typename**](group__scl__feature__type__traits.md#variable-is_executor_v) [**Executor**](group__scl__feature__type__traits.md#variable-is_executor_v), [**typename**](group__scl__feature__type__traits.md#variable-is_executor_v) [**Type**](group__scl__feature__type__traits.md#variable-is_executor_v)&gt;<br>_Primary (terminal) template for the reflection mixin chain._  |

















































## Macros

| Type | Name |
| ---: | :--- |
| define  | [**SCL\_REFLECT\_TYPE**](group__scl__feature__reflection.md#define-scl_reflect_type) (type, executor) `/* multi line expression */`<br>_Declares the wrapper and executor types for use by_ `SCL_REFLECT_METHOD` _._ |

## Detailed Description


Provides the macros and types needed to generate proxy members that transparently forward calls from a wrapper to the held object through an executor, preserving all cv-ref qualifiers.



|Symbol   |Purpose    |
|-----|-----|
|`SCL_REFLECT_TYPE(Wrapper, Executor)`   |Declares the type aliases required by `SCL_REFLECT_METHOD`. Must appear first inside the wrapper class body.    |
|`SCL_REFLECT_METHOD(method)`   |Generates 24 proxy overloads (3 × 8 cv-ref) that dispatch through the executor.    |
|`scl::feature::reflect`   |CRTP mixin base class; specialisations inject reflected members.   |






    
## Macro Definition Documentation





### define SCL\_REFLECT\_TYPE 

_Declares the wrapper and executor types for use by_ `SCL_REFLECT_METHOD` _._
```
#define SCL_REFLECT_TYPE (
    type,
    executor
) `/* multi line expression */`
```



Must appear inside the class body **before** any `SCL_REFLECT_METHOD` invocations.


A specialization of `scl::feature::executor_trait` must also be provided for `type`.




**
**


```
SCL_REFLECT_TYPE(MyWrapper, MyExecutor);
```





**Parameters:**


* `type` The unqualified wrapper class name. 
* `executor` The unqualified executor type name.



**See also:** [**scl::feature::executor\_trait**](structscl_1_1feature_1_1executor__trait.md) 



        

<hr>

------------------------------


