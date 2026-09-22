# Consume the build-variant flags from a caller's arguments.
#
# Sourced without arguments, before the caller reads "$@":
#   SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
#   . "${SCRIPT_DIR}/variant.sh"
#
# Recognised anywhere in the argument list:
#   --no-rtti         -DSCL_ENABLE_RTTI=OFF
#   --no-exceptions   -DSCL_ENABLE_EXCEPTIONS=OFF
#   --benchmarks      -DSCL_BUILD_BENCHMARKS=ON -DSCL_BUILD_TESTS=OFF
#
# Leaves the other arguments in "$@", sets SCL_VARIANT_DEFS to the configure
# arguments the flags stand for, and exports SCL_BUILD_SUFFIX, which every
# preset's binaryDir ends in - so the four scripts address one build tree and a
# variant never reconfigures the default one.
#
# The suffix is composed in the same fixed order CMakeLists.txt composes the
# toolchain triplet's variant tag in, so one option set names one build tree
# and one bin/ directory whatever order the flags are written in.

SCL_VARIANT_DEFS=""
_scl_nortti=0
_scl_noexc=0
_scl_bench=0
_scl_left=$#

while [ "${_scl_left}" -gt 0 ]; do
    case "$1" in
        --no-rtti)
            _scl_nortti=1
            ;;
        --no-exceptions)
            _scl_noexc=1
            ;;
        --benchmarks)
            _scl_bench=1
            ;;
        *)
            set -- "$@" "$1"
            ;;
    esac
    shift
    _scl_left=$((_scl_left - 1))
done

_scl_suffix=""
if [ "${_scl_nortti}" -eq 1 ]; then
    SCL_VARIANT_DEFS="${SCL_VARIANT_DEFS} -DSCL_ENABLE_RTTI=OFF"
    _scl_suffix="${_scl_suffix}-nortti"
fi
if [ "${_scl_noexc}" -eq 1 ]; then
    SCL_VARIANT_DEFS="${SCL_VARIANT_DEFS} -DSCL_ENABLE_EXCEPTIONS=OFF"
    _scl_suffix="${_scl_suffix}-noexc"
fi
if [ "${_scl_bench}" -eq 1 ]; then
    SCL_VARIANT_DEFS="${SCL_VARIANT_DEFS} -DSCL_BUILD_BENCHMARKS=ON -DSCL_BUILD_TESTS=OFF"
    _scl_suffix="${_scl_suffix}-bench"
fi

SCL_BUILD_SUFFIX="${SCL_BUILD_SUFFIX:-}${_scl_suffix}"
export SCL_BUILD_SUFFIX

unset _scl_suffix _scl_left _scl_nortti _scl_noexc _scl_bench
