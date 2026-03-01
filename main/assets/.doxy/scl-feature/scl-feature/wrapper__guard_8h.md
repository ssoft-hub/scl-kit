

# File wrapper\_guard.h



[**FileList**](files.md) **>** [**access**](dir_72f9e8d407eb10544270ff484bd5a287.md) **>** [**wrapper\_guard.h**](wrapper__guard_8h.md)

[Go to the source code of this file](wrapper__guard_8h_source.md)



* `#include "detail/holder_interface.h"`
* `#include <scl/utility/type_traits.h>`
* `#include <utility>`













## Namespaces

| Type | Name |
| ---: | :--- |
| namespace | [**ScL**](namespaceScL.md) <br> |
| namespace | [**Feature**](namespaceScL_1_1Feature.md) <br>_This is definition of Wrapper type. No tool duplicates are guarantee._  |
| namespace | [**Detail**](namespaceScL_1_1Feature_1_1Detail.md) <br> |


## Classes

| Type | Name |
| ---: | :--- |
| class | [**WrapperGuardForNonWrapped**](classScL_1_1Feature_1_1Detail_1_1WrapperGuardForNonWrapped.md) &lt;typename \_Refer&gt;<br>_This is the WrapperGuard specialization for non wrapped value. It does nothing around a value._  |
| class | [**WrapperGuardForWrapped**](classScL_1_1Feature_1_1Detail_1_1WrapperGuardForWrapped.md) &lt;typename \_Refer&gt;<br>_This is the WrapperGuard specialization for wrapped value. It activates a feature in the constructor and deactivate it in the destructor._  |
| struct | [**WrapperGuardHelper**](structScL_1_1Feature_1_1Detail_1_1WrapperGuardHelper.md) &lt;typename \_Refer&gt;<br> |
| struct | [**WrapperGuardSwitch&lt; NonWrappedCase, \_Refer &gt;**](structScL_1_1Feature_1_1Detail_1_1WrapperGuardSwitch_3_01NonWrappedCase_00_01__Refer_01_4.md) &lt;typename \_Refer&gt;<br> |
| struct | [**WrapperGuardSwitch&lt; WrappedCase, \_Refer &gt;**](structScL_1_1Feature_1_1Detail_1_1WrapperGuardSwitch_3_01WrappedCase_00_01__Refer_01_4.md) &lt;typename \_Refer&gt;<br> |

















































## Macros

| Type | Name |
| ---: | :--- |
| define  | [**SCL\_FEATURE\_WRAPPER\_GUARD\_H**](wrapper__guard_8h.md#define-scl_feature_wrapper_guard_h)  <br> |

## Macro Definition Documentation





### define SCL\_FEATURE\_WRAPPER\_GUARD\_H 

```C++
#define SCL_FEATURE_WRAPPER_GUARD_H 
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/access/wrapper_guard.h`

