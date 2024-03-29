﻿#Область ПрограммныйИнтерфейс

// Процедура - устанавливает описание команды
//
// Параметры:
//  Команда    - КомандаПриложения     - объект описание команды
//
Процедура ОписаниеКоманды(Команда) Экспорт

	Команда.Опция("file f", "",
		"Имя файла json. Если не задано, то будет дозапись в файл settings.json.
		|Если файла нет, он будет создан (не обязательный)")
		.ТСтрока();		

	Команда.Опция("action a", "",
		"Действие с json-файлом: set, del, addinarray, cleararray
		|По умолчанию set (не обязательный)")
		.ТПеречисление()
		.Перечисление(Перечисления.ДействияJSON.УстановитьНастройку,
			Перечисления.ДействияJSON.УстановитьНастройку,
			"Установить значение ключа простого типа (Строка, Число, Булево, Дата)")
		.Перечисление(Перечисления.ДействияJSON.УдалитьНастройку,
			Перечисления.ДействияJSON.УдалитьНастройку,
			"Удалить значение ключа")
		.Перечисление(Перечисления.ДействияJSON.ДобавитьВМассив,
			Перечисления.ДействияJSON.ДобавитьВМассив,
			"Добавить значение простого типа в массив")
		.Перечисление(Перечисления.ДействияJSON.ОчиститьМассив,
			Перечисления.ДействияJSON.ОчиститьМассив,
			"Очистить массив");

	Команда.Опция("key k", "",
		"Имя ключа в точечной нотации. Пример ""zip.add"" - добавит {""zip"": {""add"": ""value""}} (обязательный)")
		.ТСтрока();

	Команда.Опция("string str s", "",
		"Значение-строка")
		.ТСтрока();

	Команда.Опция("number num n", "",
		"Значение-число")
		.ТЧисло();

	Команда.Опция("boolean bool b", "",
		"Значение-булево (True/False, 1/0, Истина/Ложь)")
		.ТСтрока();

	Команда.Опция("date d", "",
		"Значение-дата в формате yyyy-MM-dd_HH:mm:ss")
		.ТДата();

	Команда.Опция("filevalue", "",
		"Значение файла будет прочитано и записано в ключ")
		.ТСтрока();

КонецПроцедуры // ОписаниеКоманды()

// Процедура - запускает выполнение команды устанавливает описание команды
//
// Параметры:
//  Команда    - КомандаПриложения     - объект  описание команды
//
Процедура ВыполнитьКоманду(Знач Команда) Экспорт
	
	Параметры = ПолучитьСтруктуруПараметров(Команда);	
	ОбщегоНазначения.ВыполнитьДействиеJSON(Параметры.ИмяФайла, Параметры.Действие, 
		Параметры.Ключ, Параметры.Значение);
    
КонецПроцедуры // ВыполнитьКоманду()

#КонецОбласти // ПрограммныйИнтерфейс

#Область СлужебныеПроцедурыИФункции

Функция ПолучитьСтруктуруПараметров(Знач Команда)

	ЧтениеОпций = Новый ЧтениеОпцийКоманды(Команда);	
	ВыводОтладочнойИнформации = ЧтениеОпций.ЗначениеОпции("verbose");	
	ПараметрыСистемы.УстановитьРежимОтладки(ВыводОтладочнойИнформации);
	
	ПараметрыКоманды = Новый Структура;
	ЗначениеПоУмолчанию = Перечисления.ДействияJSON.УстановитьНастройку;
	ПараметрыКоманды.Вставить("Действие", ЧтениеОпций.ЗначениеОпции("action", Ложь, ЗначениеПоУмолчанию));
	ПараметрыКоманды.Вставить("Ключ", ЧтениеОпций.ЗначениеОпции("key", Истина));
	ПараметрыКоманды.Вставить("Значение", Неопределено);

	Если ПараметрыКоманды.Действие = Перечисления.ДействияJSON.УстановитьНастройку
		ИЛИ ПараметрыКоманды.Действие = Перечисления.ДействияJSON.ДобавитьВМассив Тогда

		Значение = ЧтениеОпций.ЗначениеОпции("string");
		Если Значение = Неопределено Тогда
			Значение = ЧтениеОпций.ЗначениеОпции("number");
		КонецЕсли;
		Если Значение = Неопределено Тогда
			ЗначениеБулево = ЧтениеОпций.ЗначениеОпции("boolean");
			Если ЗначениеЗаполнено(ЗначениеБулево) Тогда
				ЗначениеБулево = НРег(СокрЛП(ЗначениеБулево));
				Значение = ЗначениеБулево = "true" ИЛИ ЗначениеБулево = "истина" ИЛИ ЗначениеБулево = "1";
			КонецЕсли;
		КонецЕсли;
		Если Значение = Неопределено Тогда
			ИмяФайла = ЧтениеОпций.ЗначениеОпции("filevalue");
			Если ИмяФайла <> Неопределено Тогда
				Значение = ФайловыеОперации.ПрочитатьТекстФайла(ИмяФайла);
			КонецЕсли;
		КонецЕсли;		
		Если Значение = Неопределено Тогда
			Значение = ЧтениеОпций.ЗначениеОпции("date");
		КонецЕсли;

		Если Значение = Неопределено Тогда
			Стр = "Не задано значение. Один из параметров на выбор: --string, --number, --boolean, --filevalue, --date";
			ОбщегоНазначения.ЗавершениеРаботыОшибка(Стр);
		КонецЕсли;

		ПараметрыКоманды.Вставить("Значение", Значение);
	КонецЕсли;

	ИмяФайла = ЧтениеОпций.ЗначениеОпции("file");
	Если ЗначениеЗаполнено(ИмяФайла) Тогда
		ПараметрыКоманды.Вставить("ИмяФайла", ИмяФайла);
	Иначе
		ИмяФайла = ОбъединитьПути(ОбщегоНазначения.КаталогПроекта(), ПараметрыСистемы.ИмяФайлаНастроек());
	КонецЕсли;
	ПараметрыКоманды.Вставить("ИмяФайла", ИмяФайла);

	Возврат ПараметрыКоманды; 

КонецФункции // ПолучитьСтруктуруПараметров()

#КонецОбласти // СлужебныеПроцедурыИФункции