# CI/CD для 1C на базе oscript

## Что это такое и где будет полезно?

**cicd** - это программная среда CI/CD для платформы 1С.


Система построена на базе oscript.

## Как работает?

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
    - oscript -encoding=utf-8 "$CI_PROJECT_DIR/cicd/src/cicd.os" set -name "defailt.ibconnection" -value "/F /opt/1c/base"
    only:
        refs:
        - develop
        - master
        - merge_requests

Проверка конфигурации на ошибки:
    stage: test
    script:
    - oscript -encoding=utf-8 "$CI_PROJECT_DIR/cicd/src/cicd.os" checkconfig
    only:
        refs:
        - develop
        - merge_requests
```

## ToDo

1. [ ] DumpConfigToFiles
1. [ ] DumpIB
1. [ ] DumpIBWithoutLock
1. [ ] RestoreIB
1. [ ] RestoreIBWithoutLock
1. [ ] Lock
1. [ ] Unlock
1. [ ] Terminate
1. [ ] ClearOldFiles
1. [ ] TestUpdate
1. [ ] CopyFTP
1. [ ] DownloadFTP
1. [ ] BuildDistribRepo
1. [ ] SaveLastConfigUpdateText
1. [ ] ConfigurationRepositoryUpdateCfg
1. [ ] LoadConfigFromFiles
1. [ ] LoadExtensionFromFiles
1. [ ] SaveExtensionInFile
1. [ ] GitLoad
1. [ ] EdtProjectExportToConfigFiles
1. [ ] CreateInfoBase
1. [ ] DeleteInfoBase
1. [ ] BuildDistrib
1. [ ] Save1cv8_mft
1. [ ] SaveInstall_edf
1. [ ] SetURLS
1. [ ] SendNews
1. [X] Obfuscate
1.1. [ ] Для команды obfuscation изменить сохранение обфусцированного файла. В нем есть лишние переводы строк.
1. [X] CheckConfig
1. [ ] FindFilesAndCopy
1. [ ] WriteFileAsErrorInConsole
1. [ ] UpdateIB
1. [ ] GetImageForMailing
1. [ ] MakeMailing
1. [ ] MakeUpdatesXmlZip
1. [ ] CreateZip
1. [ ] BuildDistribEpfErf
1. [ ] ConvertChangeLog
1. [ ] GetVideoPreviewFromMarkDown
1. [ ] MakeMailingFiles
1. [ ] CheckVanessaErrors
1. [ ] TaskKill
1. [ ] RunVanessaAutomation
1. [ ] FileCheckSum
1. [ ] FolderCheckSum
1. [ ] ConfigVersionFromEdtSrc
1. [ ] StartDebugFile
1. [ ] StartCoverage41C
1. [ ] StopCoverage41C
1. [ ] CreateSettingsFileVanessaAutomation
1. [ ] MergeLogsVanessaAutomation
1. [ ] MergeCoverage41CFiles
1. [ ] CreateMaileTemplate
1. [ ] SendMailOnApiSendSay
1. [ ] DumpExternalDataProcessorOrReportToFiles
1. [ ] VanessaAutomationTest

## Описание команд

С полным перечнем команд и их аргументами можно ознакомиться в файле [COMMAND.md](COMMAND.md)