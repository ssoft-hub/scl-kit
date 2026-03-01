

# Struct ScL::Feature::Detail::Operator::ResultCaseWrapperHelper&lt; true, \_Returned, \_Refer &gt;

**template &lt;typename \_Returned, typename \_Refer&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Detail**](namespaceScL_1_1Feature_1_1Detail.md) **>** [**Operator**](namespaceScL_1_1Feature_1_1Detail_1_1Operator.md) **>** [**ResultCaseWrapperHelper&lt; true, \_Returned, \_Refer &gt;**](structScL_1_1Feature_1_1Detail_1_1Operator_1_1ResultCaseWrapperHelper_3_01true_00_01__Returned_00_01__Refer_01_4.md)






















## Public Types

| Type | Name |
| ---: | :--- |
| typedef \_Returned | [**Returned**](#typedef-returned)  <br> |
| typedef ::std::conditional\_t&lt; ::std::is\_reference&lt; Value &gt;::value, ::ScL::Feature::Detail::Operator::BlockedCase, ::ScL::Feature::Detail::Operator::BlockedCase &gt; | [**Type**](#typedef-type)  <br> |
| typedef typename Wrapper::Value | [**Value**](#typedef-value)  <br> |
| typedef ::std::decay\_t&lt; Returned &gt; | [**Wrapper**](#typedef-wrapper)  <br> |
















































## Public Types Documentation




### typedef Returned 

```C++
using ScL::Feature::Detail::Operator::ResultCaseWrapperHelper< true, _Returned, _Refer >::Returned =  _Returned;
```




<hr>



### typedef Type 

```C++
using ScL::Feature::Detail::Operator::ResultCaseWrapperHelper< true, _Returned, _Refer >::Type =  ::std::conditional_t< ::std::is_reference<Value>::value, ::ScL::Feature::Detail::Operator::BlockedCase, ::ScL::Feature::Detail::Operator::BlockedCase>;
```




<hr>



### typedef Value 

```C++
using ScL::Feature::Detail::Operator::ResultCaseWrapperHelper< true, _Returned, _Refer >::Value =  typename Wrapper::Value;
```




<hr>



### typedef Wrapper 

```C++
using ScL::Feature::Detail::Operator::ResultCaseWrapperHelper< true, _Returned, _Refer >::Wrapper =  ::std::decay_t<Returned>;
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/detail/result_switch.h`

