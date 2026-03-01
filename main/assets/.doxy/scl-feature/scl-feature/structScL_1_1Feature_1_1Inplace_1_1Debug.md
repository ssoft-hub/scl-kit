

# Struct ScL::Feature::Inplace::Debug



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Inplace**](namespaceScL_1_1Feature_1_1Inplace.md) **>** [**Debug**](structScL_1_1Feature_1_1Inplace_1_1Debug.md)



[More...](#detailed-description)

* `#include <debug.h>`















## Classes

| Type | Name |
| ---: | :--- |
| struct | [**Holder**](structScL_1_1Feature_1_1Inplace_1_1Debug_1_1Holder.md) &lt;typename \_Value&gt;<br> |
























## Public Static Functions

| Type | Name |
| ---: | :--- |
|  void | [**outText**](#function-outtext) (char const \* text) <br> |


























## Detailed Description


Инструмент для формирования значения "по месту". Определение "по месту" означает, что для значения не используется специальное размещение в куче и оно является неотъемлемой частью пространства имен, в котором это значение определено. Отличается от [**ScL::Feature::Inplace::Default**](structScL_1_1Feature_1_1Inplace_1_1Default.md) наличием отладочного вывода в ::std::cout. 


    
## Public Static Functions Documentation




### function outText 

```C++
static inline void ScL::Feature::Inplace::Debug::outText (
    char const * text
) 
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/tool/inplace/debug.h`

