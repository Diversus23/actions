﻿#Использовать v8runner
#Использовать asserts
#Использовать v8storage

// BSLLS:NumberOfOptionalParams-off

// Лог модуля
Перем Лог;
// Каталог под временную ИБ, если она нужна
Перем КаталогВременнойИБ;
// Конфигуратор 1С
Перем Конфигуратор;

Функция Конфигуратор() Экспорт
	Возврат Конфигуратор;
КонецФункции

Процедура Инициализация(Знач Параметры) Экспорт
	
	ТекущаяПроцедура = "Инициализация";
	Ожидаем.Что(Параметры.СтрокаПодключения, ТекущаяПроцедура + ": не задана строка подключения").Заполнено();
	
	Конфигуратор = Новый УправлениеКонфигуратором();
	
	КаталогВременнойИБ = ВременныеФайлы.СоздатьКаталог();
	Конфигуратор.КаталогСборки(КаталогВременнойИБ);
	
	Конфигуратор.УстановитьКонтекст(Параметры.СтрокаПодключения, Параметры.Пользователь, Параметры.Пароль);
	Если ЗначениеЗаполнено(Параметры.ВерсияПлатформы) Тогда
		Конфигуратор.ИспользоватьВерсиюПлатформы(Параметры.ВерсияПлатформы);
	КонецЕсли;
	
	Если Параметры.Свойство("КлючРазрешенияЗапуска") И ЗначениеЗаполнено(Параметры.КлючРазрешенияЗапуска) Тогда
		Конфигуратор.УстановитьКлючРазрешенияЗапуска(Параметры.КлючРазрешенияЗапуска);
	КонецЕсли;
	
	Если Параметры.Свойство("КодЯзыка") И ЗначениеЗаполнено(Параметры.КодЯзыка) Тогда
		Конфигуратор.УстановитьКодЯзыка(Параметры.КодЯзыка);
	КонецЕсли;
	
	Если Параметры.Свойство("КодЯзыкаСеанса") И ЗначениеЗаполнено(Параметры.КодЯзыкаСеанса) Тогда
		Конфигуратор.УстановитьКодЯзыкаСеанса(Параметры.КодЯзыкаСеанса);
	КонецЕсли;
	
КонецПроцедуры

Процедура Деструктор() Экспорт
	Попытка
		Если КаталогВременнойИБ <> Неопределено Тогда
			ВременныеФайлы.УдалитьФайл(КаталогВременнойИБ);
		КонецЕсли;
	Исключение
		Лог.Отладка(ОписаниеОшибки());
	КонецПопытки;
	
	КаталогВременнойИБ = Неопределено;
КонецПроцедуры

Процедура СоздатьФайловуюБазу(Знач Параметры) Экспорт
	
	Лог.Информация("Создание файловой ИБ");
	Лог.Информация("Каталог %1", Параметры.КаталогБазы);
	
	Попытка
		Конфигуратор.СоздатьФайловуюБазу(Параметры.КаталогБазы,
			Параметры.ПутьКШаблону,
			Параметры.ИмяБазыВСписке);
		Лог.Информация("Создание файловой ИБ завершено");
	Исключение
		ОбщегоНазначения.ЗавершениеРаботыОшибка("Произошла ошибка при создании файловой ИБ %1",
			Конфигуратор.ВыводКоманды());
	КонецПопытки;
	
КонецПроцедуры

