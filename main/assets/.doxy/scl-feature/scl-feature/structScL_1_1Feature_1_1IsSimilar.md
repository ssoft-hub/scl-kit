

# Struct ScL::Feature::IsSimilar

**template &lt;typename \_Test, typename \_Other&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**IsSimilar**](structScL_1_1Feature_1_1IsSimilar.md)



[More...](#detailed-description)

* `#include <trait.h>`



Inherits the following classes: std::integral_constant< bool, ::std::is_rvalue_reference< _Test >::value==::std::is_rvalue_reference< _Other >::value &&::std::is_lvalue_reference< _Test >::value==::std::is_lvalue_reference< _Other >::value &&::std::is_const< ::std::remove_reference_t< _Test > >::value==::std::is_const< ::std::remove_reference_t< _Other > >::value &&::std::is_volatile< ::std::remove_reference_t< _Test > >::value==::std::is_volatile< ::std::remove_reference_t< _Other > >::value >






























































## Detailed Description


Признак подобия типов. Типы считаются подобными, если у них одинаковые признаки const/volatile и rvalue/lvalue. 


    

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/trait.h`

