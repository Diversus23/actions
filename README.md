# Actions для 1C на базе oscript CI/CD

[![Тестирование](https://github.com/Diversus23/actions1c/actions/workflows/testing.yml/badge.svg)](https://github.com/Diversus23/actions1c/actions/workflows/testing.yml)

## Что это такое и где будет полезно?

**Actions 1С** - это программная среда своеобразный аналог Github Actions для DevOps задач, в том числе CI/CD для платформы 1С. Так же прекрасно подойдет для использования в Gitlab Pipelines. Собственно и родилась эта разработка именно благодаря необходимости выполнять самые разные команды для сборки / тестирования / доставки конфигурации [Управление IT-отделом 8](https://softonit.ru/catalog/products/it/).

Система построена на базе [oscript](https://oscript.io) и представляет из себя пакет для oscript.

## Как работает?

Это программная среда, которая умеет кратко с параметрами из командной строки или сохраненными в файле выполнять различные операции в ОС. Ситаксис:

```bash
oscript src/actions.os Команда --Опция1 ЗначениеОпции1 --Опция2 ЗначениеОпции2
```

Где Команда может быть любой из доступных (работа с конфигурациями 1С, с сервером 1С, с обновлением и проверкой баз 1С, создание архивов, копирование на FTP, создание дистрибутивов, завершение процессов в ОС и т.д. и т.п.).

У каждой команды есть свои индивидуальные опции.

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
    - git clone https://github.com/Diversus23/actions.git
    # Добавление настроек в файл env.json
    - oscript -encoding=utf-8 "$CI_PROJECT_DIR/actions/src/actions.os" json write --key "defailt.connection" --string "/F /opt/1c/base"
    only:
        refs:
        - develop
        - master
        - merge_requests

Проверка конфигурации на ошибки:
    stage: test
    needs: [Подготовка]
    script:
    - oscript -encoding=utf-8 "$CI_PROJECT_DIR/actions/src/actions.os" infobase config check
    only:
        refs:
        - develop
        - merge_requests
```

## ToDo

Сделать все по статье [Создаем свою библиотеку для OneScript](https://infostart.ru/1c/articles/791568/)

- [ ] DumpConfigToFiles
- [x] **infobase dump** + **infobase dumpformat** DumpIB
- [ ] DumpIBWithoutLock
- [x] **infobase restore** RestoreIB
- [ ] RestoreIBWithoutLock
- [ ] Lock
- [ ] Unlock
- [ ] Terminate
- [x] **fs deleteold** ClearOldFiles
- [ ] TestUpdate
- [x] **ftp put** + **ftp fileexists** CopyFTP  
- [x] **ftp get** + **ftp delete** DownloadFTP
  - [ ] Переделать модуль РаботаFTP на класс МенеджерFTP
- [ ] BuildDistribRepo
- [ ] SaveLastConfigUpdateText
- [ ] ConfigurationRepositoryUpdateCfg
- [x] LoadConfigFromFiles
- [x] **infobase extension load + infobase extension loadfromsource** LoadExtensionFromFiles
- [x] **infobase extension save + infobase extension savetosource** SaveExtensionInFile
- [ ] GitLoad
- [x] **edt export xml1c** EdtProjectExportToConfigFiles
  - [ ] Заменить ЗапуститьПриложение на ОбщегоНазначения.ЗапуститьПроцесс
  - [ ] Добавить команды для режима 1C:EDT https://its.1c.ru/db/edtdoc#content:10608:hdoc
- [x] **infobase create file** и **infobase create server** CreateInfoBase
- [ ] DeleteInfoBase
- [ ] BuildDistrib
- [ ] Save1cv8_mft
- [ ] SaveInstall_edf
- [ ] SetURLS
- [ ] SendNews
- [x] **obfuscation** Obfuscate
  - [ ] Для команды obfuscation изменить сохранение обфусцированного файла. В нем есть лишние переводы строк в обфусированном файле.
- [x] **infobase check** CheckConfig
- [x] **fs copy** FindFilesAndCopy
- [x] **fs errorsfromfile** WriteFileAsErrorInConsole
- [ ] UpdateIB
- [ ] GetImageForMailing
- [ ] MakeMailing
- [ ] MakeUpdatesXmlZip
- [x] **zip add** и **zip extract** CreateZip
- [ ] BuildDistribEpfErf
- [x] **changelog convert** и **changelog init** ConvertChangeLog
  - [ ] Добавить поддержку произвольных областей в файлах changelog (их вставляем простыми абзацами \<h2\> и \<p\>)
- [ ] GetVideoPreviewFromMarkDown
- [ ] MakeMailingFiles
- [ ] CheckVanessaErrors
- [ ] TaskKill
- [ ] RunVanessaAutomation
- [x] **checksum** FileCheckSum
- [x] **checksum** FolderCheckSum
- [x] **edt versionconfig** ConfigVersionFromEdtSrc
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

С полным перечнем команд и их аргументами можно ознакомиться в файле [COMMAND.md](COMMAND.md)
