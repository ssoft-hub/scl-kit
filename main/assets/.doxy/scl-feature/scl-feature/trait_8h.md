

# File trait.h



[**FileList**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**trait.h**](trait_8h.md)

[Go to the source code of this file](trait_8h_source.md)



* `#include <scl/utility/type_traits.h>`
* `#include <type_traits>`













## Namespaces

| Type | Name |
| ---: | :--- |
| namespace | [**ScL**](namespaceScL.md) <br> |
| namespace | [**Feature**](namespaceScL_1_1Feature.md) <br>_This is definition of Wrapper type. No tool duplicates are guarantee._  |
| namespace | [**Detail**](namespaceScL_1_1Feature_1_1Detail.md) <br> |
| namespace | [**Inplace**](namespaceScL_1_1Feature_1_1Inplace.md) <br> |


## Classes

| Type | Name |
| ---: | :--- |
| struct | [**IsPartOfThisCompatibleWithOther**](structScL_1_1Feature_1_1Detail_1_1IsPartOfThisCompatibleWithOther.md) &lt;typename \_Test, typename \_Other&gt;<br>_Типы, не являющиеся_ [_**Wrapper**_](classScL_1_1Feature_1_1Detail_1_1Wrapper.md) _, не могут быть вложенными_ |
| struct | [**IsPartOfThisCompatibleWithOther&lt; ::ScL::Feature::Detail::Wrapper&lt; \_Test, \_TestTool &gt;, ::ScL::Feature::Detail::Wrapper&lt; \_Other, \_OtherTool &gt; &gt;**](structScL_1_1Feature_1_1Detail_1_1IsPartOfThisCompatibleWithOther_3_01_1_1ScL_1_1Feature_1_1Detabc6d92af80b202c0df849c33284b7556.md) &lt;typename \_Test, typename \_TestTool, typename \_Other, typename \_OtherTool&gt;<br> |
| struct | [**IsPartOfThisCompatibleWithOther&lt; ::ScL::Feature::Detail::Wrapper&lt; \_Test, \_TestTool &gt;, \_Other &gt;**](structScL_1_1Feature_1_1Detail_1_1IsPartOfThisCompatibleWithOther_3_01_1_1ScL_1_1Feature_1_1Deta602a8c2c49963046bf9bf848dc6c28ed.md) &lt;typename \_Test, typename \_TestTool, typename \_Other&gt;<br> |
| struct | [**IsThisCompatibleWithOther**](structScL_1_1Feature_1_1Detail_1_1IsThisCompatibleWithOther.md) &lt;typename \_Test, typename \_Other&gt;<br> |
| struct | [**IsThisCompatibleWithOther&lt; ::ScL::Feature::Detail::Wrapper&lt; \_Test, \_Tool &gt;, ::ScL::Feature::Detail::Wrapper&lt; \_Other, \_Tool &gt; &gt;**](structScL_1_1Feature_1_1Detail_1_1IsThisCompatibleWithOther_3_01_1_1ScL_1_1Feature_1_1Detail_1_1fdd44366347aa710b490dbd8a920fbaa.md) &lt;typename \_Test, typename \_Other, typename \_Tool&gt;<br> |
| struct | [**IsThisCompatibleWithPartOfOther**](structScL_1_1Feature_1_1Detail_1_1IsThisCompatibleWithPartOfOther.md) &lt;typename \_Test, typename \_Other&gt;<br>_Типы, не являющиеся_ [_**Wrapper**_](classScL_1_1Feature_1_1Detail_1_1Wrapper.md) _, не имеют вложенных частей_ |
| struct | [**IsThisCompatibleWithPartOfOther&lt; ::ScL::Feature::Detail::Wrapper&lt; \_Test, \_TestTool &gt;, ::ScL::Feature::Detail::Wrapper&lt; \_Other, \_OtherTool &gt; &gt;**](structScL_1_1Feature_1_1Detail_1_1IsThisCompatibleWithPartOfOther_3_01_1_1ScL_1_1Feature_1_1Deta4e78badaf6cc78e9d2bc3ddb43bbac9c.md) &lt;typename \_Test, typename \_TestTool, typename \_Other, typename \_OtherTool&gt;<br> |
| struct | [**IsThisCompatibleWithPartOfOther&lt; \_Test, ::ScL::Feature::Detail::Wrapper&lt; \_Other, \_OtherTool &gt; &gt;**](structScL_1_1Feature_1_1Detail_1_1IsThisCompatibleWithPartOfOther_3_01__Test_00_01_1_1ScL_1_1Fea7ebb3fa7d8a3293b1b3b469e978faa32.md) &lt;typename \_Test, typename \_Other, typename \_OtherTool&gt;<br> |
| struct | [**IsWrapper**](structScL_1_1Feature_1_1Detail_1_1IsWrapper.md) &lt;typename&gt;<br>_По умолчанию, типы не являются_ [_**Wrapper**_](classScL_1_1Feature_1_1Detail_1_1Wrapper.md) _._ |
| struct | [**IsWrapper&lt; ::ScL::Feature::Detail::Wrapper&lt; \_Test, \_Tool &gt; &gt;**](structScL_1_1Feature_1_1Detail_1_1IsWrapper_3_01_1_1ScL_1_1Feature_1_1Detail_1_1Wrapper_3_01__Test_00_01__Tool_01_4_01_4.md) &lt;typename \_Test, typename \_Tool&gt;<br> |
| struct | [**IsSimilar**](structScL_1_1Feature_1_1IsSimilar.md) &lt;typename \_Test, typename \_Other&gt;<br> |
| struct | [**IsThisSpecifierCompatibleWithOther**](structScL_1_1Feature_1_1IsThisSpecifierCompatibleWithOther.md) &lt;typename \_Test, typename \_Other&gt;<br> |

















































## Macros

| Type | Name |
| ---: | :--- |
| define  | [**SCL\_FEATURED\_TRAITS\_H**](trait_8h.md#define-scl_featured_traits_h)  <br> |

## Macro Definition Documentation





### define SCL\_FEATURED\_TRAITS\_H 

```C++
#define SCL_FEATURED_TRAITS_H 
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/trait.h`

