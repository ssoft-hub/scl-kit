

# File value\_guard.h



[**FileList**](files.md) **>** [**access**](dir_72f9e8d407eb10544270ff484bd5a287.md) **>** [**value\_guard.h**](value__guard_8h.md)

[Go to the source code of this file](value__guard_8h_source.md)



* `#include <scl/feature/access/wrapper_guard.h>`
* `#include <scl/feature/trait.h>`
* `#include <scl/utility/type_traits.h>`













## Namespaces

| Type | Name |
| ---: | :--- |
| namespace | [**ScL**](namespaceScL.md) <br> |
| namespace | [**Feature**](namespaceScL_1_1Feature.md) <br>_This is definition of Wrapper type. No tool duplicates are guarantee._  |
| namespace | [**Detail**](namespaceScL_1_1Feature_1_1Detail.md) <br> |


## Classes

| Type | Name |
| ---: | :--- |
| class | [**ValueGuardForNonWrapped**](classScL_1_1Feature_1_1Detail_1_1ValueGuardForNonWrapped.md) &lt;typename \_Refer&gt;<br>_This is the WrapperGuard specialization for non wrapped value. It does nothing around a value._  |
| class | [**ValueGuardForWrapped**](classScL_1_1Feature_1_1Detail_1_1ValueGuardForWrapped.md) &lt;typename \_Refer&gt;<br>_This is the ValueGuard specialization for multi wrapped value. It activates all features in the constructor and deactivate them in the destructor._  |
| struct | [**ValueGuardHelper**](structScL_1_1Feature_1_1Detail_1_1ValueGuardHelper.md) &lt;typename \_Refer&gt;<br> |
| struct | [**ValueGuardSwitch&lt; NonWrappedCase, \_Refer &gt;**](structScL_1_1Feature_1_1Detail_1_1ValueGuardSwitch_3_01NonWrappedCase_00_01__Refer_01_4.md) &lt;typename \_Refer&gt;<br> |
| struct | [**ValueGuardSwitch&lt; WrappedCase, \_Refer &gt;**](structScL_1_1Feature_1_1Detail_1_1ValueGuardSwitch_3_01WrappedCase_00_01__Refer_01_4.md) &lt;typename \_Refer&gt;<br> |

















































## Macros

| Type | Name |
| ---: | :--- |
| define  | [**SCL\_FEATURE\_ACCESS\_VALUE\_GUARD\_H**](value__guard_8h.md#define-scl_feature_access_value_guard_h)  <br> |

## Macro Definition Documentation





### define SCL\_FEATURE\_ACCESS\_VALUE\_GUARD\_H 

```C++
#define SCL_FEATURE_ACCESS_VALUE_GUARD_H 
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/access/value_guard.h`

