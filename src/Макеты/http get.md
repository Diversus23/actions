Используется библиотека [1connector](https://github.com/vbondarevsky/1connector/)

Примеры:

```bash
# Передаем параметры в GET-запрос "name=Иванов" и результат сохраним в json
oscript actions.os http get --url "https://connectorhttp.ru/anything/params" --p1 "name" --v1 "Иванов" --format json --out "c:\temp\result.json"
```

```bash
# Получим двоичные данные (картинку) и сохраняем в файл
oscript actions.os http get --url "http://connectorhttp.ru/image/png" --format binary --out "c:\temp\image.png"
```

```bash
# Авторизуемся на сервере SonarQube используя Basic-аутентификацию
oscript actions.os http get --url "http://192.168.1.20:32772/api/qualitygates/project_status?projectKey=telegram&branch=develop" --login sda1234234 --password asdasd
```
