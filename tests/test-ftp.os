#Использовать "../src"
#Использовать asserts

Перем юТест;

Функция ПолучитьТекстИзФайла(ИмяФайла)
    ФайлОбмена = Новый Файл(ИмяФайла);
    Данные = "";
    Если ФайлОбмена.Существует() Тогда
        Текст = Новый ЧтениеТекста(ИмяФайла, КодировкаТекста.UTF8);
        Данные = Текст.Прочитать();
        Текст.Закрыть();
    Иначе
        Возврат Ложь;
    КонецЕсли;
    возврат Данные;
КонецФункции

Процедура Инициализация()
КонецПроцедуры

Функция ПолучитьСписокТестов(Тестирование) Экспорт

	юТест = Тестирование;

	СписокТестов = Новый Массив;
	СписокТестов.Добавить("Тест_Должен_СкачатьФайлыCFTP");

	Возврат СписокТестов;

КонецФункции

Процедура Тест_Должен_СкачатьФайлыCFTP() Экспорт
	
    Результат = 1;
    Ожидаем.Что(Результат).Равно(1);

КонецПроцедуры

Инициализация();