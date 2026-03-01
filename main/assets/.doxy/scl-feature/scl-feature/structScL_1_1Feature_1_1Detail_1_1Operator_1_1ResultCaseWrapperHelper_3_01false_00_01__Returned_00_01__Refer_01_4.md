

# Struct ScL::Feature::Detail::Operator::ResultCaseWrapperHelper&lt; false, \_Returned, \_Refer &gt;

**template &lt;typename \_Returned, typename \_Refer&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Detail**](namespaceScL_1_1Feature_1_1Detail.md) **>** [**Operator**](namespaceScL_1_1Feature_1_1Detail_1_1Operator.md) **>** [**ResultCaseWrapperHelper&lt; false, \_Returned, \_Refer &gt;**](structScL_1_1Feature_1_1Detail_1_1Operator_1_1ResultCaseWrapperHelper_3_01false_00_01__Returned_00_01__Refer_01_4.md)






















## Public Types

| Type | Name |
| ---: | :--- |
| typedef \_Returned | [**Returned**](#typedef-returned)  <br> |
| typedef ::std::conditional\_t&lt; ::std::is\_void&lt; Returned &gt;::value, ::ScL::Feature::Detail::Operator::VoidCase, ::ScL::Feature::Detail::Operator::BlockedCase &gt; | [**Type**](#typedef-type)  <br> |
| typedef ::std::decay\_t&lt; \_Refer &gt; | [**Value**](#typedef-value)  <br> |
















































## Public Types Documentation




### typedef Returned 

```C++
using ScL::Feature::Detail::Operator::ResultCaseWrapperHelper< false, _Returned, _Refer >::Returned =  _Returned;
```




<hr>



### typedef Type 

```C++
using ScL::Feature::Detail::Operator::ResultCaseWrapperHelper< false, _Returned, _Refer >::Type =  ::std::conditional_t< ::std::is_void<Returned>::value, ::ScL::Feature::Detail::Operator::VoidCase, ::ScL::Feature::Detail::Operator::BlockedCase>;
```




<hr>



### typedef Value 

```C++
using ScL::Feature::Detail::Operator::ResultCaseWrapperHelper< false, _Returned, _Refer >::Value =  ::std::decay_t<_Refer>;
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/detail/result_switch.h`

