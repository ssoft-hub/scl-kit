

# File wrapper\_lock.h



[**FileList**](files.md) **>** [**access**](dir_72f9e8d407eb10544270ff484bd5a287.md) **>** [**wrapper\_lock.h**](wrapper__lock_8h.md)

[Go to the source code of this file](wrapper__lock_8h_source.md)



* `#include "detail/holder_interface.h"`
* `#include <scl/utility/type_traits.h>`
* `#include <cassert>`
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
| class | [**WrapperLockForNonWrapped**](classScL_1_1Feature_1_1Detail_1_1WrapperLockForNonWrapped.md) &lt;typename \_Refer&gt;<br>_This is the WrapperLock specialization for non wrapped value. It does nothing around a value._  |
| class | [**WrapperLockForWrapped**](classScL_1_1Feature_1_1Detail_1_1WrapperLockForWrapped.md) &lt;typename \_Refer&gt;<br>_This is the WrapperLock specialization for wrapped value. It activates a feature in the constructor and deactivate it in the destructor._  |
| struct | [**WrapperLockHelper**](structScL_1_1Feature_1_1Detail_1_1WrapperLockHelper.md) &lt;typename \_Refer&gt;<br> |
| struct | [**WrapperLockSwitch&lt; NonWrappedCase, \_Refer &gt;**](structScL_1_1Feature_1_1Detail_1_1WrapperLockSwitch_3_01NonWrappedCase_00_01__Refer_01_4.md) &lt;typename \_Refer&gt;<br> |
| struct | [**WrapperLockSwitch&lt; WrappedCase, \_Refer &gt;**](structScL_1_1Feature_1_1Detail_1_1WrapperLockSwitch_3_01WrappedCase_00_01__Refer_01_4.md) &lt;typename \_Refer&gt;<br> |

















































## Macros

| Type | Name |
| ---: | :--- |
| define  | [**SCL\_FEATURE\_WRAPPER\_LOCK\_H**](wrapper__lock_8h.md#define-scl_feature_wrapper_lock_h)  <br> |

## Macro Definition Documentation





### define SCL\_FEATURE\_WRAPPER\_LOCK\_H 

```C++
#define SCL_FEATURE_WRAPPER_LOCK_H 
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/access/wrapper_lock.h`

