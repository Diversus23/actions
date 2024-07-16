﻿#Область ПрограммныйИнтерфейс

// Процедура - устанавливает описание команды
//
// Параметры:
//  Команда    - КомандаПриложения     - объект описание команды
//
Процедура ОписаниеКоманды(Команда) Экспорт
			
	// Добавление дополнительных опций
	ПараметрыОпций = Работа1С.КонструкторСозданияДистрибутива();
	Работа1С.ОписаниеКоманды(Команда, ПараметрыОпций);
	
	Шаблон2 = "%1 %2";
	Шаблон3 = Шаблон2 + " %3";
	Команда.Опция("prefix", "",
		"Префикс продукта для дистрибутива (краткое имя продукта на английском). Пример: ""it"" (обязательный)")
		.ТСтрока();

	Команда.Опция("path", "",
		"Каталог сборки дистрибутива (где будет создан дистрибутив) (обязательный)")
		.ТСтрока();

	Команда.Опция("versions_path vp", "",
		"Каталог версий где будут браться версии конфигураций для создания обновлений (обязательный)")
		.ТСтрока();

	Команда.Опция("versions_update vu", "",
		"На какие версии будет устанавливаться текущая версия. Пример: ""1.0.0.12, 1.0.0.13"" (обязательный)")
		.ТСтрока();

	Команда.Опция("minimal_platform_version mpv", "",
		"Минимальная версия платформы 1С для работы. Например, ""8.3.21.1644"" (обязательный)")
		.ТСтрока();

	Команда.Опция("revoked_versions rv", "",
		"Какие версии были с отозваны. Версии перечисляются через запятую (не обязательный)")
		.ТСтрока();

	Команда.Опция("shared_path sp", "",
		"Каталог общих файлов, которые будут включены в дистрибутив (не обязательный)")
		.ТСтрока();

	Текст = СтрШаблон(Шаблон2,
		"Поставщик дистрибутива.",
		"Если не будет задан, информация о поставщике будет получена из информационной базы 1С (не обязательный)");
	Команда.Опция("vendor", "", Текст)
		.ТСтрока();

	Текст = СтрШаблон(Шаблон3,
		"Корневой каталог поставщика куда будет установлен дистрибутив или демо при установке.",
		"Пример: ""SoftOnIT"". Новая база будет по умолчанию создаваться в ""C:\Users\admin\Documents\SoftOnIT\IT"".",
		"Где SoftOnIT=""--path_to_install"", а IT=""--destination"". По умолчанию ""Vendor"" (не обязательный)");
	Команда.Опция("path_to_install", "", Текст)
		.ТСтрока();

	Текст = СтрШаблон(Шаблон2,
		"Каталог установки чистой базы 1С в каталоге поставщика.",
		"Дочерний каталог в ""--path_to_install"". По умолчанию ""Base"" (не обязательный)");
	Команда.Опция("destination", "", Текст)
		.ТСтрока();
		
	Текст = СтрШаблон(Шаблон2,
		"Каталог установки демо базы 1С в каталоге поставщика.",
		"Дочерний каталог в ""--path_to_install"". По умолчанию: ""BaseDemo"" (не обязательный)");
	Команда.Опция("destination_demo", "", Текст)
		.ТСтрока();

	Текст = СтрШаблон(Шаблон2,
		"Changelog изменений конфигурации.",
		"Необходим для создания новостей (обязательный)");
	Команда.Опция("changelog", "", Текст)
		.ТСтрока();

	Текст = СтрШаблон(Шаблон2,
		"Версия для создания обновления.",
		"Если не задана, то будет определена последняя версия из конфигурации (не обязательный)");
	Команда.Опция("version v", "", Текст)
		.ТСтрока();

	Текст = СтрШаблон(Шаблон2,
		"Дата выхода обновления в формате ""dd.MM.yyyy"". Может быть датой в будущем (когда планируется релиз).",
		"Если не задана, то будет использована текущая дата (не обязательный)");
	Команда.Опция("date_update du", "", Текст)
		.ТДата("dd.MM.yyyy");

	Команда.Опция("news_short_description", "",
		"Краткое описание для новости (необязательный)")
		.ТСтрока();

	Команда.Опция("news_picture", "",
		"Изображение для новости (необязательный)")
		.ТСтрока();
		
	Команда.Опция("news_url", "",
		"Гиперссылка для новости (необязательный)")
		.ТСтрока();

	Команда.Опция("maximgwidth", "",
		"Максимальная ширина изображения. " 
		+ "Полезна для новостей, которые будут отправлены по почте. "
		+ "Всем тегам img будет насильно задана указанная ширина (необязательный)")
		.ТЧисло();

	Команда.Опция("parser_configuration_src", "",
		"Содержит путь к каталогу с конфигурацией парсера (Управление IT-отделом 8). "
		+ "Позволяет более точно обрабатывать markdown-файлы (необязательный)")
		.ТСтрока();			

КонецПроцедуры // ОписаниеКоманды()

// Процедура - запускает выполнение команды устанавливает описание команды
//
// Параметры:
//  Команда    - КомандаПриложения     - объект  описание команды
//
Процедура ВыполнитьКоманду(Знач Команда) Экспорт
	
	Параметры = ПолучитьСтруктуруПараметров(Команда);
	МенеджерКонфигуратора = Новый МенеджерКонфигуратора();
	МенеджерКонфигуратора.Инициализация(Параметры);	
	МенеджерКонфигуратора.СоздатьДистрибутив(Параметры);
	МенеджерКонфигуратора.Деструктор();
	
