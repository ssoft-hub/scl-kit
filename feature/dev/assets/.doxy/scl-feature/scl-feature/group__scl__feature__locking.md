

# Group scl\_feature\_locking



[**Modules**](modules.md) **>** [**scl\_feature\_locking**](group__scl__feature__locking.md)



_RAII guards and lazy locks for wrapper and plain value types._ [More...](#detailed-description)


































































## Detailed Description


Three complementary primitives cover the full range of locking needs for `scl::wrapper` chains:



|Type   |Acquisition   |Depth    |
|-----|-----|-----|
|`scl::wrapper_guard`   |eager (constructor)   |single layer    |
|`scl::wrapper_lock`   |lazy (`lock()`)   |single layer    |
|`scl::value_lock`   |lazy (`lock_for()`)   |entire chain   |






All three are transparent for non-wrapper types: construction, locking, and value access become no-ops or direct reference passes respectively. 


    

------------------------------


