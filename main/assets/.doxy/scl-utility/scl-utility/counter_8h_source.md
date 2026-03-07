

# File counter.h

[**File List**](files.md) **>** [**module**](dir_a7b0466279106ea0b8f86f609f621680.md) **>** [**utility**](dir_cca185d4009e66bf68ef58b617abaf60.md) **>** [**src**](dir_ab13fdfb8e4c1ff98b437eee9f69d35c.md) **>** [**scl**](dir_ca45970a26780365ec2accbdb8d8d4fe.md) **>** [**utility**](dir_76f6b7cf5a6cf438d50211f1abeeaae6.md) **>** [**preprocessor**](dir_a3b1215870dd7b05435314af8f203f78.md) **>** [**counter.h**](counter_8h.md)

[Go to the documentation of this file](counter_8h.md)


```C++
#pragma once

#include <scl/utility/preprocessor/forward.h>

#include <cstdint>
#include <type_traits>

namespace scl::preprocessor::detail
{
    template <::std::uint_fast32_t N>
    using counter = ::std::integral_constant<::std::uint_fast32_t, N>;

    template <typename Tag, ::std::uint_fast32_t Rank, ::std::uint_fast32_t Acc>
    constexpr counter<Acc>
    crumb(Tag /*tag*/, counter<Rank> /*rank*/, counter<Acc> /*acc*/) // NOLINT(readability-named-parameter)
    {
        return {};
    }
} // namespace scl::preprocessor::detail

#define SCL_COUNTER_CRUMB(Tag, rank, acc)                                                   \
    ::scl::preprocessor::detail::crumb(Tag{}, ::scl::preprocessor::detail::counter<rank>(), \
        ::scl::preprocessor::detail::counter<acc>())

#define SCL_COUNTER_VALUE(Tag)                                                                                                                                                 \
    (SCL_COUNTER_CRUMB(SCL_FORWARD(Tag), 1ul << 0,                                                                                                                             \
        SCL_COUNTER_CRUMB(SCL_FORWARD(Tag), 1ul << 1,                                                                                                                          \
            SCL_COUNTER_CRUMB(SCL_FORWARD(Tag), 1ul << 2,                                                                                                                      \
                SCL_COUNTER_CRUMB(SCL_FORWARD(Tag), 1ul << 3,                                                                                                                  \
                    SCL_COUNTER_CRUMB(SCL_FORWARD(Tag), 1ul << 4,                                                                                                              \
                        SCL_COUNTER_CRUMB(SCL_FORWARD(Tag), 1ul << 5,                                                                                                          \
                            SCL_COUNTER_CRUMB(SCL_FORWARD(Tag), 1ul << 6,                                                                                                      \
                                SCL_COUNTER_CRUMB(SCL_FORWARD(Tag), 1ul << 7,                                                                                                  \
                                    SCL_COUNTER_CRUMB(SCL_FORWARD(Tag), 1ul << 8,                                                                                              \
                                        SCL_COUNTER_CRUMB(SCL_FORWARD(Tag), 1ul << 9,                                                                                          \
                                            SCL_COUNTER_CRUMB(SCL_FORWARD(Tag), 1ul << 10,                                                                                     \
                                                SCL_COUNTER_CRUMB(SCL_FORWARD(Tag), 1ul << 11,                                                                                 \
                                                    SCL_COUNTER_CRUMB(SCL_FORWARD(Tag), 1ul << 12,                                                                             \
                                                        SCL_COUNTER_CRUMB(SCL_FORWARD(Tag), 1ul << 13,                                                                         \
                                                            SCL_COUNTER_CRUMB(SCL_FORWARD(Tag), 1ul << 14,                                                                     \
                                                                SCL_COUNTER_CRUMB(SCL_FORWARD(Tag), 1ul << 15,                                                                 \
                                                                    SCL_COUNTER_CRUMB(SCL_FORWARD(Tag), 1ul << 16,                                                             \
                                                                        SCL_COUNTER_CRUMB(SCL_FORWARD(Tag), 1ul << 17,                                                         \
                                                                            SCL_COUNTER_CRUMB(SCL_FORWARD(Tag), 1ul << 18,                                                     \
                                                                                SCL_COUNTER_CRUMB(SCL_FORWARD(Tag), 1ul << 19,                                                 \
                                                                                    SCL_COUNTER_CRUMB(SCL_FORWARD(Tag), 1ul << 20,                                             \
                                                                                        SCL_COUNTER_CRUMB(SCL_FORWARD(Tag), 1ul << 21,                                         \
                                                                                            SCL_COUNTER_CRUMB(SCL_FORWARD(Tag), 1ul << 22,                                     \
                                                                                                SCL_COUNTER_CRUMB(SCL_FORWARD(Tag), 1ul << 23,                                 \
                                                                                                    SCL_COUNTER_CRUMB(SCL_FORWARD(Tag), 1ul << 24,                             \
                                                                                                        SCL_COUNTER_CRUMB(SCL_FORWARD(Tag), 1ul << 25,                         \
                                                                                                            SCL_COUNTER_CRUMB(SCL_FORWARD(Tag), 1ul << 26,                     \
                                                                                                                SCL_COUNTER_CRUMB(SCL_FORWARD(Tag), 1ul << 27,                 \
                                                                                                                    SCL_COUNTER_CRUMB(SCL_FORWARD(Tag), 1ul << 28,             \
                                                                                                                        SCL_COUNTER_CRUMB(SCL_FORWARD(Tag), 1ul << 29,         \
                                                                                                                            SCL_COUNTER_CRUMB(SCL_FORWARD(Tag), 1ul << 30,     \
                                                                                                                                SCL_COUNTER_CRUMB(SCL_FORWARD(Tag), 1ul << 31, \
                                                                                                                                    0))))))))))))))))))))))))))))))))          \
            .value)

#define SCL_COUNTER_NEXT(Tag)                                                                          \
    namespace scl::preprocessor::detail                                                                \
    {                                                                                                  \
        constexpr counter<SCL_COUNTER_VALUE(SCL_FORWARD(Tag)) + 1> crumb(Tag,                          \
            counter<(SCL_COUNTER_VALUE(SCL_FORWARD(Tag)) + 1) & ~SCL_COUNTER_VALUE(SCL_FORWARD(Tag))>, \
            counter<(SCL_COUNTER_VALUE(SCL_FORWARD(Tag)) + 1) & SCL_COUNTER_VALUE(SCL_FORWARD(Tag))>)  \
        {                                                                                              \
            return {};                                                                                 \
        }                                                                                              \
    }

// http://b.atch.se/posts/non-constant-constant-expressions/
// http://b.atch.se/posts/constexpr-counter/#prereq-adl
// https://stackoverflow.com/questions/44267673/is-stateful-metaprogramming-ill-formed-yet
// http://www.open-std.org/jtc1/sc22/wg21/docs/cwg_active.html#2118

// namespace scl
//{
//     template < typename Tag_ >
//     class counter
//     {
//         using Value = int;

//        template < Value n >
//        struct Index
//        {
//            friend constexpr Value adlValue ( Index< n > );
//        };

//        template < Value n >
//        struct Writer
//        {
//            friend constexpr Value adlValue ( Index< n > ) { return n; }
//            static constexpr Value value = n;
//        };

//        template < Value n >
//        static constexpr Value increment ( float, Index< n > )
//        { return n; }

//        template < Value n, Value = adlValue( Index< n >{} ) >
//        static constexpr Value increment ( Value, Index< n >, Value v = increment( 0, Index< n + 1 >{} ) ) { return v; }

//    public:
//        template < Value n = 0 >
//        static constexpr Value next ( Value v = value_of< Writer< increment( 0, Index< 0 >{} ) + n > > ) { return v + 1; }

//        template < Value n = 0 >
//        static constexpr Value value ( Value v = value_of< Writer< increment( 0, Index< 0 >{} ) + n - 1 > > ) { return v + 1; }
//    };
//}
```


