Примеры использования:

```bash
# Копирование всех файлов из папки в папку
oscript actions.os fs copy --from c:\folder\ --to c:\dest\ --recursive
# Копирование файлов c расширением txt из папки в папку (только в папке folder\*.txt)
oscript actions.os fs copy --from c:\folder\*.txt --to c:\dest\
# Перемещение всех файлов из папки в папку
oscript actions.os fs copy --from c:\folder\ --to c:\dest\ --recursive --move
# Перемещение файлов по маске *.txt из папки в папку включая дочерние
oscript actions.os fs copy --from c:\folder\*.txt --to c:\dest\ --recursive --move
```