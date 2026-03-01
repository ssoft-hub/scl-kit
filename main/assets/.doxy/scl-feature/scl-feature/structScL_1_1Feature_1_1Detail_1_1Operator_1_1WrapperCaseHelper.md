

# Struct ScL::Feature::Detail::Operator::WrapperCaseHelper

**template &lt;typename \_Left, typename \_Right&gt;**



[**ClassList**](annotated.md) **>** [**ScL**](namespaceScL.md) **>** [**Feature**](namespaceScL_1_1Feature.md) **>** [**Detail**](namespaceScL_1_1Feature_1_1Detail.md) **>** [**Operator**](namespaceScL_1_1Feature_1_1Detail_1_1Operator.md) **>** [**WrapperCaseHelper**](structScL_1_1Feature_1_1Detail_1_1Operator_1_1WrapperCaseHelper.md)






















## Public Types

| Type | Name |
| ---: | :--- |
| typedef ::std::decay\_t&lt; \_Left &gt; | [**Left**](#typedef-left)  <br> |
| typedef ::std::decay\_t&lt; \_Right &gt; | [**Right**](#typedef-right)  <br> |
| typedef ::std::conditional\_t&lt; ::ScL::Feature::isWrapper&lt; Left &gt;() &&::ScL::Feature::isWrapper&lt; Right &gt;(), BothWrapperCase, ::std::conditional\_t&lt; ::ScL::Feature::isWrapper&lt; Left &gt;(), LeftWrapperCase, ::std::conditional\_t&lt; ::ScL::Feature::isWrapper&lt; Right &gt;(), RightWrapperCase, NoneWrapperCase &gt; &gt; &gt; | [**Type**](#typedef-type)  <br> |
















































## Public Types Documentation




### typedef Left 

```C++
using ScL::Feature::Detail::Operator::WrapperCaseHelper< _Left, _Right >::Left =  ::std::decay_t<_Left>;
```




<hr>



### typedef Right 

```C++
using ScL::Feature::Detail::Operator::WrapperCaseHelper< _Left, _Right >::Right =  ::std::decay_t<_Right>;
```




<hr>



### typedef Type 

```C++
using ScL::Feature::Detail::Operator::WrapperCaseHelper< _Left, _Right >::Type =  ::std::conditional_t< ::ScL::Feature::isWrapper<Left>() && ::ScL::Feature::isWrapper<Right>(), BothWrapperCase, ::std::conditional_t< ::ScL::Feature::isWrapper<Left>(), LeftWrapperCase, ::std::conditional_t< ::ScL::Feature::isWrapper<Right>(), RightWrapperCase, NoneWrapperCase> > >;
```




<hr>

------------------------------
The documentation for this class was generated from the following file `module/feature/src/scl/feature/detail/result_switch.h`

