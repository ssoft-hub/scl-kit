

# Struct ScL::Feature::Detail::Operator::ExposingCaseHelper

**template &lt;typename \_Left, typename \_Right&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Detail**](namespaceScL_1_1Feature_1_1Detail.md) **>** [**Operator**](namespaceScL_1_1Feature_1_1Detail_1_1Operator.md) **>** [**ExposingCaseHelper**](structScL_1_1Feature_1_1Detail_1_1Operator_1_1ExposingCaseHelper.md)






















## Public Types

| Type | Name |
| ---: | :--- |
| typedef ::std::decay\_t&lt; \_Left &gt; | [**Left**](#typedef-left)  <br> |
| typedef ::std::decay\_t&lt; \_Right &gt; | [**Right**](#typedef-right)  <br> |
| typedef ::std::conditional\_t&lt; ::ScL::Feature::isPartOfThisCompatibleWithOther&lt; Right, Left &gt;(), RightExposingCase, ::std::conditional\_t&lt; ::ScL::Feature::isThisCompatibleWithPartOfOther&lt; Right, Left &gt;(), LeftExposingCase, BothExposingCase &gt; &gt; | [**Type**](#typedef-type)  <br> |
















































## Public Types Documentation




### typedef Left 

```C++
using ScL::Feature::Detail::Operator::ExposingCaseHelper< _Left, _Right >::Left =  ::std::decay_t<_Left>;
```




<hr>



### typedef Right 

```C++
using ScL::Feature::Detail::Operator::ExposingCaseHelper< _Left, _Right >::Right =  ::std::decay_t<_Right>;
```




<hr>



### typedef Type 

```C++
using ScL::Feature::Detail::Operator::ExposingCaseHelper< _Left, _Right >::Type =  ::std::conditional_t< ::ScL::Feature::isPartOfThisCompatibleWithOther<Right, Left>(), RightExposingCase, ::std::conditional_t< ::ScL::Feature::isThisCompatibleWithPartOfOther<Right, Left>(), LeftExposingCase, BothExposingCase> >;
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/detail/result_switch.h`

