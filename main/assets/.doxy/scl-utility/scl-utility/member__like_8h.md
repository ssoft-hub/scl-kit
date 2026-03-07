

# File member\_like.h



[**FileList**](files.md) **>** [**module**](dir_a7b0466279106ea0b8f86f609f621680.md) **>** [**utility**](dir_cca185d4009e66bf68ef58b617abaf60.md) **>** [**src**](dir_ab13fdfb8e4c1ff98b437eee9f69d35c.md) **>** [**scl**](dir_ca45970a26780365ec2accbdb8d8d4fe.md) **>** [**utility**](dir_76f6b7cf5a6cf438d50211f1abeeaae6.md) **>** [**type\_traits**](dir_ee84acd7aed8e5e3b0eed877408f2d18.md) **>** [**member\_like.h**](member__like_8h.md)

[Go to the source code of this file](member__like_8h_source.md)

_Traits to build pointers to class members (C++20)._ [More...](#detailed-description)

* `#include <type_traits>`













## Namespaces

| Type | Name |
| ---: | :--- |
| namespace | [**scl**](namespacescl.md) <br>_Root namespace of ScL project._  |




















































## Detailed Description



* [**scl::member\_function\_like\_t&lt;Type, Signature&gt;**](group__scl__utility__type__traits.md#typedef-member_function_like_t): Builds a pointer-to-member-function type: Result (::std::remove\_cvref\_t&lt;Type&gt;::\*)(Arguments...) [cv] [ref] [noexcept] where [cv]/[ref] are mirrored from Type and [noexcept] is mirrored from Signature.
* [**scl::member\_property\_like\_t&lt;Type, Member&gt;**](group__scl__utility__type__traits.md#typedef-member_property_like_t): Builds a pointer-to-data-member type: Member (::std::remove\_cvref\_t&lt;Type&gt;::\*) Object cv/ref qualifiers do not affect the pointer type for data members. 




    

------------------------------
The documentation for this class was generated from the following file `module/utility/src/scl/utility/type_traits/member_like.h`

