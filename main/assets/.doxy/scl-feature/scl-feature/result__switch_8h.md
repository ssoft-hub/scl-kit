

# File result\_switch.h



[**FileList**](files.md) **>** [**detail**](dir_b3eb4ac5eceab19e0dcca8b4c96aaf20.md) **>** [**result\_switch.h**](result__switch_8h.md)

[Go to the source code of this file](result__switch_8h_source.md)



* `#include "operator_tool.h"`
* `#include <scl/feature/tool/inplace/default.h>`
* `#include <scl/feature/trait.h>`
* `#include <scl/utility/type_traits.h>`
* `#include <type_traits>`













## Namespaces

| Type | Name |
| ---: | :--- |
| namespace | [**ScL**](namespaceScL.md) <br> |
| namespace | [**Feature**](namespaceScL_1_1Feature.md) <br>_This is definition of Wrapper type. No tool duplicates are guarantee._  |
| namespace | [**Detail**](namespaceScL_1_1Feature_1_1Detail.md) <br> |
| namespace | [**Operator**](namespaceScL_1_1Feature_1_1Detail_1_1Operator.md) <br> |
| namespace | [**Insplace**](namespaceScL_1_1Feature_1_1Insplace.md) <br> |


## Classes

| Type | Name |
| ---: | :--- |
| struct | [**ExposingCaseHelper**](structScL_1_1Feature_1_1Detail_1_1Operator_1_1ExposingCaseHelper.md) &lt;typename \_Left, typename \_Right&gt;<br> |
| struct | [**ResultCaseHelper**](structScL_1_1Feature_1_1Detail_1_1Operator_1_1ResultCaseHelper.md) &lt;typename \_Returned, typename \_Refer&gt;<br> |
| struct | [**ResultCaseWrapperHelper&lt; false, \_Returned, \_Refer &gt;**](structScL_1_1Feature_1_1Detail_1_1Operator_1_1ResultCaseWrapperHelper_3_01false_00_01__Returned_00_01__Refer_01_4.md) &lt;typename \_Returned, typename \_Refer&gt;<br> |
| struct | [**ResultCaseWrapperHelper&lt; true, \_Returned, \_Refer &gt;**](structScL_1_1Feature_1_1Detail_1_1Operator_1_1ResultCaseWrapperHelper_3_01true_00_01__Returned_00_01__Refer_01_4.md) &lt;typename \_Returned, typename \_Refer&gt;<br> |
| struct | [**ResultSwitch&lt; ::ScL::Feature::Detail::Operator::BothExposingCase, ::ScL::Feature::Detail::Operator::BlockedCase &gt;**](structScL_1_1Feature_1_1Detail_1_1Operator_1_1ResultSwitch_3_01_1_1ScL_1_1Feature_1_1Detail_1_1O0d3abd523892d83198b29449858ef96a.md) &lt;&gt;<br> |
| struct | [**ResultSwitch&lt; ::ScL::Feature::Detail::Operator::BothExposingCase, ::ScL::Feature::Detail::Operator::VoidCase &gt;**](structScL_1_1Feature_1_1Detail_1_1Operator_1_1ResultSwitch_3_01_1_1ScL_1_1Feature_1_1Detail_1_1Od7c71aa0050f7e09724a58dd464ecc8d.md) &lt;&gt;<br> |
| struct | [**ResultSwitch&lt; ::ScL::Feature::Detail::Operator::LeftExposingCase, ::ScL::Feature::Detail::Operator::BlockedCase &gt;**](structScL_1_1Feature_1_1Detail_1_1Operator_1_1ResultSwitch_3_01_1_1ScL_1_1Feature_1_1Detail_1_1Ob631bdbd03a42b88d42e42ed9dec5324.md) &lt;&gt;<br> |
| struct | [**ResultSwitch&lt; ::ScL::Feature::Detail::Operator::LeftExposingCase, ::ScL::Feature::Detail::Operator::VoidCase &gt;**](structScL_1_1Feature_1_1Detail_1_1Operator_1_1ResultSwitch_3_01_1_1ScL_1_1Feature_1_1Detail_1_1O3a694d5bf72ff4a68decf32971458872.md) &lt;&gt;<br> |
| struct | [**ResultSwitch&lt; ::ScL::Feature::Detail::Operator::LeftWrapperCase, ::ScL::Feature::Detail::Operator::BlockedCase &gt;**](structScL_1_1Feature_1_1Detail_1_1Operator_1_1ResultSwitch_3_01_1_1ScL_1_1Feature_1_1Detail_1_1O6857803d17e09ac1ce156750b8eefaea.md) &lt;&gt;<br> |
| struct | [**ResultSwitch&lt; ::ScL::Feature::Detail::Operator::LeftWrapperCase, ::ScL::Feature::Detail::Operator::VoidCase &gt;**](structScL_1_1Feature_1_1Detail_1_1Operator_1_1ResultSwitch_3_01_1_1ScL_1_1Feature_1_1Detail_1_1Od7f28f44452e6f228924027f50051bed.md) &lt;&gt;<br> |
| struct | [**ResultSwitch&lt; ::ScL::Feature::Detail::Operator::RightExposingCase, ::ScL::Feature::Detail::Operator::BlockedCase &gt;**](structScL_1_1Feature_1_1Detail_1_1Operator_1_1ResultSwitch_3_01_1_1ScL_1_1Feature_1_1Detail_1_1O12e209fe48281b5094e6a57070e7f277.md) &lt;&gt;<br> |
| struct | [**ResultSwitch&lt; ::ScL::Feature::Detail::Operator::RightExposingCase, ::ScL::Feature::Detail::Operator::VoidCase &gt;**](structScL_1_1Feature_1_1Detail_1_1Operator_1_1ResultSwitch_3_01_1_1ScL_1_1Feature_1_1Detail_1_1Od7d75aba007380daff182459eef861ad.md) &lt;&gt;<br> |
| struct | [**ResultSwitch&lt; ::ScL::Feature::Detail::Operator::RightWrapperCase, ::ScL::Feature::Detail::Operator::BlockedCase &gt;**](structScL_1_1Feature_1_1Detail_1_1Operator_1_1ResultSwitch_3_01_1_1ScL_1_1Feature_1_1Detail_1_1Oc08b2779a3a30ec6a2f5e495d91aae12.md) &lt;&gt;<br> |
| struct | [**ResultSwitch&lt; ::ScL::Feature::Detail::Operator::RightWrapperCase, ::ScL::Feature::Detail::Operator::VoidCase &gt;**](structScL_1_1Feature_1_1Detail_1_1Operator_1_1ResultSwitch_3_01_1_1ScL_1_1Feature_1_1Detail_1_1O0c4e60039c5f05d920bf2bdaeee6e427.md) &lt;&gt;<br> |
| struct | [**WrapperCaseHelper**](structScL_1_1Feature_1_1Detail_1_1Operator_1_1WrapperCaseHelper.md) &lt;typename \_Left, typename \_Right&gt;<br> |

















































## Macros

| Type | Name |
| ---: | :--- |
| define  | [**SCL\_FEATURE\_OPERATOR\_RESULT\_SWITCH\_H**](result__switch_8h.md#define-scl_feature_operator_result_switch_h)  <br> |

## Macro Definition Documentation





### define SCL\_FEATURE\_OPERATOR\_RESULT\_SWITCH\_H 

```C++
#define SCL_FEATURE_OPERATOR_RESULT_SWITCH_H 
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/detail/result_switch.h`

