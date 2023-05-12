﻿//////////////////////////////////////////////////////////////////////////////
//
// Служебный модуль с набором служебных параметров приложения
//
// При создании нового приложения обязательно внести изменение 
// в ф-ии ИмяПродукта, указав имя вашего приложения.
//
// При выпуске новой версии обязательно изменить ее значение
// в ф-ии ВерсияПродукта
//
///////////////////////////////////////////////////////////////////////////////

Перем КорневойПутьПроекта Экспорт;
Перем ЭтоWindows Экспорт;
Перем Окружение Экспорт;

///////////////////////////////////////////////////////////////////////////////
// СВОЙСТВА ПРОДУКТА

// ВерсияПродукта
//	Возвращает текущую версию продукта
//
// Возвращаемое значение:
//   Строка   - Значение текущей версии продукта
//
Функция ВерсияПродукта() Экспорт
	
	Возврат "1.0.0";
	
КонецФункции // ВерсияПродукта

// ИмяПродукта
//	Возвращает имя продукта
//
// Возвращаемое значение:
//   Строка   - Значение имени продукта
//
Функция ИмяПродукта() Экспорт
	
	Возврат "cicd";
	
КонецФункции // ИмяПродукта

///////////////////////////////////////////////////////////////////////////////
// ЛОГИРОВАНИЕ

//	Форматирование логов
//   См. описание метода "УстановитьРаскладку" библиотеки logos
//
Функция Форматировать(Знач Уровень, Знач Сообщение) Экспорт

	Возврат СтрШаблон("%1: %2 - %3", ТекущаяДата(), УровниЛога.НаименованиеУровня(Уровень), Сообщение);

КонецФункции
	
// ИмяЛогаСистемы
//	Возвращает идентификатор лога приложения
//
// Возвращаемое значение:
//   Строка   - Значение идентификатора лога приложения
//
Функция ИмяЛогаСистемы() Экспорт
	
	Возврат "oscript.app." + ИмяПродукта();
	
КонецФункции // ИмяЛогаСистемы

///////////////////////////////////////////////////////////////////////////////
// НАСТРОЙКА КОМАНД

// Возвращает имя команды "version" (ключ командной строки)
//
//  Возвращаемое значение:
//   Строка - имя команды
//
Функция ИмяКомандыВерсия() Экспорт
	
	Возврат "version";

КонецФункции // ИмяКомандыВерсия


// Возвращает имя команды "help" (ключ командной строки)
//
//  Возвращаемое значение:
//   Строка - имя команды
//
Функция ИмяКомандыПомощь() Экспорт

	Возврат "help";
	
КонецФункции // ИмяКомандыПомощь()

// Возвращает имя команды "createinfobase" (ключ командной строки)
//
//  Возвращаемое значение:
//   Строка - имя команды
//
Функция ИмяКомандыСоздатьИнформационнуюБазу() Экспорт

	Возврат "createinfobase";
	
КонецФункции // ИмяКомандыПомощь()

// Возвращает имя команды "setenv" (ключ командной строки)
//
//  Возвращаемое значение:
//   Строка - имя команды
//
Функция ИмяКомандыЗаписатьНастройкуОкружения() Экспорт

	Возврат "setenv";
	
КонецФункции // ИмяКомандыПомощь()

// ИмяКомандыПоУмолчанию
// 	Одна из команд может вызываться неявно, без указания команды.
// 	Иными словами, здесь указывается какой обработчик надо вызывать, если приложение запущено без какой-либо команды
// 	myapp /home/user/somefile.txt будет аналогично myapp default-action /home/user/somefile.txt 
//
// Возвращаемое значение:
// 	Строка - имя команды по умолчанию
Функция ИмяКомандыПоУмолчанию() Экспорт
	
	// Возврат "default-action";
	Возврат ИмяКомандыПомощь();
	
КонецФункции // ИмяКомандыПоУмолчанию

// НастроитьКомандыПриложения
//	Регистрирует классы обрабатывающие команды прилоложения
// 
// Параметры:
//	Приложение - Модуль - Модуль менеджера приложения
Процедура НастроитьКомандыПриложения(Знач Приложение) Экспорт
	
	Приложение.ДобавитьКоманду(ИмяКомандыПомощь(), "КомандаСправкаПоПараметрам",
		"Выводит справку по командам");
	Приложение.ДобавитьКоманду(ИмяКомандыВерсия(), "КомандаVersion",
		"Выводит версию приложения");
	Приложение.ДобавитьКоманду(ИмяКомандыЗаписатьНастройкуОкружения(), "КомандаЗаписатьНастройкуОкружения",
		"Записывает переданную настройку окружения и ее значение в файл окружения .env");

	// Приложение.ДобавитьКоманду(ИмяКомандыСоздатьИнформационнуюБазу(), "КомандаСоздатьИнформационнуюБазу",
	// 	"Создает серверную или файловую информационную базу 1С");
	
	// Приложение.ДобавитьКоманду("<Имя команды>", "<Класс реализации>", "<Описание команды>");
	
КонецПроцедуры // ПриРегистрацииКомандПриложения