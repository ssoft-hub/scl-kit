# Сборка из командной строки

Требования и модель пресетов: [presets-intro.md](presets-intro.md).

IDE не нужна — пресеты управляют CMake напрямую.

## Конфигурация, сборка, тесты

```sh
cmake --preset clang-x64                          # конфигурация в build/clang-x64/
cmake --build --preset clang-x64 --config Debug   # сборка
ctest  --preset clang-x64 --build-config Debug    # прогон тестов
```

`--config` / `--build-config` выбирает конфигурацию для multi-config пресетов
(`Ninja Multi-Config`, Visual Studio); test-пресеты по умолчанию используют
`Debug`, поэтому `ctest --preset <name>` работает без `-C`.

Для кросс-пресета передайте sysroot на этапе конфигурации:

```sh
cmake --preset gcc-arm64 -DSCL_SYSROOT=/opt/aarch64-sysroot
cmake --build --preset gcc-arm64 --config Debug   # только сборка, test-пресета нет
```

Для osxcross-пресета сперва добавьте инструменты osxcross в `PATH`, затем:

```sh
cmake --preset osxcross-arm64
cmake --build --preset osxcross-arm64 --config Debug   # только сборка
```

## Вспомогательные обёртки

`script/ci/build.sh` и `script/ci/run_tests.sh` оборачивают те же пресеты для
локального использования и CI:

```sh
script/ci/build.sh clang-x64 Debug        # cmake --preset + cmake --build --preset
script/ci/run_tests.sh clang-x64 Debug     # ctest --preset

script/ci/build.sh gcc-arm64 -DSCL_SYSROOT=/opt/aarch64-sysroot   # доп. аргументы форвардятся
```

Оба по умолчанию используют пресет `default`, если аргумент не задан. Полная
обработка аргументов описана в комментариях-заголовках скриптов.

## Подводные камни

- Windows `clang-x86` должен запускаться из **x86**-окружения VS; MinGW `gcc`
  требует MinGW в `PATH` — см.
  [Подводные камни во введении](presets-intro.md#подводные-камни).
- Краткое имя компилятора берётся из `PATH` при первой конфигурации и затем
  кэшируется в `build/<preset>/`. Чтобы переключиться на другую установку того же
  семейства компилятора, используйте запись в `CMakeUserPresets.json` (см.
  введение), а не правку `PATH`.
