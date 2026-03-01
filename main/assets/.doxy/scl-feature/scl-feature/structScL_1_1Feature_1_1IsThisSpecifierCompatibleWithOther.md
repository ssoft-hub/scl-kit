

# Struct ScL::Feature::IsThisSpecifierCompatibleWithOther

**template &lt;typename \_Test, typename \_Other&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**IsThisSpecifierCompatibleWithOther**](structScL_1_1Feature_1_1IsThisSpecifierCompatibleWithOther.md)



[More...](#detailed-description)

* `#include <trait.h>`



Inherits the following classes: std::integral_constant< bool,(!::std::is_const< _Other >::value||(::std::is_const< _Other >::value &&::std::is_const< _Test >::value)) &&(!::std::is_volatile< _Other >::value||(::std::is_volatile< _Other >::value &&::std::is_volatile< _Test >::value))>






























































## Detailed Description


Признак совместимости типов по спецификатору. Типы считаются совместимыми, если можно \_Other поставить слева, а \_Test справа при преобразовании спецификаторов const/volatile. 


    

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/trait.h`

