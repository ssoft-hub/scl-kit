

# File enum.h

[**File List**](files.md) **>** [**meta**](dir_85c7392cbdcb0ae852d6674ea46dde19.md) **>** [**enum.h**](enum_8h.md)

[Go to the documentation of this file](enum_8h.md)


```C++
#pragma once

#include <string_view>
#include <type_traits>

enum we5r256sg_e // NOLINT(cppcoreguidelines-use-enum-class, performance-enum-size)
{
    we5r256sg_v
};

namespace scl::detail
{
    template <auto V>
        requires ::std::is_enum_v<decltype(V)>
    constexpr ::std::string_view enum_name_pattern_text() noexcept
    {
#ifdef _MSC_VER
        return __FUNCSIG__;
#else
        return __PRETTY_FUNCTION__;
#endif
    }

    constexpr auto enum_prefix_lenght() noexcept
    {
        constexpr auto msvc_prefix_length =
            enum_name_pattern_text<we5r256sg_e::we5r256sg_v>().find("enum we5r256sg_e::we5r256sg_v");
        constexpr auto full_prefix_length =
            enum_name_pattern_text<we5r256sg_e::we5r256sg_v>().find("we5r256sg_e::we5r256sg_v");
        constexpr auto short_prefix_length = enum_name_pattern_text<we5r256sg_e::we5r256sg_v>().find("we5r256sg_v");
        if constexpr (msvc_prefix_length != ::std::string_view::npos)
            return msvc_prefix_length;
        else if constexpr (full_prefix_length != ::std::string_view::npos)
            return full_prefix_length;
        else if constexpr (short_prefix_length != ::std::string_view::npos)
            return short_prefix_length;
        else
            return 0;
    }

    constexpr auto enum_suffix_lenght() noexcept
    {
        constexpr auto text = enum_name_pattern_text<we5r256sg_v>(); // NOLINT(cppcoreguidelines-use-enum-class)
        return text.length() - enum_prefix_lenght() - ::std::string_view("we5r256sg_v").length();
    }
} // namespace scl::detail

namespace scl
{
    template <auto V>
        requires ::std::is_enum_v<decltype(V)>
    constexpr ::std::string_view enum_name() noexcept
    {
        constexpr auto text = detail::enum_name_pattern_text<V>();
        constexpr auto prefix_length = detail::enum_prefix_lenght();
        constexpr auto suffix_length = detail::enum_suffix_lenght();

        constexpr auto result = text.substr(prefix_length, text.length() - prefix_length - suffix_length);

        // Strip MSVC-specific 'enum ' prefix
        if constexpr (result.starts_with("enum "))
            return result.substr(5);
        else
            return result;
    }

    template <auto V>
        requires ::std::is_enum_v<decltype(V)>
    constexpr ::std::string_view enum_short_name() noexcept
    {
        constexpr auto result = enum_name<V>();
        constexpr auto pos = result.find_last_of(':');
        if constexpr (pos != ::std::string_view::npos)
            return result.substr(pos + 1);
        else
            return result;
    }

} // namespace scl
```


