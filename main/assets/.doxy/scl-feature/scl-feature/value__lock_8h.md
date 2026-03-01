

# File value\_lock.h



[**FileList**](files.md) **>** [**access**](dir_72f9e8d407eb10544270ff484bd5a287.md) **>** [**value\_lock.h**](value__lock_8h.md)

[Go to the source code of this file](value__lock_8h_source.md)



* `#include <scl/feature/access/wrapper_lock.h>`
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
| class | [**ValueLockForNonWrapped**](classScL_1_1Feature_1_1Detail_1_1ValueLockForNonWrapped.md) &lt;typename Refer\_&gt;<br>_This is the WrapperLock specialization for non wrapped value. It does nothing around a value._  |
| class | [**ValueLockForWrapped**](classScL_1_1Feature_1_1Detail_1_1ValueLockForWrapped.md) &lt;typename Refer\_&gt;<br>_This is the ValueLock specialization for multi wrapped value. It activates all features in the constructor and deactivate them in the destructor._  |
| struct | [**ValueLockHelper**](structScL_1_1Feature_1_1Detail_1_1ValueLockHelper.md) &lt;typename Refer\_&gt;<br> |
| struct | [**ValueLockSwitch&lt; NonWrappedCase, Refer\_ &gt;**](structScL_1_1Feature_1_1Detail_1_1ValueLockSwitch_3_01NonWrappedCase_00_01Refer___01_4.md) &lt;typename Refer\_&gt;<br> |
| struct | [**ValueLockSwitch&lt; WrappedCase, Refer\_ &gt;**](structScL_1_1Feature_1_1Detail_1_1ValueLockSwitch_3_01WrappedCase_00_01Refer___01_4.md) &lt;typename Refer\_&gt;<br> |

















































## Macros

| Type | Name |
| ---: | :--- |
| define  | [**SCL\_FEATURE\_ACCESS\_VALUE\_LOCK\_H**](value__lock_8h.md#define-scl_feature_access_value_lock_h)  <br> |

## Macro Definition Documentation





### define SCL\_FEATURE\_ACCESS\_VALUE\_LOCK\_H 

```C++
#define SCL_FEATURE_ACCESS_VALUE_LOCK_H 
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/access/value_lock.h`

