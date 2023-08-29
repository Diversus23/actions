#Область ПрограммныйИнтерфейс

// Процедура - устанавливает описание команды
//
// Параметры:
//  Команда    - КомандаПриложения     - объект описание команды
//
Процедура ОписаниеКоманды(Команда) Экспорт
		
	Команда.Опция("in i", "",
		"Исходный файл ChangeLog.md в формате MarkDown из которого необходимо получить описание")
		.ТСтрока();

	Команда.Опция("out o", "",
		"Файл с новостью по обновлению из исходного файла в формате HTML или TXT в зависимости от расширения файла")
		.ТСтрока();
	
	Текст = "";
	Для Каждого Шаблон Из МассивШаблонов() Цикл
		Если НЕ ПустаяСтрока(Текст) Тогда
			Текст = Текст + ", ";
		КонецЕсли;
		Текст = Текст + Шаблон;
	КонецЦикла;
	Команда.Опция("template", "",
		"Шаблон для создания файла с новостью. По умолчанию ""Simple.html"". Доступные шаблоны: " 
			+ Текст + " (не обязательный)")
		.ТСтрока();
	
	Команда.Опция("version", "",
		"Из какой версии будет получено описание. Если не задано, то создастся для всего файла --in (необязательный)")
		.ТСтрока();
		
	Команда.Опция("maxversion max", "",
		"Из файла --in будет получена максимальная версия и для нее построен файл --out (необязательный)")
		.ТБулево();

	Команда.Опция("all", "",
		"Выполняется формирование по всем версиям (необязательный)")
		.ТБулево();		

	Команда.Опция("productname", "",
		"Имя продукта (необязательный)")
		.ТСтрока();

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
		
КонецПроцедуры // ОписаниеКоманды()

// Процедура - запускает выполнение команды устанавливает описание команды
//
// Параметры:
//  Команда    - КомандаПриложения     - объект  описание команды
//
Процедура ВыполнитьКоманду(Знач Команда) Экспорт
		
	Параметры = ПолучитьСтруктуруПараметров(Команда);
	РаботаСChangeLog.Конвертировать(Параметры);
	
КонецПроцедуры // ВыполнитьКоманду()

#КонецОбласти // ПрограммныйИнтерфейс

#Область СлужебныеПроцедурыИФункции

Функция ПолучитьСтруктуруПараметров(Знач Команда)

	ЧтениеОпций = Новый ЧтениеОпцийКоманды(Команда);	
	ВыводОтладочнойИнформации = ЧтениеОпций.ЗначениеОпции("verbose");	
	ПараметрыСистемы.УстановитьРежимОтладки(ВыводОтладочнойИнформации);

	ПараметрыКоманды = Новый Структура;
	ПараметрыКоманды.Вставить("ИсходныйФайл", ЧтениеОпций.ЗначениеОпции("in", Истина));
	ПараметрыКоманды.Вставить("ФайлРезультат", ЧтениеОпций.ЗначениеОпции("out", Истина));
	ПараметрыКоманды.Вставить("Шаблон", ЧтениеОпций.ЗначениеОпции("template"));
	ПараметрыКоманды.Вставить("Версия", ЧтениеОпций.ЗначениеОпции("version"));
	ПараметрыКоманды.Вставить("ПоВсемВерсиям", ЧтениеОпций.ЗначениеОпции("all"));
	ПараметрыКоманды.ПоВсемВерсиям = ЗначениеЗаполнено(ПараметрыКоманды.ПоВсемВерсиям);
	ПараметрыКоманды.Вставить("ИмяПродукта", ЧтениеОпций.ЗначениеОпции("productname"));
	ПараметрыКоманды.Вставить("КраткоеОписание", ЧтениеОпций.ЗначениеОпции("news_short_description"));
	ПараметрыКоманды.Вставить("Изображение", ЧтениеОпций.ЗначениеОпции("news_picture"));
	ПараметрыКоманды.Вставить("Гиперссылка", ЧтениеОпций.ЗначениеОпции("news_url"));
	ПараметрыКоманды.Вставить("МаксимальнаяШиринаИзображения", ЧтениеОпций.ЗначениеОпции("maximgwidth"));
	Если НЕ ЗначениеЗаполнено(ПараметрыКоманды.МаксимальнаяШиринаИзображения) Тогда
		ПараметрыКоманды.МаксимальнаяШиринаИзображения = 0;
	КонецЕсли;
	ПараметрыКоманды.Вставить("ИспользоватьМаксимальнуюВерсию", ЧтениеОпций.ЗначениеОпции("maxversion"));
	ПараметрыКоманды.ИспользоватьМаксимальнуюВерсию = 
		ЗначениеЗаполнено(ПараметрыКоманды.ИспользоватьМаксимальнуюВерсию);
		
	Если ПараметрыКоманды.ИспользоватьМаксимальнуюВерсию = Истина 
		И НЕ ПустаяСтрока(ПараметрыКоманды.Версия) Тогда

		ТекстОшибки = "Нельзя одновременно использовать опции ""--version"" и ""--maxversion""";
		ОбщегоНазначения.ЗавершениеРаботыОшибка(ТекстОшибки);

	КонецЕсли;

	Если Не ЗначениеЗаполнено(ПараметрыКоманды.Шаблон) Тогда
		ПараметрыКоманды.Шаблон = "Simple.html";
	КонецЕсли;

	Если Не ЗначениеЗаполнено(ПараметрыКоманды.ИмяПродукта) Тогда
		ПараметрыКоманды.ИмяПродукта = "";
	КонецЕсли;
	
	Возврат ПараметрыКоманды;
	
КонецФункции

Функция МассивШаблонов()

	Результат = Новый Массив();
	Файлы = НайтиФайлы(ОбщегоНазначения.КаталогМакетов(), "ChangeLog*.*", Ложь);
	Для Каждого Элемент Из Файлы Цикл
		ИмяШаблона = Элемент.Имя;
		Если СтрНайти(ИмяШаблона, "Item.") ИЛИ СтрНайти(ИмяШаблона, ".md") Тогда
			Продолжить;
		КонецЕсли;
		ИмяШаблона = Сред(ИмяШаблона, СтрДлина("ChangeLog") + 1);
		Результат.Добавить(ИмяШаблона);
	КонецЦикла;

	Возврат Результат; 

КонецФункции

#КонецОбласти // СлужебныеПроцедурыИФункции