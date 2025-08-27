# Hybrid Arbitrage Bot (Python + C++)

Это стартовый репозиторий для гибридного арбитражного бота: Python — логика/оркестратор, C++ (PyBind11) — ускоритель.


## Что внутри

- `src/` — Python-пакет: core, exchanges, strategy, exec, fastlane (Python-обёртки)
- `cpp/fastlane/` — C++ код модуля `fastlane` (pybind11)
- `config.yaml` — пример конфигурации
- `Dockerfile`, `docker-compose.yml` — dev/deploy-скелеты
- `CMakeLists.txt` — для сборки C++ модуля
- `requirements.txt` — зависимые Python-библиотеки
- `tests/` — базовые тесты

## Быстрый старт (локально)
1. Установи зависимости Python: `python -m pip install -r requirements.txt`
2. Собери C++ модуль:
   ```bash
   mkdir -p cpp/fastlane/build && cd cpp/fastlane/build
   cmake .. && cmake --build . --config Release
   ```
   После сборки модуль `fastlane` будет доступен как `fastlane.*(so|pyd)` в каталоге `cpp/fastlane/build` — скопируй его в `src/fastlane/` или установи путь.
3. Запусти демо:
   ```bash
   python -m src.main
   ```

## Docker
В Dockerfile показан multi-stage build: сначала собирается C++ модуль, затем собирается runtime image.

## Замечания
- Модуль C++ — минимальный, но продуманный по API (`cross_edge`), есть fallback в Python для быстрой разработки.
- Все ключи и секреты — через `config.yaml` и env vars.

Удачи! Если хочешь, могу собрать артефакт и отдать тебе бинарь/колесо.
