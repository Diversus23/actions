﻿#Использовать 1connector

#Область ПрограммныйИнтерфейс

// Процедура - устанавливает описание команды
//
// Параметры:
//  Команда    - КомандаПриложения     - объект описание команды
//
Процедура ОписаниеКоманды(Команда) Экспорт
	
	Команда.Опция("infobase i", "",
		"Имя информационной базы. По умолчанию DefAlias (не обязательный)")
		.ТСтрока();

	Команда.Опция("debugger u", "",
		"Адрес отладчика. Пример: http://localhost:1550 (обязательный)")
		.ТСтрока();

	Текст = СтрШаблон("%1 %2", 
		"Файл-флаг с результатом запуска. По умолчанию ""cover.json"".",
		"Нужен для последующей остановки приложения (не обязательный)");
	Команда.Опция("file f", "", Текст)
		.ТСтрока();	

	Команда.Опция("processpath", "",
		"Каталог или файл данных о процессе. Если процесс зависнет, то система закроет его (не обязательный)")
		.ТСтрока();

КонецПроцедуры // ОписаниеКоманды()

// Процедура - запускает выполнение команды устанавливает описание команды
//
// Параметры:
//  Команда    - КомандаПриложения     - объект  описание команды
//
Процедура ВыполнитьКоманду(Знач Команда) Экспорт
	
	Лог = ПараметрыСистемы.Лог();
	Лог.Информация("Остановка Coverage41C");

	Параметры = ПолучитьСтруктуруПараметров(Команда);	
	ПутьКПриложению = ОбщегоНазначения.НайтиПриложениеВСистеме("Coverage41C");
	Если ПараметрыСистемы.ЭтоWindows И НЕ СтрЗаканчиваетсяНа(НРег(ПутьКПриложению), ".bat") Тогда
		ПутьКПриложению = ПутьКПриложению + ".bat";
	КонецЕсли;
	Массив = Новый Массив();
	Массив.Добавить("stop");
	Массив.Добавить("-i " + ФайловыеОперации.ОбернутьПутьВКавычки(Параметры.ИнформационнаяБаза));
	Массив.Добавить("-u " + ФайловыеОперации.ОбернутьПутьВКавычки(Параметры.Отладчик));

	Команда = Новый КонтролируемыйПроцесс();
	Команда.УстановитьКаталогКонтроляОткрытыхПриложений(Параметры.КаталогКонтроляОткрытыхПриложений);
	Команда.УстановитьКоманду(ПутьКПриложению);
	Команда.ДобавитьПараметры(Массив);
	Команда.ПоказыватьВыводНемедленно(Ложь);
	Команда.УстановитьИсполнениеЧерезКомандыСистемы(Ложь);
	Команда.ВывестиСтрокуЗапуска();
	КодВозврата = Команда.Исполнить();
	
	Если КодВозврата <> 0 И ЗначениеЗаполнено(Параметры.ИмяФайла) 
		И ФайловыеОперации.ФайлСуществует(Параметры.ИмяФайла) Тогда
		Длительность = 60;
		Настройки = ОбщегоНазначения.ПрочитатьФайлJSON(Параметры.ИмяФайла);
		Идентификатор = Настройки.Получить("pid");
		ВремяНачала = ТекущаяДата();	
		Пока Истина Цикл
			ТаймаутПоУмолчанию = 1000;
			Приостановить(ТаймаутПоУмолчанию);
			Лог.Информация("Попытка закрыть Coverage41C");

			Если ЗначениеЗаполнено(Идентификатор) Тогда
				Процесс = НайтиПроцессПоИдентификатору(Идентификатор);
				Если НЕ ЗначениеЗаполнено(Процесс) Тогда
					Прервать;
				КонецЕсли;
			КонецЕсли;

			Если ТекущаяДата() - ВремяНачала > Длительность Тогда
				Процесс.Завершить();			
				ФайловыеОперации.УдалитьФайлЕслиОнСуществует(Параметры.ИмяФайла);
				ТекстОшибки = "Coverage41C остановлен принудительно. Данные не получены (PID %1)";
				ОбщегоНазначения.ЗавершениеРаботыОшибка(ТекстОшибки, Идентификатор);
				Прервать;
			КонецЕсли;
		КонецЦикла;
	КонецЕсли;

	Лог.Предупреждение("Coverage41C успешно закрыт код возврата (%1)", КодВозврата);

КонецПроцедуры // ВыполнитьКоманду()

#КонецОбласти // ПрограммныйИнтерфейс

#Область СлужебныеПроцедурыИФункции

Функция ПолучитьСтруктуруПараметров(Знач Команда)
	
	ЧтениеОпций = Новый ЧтениеОпцийКоманды(Команда);	
	ВыводОтладочнойИнформации = ЧтениеОпций.ЗначениеОпции("verbose");	
	ПараметрыСистемы.УстановитьРежимОтладки(ВыводОтладочнойИнформации);

	ПараметрыКоманды = Новый Структура;	
	ПараметрыКоманды.Вставить("ИнформационнаяБаза", ЧтениеОпций.ЗначениеОпции("infobase", Ложь, "DefAlias"));
	ПараметрыКоманды.Вставить("Отладчик", ЧтениеОпций.ЗначениеОпции("debugger", Истина));
	ИмяФайлаПоУмолчанию = ОбъединитьПути(ОбщегоНазначения.КаталогПроекта(), "cover.json");
	ПараметрыКоманды.Вставить("ИмяФайла", ЧтениеОпций.ЗначениеОпции("file", Ложь, ИмяФайлаПоУмолчанию));
	ПараметрыКоманды.Вставить("КаталогКонтроляОткрытыхПриложений", ЧтениеОпций.ЗначениеОпции("processpath"));

	Возврат ПараметрыКоманды;
	
КонецФункции

#КонецОбласти // СлужебныеПроцедурыИФункции