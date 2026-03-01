

# File symbol.h

[**File List**](files.md) **>** [**meta**](dir_85c7392cbdcb0ae852d6674ea46dde19.md) **>** [**symbol.h**](symbol_8h.md)

[Go to the documentation of this file](symbol_8h.md)


```C++
#pragma once

#include <string_view>

inline void lah4l4tjla6_f() {}

namespace scl::detail
{
    template <auto S>
    constexpr ::std::string_view symbol_pattern_text() noexcept
    {
#if defined(_MSC_VER) && !defined(__clang__)
        return __FUNCSIG__;
#else
        return __PRETTY_FUNCTION__;
#endif
    }

#if defined(_MSC_VER) && !defined(__clang__)
    // MSVC-specific: use bracket extraction like type_name
    constexpr ::std::size_t symbol_prefix_length() noexcept
    {
        constexpr auto text = symbol_pattern_text<lah4l4tjla6_f>();
        constexpr auto close_pattern = text.rfind(">(");
        if constexpr (close_pattern == ::std::string_view::npos)
            return 0;
        constexpr auto before_close = text.substr(0, close_pattern);
        constexpr auto open_bracket = before_close.find_last_of('<');
        return (open_bracket != ::std::string_view::npos) ? open_bracket + 1 : 0;
    }

    constexpr auto symbol_suffix_length() noexcept
    {
        constexpr auto text = symbol_pattern_text<lah4l4tjla6_f>();
        constexpr auto close_pattern = text.rfind(">(");
        return (close_pattern != ::std::string_view::npos) ? text.length() - close_pattern : 0;
    }

    // Helper to strip MSVC function signature decorations
    // Format: "void __cdecl Namespace::func(args)" -> "Namespace::func"
    constexpr ::std::string_view strip_msvc_function_decorations(::std::string_view name) noexcept
    {
        auto last_space = name.find_last_of(' ');
        if (last_space != ::std::string_view::npos)
        {
            auto after_space = name.substr(last_space + 1);
            auto paren = after_space.find('(');
            if (paren != ::std::string_view::npos)
                return after_space.substr(0, paren);
        }
        return name;
    }
#else
    // GCC/Clang: use marker search
    constexpr auto symbol_prefix_length() noexcept
    {
        return symbol_pattern_text<lah4l4tjla6_f>().find("lah4l4tjla6_f");
    }

    constexpr auto symbol_suffix_length() noexcept
    {
        constexpr auto text = symbol_pattern_text<lah4l4tjla6_f>();
        return text.length() - symbol_prefix_length() - ::std::string_view("lah4l4tjla6_f").length();
    }
#endif
} // namespace scl::detail

namespace scl
{
    template <auto S>
    constexpr ::std::string_view symbol_name() noexcept
    {
        constexpr auto text = detail::symbol_pattern_text<S>();
        constexpr auto prefix_length = detail::symbol_prefix_length();
        constexpr auto suffix_length = detail::symbol_suffix_length();

        constexpr auto result = text.substr(prefix_length, text.length() - prefix_length - suffix_length);

#if defined(_MSC_VER) && !defined(__clang__)
        // MSVC includes function signature like "void __cdecl Name(args)"
        constexpr auto cleaned = detail::strip_msvc_function_decorations(result);
#else
        constexpr auto cleaned = result;
#endif

        // Clean up junk characters (spaces, parens, ampersands)
        constexpr auto junk = " ()&";
        constexpr auto begin_pos = cleaned.find_first_not_of(junk);
        if constexpr (begin_pos == ::std::string_view::npos)
            return {};
        constexpr auto last_pos = cleaned.find_last_not_of(junk);
        return cleaned.substr(begin_pos, last_pos - begin_pos + 1);
    }

    template <auto S>
    constexpr ::std::string_view symbol_short_name() noexcept
    {
        constexpr auto result = symbol_name<S>();
        constexpr auto pos = result.find_last_of(':');
        if constexpr (pos != ::std::string_view::npos)
            return result.substr(pos + 1);
        else
            return result;
    }

} // namespace scl
```


