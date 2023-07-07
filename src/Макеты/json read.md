Пример файла находятся в папке `tests\fixtures\test.json`

```json
{
    "default": {
        "test": {
            "string": "Hello world",
            "number": 555,
            "boolean": true
        }
    }
}
```
Выполним команду:

```bash
# Читаем строку
oscript actions.os json read "..\tests\fixtures\test.json" --key "default.test.string"
# В консоль будет выведено "Hello world"
```