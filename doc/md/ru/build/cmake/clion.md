# Сборка в CLion

Требования и модель пресетов: [presets-intro.md](presets-intro.md).

CLion (2023.1+) читает `CMakePresets.json` и отображает configure-пресеты на
CMake-профили.

## 1. Открыть проект

**File → Open…** и выберите корень репозитория (папку с верхнеуровневым
`CMakeLists.txt`). CLion обнаружит `CMakePresets.json`.

## 2. Включить пресеты

**Settings → Build, Execution, Deployment → CMake**. CLion предложит создать
профиль из каждого пресета; включите нужные (например, `clang-x64`,
`msvc-x64-2026`). Каждый профиль конфигурируется в дерево `build/<preset>/` этого
пресета. Используйте **Reload CMake Presets**, если правили `CMakePresets.json`
после открытия.

## 3. Конфигурация, сборка, тесты

- Выбор профиля конфигурирует его; прогресс — в окне инструмента **CMake**.
- **Build → Build Project** (`Ctrl+F9`) собирает активный профиль.
- CLion обнаруживает CTest-тесты; запускайте из поля у строки или из конфигурации
  запуска **CTest Application** / Google Test.

## Подводные камни

- Сопоставьте тулчейн профиля (**Settings → Build … → Toolchains**) пресету:
  тулчейн Visual Studio для `msvc-*`, тулчейн MinGW для `gcc-*` на Windows и т.д.
  Как и в других IDE, `clang-x86` на Windows требует x86-окружения VS, а MinGW
  `gcc` — MinGW в `PATH` — см.
  [Подводные камни во введении](presets-intro.md#подводные-камни).
- Кросс-пресеты (`clang-arm64`/`gcc-arm64`/`osxcross-*`) — только сборка; CLion не
  запустит их бинарники на хосте.
