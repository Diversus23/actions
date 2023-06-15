﻿#Использовать tempfiles
#Использовать logos
#Использовать json
#Использовать "../Макеты"

Перем Лог;

Процедура РегистрацияГлобальныхПараметровКоманд(Парсер) Экспорт
	
	Описание = СтрШаблон("Путь к файлу настроек CI/CD в формате json. По умолчанию имя файла ""%1""  (необязательно)",
			ПараметрыСистемы.ИмяФайлаНастроек());
	Парсер.ДобавитьИменованныйПараметр("-settings",
		Описание,
		Истина);
	
	Парсер.ДобавитьИменованныйПараметр("-logfile",
		"Вывод отладочных файлов в указанный лог-файл (необязательно)",
		Истина);
	
КонецПроцедуры

Функция ДанныеПодключения(ЗначенияПараметров) Экспорт
	
	СтрокаПодключения = СокрЛП(ЗначенияПараметров["-ibconnection"]);
	
	СтруктураПодключения = Новый Структура;
	СтруктураПодключения.Вставить("СтрокаПодключения", СтрокаПодключения);
	Если СтрНачинаетсяС(ВРег(СтрокаПодключения), "/S") Тогда
		СтрокаПодключения = Сред(СтрокаПодключения, 3);
		Сервер1С = Лев(СтрокаПодключения, Найти(СтрокаПодключения, "\") - 1);
		ИмяИБ = Прав(СтрокаПодключения, СтрДлина(СтрокаПодключения) - Найти(СтрокаПодключения, "\"));
		СтруктураПодключения.Вставить("Сервер1С", Сервер1С);
		СтруктураПодключения.Вставить("ИмяИБ", ИмяИБ);
	ИначеЕсли СтрНачинаетсяС(ВРег(СтрокаПодключения), "/F") Тогда
		КаталогИБ = Сред(СтрокаПодключения, 3);
		СтруктураПодключения.Вставить("КаталогИБ", КаталогИБ);
	Иначе
		Возврат СтруктураПодключения;
	КонецЕсли;
	СтруктураПодключения.Вставить("Пользователь",    ЗначенияПараметров["-ib-user"]);
	СтруктураПодключения.Вставить("Пароль",          ЗначенияПараметров["-ib-pwd"]);
	СтруктураПодключения.Вставить("КодЯзыка",        ЗначенияПараметров["-language"]);
	СтруктураПодключения.Вставить("КодЯзыкаСеанса",  ЗначенияПараметров["-locale"]);
	СтруктураПодключения.Вставить("ВерсияПлатформы", ЗначенияПараметров["-v8version"]);
	
	Рез = Новый Структура;
	Для Каждого КлючЗначение Из СтруктураПодключения Цикл
		Значение = КлючЗначение.Значение;
		Если Значение = Неопределено Тогда
			Значение = "";
		КонецЕсли;
		Рез.Вставить(КлючЗначение.Ключ, Значение);
	КонецЦикла;
	
	Возврат Новый ФиксированнаяСтруктура(Рез);
	
КонецФункции // ДанныеПодключения(ЗначенияПараметров)

// Функция подготавливает конфигуратор 1С для выполнения в режиме командной строки.
//
// Параметры:
//   Параметры - Структура - строка подключения к базе 1С.
//
// Возвращаемое значение:
//		УправлениеКонфигуратором - подготовленный конфигуратор.
//
Функция НастроитьКонфигуратор(Параметры) Экспорт
	
	Конфигуратор = Новый УправлениеКонфигуратором;
	
	КаталогСборки = КаталогВременныхФайлов();
	
	Конфигуратор.КаталогСборки(КаталогСборки);
	ДанныеПодключения = Параметры["ДанныеПодключения"];
	
	Если ЗначениеЗаполнено(ДанныеПодключения.СтрокаПодключения) Тогда
		Конфигуратор.УстановитьКонтекст(ДанныеПодключения.СтрокаПодключения,
			ДанныеПодключения.Пользователь,
			ДанныеПодключения.Пароль);
	КонецЕсли;
	
	Если ДанныеПодключения.Свойство("ВерсияПлатформы") Тогда
		Конфигуратор.ИспользоватьВерсиюПлатформы(ДанныеПодключения.ВерсияПлатформы);
	КонецЕсли;
	
	Возврат Конфигуратор;
	
КонецФункции // НастроитьКонфигуратор()

// Функция - читает указанный макет JSON и возвращает содержимое в виде структуры/массива
//
// Параметры:
//	ИмяМакета    - Строка   - имя макета (файла) json
//
// Возвращаемое значение:
//	Структура, Массив       - прочитанные данные из макета
//
Функция ПрочитатьДанныеИзМакетаJSON(ИмяМакета) Экспорт
	
	Чтение = Новый ЧтениеJSON();
	
	ПутьКМакету = ПолучитьМакет(СтрШаблон("/Макеты/%1", ИмяМакета));
	
	Чтение.ОткрытьФайл(ПутьКМакету, КодировкаТекста.UTF8);
	
	Возврат ПрочитатьJSON(Чтение, Ложь);
	
КонецФункции // ПрочитатьДанныеИзМакетаJSON()

// Функция - читает указанный текстовый макет возвращает содержимое в виде строки
//
// Параметры:
//	ИмяМакета    - Строка   - имя макета (файла) md
//
// Возвращаемое значение:
//	Строка       - прочитанные данные из макета
//
Функция ПрочитатьДанныеИзМакета(ИмяМакета) Экспорт
	
	ТекстовыйДокумент = Новый ТекстовыйДокумент();
	
	ПутьКМакету = ПолучитьМакет(СтрШаблон("/Макеты/%1", ИмяМакета));
	
	ТекстовыйДокумент.Прочитать(ПутьКМакету, КодировкаТекста.UTF8);
	
	Возврат ТекстовыйДокумент.ПолучитьТекст();
	
КонецФункции // ПрочитатьДанныеИзМакета()

Процедура ВывестиСтруктуруВКонсоль(Структура) Экспорт
	Для Каждого КлючЗначение Из Структура Цикл
		Сообщить(КлючЗначение.Ключ + "=" + КлючЗначение.Значение);
	КонецЦикла;
КонецПроцедуры

Процедура ДополнитьАргументыИзФайлаНастроек(Знач Команда, ЗначенияПараметров, Знач НастройкиИзФайла) Экспорт

	КлючПоУмолчанию = "default";
	
	ДополнитьСоответствиеСУчетомПриоритета(ЗначенияПараметров, НастройкиИзФайла.Получить(Команда));
	ДополнитьСоответствиеСУчетомПриоритета(ЗначенияПараметров, НастройкиИзФайла.Получить(КлючПоУмолчанию));
	
	Для Каждого Элемент Из ЗначенияПараметров Цикл
		Лог.Отладка("Получен параметр <%1> = <%2>", Элемент.Ключ, Элемент.Значение);
	КонецЦикла;
	
КонецПроцедуры // ДополнитьАргументыИзФайлаНастроек

Процедура ДополнитьСоответствиеСУчетомПриоритета(КоллекцияОсновная, Знач КоллекцияДоп) Экспорт
	
	Если КоллекцияДоп = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	Для Каждого Элемент Из КоллекцияДоп Цикл
		Значение = КоллекцияОсновная.Получить(Элемент.Ключ);
		Если Значение = Неопределено Тогда
			КоллекцияОсновная.Вставить(Элемент.Ключ, Элемент.Значение);
		ИначеЕсли ТипЗнч(Значение) = Тип("Булево") И НЕ Значение Тогда
			Если ТипЗнч(Элемент.Значение) = Тип("Строка") Тогда
				Если Элемент.Значение = "1" ИЛИ Нрег(Элемент.Значение) = "истина" ИЛИ Нрег(Элемент.Значение) = "true" Тогда
					КоллекцияОсновная.Вставить(Элемент.Ключ, Истина);
				КонецЕсли;
			ИначеЕсли ТипЗнч(Элемент.Значение) = Тип("Булево") И Элемент.Значение Тогда
				КоллекцияОсновная.Вставить(Элемент.Ключ, Истина);
			КонецЕсли;
		КонецЕсли;
	КонецЦикла;
	
КонецПроцедуры // ДополнитьСоответствиеСУчетомПриоритета

Функция ПрочитатьНастройкиФайлJSON(Знач ТекущийКаталогПроекта, Знач ПутьКФайлу, Знач ПутьФайлаПоУмолчанию) Экспорт
	Лог.Отладка("Передан путь к файлу настроек <%1>", ПутьКФайлу);
	Если ПутьКФайлу = Неопределено ИЛИ НЕ ЗначениеЗаполнено(ПутьКФайлу) Тогда
		ПутьКФайлу = ПутьФайлаПоУмолчанию;
		Лог.Отладка("Не задан путь к файлу настроек, использую путь по умолчанию " + ПутьКФайлу);
	ИначеЕсли Лев(Строка(ПутьКФайлу), 1) = "." Тогда
		ПутьКФайлу = ОбъединитьПути(ТекущийКаталогПроекта, ПутьКФайлу);
	КонецЕсли;
	
	Возврат ПрочитатьФайлJSON(ПутьКФайлу);
КонецФункции

Функция ПрочитатьФайлJSON(Знач ИмяФайла) Экспорт
	Лог.Отладка("Читаю настройки из json-файла %1", ИмяФайла);
	ФайлСуществующий = Новый Файл(ИмяФайла);
	Если НЕ ФайлСуществующий.Существует() Тогда
		Возврат Новый Соответствие;
	КонецЕсли;
	JsonСтрока = ПрочитатьФайл(ИмяФайла);
	
	ПарсерJSON = Новый ПарсерJSON();
	Результат = ПарсерJSON.ПрочитатьJSON(JsonСтрока);
	
	Возврат Результат;
КонецФункции

Функция ПрочитатьФайл(Знач ИмяФайла, Знач Кодировка = Неопределено) Экспорт
	Лог.Отладка("Читаю из файла %1", ИмяФайла);
	Если НЕ ЗначениеЗаполнено(Кодировка) Тогда
		Кодировка = КодировкаТекста.UTF8;
	КонецЕсли;
	
	Чтение = Новый ЧтениеТекста(ИмяФайла, Кодировка, , , Ложь);
	Результат = Чтение.Прочитать();
	Чтение.Закрыть();
	
	Возврат Результат;
КонецФункции

Функция ПолучитьОбязательныйПараметр(Знач Параметры, ИмяПараметра, ТекстСОшибкой = "") Экспорт
	
	Результат = Параметры[ИмяПараметра];
	Если НЕ ЗначениеЗаполнено(Результат) Тогда
		Текст = ТекстСОшибкой;
		Если ПустаяСтрока(Текст) Тогда
			Текст = "Не заполнен обязательный параметр """ + ИмяПараметра + """";
		КонецЕсли;
		КодВозврата = МенеджерКомандПриложения.РезультатыКоманд().НеверныеПараметры;
		СистемноеЗавершениеРаботыОшибка(КодВозврата, Текст);
	КонецЕсли;
	
	Возврат Результат;
	
КонецФункции

Функция ПолучитьПараметр(Знач Параметры, ИмяПараметра, ЗначениеПоУмолчанию = Неопределено) Экспорт
	
	Результат = Параметры[ИмяПараметра];
	Если НЕ ЗначениеЗаполнено(Результат) И ЗначениеПоУмолчанию <> Неопределено Тогда
		Результат = ЗначениеПоУмолчанию;
		Лог = ПараметрыСистемы.ПолучитьЛог();
		Текст = СтрШаблон("Параметр ""%1"" не задан. Используется значение по умолчанию <%2>",
				ИмяПараметра, ЗначениеПоУмолчанию);
		Лог.Информация(Текст);
	КонецЕсли;
	
	Возврат Результат;
	
КонецФункции

Функция ПолучитьПараметрЧисло(Знач Параметры, ИмяПараметра, ЗначениеПоУмолчанию = 0) Экспорт
	
	РезультатСтрокой = ПолучитьПараметр(Параметры, ИмяПараметра);
	Попытка
		Результат = Число(РезультатСтрокой);
	Исключение
		Текст = СтрШаблон("Параметр ""%1"" не является числом", ИмяПараметра);
		КодВозврата = МенеджерКомандПриложения.РезультатыКоманд().НеверныеПараметры;
		СистемноеЗавершениеРаботыОшибка(КодВозврата, Текст);
	КонецПопытки;
	
	Если НЕ ЗначениеЗаполнено(Результат) Тогда
		Результат = ЗначениеПоУмолчанию;
		Лог = ПараметрыСистемы.ПолучитьЛог();
		Текст = СтрШаблон("Параметр ""%1"" не задан. Используется значение по умолчанию <%2>",
				ИмяПараметра, ЗначениеПоУмолчанию);
		Лог.Информация(Текст);
	КонецЕсли;
	
	Возврат Результат;
	
КонецФункции

Функция ПолучитьПараметрБулево(Знач Параметры, ИмяПараметра, ЗначениеПоУмолчанию = Ложь) Экспорт
	
	Результат = Параметры[ИмяПараметра];
	Если НЕ ЗначениеЗаполнено(Результат) Тогда
		Результат = ЗначениеПоУмолчанию;
	КонецЕсли;
	
	Возврат Результат;
	
КонецФункции

Процедура СистемноеЗавершениеРаботы(Знач КодВозврата) Экспорт
	
	ВременныеФайлы.Удалить();
	ЗавершитьРаботу(КодВозврата);
	
КонецПроцедуры

Процедура СистемноеЗавершениеРаботыОшибка(Знач КодВозврата, Знач ТекстОшибки) Экспорт
	
	Если НЕ ПустаяСтрока(ТекстОшибки) Тогда
		Лог = ПараметрыСистемы.ПолучитьЛог();
		Лог.Ошибка(ТекстОшибки);
	КонецЕсли;
	СистемноеЗавершениеРаботы(КодВозврата);
	
КонецПроцедуры

Процедура СистемноеЗавершениеРаботыПредупреждение(Знач КодВозврата, Знач ТекстПредупреждения) Экспорт
	
	Если НЕ ПустаяСтрока(ТекстПредупреждения) Тогда
		Лог = ПараметрыСистемы.ПолучитьЛог();
		Лог.Предупреждение(ТекстПредупреждения);
	КонецЕсли;
	СистемноеЗавершениеРаботы(КодВозврата);
	
КонецПроцедуры

Функция ОбщиеПараметрыV8() Экспорт
	Массив = Новый Массив();
	Массив.Добавить("-ibconnection");
	Массив.Добавить("-ib-user");
	Массив.Добавить("-ib-pwd");
	Массив.Добавить("-v8version");
	Массив.Добавить("-uccode");
	Массив.Добавить("-ordinaryapp");
	Массив.Добавить("-language");
	Массив.Добавить("-locale");
	Возврат Массив;
КонецФункции

Процедура РегистрацияОбщихПараметровV8(ОписаниеКоманды, Парсер, МассивПараметров) Экспорт
	
	ИмяКоманды = "-ibconnection";
	Если МассивПараметров.Найти(ИмяКоманды) <> Неопределено Тогда
		Парсер.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды, ИмяКоманды,
			"Строка подключения к ИБ (/FfilePath или /SserverPath) (обязательно)
			|	Например, для файловых баз -ibconnection /FC:\base1 или -ibconnection /Fbase1
			|	Или для серверных баз -ibconnection /Sservername\basename");
	КонецЕсли;
	
	ИмяКоманды = "-ib-user";
	Если МассивПараметров.Найти(ИмяКоманды) <> Неопределено Тогда
		Парсер.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды, ИмяКоманды,
			"Пользователь ИБ");
	КонецЕсли;
	
	ИмяКоманды = "-ib-pwd";
	Если МассивПараметров.Найти(ИмяКоманды) <> Неопределено Тогда
		Парсер.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды, ИмяКоманды,
			"Пароль пользователя ИБ");
	КонецЕсли;
	
	ИмяКоманды = "-v8version";
	Если МассивПараметров.Найти(ИмяКоманды) <> Неопределено Тогда
		Парсер.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды, ИмяКоманды,
			"Версия платформы 1С (необязательно). Примеры:
			|	8.3
			|	8.3.22
			|	8.3.22.3456");
	КонецЕсли;
	
	ИмяКоманды = "-uccode";
	Если МассивПараметров.Найти(ИмяКоманды) <> Неопределено Тогда
		Парсер.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды, ИмяКоманды,
			"Ключ разрешения запуска (необязательно)");
	КонецЕсли;
	
	ИмяКоманды = "-ordinaryapp";
	Если МассивПараметров.Найти(ИмяКоманды) <> Неопределено Тогда
		Парсер.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды, ИмяКоманды,
			"Запуск толстого клиента (1 = толстый, 0 = тонкий клиент, -1 = без указания клиента). 
			|	По умолчанию используется значение 0 (тонкий клиент). 
			|	Значение -1 может применяться в случаях, когда нужно прочитать лог работы 1С в режиме Предприятие в управляемом интерфейсе.");
	КонецЕсли;
	
	ИмяКоманды = "-nocacheuse";
	Если МассивПараметров.Найти(ИмяКоманды) <> Неопределено Тогда
		Парсер.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды, ИмяКоманды,
			"Признак - не использовать кэш платформы для ускорения операций с базой,
			|а также не надо добавлять базу в список баз 1C пользователя (необязательно)");
	КонецЕсли;
	
	ИмяКоманды = "-language";
	Если МассивПараметров.Найти(ИмяКоманды) <> Неопределено Тогда
		Парсер.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды, ИмяКоманды,
			"Код языка запуска платформы (необязательно)");
	КонецЕсли;
	
	ИмяКоманды = "-locale";
	Если МассивПараметров.Найти(ИмяКоманды) <> Неопределено Тогда
		Парсер.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды, ИмяКоманды,
			"Код локализации сеанса платформы (необязательно)");
	КонецЕсли;
	
	ИмяКоманды = "-cluster-user";
	Если МассивПараметров.Найти(ИмяКоманды) <> Неопределено Тогда
		Парсер.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды, ИмяКоманды,
			"Администратор кластера (необязательно)");
	КонецЕсли;
	
	ИмяКоманды = "-cluster-pwd";
	Если МассивПараметров.Найти(ИмяКоманды) <> Неопределено Тогда
		Парсер.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды, ИмяКоманды,
			"Пароль администратора кластера (необязательно)");
	КонецЕсли;
	
	ИмяКоманды = "-addinlist";
	Если МассивПараметров.Найти(ИмяКоманды) <> Неопределено Тогда
		Парсер.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды, ИмяКоманды,
			"Имя, под которым база добавляется в список.
			|Если этот параметр не указан, база добавлена в список не будет (необязательно)");
	КонецЕсли;
	
	ИмяКоманды = "-template";
	Если МассивПараметров.Найти(ИмяКоманды) <> Неопределено Тогда
		Парсер.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды, ИмяКоманды,
			"Путь к шаблону для создания информационной базы (*.cf; *.dt).
			|Если шаблон не указан, то будет создана пустая ИБ (необязательно)");
	КонецЕсли;
	
	ИмяКоманды = "-db-srvr";
	Если МассивПараметров.Найти(ИмяКоманды) <> Неопределено Тогда
		Парсер.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды, ИмяКоманды,
			"Адрес сервера СУБД");
	КонецЕсли;
	
	ИмяКоманды = "-sql-offs";
	Если МассивПараметров.Найти(ИмяКоманды) <> Неопределено Тогда
		Парсер.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды, ИмяКоманды,
			"Смещение дат на сервере MS SQL (0; 2000 <по умолчанию>)");
	КонецЕсли;
	
	ИмяКоманды = "-createdb";
	Если МассивПараметров.Найти(ИмяКоманды) <> Неопределено Тогда
		Парсер.ДобавитьПараметрФлагКоманды(ОписаниеКоманды, ИмяКоманды,
			"Создавать базу данных в случае отсутствия");
	КонецЕсли;
	
	ИмяКоманды = "-allowschjob";
	Если МассивПараметров.Найти(ИмяКоманды) <> Неопределено Тогда
		Парсер.ДобавитьПараметрФлагКоманды(ОписаниеКоманды, ИмяКоманды,
			"Разрешить регламентные задания");
	КонецЕсли;
	
	ИмяКоманды = "-allowlicdstr";
	Если МассивПараметров.Найти(ИмяКоманды) <> Неопределено Тогда
		Парсер.ДобавитьПараметрФлагКоманды(ОписаниеКоманды, ИмяКоманды,
			"Разрешить выдачу лицензий сервером 1С");
	КонецЕсли;
	
	ИмяКоманды = "-dbms";
	Если МассивПараметров.Найти(ИмяКоманды) <> Неопределено Тогда
		Парсер.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды, ИмяКоманды,
			"Тип сервера СУБД (MSSQLServer <по умолчанию>; PostgreSQL; IBMDB2; OracleDatabase)");
	КонецЕсли;
	
	ИмяКоманды = "-db-user";
	Если МассивПараметров.Найти(ИмяКоманды) <> Неопределено Тогда
		Парсер.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды, ИмяКоманды,
			"Пользователь информационной базы (необязательно)");
	КонецЕсли;
	
	ИмяКоманды = "-db-pwd";
	Если МассивПараметров.Найти(ИмяКоманды) <> Неопределено Тогда
		Парсер.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды, ИмяКоманды,
			"Пароль пользователя информационной базы (необязательно)");
	КонецЕсли;
	
КонецПроцедуры

// Производит замену по регулярному выражению
//	Параметры:
//		ИсходнаяСтрока - Строка - исходная строка
//		РегулярноеВыражение - Строка - регулярное выражение
//		СтрокаЗамены - Строка - строка замены
// Возвращаемой значение:
//		Строка - строка с учетом замены.
// Пример:
//	ЗаменитьПоРегулярномуВыражению("**жирный**", "(\*\*)(.*)(\*\*)", "<b>$2</b>") вернет <b>жирный</b>
// Подробнее о работе в: https://snegopat.ru/scripts/doc/trunk/rex/readme.markdown
//
Функция ЗаменитьПоРегулярномуВыражению(ИсходнаяСтрока, РегулярноеВыражение, СтрокаЗамены) Экспорт
	
	РегВыражение = Новый РегулярноеВыражение(РегулярноеВыражение);
	РегВыражение.ИгнорироватьРегистр = Истина;
	РегВыражение.Многострочный = Истина;
	Возврат РегВыражение.Заменить(ИсходнаяСтрока, СтрокаЗамены);
	
КонецФункции

// Производит поиск регулярного выражения в тексте и возвращает массив строк
//	Параметры:
//		ИсходнаяСтрока - Строка - исходная строка
//		РегулярноеВыражение - Строка - регулярное выражение
// Возвращаемой значение:
//		Массив - массив с учетом реглулярного выражения
// Пример:
//	НайтиПоРегулярномуВыражению("**жирный**", "\*\*(.*)\*\*") вернет массив из 1 элемента жирный
// Подробнее о работе в: https://snegopat.ru/scripts/doc/trunk/rex/readme.markdown
//
Функция НайтиПоРегулярномуВыражению(ИсходнаяСтрока, РегулярноеВыражение) Экспорт
	
	РегВыражение = Новый РегулярноеВыражение(РегулярноеВыражение);
	РегВыражение.ИгнорироватьРегистр = Истина;
	РегВыражение.Многострочный = Истина;
	Возврат РегВыражение.Разделить(ИсходнаяСтрока);
	
КонецФункции

Функция ВесВерсии(Знач Версия) Экспорт
	
	ПриведеннаяВерсия = ПривестиКВерсии(Версия);
	Если ПриведеннаяВерсия = "" Тогда
		Возврат 0;
	КонецЕсли;
	Результат = ВесВерсииИзМассиваСтрок(СтрРазделить(ПриведеннаяВерсия, "."));
	
	// "1.0.0.0" больше, чем "1.0.0.0 aplha"
	Если СтрДлина(ПриведеннаяВерсия) < СтрДлина(Версия) Тогда
		Результат = Результат - 0.5;
	КонецЕсли;
	
	Возврат Результат;
	
КонецФункции

Функция ВесВерсииИзМассиваСтрок(РазрядыВерсииСтроками)
	
	Результат = 0;
	
	// Проверека, что массив пуст
	Если РазрядыВерсииСтроками.Количество() = 0 Тогда
		Возврат Результат;
	КонецЕсли;
	
	// Проверка, что версия не число
	Для Каждого Элемент Из РазрядыВерсииСтроками Цикл
		Если НЕ СтроковыеФункции.ТолькоЦифрыВСтроке(Элемент) Тогда
			Возврат Результат;
		КонецЕсли;
	КонецЦикла;
	
	КоэффициентИндекс = 1;
	КоэффициентВерсии = 1000;
	Индекс = РазрядыВерсииСтроками.Количество() - 1;
	Пока Индекс >= 0 Цикл
		Результат = Результат + РазрядыВерсииСтроками[Индекс] * КоэффициентИндекс;
		Индекс = Индекс - 1;
		КоэффициентИндекс = КоэффициентИндекс * КоэффициентВерсии;
	КонецЦикла;
	
	Возврат Результат;
	
КонецФункции

// Приводит строку с версией и другими символами к строке, где есть только версия
//
// Параметры:
//	ВерсияСтрокой - Строка - исходная строка
//
// Возвращаемой значение:
//	Строка - строка только с символами 0123456789 и точкой. Пример: "1.0.0.5 alpha" => "1.0.0.5"
//
Функция ПривестиКВерсии(Знач ВерсияСтрокой) Экспорт
	
	Результат = "";
	Для Индекс = 1 По СтрДлина(ВерсияСтрокой) Цикл
		СимволСтроки = Сред(ВерсияСтрокой, Индекс, 1);
		Если СтрНайти("0123456789.", СимволСтроки) > 0 Тогда
			Результат = Результат + СимволСтроки;
		КонецЕсли;
	КонецЦикла;
	
	Возврат Результат;
	
КонецФункции

Функция ЭтоWindows() Экспорт

	СистемнаяИнформация = Новый СистемнаяИнформация;
	ЭтоWindows = Найти(НРег(СистемнаяИнформация.ВерсияОС), "windows") > 0;
	Возврат ЭтоWindows;

КонецФункции

Лог = ПараметрыСистемы.ПолучитьЛог();