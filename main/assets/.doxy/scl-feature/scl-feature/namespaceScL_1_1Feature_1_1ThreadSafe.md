

# Namespace ScL::Feature::ThreadSafe



[**Namespace List**](namespaces.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**ThreadSafe**](namespaceScL_1_1Feature_1_1ThreadSafe.md)




















## Classes

| Type | Name |
| ---: | :--- |
| struct | [**Lock**](structScL_1_1Feature_1_1ThreadSafe_1_1Lock.md) &lt;typename \_Lock&gt;<br> |
| struct | [**Locking**](structScL_1_1Feature_1_1ThreadSafe_1_1Locking.md) &lt;typename \_Lock, typename \_HolderRefer&gt;<br> |
| struct | [**Locking&lt; ::ScL::SharedMutex, \_Holder &gt;**](structScL_1_1Feature_1_1ThreadSafe_1_1Locking_3_01_1_1ScL_1_1SharedMutex_00_01__Holder_01_4.md) &lt;typename \_Holder&gt;<br> |
| struct | [**Locking&lt; ::ScL::SharedMutex, const \_Holder &gt;**](structScL_1_1Feature_1_1ThreadSafe_1_1Locking_3_01_1_1ScL_1_1SharedMutex_00_01const_01__Holder_01_4.md) &lt;typename \_Holder&gt;<br> |
| struct | [**Locking&lt; ::std::atomic&lt; bool &gt;, \_Holder &gt;**](structScL_1_1Feature_1_1ThreadSafe_1_1Locking_3_01_1_1std_1_1atomic_3_01bool_01_4_00_01__Holder_01_4.md) &lt;typename \_Holder&gt;<br> |
| struct | [**Locking&lt; ::std::mutex, \_Holder &gt;**](structScL_1_1Feature_1_1ThreadSafe_1_1Locking_3_01_1_1std_1_1mutex_00_01__Holder_01_4.md) &lt;typename \_Holder&gt;<br> |
| struct | [**Locking&lt; ::std::recursive\_mutex, \_Holder &gt;**](structScL_1_1Feature_1_1ThreadSafe_1_1Locking_3_01_1_1std_1_1recursive__mutex_00_01__Holder_01_4.md) &lt;typename \_Holder&gt;<br> |


## Public Types

| Type | Name |
| ---: | :--- |
| typedef [**::ScL::Feature::ThreadSafe::Lock**](structScL_1_1Feature_1_1ThreadSafe_1_1Lock.md)&lt; ::std::atomic&lt; bool &gt; &gt; | [**Atomic**](#typedef-atomic)  <br> |
| typedef [**::ScL::Feature::ThreadSafe::Lock**](structScL_1_1Feature_1_1ThreadSafe_1_1Lock.md)&lt; ::std::mutex &gt; | [**Mutex**](#typedef-mutex)  <br> |
| typedef [**::ScL::Feature::ThreadSafe::Lock**](structScL_1_1Feature_1_1ThreadSafe_1_1Lock.md)&lt; ::std::recursive\_mutex &gt; | [**RecursiveMutex**](#typedef-recursivemutex)  <br> |
| typedef [**::ScL::Feature::ThreadSafe::Lock**](structScL_1_1Feature_1_1ThreadSafe_1_1Lock.md)&lt; ::ScL::SharedMutex &gt; | [**SharedMutex**](#typedef-sharedmutex)  <br> |
















































## Public Types Documentation




### typedef Atomic 

```C++
using ScL::Feature::ThreadSafe::Atomic = typedef ::ScL::Feature::ThreadSafe::Lock< ::std::atomic<bool> >;
```




<hr>



### typedef Mutex 

```C++
using ScL::Feature::ThreadSafe::Mutex = typedef ::ScL::Feature::ThreadSafe::Lock< ::std::mutex>;
```




<hr>



### typedef RecursiveMutex 

```C++
using ScL::Feature::ThreadSafe::RecursiveMutex = typedef ::ScL::Feature::ThreadSafe::Lock< ::std::recursive_mutex>;
```




<hr>



### typedef SharedMutex 

```C++
using ScL::Feature::ThreadSafe::SharedMutex = typedef ::ScL::Feature::ThreadSafe::Lock< ::ScL::SharedMutex >;
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/tool/thread_safe/atomic.h`

