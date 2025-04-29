# Задача

организовать CI/CD конвейер полного цикла сборка, запуск тестов, развёртывание/запуск где автоматически идет создание и изменение файла CHANGELOG со всеми изменениями по ветке master от момента создания и до последней ревизии (язык и что собирается не имеет значения, а также система которая будет использоваться)

# Мини отчет

## Приложение

- файл [app.py](app.py) с минимальным Python-кодом (print("Hi, CI/CD!"))
- тестовый файл [testa_app.py](testa_app.py) с простым тестом для pytest (по сути заглушка)
- файл [requirements.txt](requirements.txt) с зависимостью pytest

## CI/CD конвейер

- сделан файл .github/workflows/cicd.yml для GitHub Actions, в котором:
* Checkout кода: Использование actions/checkout@v4 с полной историей (fetch-depth: 0)
* Настройка Python: Установка Python версии 3.x
* Установка зависимостей: Обновление pip и установка пакетов из requirements.txt
* Запуск тестов: Выполнение pytest с опцией --verbose для подробного вывода
* енерация CHANGELOG: Выполнение скрипта generate_changelog.sh для создания/обновления [CHANGELOG.md](CHANGELOG.md)
* Коммит и пуш CHANGELOG: Автоматический коммит обновленного CHANGELOG.md с сообщением "Update CHANGELOG [skip ci" для предотвращения зацикливания CI/CD
* Развертывание: Заглушка для развертывания (в данный момент вывод сообщения "Deploying application...")

## Скрипт [generate_changelog.sh](generate_changelog.sh)

Используется "git log origin/main --pretty=format:'- %s (%an, %ad)' --date=short" чтобы включать все коммиты с указанием сообщения, автора и даты

