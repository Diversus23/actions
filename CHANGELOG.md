# Change Log

Все заметные изменения в этом проекте будут задокументированы в этом файле.
Формат основан на [Keep a Changelog](http://keepachangelog.com/) и этот проект придерживается [Semantic Versioning](http://semver.org/).

# [Unreleased]

* Добавлена команда changelog check-version для проверки наличия указанной версии в файле CHANGELOG.md.
* Добавлена команда infobase updatecfg - обновление конфигурации на поддержке.
* Добавлена команда infobase runcode - выполнение произвольного кода в режиме предприятия.

# [0.5.0] - 2023-09-22

## Добавлено

* Добавление команд для работы с FTP: ftp get, ftp put, ftp delete
* Добавление команд для работы с ИБ 1С: infobase create file, infobase create server, infobase dump, infobase restore
* Добавление команд для работы с файловой системой: fs delete, fs newtempfile, fs newtemppath, fs copy, fs errorsfromfile, fs addcontent, fs read
* Добавление команды для экспорта проекта EDT в XML 1C: edt export xml1c
* Добавление в тесты возможности исполнения тестов по регулярному выражению
* Добавление команд для работы с расширениями 1С: infobase extension load, infobase extension loadfromsource, infobase extension save, infobase extension savetosource, infobase extension update
* Добавлены команды для создания дистриубтивов: infobase distrib
* Добавлены команды для HTTP-запросов: http get, http post
* Добавлены команды для работы c json-файлами: json read, json write
* Добавлены команды для работы с EDT: srctoxml, versionconfig
* Добавлены команды для создания новостей из конфигурации: infobase news

## Изменено

* Переименованы классы команд, для удобной группировки

# [0.0.2] - 2023-06-20

## Добавлено

* Добавлена автогенерация всех команд и параметров команд в отдельный файл COMMAND.md. Данные строятся на основании автоматически.
* Внедрены тесты.
* Внедрен запуск из Github Actions.
* Добавлена работа с настройками.
* Добавлена запись настроек.

# [0.0.1] - 2023-05-01

## Новый функционал

* Начало работы над CI/CD