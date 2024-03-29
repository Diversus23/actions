﻿#Область ПрограммныйИнтерфейс

// Процедура - устанавливает описание команды
//
// Параметры:
//  Команда    - КомандаПриложения     - объект описание команды
//
Процедура ОписаниеКоманды(Команда) Экспорт
    
	Команда.Опция("path p", "",
		"Локальный каталог в котором необходимо удалить файлы (обязательный)")
		.ТСтрока();

	Команда.Опция("mask m", "",
		"Маска файлов. По умолчанию ""*"" (не обязательный)")
		.ТСтрока();

	Команда.Опция("type t", "",
		"Тип удаления. Поддерживаются типы устаревания файлов: day, hour, min (день, час, минута).
		|По умолчанию day (не обязательный)")
		.ТПеречисление()
		.Перечисление(Перечисления.ТипУстареванияФайлов.День,
			Перечисления.ТипУстареванияФайлов.День,
			"Удаление файлов старше N дней")
		.Перечисление(Перечисления.ТипУстареванияФайлов.Час,
			Перечисления.ТипУстареванияФайлов.Час,
			"Удаление файлов старше N часов")
		.Перечисление(Перечисления.ТипУстареванияФайлов.Минута,
			Перечисления.ТипУстареванияФайлов.Минута,
			"Удаление файлов старше N минут");

	Команда.Опция("value val", "",
		"Значение удаления. По умолчанию 5 (не обязательный)")
		.ТЧисло();
	
	Команда.Опция("recursive r", "",
		"Поиск включая подкаталоги (не обязательный)")
		.ТБулево();

	Команда.Опция("delifempty", "",
		"Удалить корневой каталог, если он остался пуст (не обязательный)")
		.ТБулево();
		
КонецПроцедуры // ОписаниеКоманды()

// Процедура - запускает выполнение команды устанавливает описание команды
//
// Параметры:
//  Команда    - КомандаПриложения     - объект  описание команды
//
Процедура ВыполнитьКоманду(Знач Команда) Экспорт
	
	ПараметрыКоманды = ПолучитьСтруктуруПараметров(Команда);
	УдалитьСтарыеФайлы(ПараметрыКоманды);
    
КонецПроцедуры // ВыполнитьКоманду()

#КонецОбласти // ПрограммныйИнтерфейс

#Область СлужебныеПроцедурыИФункции

Функция ПолучитьСтруктуруПараметров(Знач Команда)

	ЧтениеОпций = Новый ЧтениеОпцийКоманды(Команда);	
	ВыводОтладочнойИнформации = ЧтениеОпций.ЗначениеОпции("verbose");	
	ПараметрыСистемы.УстановитьРежимОтладки(ВыводОтладочнойИнформации);

	ПараметрыКоманды = Новый Структура;
	ПараметрыКоманды.Вставить("Каталог", ЧтениеОпций.ЗначениеОпции("path", Истина));
	ПараметрыКоманды.Вставить("Маска", ЧтениеОпций.ЗначениеОпции("mask", Ложь, "*"));
	ПараметрыКоманды.Вставить("Значение", ЧтениеОпций.ЗначениеОпции("value", Ложь, 5));
	ТипУдаленияПоУмолчанию = Перечисления.ТипУстареванияФайлов.День;
	ПараметрыКоманды.Вставить("ТипУдаления", ЧтениеОпций.ЗначениеОпции("type", Ложь, ТипУдаленияПоУмолчанию));
	ПараметрыКоманды.Вставить("РекурсивноеУдаление", ЧтениеОпций.ЗначениеОпции("recursive", Ложь));
	ПараметрыКоманды.РекурсивноеУдаление = ЗначениеЗаполнено(ПараметрыКоманды.РекурсивноеУдаление);
	ПараметрыКоманды.Вставить("УдалитьКаталогЕслиПуст", ЧтениеОпций.ЗначениеОпции("delifempty", Ложь));
	ПараметрыКоманды.УдалитьКаталогЕслиПуст = ЗначениеЗаполнено(ПараметрыКоманды.УдалитьКаталогЕслиПуст);

	Возврат ПараметрыКоманды; 

КонецФункции // ПолучитьСтруктуруПараметров()

Процедура УдалитьСтарыеФайлы(Знач Параметры)

	Лог = ПараметрыСистемы.Лог();
	Если НЕ ФайловыеОперации.КаталогСуществует(Параметры.Каталог) Тогда
		Лог.Предупреждение("Каталог для удаления устаревших файлов не найден <%1>", Параметры.Каталог);
		Возврат;
	КонецЕсли;
	
	Лог.Информация("Начало удаления устаревших файлов");

	ПродолжительностьМинуты = 60;
	МинутВЧасе = 60;
	ПродолжительностьЧаса = МинутВЧасе * ПродолжительностьМинуты;
	ЧасовВСутках = 24;

	Если Параметры.ТипУдаления = Перечисления.ТипУстареванияФайлов.Минута Тогда
		Коэффициент = ПродолжительностьМинуты;
	ИначеЕсли Параметры.ТипУдаления = Перечисления.ТипУстареванияФайлов.Час Тогда
		Коэффициент = ПродолжительностьЧаса;
	Иначе
		Коэффициент = ЧасовВСутках * ПродолжительностьЧаса;
	КонецЕсли;
	ДатаУстаревания = ТекущаяДата() - Параметры.Значение * Коэффициент;
	Лог.Информация("Дата, ранее которой будут удалены файлы: <%1>", ДатаУстаревания);

	МассивФайлов = НайтиФайлы(Параметры.Каталог, Параметры.Маска, Параметры.РекурсивноеУдаление);
	Если МассивФайлов.Количество() > 0 Тогда		

		ТЗ = Новый ТаблицаЗначений;
		ТЗ.Колонки.Добавить("ИмяФайла");
		ТЗ.Колонки.Добавить("ПоследняяДатаИзменения");
		ТЗ.Колонки.Добавить("ЭтоФайл");
		Для Каждого Файл Из МассивФайлов Цикл
			СтрокаТЗ 						= ТЗ.Добавить();
			СтрокаТЗ.ИмяФайла				= Файл.ПолноеИмя;
			СтрокаТЗ.ПоследняяДатаИзменения = Файл.ПолучитьВремяИзменения();
			СтрокаТЗ.ЭтоФайл				= Файл.ЭтоФайл();
		КонецЦикла;

		ТЗ.Сортировать("ИмяФайла Возр");

		КоличествоУдаленныхФайлов = 0;
		КоличествоУдаленныхКаталогов = 0;

		// Удаление файлов
		Индекс = ТЗ.Количество() - 1;		
		Пока Индекс >= 0 Цикл
			Файл = ТЗ[Индекс];
			Если Файл.ЭтоФайл = Истина И Файл.ПоследняяДатаИзменения < ДатаУстаревания Тогда
				
				Попытка
					УдалитьФайлы(Файл.ИмяФайла);
					КоличествоУдаленныхФайлов = КоличествоУдаленныхФайлов + 1;					
					Лог.Информация("Удален файл: <%1>", Файл.ИмяФайла);
					ТЗ.Удалить(Индекс);
				Исключение
					ОбщегоНазначения.ЗавершениеРаботыОшибка("Произошла ошибка при удалении файла <%1>: %2", 
						Файл.ИмяФайла, ОписаниеОшибки());
				КонецПопытки;
			КонецЕсли;

			Индекс = Индекс - 1;
		КонецЦикла;

		// Удаление каталогов
		Индекс = ТЗ.Количество() - 1;
		Пока Индекс >= 0 Цикл
			Файл = ТЗ[Индекс];
			Если Файл.ЭтоФайл = Ложь И Файл.ПоследняяДатаИзменения < ДатаУстаревания Тогда
				Попытка
					УдалитьФайлы(Файл.ИмяФайла);
					КоличествоУдаленныхКаталогов = КоличествоУдаленныхКаталогов + 1;					
					Лог.Информация("Удален каталог: <%1>", Файл.ИмяФайла);
					ТЗ.Удалить(Индекс);
				Исключение
					ОбщегоНазначения.ЗавершениеРаботыОшибка("Произошла ошибка при удалении каталога <%1>: %2", 
						Файл.ИмяФайла, ОписаниеОшибки());
				КонецПопытки;
			КонецЕсли;
			Индекс = Индекс - 1;
		КонецЦикла;

		Лог.Информация("Всего удалено файлов: %1", КоличествоУдаленныхФайлов);
		Если КоличествоУдаленныхКаталогов > 0 Тогда
			Лог.Информация("Всего удалено каталогов: %1", КоличествоУдаленныхКаталогов);
		КонецЕсли;

	КонецЕсли;

	// Попытка удалить корневой каталог, если он пуст
	Если Параметры.УдалитьКаталогЕслиПуст Тогда
		Файл = Новый Файл(Параметры.Каталог);
		МассивФайлов = НайтиФайлы(Параметры.Каталог, "*", Ложь);
		Если МассивФайлов.Количество() = 0 Тогда
			Лог.Информация("Удаление пустого каталога <%1>", Параметры.Каталог);
			УдалитьФайлы(Параметры.Каталог);
		КонецЕсли;
	КонецЕсли;

	Лог.Информация("Завершение удаления устаревших файлов");
	
КонецПроцедуры

#КонецОбласти // СлужебныеПроцедурыИФункции