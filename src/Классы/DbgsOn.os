﻿#Использовать v8runner

#Область ПрограммныйИнтерфейс

// Процедура - устанавливает описание команды
//
// Параметры:
//  Команда    - КомандаПриложения     - объект описание команды
//
Процедура ОписаниеКоманды(Команда) Экспорт

	ТекстШаблона = "%1 %2";
	ПараметрыОпций = Работа1С.КонструкторDbgsOn();
	Работа1С.ОписаниеКоманды(Команда, ПараметрыОпций);

	Команда.Опция("addr a", "",
		"Адрес сервера отладки. По умолчанию ""127.0.0.1"" (не обязательный)")
		.ТСтрока();

	Текст = СтрШаблон(ТекстШаблона, 
		"Порт сервера отладки. По умолчанию 1550.", 
		"Если порт будет занят, то будет найден свободный порт (не обязательный)");
	Команда.Опция("port p", "", Текст)
		.ТЧисло();	

	Текст = СтрШаблон(ТекстШаблона, 
		"Файл-флаг с результатом запуска dbgs. По умолчанию ""dbgs.json"".",
		"Нужен для последующей остановки сервера отладки (не обязательный)");
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

	Лог.Информация("Старт сервера отладки dbgs");
	Параметры = ПолучитьСтруктуруПараметров(Команда);
	Конфигуратор = Новый УправлениеКонфигуратором();
	Если ЗначениеЗаполнено(Параметры.ВерсияПлатформы) Тогда
		Конфигуратор.ИспользоватьВерсиюПлатформы(Параметры.ВерсияПлатформы);
	КонецЕсли;
	Файл = Новый Файл(Конфигуратор.ПутьКПлатформе1С());
	Путь = Файл.Путь;
	ИмяФайлаОтладчика = ОбъединитьПути(Путь, "dbgs");
	Если ПараметрыСистемы.ЭтоWindows Тогда
		ИмяФайлаОтладчика = ИмяФайлаОтладчика + ".exe";
	КонецЕсли;
	
	ТекущийПорт = Параметры.Порт;
	Идентификатор = "";

	Пока Истина Цикл
		Массив = Новый Массив();
		Массив.Добавить("--addr=" + Параметры.Адрес);
		Массив.Добавить("--port=" + Формат(ТекущийПорт, "ЧГ=0"));
		Команда = Новый КонтролируемыйПроцесс();
		Команда.УстановитьКаталогКонтроляОткрытыхПриложений(Параметры.КаталогКонтроляОткрытыхПриложений);	
		Команда.УстановитьКоманду(ИмяФайлаОтладчика);
		Команда.ДобавитьПараметры(Массив);
		Команда.УстановитьИсполнениеЧерезКомандыСистемы(Ложь);
		Команда.ПоказыватьВыводНемедленно(Ложь);
		Команда.ПерехватыватьПотоки(Ложь);
		Процесс = Команда.ЗапуститьПроцесс();
		Идентификатор = Процесс.Идентификатор;
		Лог.Информация("Попытка запуска сервера отладки dbgs PID: %1", Идентификатор);
		ТаймаутПоУмолчанию = 3000;
		Приостановить(ТаймаутПоУмолчанию);		
		Если ЗначениеЗаполнено(Процесс) И Процесс.Завершен = Ложь Тогда
			Прервать;
		КонецЕсли;
		ТекущийПорт = ТекущийПорт + 1;		
	КонецЦикла;

	ОбщегоНазначения.ЗаписатьНастройкуВФайл(Параметры.ИмяФайла, "port", ТекущийПорт);
	ОбщегоНазначения.ЗаписатьНастройкуВФайл(Параметры.ИмяФайла, "pid", Идентификатор);
	Лог.Информация("Сервер отладки запущен на свободном порту %1 (PID %2)", ТекущийПорт, Идентификатор);
	
КонецПроцедуры // ВыполнитьКоманду()

#КонецОбласти // ПрограммныйИнтерфейс

#Область СлужебныеПроцедурыИФункции

Функция ПолучитьСтруктуруПараметров(Знач Команда)
	
	ЧтениеОпций = Новый ЧтениеОпцийКоманды(Команда);
	ВыводОтладочнойИнформации = ЧтениеОпций.ЗначениеОпции("verbose");
	ПараметрыСистемы.УстановитьРежимОтладки(ВыводОтладочнойИнформации);
	
	ПараметрыОпций = Работа1С.КонструкторDbgsOn();
	ПараметрыКоманды = Работа1С.ПрочитатьПараметры(Команда, ПараметрыОпций);

	// BSLLS:UsingHardcodeNetworkAddress-off
	ПараметрыКоманды.Вставить("Адрес", ЧтениеОпций.ЗначениеОпции("addr", Ложь, "127.0.0.1"));
	// BSLLS:UsingHardcodeNetworkAddress-on
	ПараметрыКоманды.Вставить("Порт", ЧтениеОпций.ЗначениеОпции("port"));
	Если НЕ ЗначениеЗаполнено(ПараметрыКоманды.Порт) Тогда
		ПараметрыКоманды.Порт = 1550;
	КонецЕсли;
	Сообщить(ПараметрыКоманды.Порт);
	ИмяФайлаПоУмолчанию = ОбъединитьПути(ОбщегоНазначения.КаталогПроекта(), "dbgs.json");
	ПараметрыКоманды.Вставить("ИмяФайла", ЧтениеОпций.ЗначениеОпции("file", Ложь, ИмяФайлаПоУмолчанию));
	ПараметрыКоманды.Вставить("КаталогКонтроляОткрытыхПриложений", ЧтениеОпций.ЗначениеОпции("processpath"));

	Возврат ПараметрыКоманды;
	
КонецФункции // ПолучитьСтруктуруПараметров()

#КонецОбласти // СлужебныеПроцедурыИФункции