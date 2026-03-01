

# File guard.h

[**File List**](files.md) **>** [**feature**](dir_0353163fedb9ed52d00571e05b9d7425.md) **>** [**src**](dir_128cb90ac92ab15b1b3598556d036c00.md) **>** [**scl**](dir_3cb8c5947ec40e9fe62f293d8773d742.md) **>** [**feature**](dir_fa8d125dcaa64c120bbbc8d1167944b9.md) **>** [**guard.h**](guard_8h.md)

[Go to the documentation of this file](guard_8h.md)


```C++
#pragma once
#ifndef SCL_FEATURE_GUARDED_H
#define SCL_FEATURE_GUARDED_H

#include <scl/feature/tool/reference/raw.h>
#include <scl/feature/trait.h>
#include <scl/feature/wrapper.h>
#include <scl/utility/type_traits.h>

namespace ScL::Feature
{
    template <typename Type_>
    inline decltype(auto) guarded(Type_ && value) noexcept
    {
        if constexpr (::ScL::Feature::isWrapper<::std::decay_t<Type_>>())
        {
            using WrapperRefer = Type_ &&;
            using ValueRefer = ::ScL::SimilarRefer<typename ::std::decay_t<WrapperRefer>::Value,
                WrapperRefer>;

            if constexpr (::ScL::Feature::isWrapper<::std::decay_t<ValueRefer>>())
            {
                auto invokable = [](ValueRefer && value) {
                    return guarded<ValueRefer>(::std::forward<ValueRefer>(value));
                };

                using Invokable = decltype(invokable);
                using Returned = ::std::invoke_result_t<Invokable, ValueRefer>;

                return ::ScL::Feature::Detail::Operator::ResultSwitch<
                    ::ScL::Feature::Detail::Operator::LeftWrapperCase,
                    ::ScL::Feature::Detail::Operator::ResultSwitchCase<Returned,
                        ValueRefer>>::invoke(::std::forward<Invokable>(invokable),
                    ::std::forward<WrapperRefer>(value));
            }
            else
            {
                auto invokable = [](ValueRefer && value) -> ValueRefer && {
                    return ::std::forward<ValueRefer>(value);
                };

                using Invokable = decltype(invokable);
                using Returned = ::std::invoke_result_t<Invokable, ValueRefer>;

                return ::ScL::Feature::Detail::Operator::ResultSwitch<
                    ::ScL::Feature::Detail::Operator::LeftWrapperCase,
                    ::ScL::Feature::Detail::Operator::ResultSwitchCase<Returned,
                        ValueRefer>>::invoke(::std::forward<Invokable>(invokable),
                    ::std::forward<WrapperRefer>(value));
            }
        }
        else
        {
            using Result = ::ScL::Feature::Wrapper<::std::remove_reference_t<Type_>,
                ScL::Feature::Reference::Raw>;
            return Result{value};
        }
    }
} // namespace ScL::Feature

#endif
```


