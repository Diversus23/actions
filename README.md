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

[-] 
[-] Для команды obfuscation изменить сохранение обфусцированного файла. В нем есть лишние переводы строк.

## Описание команд

С полным перечнем команд и их аргументами можно ознакомиться в файле [COMMAND.md](COMMAND.md)