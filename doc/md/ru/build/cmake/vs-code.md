# Сборка в VS Code

Требования и модель пресетов: [presets-intro.md](presets-intro.md).

Используйте расширение **CMake Tools** (`ms-vscode.cmake-tools`); оно управляет
`CMakePresets.json` нативно.

## 1. Открыть и включить пресеты

Откройте папку репозитория (**File → Open Folder…**). С установленным CMake Tools
открытие папки, содержащей `CMakePresets.json`, автоматически включает режим
пресетов. Чтобы задать принудительно, в `.vscode/settings.json`:

```json
{
  "cmake.useCMakePresets": "always"
}
```

## 2. Выбрать пресеты

Из строки состояния (или палитры команд, `Ctrl+Shift+P`):

- **CMake: Select Configure Preset** — выберите, например, `clang-x64`,
  `msvc-x64-2026`.
- **CMake: Select Build Preset** — соответствующий build-пресет.
- **CMake: Select Test Preset** — соответствующий test-пресет.

Выбранные пресеты отображаются в строке состояния.

## 3. Конфигурация, сборка, тесты

- **CMake: Configure** конфигурирует в `build/<preset>/`.
- **CMake: Build** (или кнопка **Build** в строке состояния) собирает.
- **CMake: Run Tests** прогоняет CTest через выбранный test-пресет; результаты — в
  **Test Explorer** и в канале вывода CMake.

## Выбор конфигурации сборки (multi-config)

Пресеты используют multi-config генераторы (`Ninja Multi-Config`, Visual Studio),
поэтому конфигурация **не** выбирается на этапе configure — configure-пресет
задаёт только компилятор + архитектуру, а одно дерево сборки хранит все
конфигурации сразу. Конфигурация выбирается на этапе *сборки* флагом `--config`.
Multi-config генераторы предоставляют четыре стандартных конфигурации CMake —
`Debug`, `Release`, `RelWithDebInfo`, `MinSizeRel` — так что `--config` не
ограничен Debug/Release.

В режиме пресетов у CMake Tools нет GUI-переключателя конфигурации сборки (команды
«Select Build Configuration» не существует). Вместо умножения числа пресетов
поконфигурационными вариантами задайте конфигурацию через задачу, переиспользующую
**активный** build-пресет. Создайте `.vscode/tasks.json` (папка в gitignore —
остаётся машинно-локальной). Одна задача с запросом конфигурации покрывает любой
пресет × любую конфигурацию без дублирования:

```json
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "Build",
            "type": "shell",
            "command": "cmake",
            "args": ["--build", "--preset", "${command:cmake.activeBuildPresetName}", "--config", "${input:buildConfig}"],
            "group": { "kind": "build", "isDefault": true }
        }
    ],
    "inputs": [
        {
            "id": "buildConfig",
            "type": "pickString",
            "description": "CMake configuration",
            "options": ["Debug", "Release", "RelWithDebInfo", "MinSizeRel"],
            "default": "Debug"
        }
    ]
}
```

- `${command:cmake.activeBuildPresetName}` подставляет пресет, выбранный в строке
  состояния CMake, поэтому эта одна задача покрывает любой пресет — конфигурация
  ортогональна пресету, нуль новых пресетов.
- Четыре варианта — стандартные multi-config конфигурации. Проект не определяет
  дополнительных (нет «Profile» и подобных).

Использование:

- Компилятор/архитектуру переключаете как раньше — в строке состояния CMake.
- `Ctrl+Shift+B` (**Tasks: Run Build Task**) запускает **Build** и спрашивает,
  какую конфигурацию собрать. Эквивалентно `Ctrl+Shift+P` → **Tasks: Run Task**.
  Повесьте на клавишу в `keybindings.json` для сборки в одно нажатие; для кнопки в
  строке состояния расширение **Tasks** (`actboy168.tasks`) её выносит.
- Отладка по `F5` остаётся на конфигурации по умолчанию (Debug).

`problemMatcher` не задан: терминал VS Code сам превращает пути `file:line`,
которые печатают CMake, Ninja и компиляторы, в кликабельные ссылки. Добавляйте
matcher, только если хотите зеркалить ошибки в панель **Problems** — `$msCompile`
для MSVC (встроенный), а для GCC/Clang либо `$gcc` (нужно расширение **C/C++**,
`ms-vscode.cpptools`), либо inline-`pattern`-matcher.

## Подводные камни

- На Windows запускайте VS Code из окружения, которое нужно пресету: приглашение
  **x86** Native Tools для `clang-x86` или оболочка с MinGW в `PATH` для `gcc-*`.
  CMake Tools наследует окружение процесса, запустившего VS Code — см.
  [Подводные камни во введении](presets-intro.md#подводные-камни).
- Если список пресетов пуст, убедитесь, что `cmake.useCMakePresets` не выставлен в
  `"never"` и что CMake Tools указывает на CMake ≥ 3.23.
