﻿#Использовать "../"
#Использовать logos
#Использовать asserts
#Использовать 1commands

Перем юТест;
Перем Лог;
Перем ВременныйКаталог;

Процедура ПередЗапускомТеста() Экспорт
	ВременныйКаталог = ВременныеФайлы.СоздатьКаталог();
КонецПроцедуры

Процедура ПослеЗапускаТеста() Экспорт
	Если ЗначениеЗаполнено(ВременныйКаталог) Тогда
		ВременныеФайлы.УдалитьФайл(ВременныйКаталог);
		ВременныйКаталог = "";
	КонецЕсли;
КонецПроцедуры

Процедура Инициализация()
КонецПроцедуры

Функция ПолучитьСписокТестов(Тестирование) Экспорт
	
	юТест = Тестирование;
	
	СписокТестов = Новый Массив;
	СписокТестов.Добавить("Тест_Должен_ПроверитьКонтрольнуюСуммуФайла");
	СписокТестов.Добавить("Тест_Должен_Выполнить_Команду_checksum");
	
	Возврат СписокТестов;
	
КонецФункции

Процедура ЯВыполняюКомандуПродуктаCПередачейПараметров(Знач КомандаТестера, Знач ПараметрыКоманды,
		Знач ОжидаемыйКодВозврата = 0, ТекстВывода = "")
	
	Если Лог.Уровень() >= УровниЛога.Отладка Тогда
		юТест.ВключитьОтладкуВЛогахЗапускаемыхСкриптовOnescript();
	КонецЕсли;
	
	ПутьСтартера = ОбъединитьПути(КаталогИсходников(), "src", "cicd.os");
	ФайлСтартера = Новый Файл(ПутьСтартера);
	Ожидаем.Что(ФайлСтартера.Существует(), "Ожидаем, что скрипт-стартер <main.os> существует, а его нет. "
		+ ФайлСтартера.ПолноеИмя).Равно(Истина);
	
	КомандаДвижка = "oscript -encoding=utf-8";
	Если юТест.ИспользоватьСборСтатистикиСкриптовOnescript() Тогда
		КомандаСтатистики = "-codestat";
		КомандаДвижка = СтрШаблон("%1 %2", КомандаДвижка, ПараметрСтатистикиДляКомандыОСкрипт());
	КонецЕсли;
	
	СтрокаКоманды = СтрШаблон("%1 %2 %3 %4", КомандаДвижка, ПутьСтартера, КомандаТестера, ПараметрыКоманды);
	
	Команда = Новый Команда;
	
	Команда.УстановитьСтрокуЗапуска(СтрокаКоманды);
	Команда.УстановитьКодировкуВывода(КодировкаТекста.UTF8);
	КодВозврата = Команда.Исполнить();
	ТекстВывода = Команда.ПолучитьВывод();
	
	Лог.Отладка(ТекстВывода);
	
	Если ОжидаемыйКодВозврата <> Неопределено И КодВозврата <> ОжидаемыйКодВозврата
		ИЛИ Лог.Уровень() <= УровниЛога.Отладка Тогда
		ВывестиТекст(ТекстВывода);
		Ожидаем.Что(КодВозврата, "Код возврата в ЯВыполняюКомандуПродуктаCПередачейПараметров")
		.Равно(ОжидаемыйКодВозврата);
	КонецЕсли;
КонецПроцедуры

Функция ПараметрСтатистикиДляКомандыОСкрипт()

	ОбъектКаталогаСтатистики = юТест.КаталогСбораСтатистикиСкриптовOnescript();
	Если Не ЗначениеЗаполнено(ОбъектКаталогаСтатистики) Тогда
		Возврат "";
	КонецЕсли;

	Ожидаем.Что(ОбъектКаталогаСтатистики.Существует(),
		"Каталог статистики должен существовать перед выполнения скрипта OneScript").Равно(Истина);

	МенеджерВременныхФайлов = Новый МенеджерВременныхФайлов;
	МенеджерВременныхФайлов.БазовыйКаталог = ОбъектКаталогаСтатистики.ПолноеИмя;
	ИмяФайлаСтатистики = МенеджерВременныхФайлов.НовоеИмяФайла("json");
	ПутьФайлаСтатистики = ОбъединитьПути(ОбъектКаталогаСтатистики.ПолноеИмя, ИмяФайлаСтатистики);

	Возврат СтрШаблон("-codestat=%1", ПутьФайлаСтатистики);
КонецФункции

Процедура ВключитьПоказОтладки()
	Лог.УстановитьУровень(УровниЛога.Отладка);
КонецПроцедуры

Процедура ВыключитьПоказОтладки()
	Лог.УстановитьУровень(УровниЛога.Информация);
КонецПроцедуры

Процедура ВывестиТекст(Знач Строка)
	
	Лог.Отладка("");
	Лог.Отладка("  ----------------    ----------------    ----------------  ");
	Лог.Отладка(Строка);
	Лог.Отладка("  ----------------    ----------------    ----------------  ");
	Лог.Отладка("");
	
КонецПроцедуры

Функция КаталогТестовыхФикстур() Экспорт
	Возврат ОбъединитьПути(КаталогТестов(), "fixtures");
КонецФункции

Функция КаталогТестов() Экспорт
	Возврат ОбъединитьПути(КаталогИсходников(), "tests");
КонецФункции

Функция КаталогИсходников() Экспорт
	Возврат ОбъединитьПути(ТекущийСценарий().Каталог, "..");
КонецФункции

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
	
	Возврат Данные;
	
КонецФункции

Процедура Тест_Должен_ПроверитьКонтрольнуюСуммуФайла() Экспорт
	
	ПутьФайлаТеста = ОбъединитьПути(КаталогТестовыхФикстур(), "env.json");

	Команда = Новый КомандаКонтрольнаяСумма();
	Хэш = Команда.ХэшФайлов(ПутьФайлаТеста);	
	Ожидаем.Что(Хэш).Равно("2f5b932abded144c9ef07d021b5b8f30");
	
КонецПроцедуры

Процедура Тест_Должен_Выполнить_Команду_checksum() Экспорт

	ПутьФайлаТеста = ОбъединитьПути(КаталогТестовыхФикстур(), "env.json");
	ЯВыполняюКомандуПродуктаCПередачейПараметров("checksum", "-file " + ПутьФайлаТеста);
	
КонецПроцедуры

Инициализация();
Лог = Логирование.ПолучитьЛог("cicd.tests");
//ВключитьПоказОтладки();