﻿#Использовать 1connector

#Область ПрограммныйИнтерфейс

// Процедура - устанавливает описание команды
//
// Параметры:
//  Команда    - КомандаПриложения     - объект описание команды
//
Процедура ОписаниеКоманды(Команда) Экспорт
	
	Команда.Опция("url u", "",
		"URL сервера Allure Docker Service (обязательный)")
		.ТСтрока();

	Команда.Опция("project", "",
		"Имя проекта на сервере Allure (обязательный)")
		.ТСтрока();

	Команда.Опция("file f", "",
		"Имя файла, куда сохранить краткий отчет с сервера (обязательный)")
		.ТСтрока();

КонецПроцедуры // ОписаниеКоманды()

// Процедура - запускает выполнение команды устанавливает описание команды
//
// Параметры:
//  Команда    - КомандаПриложения     - объект  описание команды
//
Процедура ВыполнитьКоманду(Знач Команда) Экспорт
	
	Лог = ПараметрыСистемы.Лог();
	Лог.Информация("Начало получения отчета на сервере Allure Docker Service");

	Параметры = ПолучитьСтруктуруПараметров(Команда);	
	// Готовим запрос
	СтруктураЗапроса = Новый Структура();
	СтруктураЗапроса.Вставить("project_id", Параметры.Проект);
	Адрес = РаботаAllure.ПостоянныйАдресAllureDickerService(Параметры.АдресСервера) 
		+ "/emailable-report/export?"
		+ ОбщегоНазначения.СтруктуруВПараметрыHTTPЗапроса(СтруктураЗапроса);	

	// Отправляем запрос
	Таймаут = РаботаAllure.ТаймаутAllureDickerService();
	Попытка
		Результат = КоннекторHTTP.Get(Адрес, Неопределено, Новый Структура("Таймаут", Таймаут)).ДвоичныеДанные();
		Результат.Записать(Параметры.ИмяФайла);
	Исключение
		Текст = ОписаниеОшибки();
		ОбщегоНазначения.ЗавершениеРаботыОшибка(
			"Ошибка отправки данных на сервер Allure Docker Service:
			|%1", Текст);
	КонецПопытки;

	Лог.Информация("Получение отчета на сервере Allure Docker Service завершено");

КонецПроцедуры // ВыполнитьКоманду()

#КонецОбласти // ПрограммныйИнтерфейс

#Область СлужебныеПроцедурыИФункции

Функция ПолучитьСтруктуруПараметров(Знач Команда)
	
	ЧтениеОпций = Новый ЧтениеОпцийКоманды(Команда);	
	ВыводОтладочнойИнформации = ЧтениеОпций.ЗначениеОпции("verbose");	
	ПараметрыСистемы.УстановитьРежимОтладки(ВыводОтладочнойИнформации);

	ПараметрыКоманды = Новый Структура;	
	ПараметрыКоманды.Вставить("АдресСервера", ЧтениеОпций.ЗначениеОпции("url", Истина));
	ПараметрыКоманды.Вставить("Проект", ЧтениеОпций.ЗначениеОпции("project", Истина));
	ПараметрыКоманды.Вставить("ИмяФайла", ЧтениеОпций.ЗначениеОпции("file", Истина));

	Возврат ПараметрыКоманды;
	
КонецФункции

#КонецОбласти // СлужебныеПроцедурыИФункции