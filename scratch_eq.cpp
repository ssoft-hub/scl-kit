#include <scl/feature/reflection/operator.h>
#include <scl/feature/type_traits/executor.h>
#include <scl/utility/type_traits/forward_like.h>
#include <utility>

struct Sym {
    int value = 0;
    constexpr short operator+(int r) & { return (short)(value+r); }
    constexpr int operator+(int r) const & { return value+r+50; }
    friend constexpr long operator+(int l, Sym const& s) { return (long)(l+s.value+1000); }
    constexpr bool operator==(int r) const { return value==r; }
};
struct SymExec {
    Sym m_value;
    template <typename S, typename F, typename... A>
    static constexpr decltype(auto) execute(S&&, F&& f, A&&... a){ return std::forward<F>(f)(std::forward<A>(a)...); }
    template <typename S> static constexpr decltype(auto) access(S&& s){ return scl::forward_like<S>(s.m_value); }
};
struct SymW;
template <> struct scl::feature::executor_trait<SymW> {
    template <typename S> static constexpr decltype(auto) executor(S&& s){ return scl::forward_like<S>(s.m_exec); }
};
struct SymW {
    SymExec m_exec;
    SCL_REFLECT_TYPE(SymW, SymExec);
    constexpr explicit SymW(int v): m_exec{Sym{v}} {}
    SCL_REFLECT_BINARY_OPERATOR(+, op_add)
    SCL_REFLECT_EQUALITY_OPERATOR(==, op_eq)
};
int main(){
    SymW w{10};
    auto a = w + 5;      // member -> short
    auto b = 5 + w;      // reverse friend -> long
    bool e1 = (w == 10); // member bool
    bool e2 = (10 == w); // reverse-friend bool / rewrite
    return (int)a + (int)b + (int)e1 + (int)e2;
}
