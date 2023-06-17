# Actions для 1C на базе oscript

[![Тестирование](https://github.com/Diversus23/actions1c/actions/workflows/testing.yml/badge.svg)](https://github.com/Diversus23/actions1c/actions/workflows/testing.yml)

## Что это такое и где будет полезно?

**Actions1c** - это программная среда своеобразный аналог Github Actions для DevOps задач, в том числе CI/CD для платформы 1С. Так же прекрасно подойдет для использования в Gitlab Pipelines. Собственно и родилась эта разработка именно благодаря необходимости выполнять самые разные команды для сборки/тестирования/доставки конфигурации Управление IT-отделом 8.

Система построена на базе [oscript](https://oscript.io).

## Как работает?

Это программная среда, которая умеет кратко с параметрами из командной строки или сохраненными в файле выполнять различные операции в ОС. Ситаксис:

```cmd
oscript src/actions.os Команда Параметры
```

Где Команда может быть любой из доступных (работа с конфигурациями 1С, с сервером 1С, с обновлением и проверкой баз 1С, создание архивов, копирование на FTP, создание дистрибутивов, завершение процессов в ОС и т.д. и т.п.).

У каждой команды есть свои индивидуальные параметры.

Создается файл `env.json` в котором указываются обязательные и дополнительные настройки для работы с проектом, например, имя проекта, его названия, токены доступа куда устанавливать в рабочем контуре и т.д.

### GitLab

Создается файл `.gitlab-ci.yml` и в нем пишутся шаги для выполнения команд:

```yml
stages:
  - pre
  - test

before_script:
  - chcp 65001 

Подготовка:
    stage: pre
    script:
    # Копирование библиотеки CI/CD для работы
    - git config --local core.quotepath false
    - git clone https://github.com/Diversus23/cicd.git
    # Добавление настроек в файл env.json
    - oscript -encoding=utf-8 "$CI_PROJECT_DIR/cicd/src/actions.os" set -name "defailt.ibconnection" -value "/F /opt/1c/base"
    only:
        refs:
        - develop
        - master
        - merge_requests

Проверка конфигурации на ошибки:
    stage: test
    script:
    - oscript -encoding=utf-8 "$CI_PROJECT_DIR/actions/src/actions.os" checkconfig
    only:
        refs:
        - develop
        - merge_requests
```

## ToDo

Сделать все по статье [Создаем свою библиотеку для OneScript](https://infostart.ru/1c/articles/791568/)

- [ ] DumpConfigToFiles
- [ ] DumpIB
- [ ] DumpIBWithoutLock
- [ ] RestoreIB
- [ ] RestoreIBWithoutLock
- [ ] Lock
- [ ] Unlock
- [ ] Terminate
- [ ] ClearOldFiles
- [ ] TestUpdate
- [ ] CopyFTP
- [ ] DownloadFTP
- [ ] BuildDistribRepo
- [ ] SaveLastConfigUpdateText
- [ ] ConfigurationRepositoryUpdateCfg
- [ ] LoadConfigFromFiles
- [ ] LoadExtensionFromFiles
- [ ] SaveExtensionInFile
- [ ] GitLoad
- [ ] EdtProjectExportToConfigFiles
- [ ] CreateInfoBase
- [ ] DeleteInfoBase
- [ ] BuildDistrib
- [ ] Save1cv8_mft
- [ ] SaveInstall_edf
- [ ] SetURLS
- [ ] SendNews
- [X] **obfuscation** Obfuscate
  - [ ] Для команды obfuscation изменить сохранение обфусцированного файла. В нем есть лишние переводы строк в обфусированном файле.
- [X] **checkconfig** CheckConfig
- [ ] FindFilesAndCopy
- [ ] WriteFileAsErrorInConsole
- [ ] UpdateIB
- [ ] GetImageForMailing
- [ ] MakeMailing
- [ ] MakeUpdatesXmlZip
- [X] **zip-add** и **zip-extract** CreateZip
- [ ] BuildDistribEpfErf
- [ ] ConvertChangeLog
- [ ] GetVideoPreviewFromMarkDown
- [ ] MakeMailingFiles
- [ ] CheckVanessaErrors
- [ ] TaskKill
- [ ] RunVanessaAutomation
- [X] **checksum** FileCheckSum
- [X] **checksum** FolderCheckSum
- [ ] ConfigVersionFromEdtSrc
- [ ] StartDebugFile
- [ ] StartCoverage41C
- [ ] StopCoverage41C
- [ ] CreateSettingsFileVanessaAutomation
- [ ] MergeLogsVanessaAutomation
- [ ] MergeCoverage41CFiles
- [ ] CreateMaileTemplate
- [ ] SendMailOnApiSendSay
- [ ] DumpExternalDataProcessorOrReportToFiles
- [ ] VanessaAutomationTest

## Описание команд

С полным перечнем команд и их аргументами можно ознакомиться в файле [COMMAND.md](docs/COMMAND.md)