Процедура СоздатьСервернуюБазу(Знач Параметры) Экспорт

	// BSLLS:CognitiveComplexity-off
	Лог.Информация("Создание серверной ИБ");

	// Заполнение параметров базы 1С
	ПараметрыБазы1С = Новый Структура();
	ПараметрыБазы1С.Вставить("Сервер1С", Параметры.Сервер1С);
	Лог.Информация("Сервер 1С: %1", Параметры.Сервер1С);
	ПараметрыБазы1С.Вставить("ИмяИБ", Параметры.ИмяИБ);
	Лог.Информация("Имя базы 1С: %1", Параметры.ИмяИБ);
	Если ЗначениеЗаполнено(Параметры.РазрешитьРегЗадания) Тогда
		ПараметрыБазы1С.Вставить("РазрешитьРегЗадания", Параметры.РазрешитьРегЗадания);
	Иначе
		ПараметрыБазы1С.Вставить("РазрешитьРегЗадания", Истина);
	КонецЕсли;
	Если ЗначениеЗаполнено(Параметры.РазрешитьРегЗадания) Тогда
		ПараметрыБазы1С.Вставить("РазрешитьВыдачуЛицензий", Параметры.РазрешитьВыдачуЛицензий);
	Иначе
		ПараметрыБазы1С.Вставить("РазрешитьВыдачуЛицензий", Ложь);
	КонецЕсли;
	
	// Параметры СУБД
	ПараметрыСУБД = Новый Структура();

	Если ЗначениеЗаполнено(Параметры.ТипСУБД) Тогда
		ПараметрыСУБД.Вставить("ТипСУБД", Параметры.ТипСУБД);
	Иначе
		ПараметрыСУБД.Вставить("ТипСУБД", Перечисления.ТипыСУБД.MSSQLServer);
	КонецЕсли;

	Если ЗначениеЗаполнено(Параметры.СерверСУБД) Тогда
		ПараметрыСУБД.Вставить("СерверСУБД", Параметры.СерверСУБД);	
	Иначе
		ПараметрыСУБД.Вставить("СерверСУБД", Параметры.Сервер1С);	
	КонецЕсли;
	Лог.Информация("Сервер БД %1:%2", ПараметрыСУБД.ТипСУБД, ПараметрыСУБД.СерверСУБД);
	
	Если ЗначениеЗаполнено(Параметры.ПользовательСУБД) Тогда
		ПараметрыСУБД.Вставить("ПользовательСУБД", Параметры.ПользовательСУБД);
		Лог.Информация("ПользовательСУБД: %1", ПараметрыСУБД.ПользовательСУБД);
	Иначе
		ПараметрыСУБД.Вставить("ПользовательСУБД", "");
	КонецЕсли;
	
	Если ЗначениеЗаполнено(Параметры.ПарольСУБД) Тогда
		ПараметрыСУБД.Вставить("ПарольСУБД", Параметры.ПарольСУБД);
		Лог.Информация("ПарольСУБД: ***");
	Иначе
		ПараметрыСУБД.Вставить("ПарольСУБД", "");
	КонецЕсли;
	
	Если ЗначениеЗаполнено(Параметры.ИмяБД) Тогда
		ПараметрыСУБД.Вставить("ИмяБД", Параметры.ИмяБД);
	Иначе
		ПараметрыСУБД.Вставить("ИмяБД", ПараметрыБазы1С.ИмяИБ);
	КонецЕсли;
	Лог.Информация("Имя базы БД: %1", ПараметрыСУБД.ИмяБД);

	Если ЗначениеЗаполнено(Параметры.СмещениеДат) Тогда
		ПараметрыСУБД.Вставить("СмещениеДат", Параметры.СмещениеДат);
	Иначе
		ПараметрыСУБД.Вставить("СмещениеДат", 2000);
	КонецЕсли;
	
	Если ЗначениеЗаполнено(Параметры.СоздаватьБД) Тогда
		ПараметрыСУБД.Вставить("СоздаватьБД", Параметры.СоздаватьБД);
	Иначе
		ПараметрыСУБД.Вставить("СоздаватьБД", Истина);
	КонецЕсли;
	
	АвторизацияВКластере = Новый Структура();
	Если ЗначениеЗаполнено(Параметры.АдминистраторКластера) Тогда
		АвторизацияВКластере.Вставить("Имя", Параметры.АдминистраторКластера);
		Лог.Информация("Администратор кластера: %1", АвторизацияВКластере.Имя);
	Иначе
		АвторизацияВКластере.Вставить("Имя", "");
	КонецЕсли;
	Если ЗначениеЗаполнено(Параметры.ПарольКластера) Тогда
		АвторизацияВКластере.Вставить("Пароль", Параметры.ПарольКластера);
		Лог.Информация("Пароль администратора кластера: ***");
	Иначе
		АвторизацияВКластере.Вставить("Пароль", "");
	КонецЕсли;
	ОшибкаЕслиСуществует = Истина;
	
	ПутьКШаблону = "";
	Если ЗначениеЗаполнено(Параметры.ПутьКШаблону) Тогда
		ПутьКШаблону = Параметры.ПутьКШаблону;
		Лог.Информация("Шаблон создаваемой ИБ: %1", ПутьКШаблону);
	КонецЕсли;
	
	ИмяБазыВСписке = "";
	Если ЗначениеЗаполнено(Параметры.ИмяБазыВСписке) Тогда
		ИмяБазыВСписке = Параметры.ИмяБазыВСписке;
		Лог.Информация("Имя в списке баз пользователя: %1", ИмяБазыВСписке);
	КонецЕсли;

	Попытка
		Конфигуратор.СоздатьСервернуюБазу(ПараметрыБазы1С, ПараметрыСУБД, АвторизацияВКластере, ОшибкаЕслиСуществует, ПутьКШаблону, ИмяБазыВСписке);
		Лог.Информация("Создание ИБ завершено");
	Исключение
		ОбщегоНазначения.ЗавершениеРаботыОшибка("Произошла ошибка при создании ИБ на сервере %1",
			Конфигуратор.ВыводКоманды());
	КонецПопытки;

	// BSLLS:CognitiveComplexity-on
	
КонецПроцедуры

// BSLLS:NumberOfOptionalParams-on

Лог = ПараметрыСистемы.Лог();