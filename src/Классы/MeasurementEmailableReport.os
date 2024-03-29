﻿#Область ПрограммныйИнтерфейс

// Процедура - устанавливает описание команды
//
// Параметры:
//  Команда    - КомандаПриложения     - объект описание команды
//
Процедура ОписаниеКоманды(Команда) Экспорт

	Команда.Опция("path p", "",
		"Каталог где хранятся json-отчеты по замерам производительности (обязательный)")
		.ТСтрока();
	
	Команда.Опция("file f", "",
		"Имя html-файла куда сохранить отчет по замерам производительности по всем замерам в каталоге (обязательный)")
		.ТСтрока();

КонецПроцедуры

// Процедура - запускает выполнение команды устанавливает описание команды
//
// Параметры:
//  Команда    - КомандаПриложения     - объект  описание команды
//
Процедура ВыполнитьКоманду(Знач Команда) Экспорт
    
	Параметры = ПолучитьСтруктуруПараметров(Команда);
	Лог = ПараметрыСистемы.Лог();
	Лог.Информация("Начало сохранения файла-отчета по замерам производительности");
	ПараметрыСистемы.Замеры.СформироватьОтчетПоЗамерам(Параметры.ИмяФайла, Параметры.Каталог);
	Лог.Информация("Сохранение окончено");
        
КонецПроцедуры

#КонецОбласти // ПрограммныйИнтерфейс

#Область СлужебныеПроцедурыИФункции

Функция ПолучитьСтруктуруПараметров(Знач Команда)	

	ЧтениеОпций = Новый ЧтениеОпцийКоманды(Команда);	
	ВыводОтладочнойИнформации = ЧтениеОпций.ЗначениеОпции("verbose");	
	ПараметрыСистемы.УстановитьРежимОтладки(ВыводОтладочнойИнформации);

	ПараметрыКоманды = Новый Структура;
	ПараметрыКоманды.Вставить("Каталог", ЧтениеОпций.ЗначениеОпции("path", Истина));
	ПараметрыКоманды.Вставить("ИмяФайла", ЧтениеОпций.ЗначениеОпции("file", Истина));

	Если НЕ ФайловыеОперации.КаталогСуществует(ПараметрыКоманды.Каталог) Тогда
		ОбщегоНазначения.ЗавершениеРаботыОшибка("Каталог <%1> отчетов по замерам производительности не существует",
			ПараметрыКоманды.Каталог);
	КонецЕсли;

	Возврат ПараметрыКоманды;

КонецФункции

#КонецОбласти // СлужебныеПроцедурыИФункции