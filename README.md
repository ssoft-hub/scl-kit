# Инструментарий ScL

[![GitLab Pipeline](https://gitlab.com/ssoft-scl/scl-kit/badges/main/pipeline.svg)](https://gitlab.com/ssoft-scl/scl-kit/-/pipelines)
[![GitHub Build](https://github.com/ssoft-hub/scl-kit/actions/workflows/build.yml/badge.svg)](https://github.com/ssoft-hub/scl-kit/actions/workflows/build.yml)
[![GitLab Pages](https://img.shields.io/badge/pages-gitlab-orange)](https://ssoft-scl.gitlab.io/scl-kit/)
[![GitHub Pages](https://img.shields.io/badge/pages-github-blue)](https://ssoft-hub.github.io/scl-kit/)

Инструментарий ScL предоставляет бесплатные решения для организации разработки на C++.

Проект содержит набор библиотек C++ и других вспомогательных средств для формирования рабочего окружения для решения задач на C++. Лицензия ScL позволяет использовать инструментарий как в коммерческих, так и в некоммерческих целях и не требует указания авторства для бинарного использования.

# Состав ScL

## Библиотеки C++

* [meta](https://gitlab.com/ssoft-scl/module/meta) (header only) - средства С++ для работы с метаинформацией
* [utility](https://gitlab.com/ssoft-scl/module/utility) (header only) - общие вспомогательные средства С++
* [feature](https://gitlab.com/ssoft-scl/module/feature) (header only) - средства С++ для использования умных оберток для наделения типов дополнительной особенностями.

## Вспомогательные средства

* [qmake-features](https://gitlab.com/ssoft-tool/qmake-features) - набор инструментов для упрощения ведения проектов с помощью qmake.

# Использование ScL

Для использования ScL достаточно загрузить проект из git репозитория со всеми подмодулями

```
git clone --recurse-submodule git@gitlab.com:ssoft-scl/complex/scl-kit.git
```

и подключить в свой проект корневую директорию с заголовочными файлами ScL [include](include).

# Сборка  ScL

Проект содержит тесты и примеры использования, собрать которые можно с помощью следующих инструментов:

* [cmake](https://cmake.org)
* [qmake](http://doc.qt.io/qt-5/qmake-manual.html)

Соответствующие проектные файлы находятся в корневой папке ScL.