КонецПроцедуры // ВыполнитьКоманду()

#КонецОбласти // ПрограммныйИнтерфейс

#Область СлужебныеПроцедурыИФункции

Функция ПолучитьСтруктуруПараметров(Знач Команда)
	
	ЧтениеОпций = Новый ЧтениеОпцийКоманды(Команда);
	ВыводОтладочнойИнформации = ЧтениеОпций.ЗначениеОпции("verbose");
	ПараметрыСистемы.УстановитьРежимОтладки(ВыводОтладочнойИнформации);
	
	ПараметрыОпций = Работа1С.КонструкторСозданияДистрибутива();
	ПараметрыКоманды = Работа1С.ПрочитатьПараметры(Команда, ПараметрыОпций);
	
	ПараметрыКоманды.Вставить("КаталогСборки", ЧтениеОпций.ЗначениеОпции("path", Истина));
	ПараметрыКоманды.Вставить("Префикс", ЧтениеОпций.ЗначениеОпции("prefix", Истина));
	ПараметрыКоманды.Вставить("КаталогВерсий", ЧтениеОпций.ЗначениеОпции("versions_path", Истина));
	ПараметрыКоманды.Вставить("ВерсииОбновления", ЧтениеОпций.ЗначениеОпции("versions_update", Истина));
	МинимальнаяВерсияПлатформы = ЧтениеОпций.ЗначениеОпции("minimal_platform_version", Истина);
	ПараметрыКоманды.Вставить("МинимальнаяВерсияПлатформы", МинимальнаяВерсияПлатформы);	
	ПараметрыКоманды.Вставить("ОтозванныеВерсии", ЧтениеОпций.ЗначениеОпции("revoked_versions"));
	ПараметрыКоманды.Вставить("КаталогОбщихФайлов", ЧтениеОпций.ЗначениеОпции("shared_path"));
	КаталогШаблоновПоставщика = ЧтениеОпций.ЗначениеОпции("path_to_install", Ложь, "Vendor");
	ПараметрыКоманды.Вставить("КаталогШаблоновПоставщика", КаталогШаблоновПоставщика);
	ПараметрыКоманды.Вставить("Назначение", ЧтениеОпций.ЗначениеОпции("destination", Ложь, "Base"));
	ПараметрыКоманды.Вставить("НазначениеДемо", ЧтениеОпций.ЗначениеОпции("destination_demo", Ложь, "BaseDemo"));
	ПараметрыКоманды.Вставить("Поставщик", ЧтениеОпций.ЗначениеОпции("vendor"));
	ПараметрыКоманды.Вставить("ИмяФайлаИзменений", ЧтениеОпций.ЗначениеОпции("changelog", Истина));
	ПараметрыКоманды.Вставить("Версия", ЧтениеОпций.ЗначениеОпции("version"));	
	ПараметрыКоманды.Вставить("Дата", ЧтениеОпций.ЗначениеОпции("date_update", Ложь, ТекущаяДата()));
	ПараметрыКоманды.Вставить("КраткоеОписание", ЧтениеОпций.ЗначениеОпции("news_short_description"));
	ПараметрыКоманды.Вставить("Изображение", ЧтениеОпций.ЗначениеОпции("news_picture"));
	ПараметрыКоманды.Вставить("Гиперссылка", ЧтениеОпций.ЗначениеОпции("news_url"));
	ПараметрыКоманды.Вставить("МаксимальнаяШиринаИзображения", ЧтениеОпций.ЗначениеОпции("maximgwidth"));
	ПараметрыКоманды.Вставить("ПутьККонфигурацииПарсера", ЧтениеОпций.ЗначениеОпции("parser_configuration_src"));
	Если НЕ ЗначениеЗаполнено(ПараметрыКоманды.МаксимальнаяШиринаИзображения) Тогда
		ПараметрыКоманды.МаксимальнаяШиринаИзображения = 0;
	КонецЕсли;
	
	Если НЕ ФайловыеОперации.ФайлСуществует(ПараметрыКоманды.ИмяФайлаИзменений) Тогда
		ОбщегоНазначения.ЗавершениеРаботыОшибка("Changelog %1 не существует", ПараметрыКоманды.ИмяФайлаИзменений);
	КонецЕсли;

	Если ЗначениеЗаполнено(ПараметрыКоманды.ПутьККонфигурацииПарсера)
		И НЕ ФайловыеОперации.КаталогСуществует(ПараметрыКоманды.ПутьККонфигурацииПарсера) Тогда
		ПараметрыКоманды.ПутьККонфигурацииПарсера = Неопределено;
	КонецЕсли;

	Если ЗначениеЗаполнено(ПараметрыКоманды.ПутьККонфигурацииПарсера) Тогда
		ПараметрыКоманды.ПутьККонфигурацииПарсера =
			ФайловыеОперации.АбсолютныйПуть(ПараметрыКоманды.ПутьККонфигурацииПарсера);		
	КонецЕсли;

	Возврат ПараметрыКоманды;
	
КонецФункции // ПолучитьСтруктуруПараметров()

#КонецОбласти // СлужебныеПроцедурыИФункции