#Использовать logos

// Лог модуля
Перем Лог;

#Область ПрограммныйИнтерфейс

// Инициализирует файл Changelog.md
//
// Параметры:
//  ИмяФайла    - Строка     - имя создаваемого файла
//
Процедура ИнициализироватьChangeLog(Знач ИмяФайла) Экспорт
	
	Лог.Информация("Начало инициализации %1", ИмяФайла);
	
	Версия = "1.0.0.0";
	ДатаВФормате = Формат(ТекущаяДата(), "ДФ=yyyy-MM-dd");
	Результат = СтрШаблон(
			"# Changelog
			|
			|Все изменения по проекту.
			|
			|## [%1] - %2
			|
			|### Внимание!
			|
			|* Важная заметка 1 **жирный** *курсив*
			|* Важная заметка 2 ~~Зачеркнутый~~
			|
			|### Добавлено
			|
			|* Добавлено дело 1 ***жирный курсив***
			|* Добавлено дело 2 `выделенный`
			|* Картинка ![Описание](https://camo.githubusercontent.com/b0ae38dceb7087a93c566bcf5fd05b0e511edd3d523a290e0a9fe465b4c97df0/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6c6963656e73652d4d49542d696e666f726d6174696f6e616c)
			|		
			|### Изменено
			|
			|* Изменение 1 __снова жиный__ _снова курсив_
			|* Изменение 2
			|
			|### Исправлено
			|
			|* Исправление ошибки", Версия, ДатаВФормате);
	
	ТД = Новый ТекстовыйДокумент;
	ТД.УстановитьТекст(Результат);
	ТД.Записать(ИмяФайла);
	
	Лог.Информация("Окончание инициализации %1", ИмяФайла);
	
КонецПроцедуры

// Структура для преобразования файла Changelog.md
//
// Возвращаемое значение:
//	Структрура - конвертация
Функция КонструкторКонвертирования() Экспорт

	ПараметрыКоманды = Новый Структура;
	ПараметрыКоманды.Вставить("ИсходныйФайл", "");
	ПараметрыКоманды.Вставить("ФайлРезультат", "");
	ПараметрыКоманды.Вставить("Шаблон", "Simple.html");
	ПараметрыКоманды.Вставить("Версия", "");
	ПараметрыКоманды.Вставить("ПоВсемВерсиям", Ложь);
	ПараметрыКоманды.Вставить("ИмяПродукта", "");
	ПараметрыКоманды.Вставить("ИспользоватьМаксимальнуюВерсию", "Ложь");	
	Возврат ПараметрыКоманды;

КонецФункции

// Конвертирует файл Changelog.md в один из форматов
//
// Параметры:
//  Параметры    - Структура     - структура конвертации
//
Процедура Конвертировать(Знач Параметры) Экспорт
	
	Лог.Информация("Начало получения новости ChangeLog");
	
	// Шаг 0. Проверка заполненных параметров
	ФайлОсновной = Параметры.ИсходныйФайл;
	Если НЕ ФайловыеОперации.ФайлСуществует(ФайлОсновной) Тогда
		ТекстОшибки = "Опция ""--in"" - содержит полный путь к не существующему файлу ChangeLog.md";
		ОбщегоНазначения.ЗавершениеРаботыОшибка(ТекстОшибки);
	КонецЕсли;
	
	ФайлРезультат = Параметры.ФайлРезультат;
	
	Лог.Информация("Шаблон: ""%1""", Параметры.Шаблон);

	ТекстОсновногоФайла = ФайловыеОперации.ПрочитатьТекстФайла(ФайлОсновной);
	Версии = ТаблицаВерсий(ТекстОсновногоФайла);

	Версия = "";
	НужнаВерсия = (Параметры.ИспользоватьМаксимальнуюВерсию = Истина
		ИЛИ ЗначениеЗаполнено(Параметры.Версия))
		И Параметры.ПоВсемВерсиям = Ложь;

	Если НужнаВерсия Тогда

		Если Параметры.ИспользоватьМаксимальнуюВерсию = Истина Тогда
			Версия = МаксимальнаяВерсияИзФайлаChangeLog(Версии);
			Если НЕ ПустаяСтрока(Версия) Тогда
				Лог.Информация("Определена максимальная версия ""%1"" в файле ChangeLog", Версия);
			КонецЕсли;
		Иначе
			Версия = Параметры.Версия;
			Лог.Информация("Получение информации по версия ""%1"" из файла ChangeLog", Версия);
		КонецЕсли;
		
		Если НЕ ЗначениеЗаполнено(Версия) Тогда
			ТекстОшибки = "В файле ChangeLog не найдена область с версией. В виде ""## [1.0.0.0] - 2023-01-01"""
				+ " или ""## [1.0.0.0]""" ;
			ОбщегоНазначения.ЗавершениеРаботыОшибка(ТекстОшибки);
		КонецЕсли;

		Заголовок = СокрЛП(Параметры.ИмяПродукта + " " + Версия);

	Иначе

		Лог.Информация("Используем файл ChangeLog полностью для всех версий");
		Заголовок = СокрЛП("Changelog " + Параметры.ИмяПродукта);

	КонецЕсли;

	ТекстШаблона = ПолучитьТекстШаблона(Параметры.Шаблон);
	ТекстВерсииШаблона = ПолучитьТекстВерсииШаблона(Параметры.Шаблон);
	ПараметрыMD = ДоксинумКлиентСерверСлужебный.ПараметрыMD();
	ПараметрыMD.Вставить("ЭтоOneScript", Истина);
	ПараметрыMD.Вставить("ТолькоТекстMD", Истина);
	Если ПараметрыMD.ЭтоOneScript Тогда
		ПараметрыMD.Вставить("МетодыOneScript", Вычислить("Новый ОбработчикOneScript()"));
	КонецЕсли;
	ПараметрыMD.Вставить("Шаблоны", ДоксинумШаблоныКлиентСервер.Шаблон_gfm());
	
	Массив = Новый Массив;
	Для Каждого СтрокаВерсия Из Версии Цикл		
		
		Если НЕ ПустаяСтрока(Версия) И СтрокаВерсия.Версия <> Версия Тогда
			Продолжить;
		КонецЕсли;

		Если СтрЗаканчиваетсяНа(Параметры.Шаблон, ".html") Тогда
			ТекстВерсии = ДоксинумКлиентСерверСлужебный.СформироватьHTML(ПараметрыMD, СтрокаВерсия.Текст);
			Если Параметры.Свойство("МаксимальнаяШиринаИзображения")
				И Параметры.МаксимальнаяШиринаИзображения <> 0 Тогда
				СтрЗамены = "<img width='" + Формат(Параметры.МаксимальнаяШиринаИзображения, "ЧРГ=") + "' $1 src=";
				ТекстВерсии = ОбщегоНазначения.ЗаменитьПоРегулярномуВыражению(ТекстВерсии, "<img(.*)src=", СтрЗамены);
			КонецЕсли;
		Иначе
			ТекстВерсии = MarkdownВТекст(СтрокаВерсия.Текст);
		КонецЕсли;

		Структура = Новый Структура();
		Структура.Вставить("Version", СтрокаВерсия.Версия);
		Структура.Вставить("Date", Формат(СтрокаВерсия.Дата, "ДЛФ=Д"));
		Структура.Вставить("Text", ТекстВерсии);
		ДополнитьСтруктуруПараметров(Структура, Параметры);

		Текст = СтроковыеОперации.ЗаменитьПараметры(ТекстВерсииШаблона, Структура);
		Текст = УдалитьПустыеСтроки(Текст);
		Массив.Добавить(Текст);

	КонецЦикла;

	Текст = СтрСоединить(Массив, Символы.ПС);
	Структура = Новый Структура();
	Структура.Вставить("Title", Заголовок);
	Структура.Вставить("Version", Версия);
	Структура.Вставить("Text", Текст);
	ДополнитьСтруктуруПараметров(Структура, Параметры);
	Текст = СтроковыеОперации.ЗаменитьПараметры(ТекстШаблона, Структура);

	ТД = Новый ТекстовыйДокумент;
	ТД.УстановитьТекст(Текст);
	ТД.Записать(ФайлРезультат);
	
	Лог.Информация("Окончание получения новости ChangeLog");
	
КонецПроцедуры

// BSLLS:LatinAndCyrillicSymbolInWord-off

// Преобразует строку в формате Markdown в строку с BB-кодами.
//
// Параметры:
//  ИсходнаяСтрока - Строка - Строка c MarkDown.
//	ПараметрыПреобразования - Структура - параметры преобразования MarkDown
//		* ИспользоватьДаты - Булево - добавлять в итоговый файл даты.
//		* Формат - Строка - формат вывода.

// Возвращаемое значение:
//   Строка - Строка с BB-кодами.
//
// Примеры:
//  MarkdownВТекст("Привет **это** _я_") = "Привет [b]это[/b] [i]я[/i]";
//
Функция MarkdownВТекст(Знач ИсходнаяСтрока) Экспорт

	Заголовки = Новый Структура();
	Заголовки.Вставить("Added", МассивЗаголовков(СинонимыAdded()));
	Заголовки.Вставить("Changed", МассивЗаголовков(СинонимыChanged()));
	Заголовки.Вставить("Deprecated", МассивЗаголовков(СинонимыDeprecated()));
	Заголовки.Вставить("Removed", МассивЗаголовков(СинонимыRemoved()));
	Заголовки.Вставить("Fixed", МассивЗаголовков(СинонимыFixed()));
	Заголовки.Вставить("Security", МассивЗаголовков(СинонимыSecurity()));
	Заголовки.Вставить("Attention", МассивЗаголовков(СинонимыAttention()));
	
	Текст = "";
	КлассCSS = "";
	Для Индекс = 1 По СтрЧислоСтрок(ИсходнаяСтрока) Цикл

		Стр = СокрЛП(СтрПолучитьСтроку(ИсходнаяСтрока, Индекс));
		Если ПустаяСтрока(Стр) Тогда
			Продолжить;
		КонецЕсли;
		
		Если СтрНачинаетсяС(Стр, "#") Тогда

			// Для заголовка определяем класс префикса
			мСтр = Стр;
			Пока СтрНачинаетсяС(мСтр, "#") Цикл
				мСтр = Сред(мСтр, 2);
			КонецЦикла;
			мСтр = СокрЛП(мСтр);
			Префикс = ПрефиксСтроки(Заголовки, мСтр);
			Если НЕ ПустаяСтрока(Префикс) Тогда
				КлассCSS = Префикс;								
			КонецЕсли;			

		Иначе

			// Класс не задан, игнорируем строки
			Если ПустаяСтрока(КлассCSS) Тогда
				Продолжить;
			КонецЕсли;
			
			// Класс задан, накапливаем
			Если СтрНачинаетсяС(Стр, "* ") ИЛИ СтрНачинаетсяС(Стр, "- ") Тогда
				Стр = Сред(Стр, 3);
			КонецЕсли;
			
			Стр = ЗаменитьBBCode(Стр);
			
			Текст = Текст + КлассCSS + Стр + Символы.ПС;
	
		КонецЕсли;
				
	КонецЦикла;

	Если ПустаяСтрока(Текст) Тогда
		Текст = ЗаменитьBBCode(ИсходнаяСтрока);
	КонецЕсли;
	
	Возврат Текст;
	
КонецФункции

// BSLLS:LatinAndCyrillicSymbolInWord-on

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция СинонимыAdded()
	Возврат "Добавлено|Новый функционал|FEATURES|Added";
КонецФункции

Функция СинонимыChanged()
	Возврат "Изменения|Изменено|IMPROVEMENTS|Changed";
КонецФункции

Функция СинонимыDeprecated()
	Возврат "Устарело|Deprecated";
КонецФункции

Функция СинонимыRemoved()
	Возврат "Удалено|Removed";
КонецФункции

Функция СинонимыFixed()
	Возврат "Исправление ошибок|Замечания к обновлению|Исправлено|BUG FIXES|Fixed";
КонецФункции

Функция СинонимыSecurity()
	Возврат "Безопасность|Security";
КонецФункции

Функция СинонимыAttention()
	Возврат "Внимание!|Новости|News|BREAKING CHANGES|Attention!";
КонецФункции

Функция МассивЗаголовков(Знач Заголовки)
	Возврат СтроковыеОперации.РазложитьСтрокуВМассивПодстрок(НРег(Заголовки), "|", Ложь);
КонецФункции

Функция ПодстрокаВМассиве(Знач Массив, Знач Подстрока)
	
	Для Каждого Элемент Из Массив Цикл
		Если СтрНайти(НРег(Подстрока), НРег(Элемент)) > 0 Тогда
			Возврат Истина;
		КонецЕсли;
	КонецЦикла;
	
	Возврат Ложь;
КонецФункции

Функция ЗаменитьЗаголовкиHTML(ТекстHTML, Заголовки, КлассCSS)

	ИсходныйШаблон = СтрШаблон("\<h3\>(%1)\<\/h3\>\n<p><\/p>\n<ul>", Заголовки);
	ЗаменаШаблон = СтрШаблон("<h3>$1</h3>%1<p></p>%1<ul class=""%2"">", Символы.ПС, КлассCSS);
	ТекстHTML = ЗаменитьПоРегулярномуВыражению(ТекстHTML, ИсходныйШаблон, ЗаменаШаблон);

	ИсходныйШаблон = СтрШаблон("\<h3\>(%1)\<\/h3\>\n<ul>", Заголовки);
	ЗаменаШаблон = СтрШаблон("<h3>$1</h3>%1<ul class=""%2"">", Символы.ПС, КлассCSS);
	ТекстHTML = ЗаменитьПоРегулярномуВыражению(ТекстHTML, ИсходныйШаблон, ЗаменаШаблон);

	ИсходныйШаблон = СтрШаблон("\<h2\>(%1)\<\/h2\>\n<p><\/p>\n<ul>", Заголовки);
	ЗаменаШаблон = СтрШаблон("<h2>$1</h2>%1<p></p>%1<ul class=""%2"">", Символы.ПС, КлассCSS);
	ТекстHTML = ЗаменитьПоРегулярномуВыражению(ТекстHTML, ИсходныйШаблон, ЗаменаШаблон);
	
	ИсходныйШаблон = СтрШаблон("\<h2\>(%1)\<\/h2\>\n<ul>", Заголовки);
	ЗаменаШаблон = СтрШаблон("<h2>$1</h2>%1<ul class=""%2"">", Символы.ПС, КлассCSS);
	ТекстHTML = ЗаменитьПоРегулярномуВыражению(ТекстHTML,	ИсходныйШаблон, ЗаменаШаблон);
	
	Возврат ТекстHTML;
	
КонецФункции

Функция ЗаменитьПоРегулярномуВыражению(ИсходнаяСтрока, РегулярноеВыражение, СтрокаЗамены)
	
	РегВыражение = Новый РегулярноеВыражение(РегулярноеВыражение);
	РегВыражение.ИгнорироватьРегистр = Истина;
	РегВыражение.Многострочный = Истина;
	Возврат РегВыражение.Заменить(ИсходнаяСтрока, СтрокаЗамены);
	
КонецФункции

Функция ТаблицаВерсий(Знач Текст)
		
	РегВыражение = Новый РегулярноеВыражение("# \[(.*)\](.*(\d{4}\-\d{2}\-\d{2}))?");
	РегВыражение.ИгнорироватьРегистр = Истина;
	РегВыражение.Многострочный = Истина;

	Массив = РегВыражение.НайтиСовпадения(Текст);
	Индекс = 0;
	ТаблицаВерсий = Новый ТаблицаЗначений;
	ТаблицаВерсий.Колонки.Добавить("Дата");
	ТаблицаВерсий.Колонки.Добавить("Версия");
	ТаблицаВерсий.Колонки.Добавить("ВесВерсии");
	ТаблицаВерсий.Колонки.Добавить("Текст");	
	Пока Индекс < Массив.Количество() Цикл
		Элемент = Массив[Индекс].Группы[1];
		НоваяСтрока = ТаблицаВерсий.Добавить();
		
		ВерсияСтрокой = Элемент.Значение;		
		Попытка
			ВесВерсии = ОбщегоНазначения.ВесВерсии(ВерсияСтрокой);
		Исключение
			ВесВерсии = 0;
		КонецПопытки;

		Попытка
			Элемент = Массив[Индекс].Группы[3];
			ИсходнаяДата = СокрЛП(Элемент.Значение);
			ДеньВерсии = Число(Сред(ИсходнаяДата, 9));
			МесяцВерсии = Число(Сред(ИсходнаяДата, 6, 2));
			ГодВерсии = Число(Лев(ИсходнаяДата, 4));
			НоваяСтрока.Дата = Дата(ГодВерсии, МесяцВерсии, ДеньВерсии);				
		Исключение
			НоваяСтрока.Дата = Дата(1, 1, 1);
		КонецПопытки;
		
		НоваяСтрока.Версия = ВерсияСтрокой;
		НоваяСтрока.ВесВерсии = ВесВерсии;
		НоваяСтрока.Текст = ПолучитьОписаниеВерсииChangeLog(Текст, ВерсияСтрокой);
		
		Индекс = Индекс + 1;
	КонецЦикла;
	
	Если ТаблицаВерсий.Количество() > 0 Тогда
		ТаблицаВерсий.Сортировать("ВесВерсии Убыв");
	КонецЕсли;
	
	Возврат ТаблицаВерсий;
	
КонецФункции

Функция УдалитьПустыеСтроки(Текст)

	Результат = Новый Массив;
	ЧислоСтрок = СтрЧислоСтрок(Текст);
	
	Для Индекс = 1 По ЧислоСтрок Цикл
		Стр = СтрПолучитьСтроку(Текст, Индекс);
		Если НЕ ПустаяСтрока(Стр) Тогда
			Результат.Добавить(Стр);
		КонецЕсли;
	КонецЦикла;	

	Возврат СтрСоединить(Результат, Символы.ПС);

КонецФункции

Функция МаксимальнаяВерсияИзФайлаChangeLog(Знач ТаблицаВерсий)

	мВерсия = "";

	ТаблицаВерсий.Сортировать("ВесВерсии Убыв");
	Если ТаблицаВерсий.Количество() > 0 Тогда
		мВерсия = ТаблицаВерсий[0].Версия;
	КонецЕсли;
	
	Возврат мВерсия;

КонецФункции

Функция ПолучитьОписаниеВерсииChangeLog(Знач ТекстФайла, Знач Версия)

	Текст = "";

	РазмерФайла = СтрДлина(ТекстФайла);
	Индекс = СтрНайти(ТекстФайла, "# [" + Версия + "]");
	Если Индекс > 0 Тогда

		Индекс = СтрНайти(ТекстФайла, Символы.ПС, , Индекс);

		ИндексСледующий = СтрНайти(ТекстФайла, "# [", , Индекс + 1);
		Если ИндексСледующий = 0 Тогда
			Отступ = 2;
			ИндексСледующий = РазмерФайла + Отступ;
		КонецЕсли;
		Текст = Сред(ТекстФайла, Индекс, ИндексСледующий - Индекс - 1);

	КонецЕсли;
		
	Возврат Текст;
	
КонецФункции

Функция ЗаменитьBBCode(Знач Строка)

	Стр = Строка;
	Стр = ЗаменитьПоРегулярномуВыражению(Стр, "(\*\*|__)(.*?)\1", "[b]$2[/b]");
	Стр = ЗаменитьПоРегулярномуВыражению(Стр, "(\*|_)(\S(.*?\S)?)(\*|_)", "[i]$2[/i]");
	Стр = ЗаменитьПоРегулярномуВыражению(Стр, "\~\~(.*?)\~\~", "[s]$1[/s]");
	Стр = ЗаменитьПоРегулярномуВыражению(Стр, "[`](.*?)[`]", "[code]$1[/code]");
	Стр = ЗаменитьПоРегулярномуВыражению(Стр, 
		"\!\[([^\[]+)\]\(([^\""]+) \""([^\)]+)\""\)",
		"<img src=""$2"" alt=""$1"" title=""$3"">");
	Стр = ЗаменитьПоРегулярномуВыражению(Стр, 
		"\!\[([^\[]+)\]\(([^\)]+)\)", 
		"[img]$2[/img]");
	Стр = ЗаменитьПоРегулярномуВыражению(Стр,
		"\[([^\[]+)\]\(([^\)]+)\)", 
		"[url=""$2""]$1[/url]");

	Возврат Стр;

