# Copies the active build's compile_commands.json to SRC/DST (passed via -D)
# so clangd finds it by walking up from any source file, without needing a
# build-dir argument. A no-op, not an error, when SRC doesn't exist — e.g.
# Visual Studio, which CMAKE_EXPORT_COMPILE_COMMANDS has no effect on.
if (EXISTS "${SRC}")
    file(COPY_FILE "${SRC}" "${DST}" ONLY_IF_DIFFERENT)
endif()
