﻿// Процедура - устанавливает описание команды
//
// Параметры:
//  Команда    - КомандаПриложения     - объект описание команды
//
Процедура ОписаниеКоманды(Команда) Экспорт

	Команда.ДобавитьКоманду("clearcache",
		"Очистить локальный кэш базы 1С",
		Новый InfoBaseClearCache());

	Команда.ДобавитьКоманду("close-all-clients",
		"Завершить все клиентские приложения 1С текущего пользователя",
		Новый InfoBaseCloseAllClients());
		
	Команда.ДобавитьКоманду("configcheck",
		"Синтаксический контроль конфигурации 1С",
		Новый InfoBaseConfigCheck());

	Команда.ДобавитьКоманду("configload",
		"Загрузить конфигурацию из cf-файла",
		Новый InfoBaseConfigLoad());

	Команда.ДобавитьКоманду("configloadfromxml",
		"Загрузить конфигурацию из исходников XML (формат 1C)",
		Новый InfoBaseConfigLoadFromXML());

	Команда.ДобавитьКоманду("configsave",
		"Сохранить конфигурацию в cf-файл",
		Новый InfoBaseConfigSave());

	Команда.ДобавитьКоманду("configsavetoxml",
		"Сохранить конфигурацию в исходники XML (формат 1C)",
		Новый InfoBaseConfigSaveToXML());

	Команда.ДобавитьКоманду("create",
		"Создание информационной базы 1С",
		Новый InfoBaseCreate());

	Команда.ДобавитьКоманду("distrib",
		"Создание из информационной базы 1С дистрибутива",
		Новый InfoBaseDistrib());

	Команда.ДобавитьКоманду("dump",
		"Выгрузка информационной базы 1С в dt-файл",
		Новый InfoBaseDump());

	Команда.ДобавитьКоманду("dumpformat",
		"Выгрузка информационной базы 1С в dt-файл в файл, с форматом имени, которое можно задать",
		Новый InfoBaseDumpFormat());

	Команда.ДобавитьКоманду("extension",
		"Работа с расширениями 1С",
		Новый InfoBaseExtension());

	Команда.ДобавитьКоманду("news",
		"Получение информации из макетов с описанием изменений (новостей) по версии",
		Новый InfoBaseNews());

	Команда.ДобавитьКоманду("restore",
		"Загрузка информационной базы 1С из dt-файла",
		Новый InfoBaseRestore());

	Команда.ДобавитьКоманду("runcode",
		"Выполнить произвольный код в режиме 1С:Предприятие",
		Новый InfoBaseRunCode());

	Команда.ДобавитьКоманду("setlegal",
		"Подтверждение легальности получения обновлений (для конфигураций на базе БСП)",
		Новый InfoBaseSetLegal());

	Команда.ДобавитьКоманду("updatecfg",
		"Обновление конфигурации, находящейся на поддержке",
		Новый InfoBaseUpdateCfg());

КонецПроцедуры // ОписаниеКоманды()

// Обработчик выполнения команды
//
// Параметры:
//   КомандаПриложения - КомандаПриложения - Выполняемая команда
//
Процедура ВыполнитьКоманду(Знач КомандаПриложения) Экспорт
    
    КомандаПриложения.ВывестиСправку();
    
КонецПроцедуры