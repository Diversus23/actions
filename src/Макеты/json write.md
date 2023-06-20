Записываемое значение может быть различных типов.

1. Записываем строку. Приоритет 1:
    ```bash
    oscript actions.os json write --key "add.zip" --string "Привет мир"
    ```
2. Записываем число. Приоритет 2:
    ```bash
    oscript actions.os json write --key "add.zip" --number 555
    ```
3. Записываем булево. Приоритет 3:
    ```bash
    # Присваиваем Истина
    oscript actions.os json write --key "add.zip" --boolean true
    oscript actions.os json write --key "add.zip" --boolean 1    
    oscript actions.os json write --key "add.zip" --boolean Истина
    # Присваиваем Ложь
    oscript actions.os json write --key "add.zip" --boolean false
    oscript actions.os json write --key "add.zip" --boolean 0
    oscript actions.os json write --key "add.zip" --boolean Ложь
    ```
4. Записываем дату. Приоритет 4:
    ```bash
    oscript actions.os json write --key "add.zip" --date 2023-06-05_23:59:59
    ```
    
> **Важно!** Если указать несколько значений у одного ключа одновременно (пример: *"--key "add.zip" --boolean 1 --number 555"*), то значение установится по приоритету указанному выше, в примерах (1-4).