КонецФункции

Функция ПрефиксСтроки(Заголовки, Строка)

	Если ПодстрокаВМассиве(Заголовки.Added, Строка) Тогда
		Возврат "[+] ";
	ИначеЕсли ПодстрокаВМассиве(Заголовки.Changed, Строка) Тогда
		Возврат "[*] ";
	ИначеЕсли ПодстрокаВМассиве(Заголовки.Fixed, Строка) Тогда
		Возврат "[-] ";
	ИначеЕсли ПодстрокаВМассиве(Заголовки.Attention, Строка) Тогда
		Возврат "[!] ";
	ИначеЕсли ПодстрокаВМассиве(Заголовки.Deprecated, Строка) Тогда
		Возврат "[D] ";
	ИначеЕсли ПодстрокаВМассиве(Заголовки.Removed, Строка) Тогда
		Возврат "[R] ";
	ИначеЕсли ПодстрокаВМассиве(Заголовки.Security, Строка) Тогда
		Возврат "[S] ";
	Иначе
		Возврат "";
	КонецЕсли;

КонецФункции

// Дополняет структуру параметрами
//
// Параметры:
//  Структура  - Структура - параметры для подстановки в текст
//  Параметры  - Структура - параметры дополнения
//
Процедура ДополнитьСтруктуруПараметров(Структура, Знач Параметры)
	
	Структура.Вставить("ProductName", Параметры.ИмяПродукта);
	Структура.Вставить("news_short_description", Параметры.КраткоеОписание);
	Структура.Вставить("news_picture", Параметры.Изображение);
	Структура.Вставить("news_url", Параметры.Гиперссылка);

