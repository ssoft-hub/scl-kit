

# Struct ScL::Feature::Detail::IsThisCompatibleWithOther

**template &lt;typename \_Test, typename \_Other&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Detail**](namespaceScL_1_1Feature_1_1Detail.md) **>** [**IsThisCompatibleWithOther**](structScL_1_1Feature_1_1Detail_1_1IsThisCompatibleWithOther.md)



[More...](#detailed-description)

* `#include <trait.h>`



Inherits the following classes: std::integral_constant< bool, ::std::is_same< ::std::remove_cv_t< _Test >, ::std::remove_cv_t< _Other > >::value||::std::is_base_of< ::std::remove_cv_t< _Other >, ::std::remove_cv_t< _Test > >::value >






























































## Detailed Description


Типы являются совместимыми, если они одинаковые или тип \_Test является производным от типа \_Other. 


    

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/trait.h`

