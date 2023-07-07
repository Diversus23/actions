Записываемое значение может быть различных типов.

1. Записываем строку. Приоритет 1:
    ```bash
    oscript actions.os json write --file example.json --key "add.zip.string" --string "Привет мир"
    ```
2. Записываем число. Приоритет 2:
    ```bash
    oscript actions.os json write --file example.json --key "add.zip.number" --number 555
    ```
3. Записываем булево. Приоритет 3:
    ```bash
    # Присваиваем Истина
    oscript actions.os json write --file example.json --file example.json --key "add.zip.boolean1" --boolean true
    oscript actions.os json write --file example.json --key "add.zip.boolean2" --boolean 1    
    oscript actions.os json write --file example.json --key "add.zip.boolean3" --boolean Истина
    # Присваиваем Ложь
    oscript actions.os json write --file example.json --key "add.zip.boolean4" --boolean false
    oscript actions.os json write --file example.json --key "add.zip.boolean5" --boolean 0
    oscript actions.os json write --file example.json --key "add.zip.boolean6" --boolean Ложь
    ```
4. Записываем дату. Приоритет 4:
    ```bash
    oscript actions.os json write --key "add.zip.date" --date 2023-06-05_23:59:59
    ```
    
> **Важно!** Если указать несколько значений у одного ключа одновременно (пример: *"--key "add.zip" --boolean 1 --number 555"*), то значение установится по приоритету указанному выше, в примерах (1-4).

После выполнения всех команд получим файл `example.json` с таким содержимым:

```json
{
    "add": {
        "zip": {
            "string": "Привет мир",
            "number": 555,
            "boolean1": true,
            "boolean2": true,
            "boolean3": true,
            "boolean4": false,
            "boolean5": false,
            "boolean6": false,
            "date": "2023-06-05T23:59:59Z"            
        }
    }
}
```