КонецПроцедуры

Функция ПолучитьТекстШаблона(ИмяШаблона)

	ИмяФайла = ОбъединитьПути(ОбщегоНазначения.КаталогМакетов(), "ChangeLog" + ИмяШаблона);
	Если НЕ ФайловыеОперации.ФайлСуществует(ИмяФайла) Тогда
		ОбщегоНазначения.ЗавершениеРаботыОшибка("Файл шаблона %1 не существует", ИмяФайла);
	КонецЕсли;
	Возврат ОбщегоНазначения.ПрочитатьДанныеИзМакета(ИмяФайла);

КонецФункции

Функция ПолучитьТекстВерсииШаблона(ИмяШаблона)

	Расширение = Сред(ИмяШаблона, СтрНайти(ИмяШаблона, ".") + 1);
	ИмяШаблонаВерсии = Лев(ИмяШаблона, СтрНайти(ИмяШаблона, ".") - 1);
	ИмяШаблонаВерсии = СтрШаблон("ChangeLog%1Item.%2", ИмяШаблонаВерсии, Расширение);
	ИмяФайла = ОбъединитьПути(ОбщегоНазначения.КаталогМакетов(), ИмяШаблонаВерсии);
	Если НЕ ФайловыеОперации.ФайлСуществует(ИмяФайла) Тогда
		ОбщегоНазначения.ЗавершениеРаботыОшибка("Файл версии шаблона %1 не существует", ИмяФайла);
	КонецЕсли;
	Возврат ОбщегоНазначения.ПрочитатьДанныеИзМакета(ИмяФайла);

КонецФункции

#КонецОбласти

Лог = ПараметрыСистемы.Лог();