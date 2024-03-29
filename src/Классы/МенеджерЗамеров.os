﻿// Главный замер производительности, который собирает все
Перем ГлавныйЗамер;
// Лог замеров
Перем Лог;

#Область ПрограммныйИнтерфейс

// Фиксирует все замеры
//
Процедура ЗафиксироватьВсеЗамеры() Экспорт
	
	ЗакончитьЗамер(ГлавныйЗамер);

КонецПроцедуры

// Начинает замеры времени определенного блока кода.
//
// Параметры:
//  Имя  - Строка - адрес замера в общем замере вида "Адрес1.Адрес2.Адрес3", позволяет вкладывать замеры одни в другие.
//  Аргументы  - Строка - дополнительная информация, которую хотелось бы записать для отладки.
//
// Возвращаемое значение:
//	Структура - описывает замер времени
//
Функция НачатьЗамер(Знач Имя, Знач Аргументы = "") Экспорт

	ПараметрыЗамера = НайтиЗамер("actions." + Имя, ГлавныйЗамер);	
	ПараметрыЗамера.ДатаНачала = ТекущаяДата();
	ПараметрыЗамера.Начало = ТекущаяУниверсальнаяДатаВМиллисекундах();
	ПараметрыЗамера.Аргументы = Аргументы;
	
	Возврат ПараметрыЗамера;

КонецФункции // НачатьЗамер()

// Заканичвает начатый ранее замер времени.
//
// Параметры:
//  ПараметрыЗамера  - Структура - информация о начатом ранее замере времени
//
Процедура ЗакончитьЗамер(ПараметрыЗамера) Экспорт
	
	Длительность = ТекущаяУниверсальнаяДатаВМиллисекундах() - ПараметрыЗамера.Начало;	
	Замер = ПараметрыЗамера;
	Пока Замер <> Неопределено Цикл
	 	Замер.Длительность = Замер.Длительность + Длительность;
	 	Замер = НайтиЗамерПоИдентификатору(Замер.Родитель, ГлавныйЗамер);
	КонецЦикла;

КонецПроцедуры // ЗафиксироватьОкончаниеЗамера()

// Записывает результаты замеров в файл как новый, так и существующий
//
// Параметры:
//  ИмяФайла  - Строка - каталог
//
Процедура СохранитьЗамерыВФайл(Знач ИмяФайла) Экспорт
	
	РаботаJSON.ЗаписатьФайлJSON(ИмяФайла, ГлавныйЗамер);

КонецПроцедуры

// Записывает результаты замеров в каталог с именем yyyy_MM_dd_ЧЧ_мм_сс.json
//
// Параметры:
//  Каталог  - Строка - каталог
//
Процедура СохранитьЗамерыВКаталог(Знач Каталог) Экспорт
	
	ФайловыеОперации.ОбеспечитьКаталог(Каталог);
	ИмяФайла = ОбъединитьПути(Каталог, Формат(ТекущаяДата(), "ДФ=yyyy_MM_dd_ЧЧ_мм_сс") + ".json");
	СохранитьЗамерыВФайл(ИмяФайла);

КонецПроцедуры

// Формирует красивый HTML-отчет по замерам времени
//
// Параметры:
//	ИмяФайла - -Строка - имя HTML-файла замеров
//  Каталог  - Строка - каталог с замерами
//	Маска - Строка, Неопределено - маска файлов, если не задано, то будет по всем json-файлам в каталоге
//
Процедура СформироватьОтчетПоЗамерам(Знач ИмяФайла, Знач Каталог, Знач Маска = "*.json") Экспорт
		
	Файлы = НайтиФайлы(Каталог, Маска, Ложь);
	Таблица = Новый ТаблицаЗначений();
	Таблица.Колонки.Добавить("ИмяФайла");
	Таблица.Колонки.Добавить("Описание");
	Таблица.Колонки.Добавить("ОбщееВремя");
	
	// Собираем результаты и аккумулируем
	ВсегоВремени = 0;
	Для Каждого Файл Из Файлы Цикл
		ВсегоВремени = ВсегоВремени + ПолучитьОбщееВремя(Файл.ПолноеИмя);
	КонецЦикла;

	// Сохраняем результаты
	Результат = 
	"<!doctype html>
	|	<html lang='en'>
	|	  <head>
	|		<meta charset='utf-8'>
	|		<meta name='viewport' content='width=device-width, initial-scale=1'>
	|		<title>Profiler</title>
	|		<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65' crossorigin='anonymous'>
	|	  </head>
	|<body>
	|<table class='table table-hover'>
	|<thead>
	|	<tr>
	|		<th class='col-1'>Дата</th>
	|		<th>Операция</th>
	|		<th class='col-1'>Длительность</th>
	|		<th class='col-1'>%</th>
	|		<th>Прогресс</th>
	|	</tr>
	|</thead>";
//	"<html><style>* { font-family: courier !important }</style><body><table>";
	Для Каждого Файл Из Файлы Цикл
		ОписаниеФайла = ПолучитьОписаниеФайла(Файл.ПолноеИмя, ВсегоВремени);
		Результат = Результат + ОписаниеФайла.Описание + Символы.ПС;
	КонецЦикла;
	Результат = Результат + 
	"</table>	
	|		<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js' integrity='sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4' crossorigin='anonymous'></script>
	|	  </body>
	|	</html>";

	ФайловыеОперации.ЗаписатьТекстФайла(ИмяФайла, Результат);

КонецПроцедуры

Функция ПолучитьОбщееВремя(Знач ИмяФайла)

	Результат = Новый Структура("ИмяФайла", ИмяФайла);
	Структура = РаботаJSON.ПрочитатьФайлJSON(ИмяФайла);

	Возврат Структура.Длительность;

КонецФункции

Функция ПолучитьОписаниеФайла(Знач ИмяФайла, Знач ВсегоВремени)

	Результат = Новый Структура("ИмяФайла", ИмяФайла);
	Структура = РаботаJSON.ПрочитатьФайлJSON(ИмяФайла);
	Результат.Вставить("ОбщееВремя", Структура.Длительность);
	Результат.Вставить("Описание", ОписаниеЗамера(Структура, ВсегоВремени));

	Возврат Результат;

КонецФункции

Функция ОписаниеЗамера(Знач ПараметрыЗамера, Знач ВсегоВремени, Знач Уровень = 0)

	МиллисекундВСекунде = 1000;

	Длительность = ПредставлениеВремени(ПараметрыЗамера.Длительность / МиллисекундВСекунде);
	Операция = СтроковыеОперации.УдалитьТегиИСпецСимволыИзСтроки(ПараметрыЗамера["Имя"]);
	Для Индекс = 0 По Уровень - 1 Цикл
		Операция = "&nbsp;&nbsp;" + Операция;
	КонецЦикла;
	Аргументы = СтроковыеОперации.УдалитьТегиИСпецСимволыИзСтроки(ПараметрыЗамера.Аргументы);
	Если НЕ ПустаяСтрока(Аргументы) Тогда
		Операция = Операция + " " + Аргументы;
	КонецЕсли;
	Процент = Окр(ПараметрыЗамера.Длительность * 100 / ВсегоВремени);

	Результат = 
		"<tr>"
		+ "<td>" + ПараметрыЗамера["ДатаНачала"] + "</td>"
		+ "<td>" + Операция + "</td>"
		+ "<td>" + Длительность + "</td>"
		+ "<td>" + Процент + "% </td>"
		+ "<td><progress value='" + Процент + "' max='100' class='w-100'></progress></td>"
		+ "</tr>" + Символы.ПС;

	Для Каждого Замер Из ПараметрыЗамера["Замеры"] Цикл
		Результат = Результат + ОписаниеЗамера(Замер, ВсегоВремени, Уровень + 1);
	КонецЦикла;

	Возврат Результат;

КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция НайтиЗамер(Знач Имя, ЗамерРодитель)
	
	Если ВРег(ЗамерРодитель.Имя) = ВРег(Имя) Тогда
		Возврат ЗамерРодитель;
	КонецЕсли;

	НовыйЗамер = Неопределено;

	МассивПутей = СтрРазделить(Имя, ".", Ложь);
	Для Индекс = 0 По МассивПутей.Количество() - 1 Цикл
		ЧастьПути = МассивПутей[Индекс];
		 Если ВРег(ЗамерРодитель.Имя) = ВРег(ЧастьПути) Тогда
			Если Индекс = МассивПутей.Количество() - 1 Тогда
		 		Возврат ЗамерРодитель;
			Иначе
				ДругаяЧастьПути = "";
				Для Индекс2 = Индекс + 1 По МассивПутей.Количество() - 1 Цикл
					Если Индекс2 <> Индекс + 1 Тогда
						ДругаяЧастьПути = ДругаяЧастьПути + ".";
					КонецЕсли;
					ДругаяЧастьПути = ДругаяЧастьПути + МассивПутей[Индекс2];
				КонецЦикла;	
				Если НЕ ПустаяСтрока(ДругаяЧастьПути) Тогда
					Возврат НайтиЗамер(ДругаяЧастьПути, ЗамерРодитель);
				КонецЕсли;
			КонецЕсли;
		 КонецЕсли;

		Найдено = Ложь;
		Для Каждого Замер Из ЗамерРодитель.Замеры Цикл			
			Если ВРег(Замер.Имя) = ВРег(ЧастьПути) Тогда				
				Найдено = Истина;
				Если Индекс = МассивПутей.Количество() - 1 Тогда
					Возврат Замер;
				Иначе
					ДругаяЧастьПути = "";
					Для Индекс2 = Индекс + 1 По МассивПутей.Количество() - 1 Цикл
						Если Индекс2 <> Индекс + 1 Тогда
							ДругаяЧастьПути = ДругаяЧастьПути + ".";
						КонецЕсли;
						ДругаяЧастьПути = ДругаяЧастьПути + МассивПутей[Индекс2];
					КонецЦикла;					
					Если НЕ ПустаяСтрока(ДругаяЧастьПути) Тогда
						Возврат НайтиЗамер(ДругаяЧастьПути, Замер);
					КонецЕсли;
				КонецЕсли;
			КонецЕсли;
		КонецЦикла;

		Если НЕ Найдено Тогда			
			НовыйЗамер = СтруктураПараметровЗамера(ЧастьПути);
			НовыйЗамер.Родитель = ЗамерРодитель.Идентификатор;
			ЗамерРодитель.Замеры.Добавить(НовыйЗамер);
			ДругаяЧастьПути = "";
			Для Индекс2 = Индекс + 1 По МассивПутей.Количество() - 1 Цикл
				Если Индекс2 <> Индекс + 1 Тогда
					ДругаяЧастьПути = ДругаяЧастьПути + ".";
				КонецЕсли;
				ДругаяЧастьПути = ДругаяЧастьПути + МассивПутей[Индекс2];
			КонецЦикла;
			Если НЕ ПустаяСтрока(ДругаяЧастьПути) Тогда
				Возврат НайтиЗамер(ДругаяЧастьПути, НовыйЗамер);
			КонецЕсли;
		КонецЕсли;

	КонецЦикла;

	Возврат НовыйЗамер;

КонецФункции

Функция НайтиЗамерПоИдентификатору(Знач Идентификатор, Знач РодительскийЗамер)

	Если РодительскийЗамер.Идентификатор = Идентификатор Тогда
		Возврат РодительскийЗамер;
	КонецЕсли;

	Для Каждого Замер Из РодительскийЗамер.Замеры Цикл
		Если Замер.Идентификатор = Идентификатор Тогда
			Возврат Замер;
		Иначе
			Возврат НайтиЗамерПоИдентификатору(Идентификатор, Замер);
		КонецЕсли;
	КонецЦикла;

	Возврат Неопределено;

КонецФункции

Функция СтруктураПараметровЗамера(Знач Имя = "")

	ПараметрыЗамера = Новый Структура();
	ПараметрыЗамера.Вставить("Идентификатор", Строка(Новый УникальныйИдентификатор()));
	ПараметрыЗамера.Вставить("ДатаНачала", ТекущаяДата());
	ПараметрыЗамера.Вставить("Начало", ТекущаяУниверсальнаяДатаВМиллисекундах());
	ПараметрыЗамера.Вставить("Имя", Имя);
	ПараметрыЗамера.Вставить("Аргументы");
	ПараметрыЗамера.Вставить("Длительность", 0);
	ПараметрыЗамера.Вставить("Замеры", Новый Массив);
	ПараметрыЗамера.Вставить("Родитель", Неопределено);
	ПараметрыЗамера.Вставить("Количество", 1);

	Возврат ПараметрыЗамера;

КонецФункции // СтруктураПараметровЗамера()

Функция ПараметрыЗамераСтрокой(ПараметрыЗамера, Префикс)

	МассивПараметровЗамера = Новый Массив();

	МиллисекундВСекунде = 1000;
	МассивПараметровЗамера.Добавить(ПараметрыЗамера.ДатаНачала);
	МассивПараметровЗамера.Добавить(Префикс);
	Имя = ПараметрыЗамера.Имя;
	Если ПараметрыЗамера.Уровень > 0 Тогда
		Имя = СтроковыеФункции.ДополнитьСтроку("", ПараметрыЗамера.Уровень, " ") + Имя;
	КонецЕсли;
	МассивПараметровЗамера.Добавить(Имя);
	
	Если ПараметрыЗамера.Длительность = Неопределено Тогда
		Время = "";
	Иначе
		Время = ПредставлениеВремени(ПараметрыЗамера.Длительность / МиллисекундВСекунде);
	КонецЕсли;

	МассивПараметровЗамера.Добавить(Время);

	Возврат СтрСоединить(МассивПараметровЗамера, " | ");

КонецФункции // ПараметрыЗамераСтрокой()

// Возвращает текстовое представление интервала времени, заданного в секундах.
//
// Параметры:
//
//  Время - Число - интервал времени в секундах.
//
//  ПолноеПредставление	- Булево - кратное или полное представление времени.
//		Например, интервал 1 000 000 секунд:
//		1) полное представление:  11 дней 13 часов 46 минут 40 секунд;
//		2) краткое представление: 11 дней 13 часов.
//  
//  ВыводитьСекунды - Булево - Ложь, если секунды не требуются.
//  
// Возвращаемое значение:
//   Строка - представление интервала времени.
//
Функция ПредставлениеВремени(Знач Время, ПолноеПредставление = Истина, ВыводитьСекунды = Истина) Экспорт

	Результат = "";		
	Время = Число(Время);
	
	Если Время < 0 Тогда
		Время = -Время;
	КонецЕсли;

	ДнейВНеделе = 7;
	СекундВМинуте = 60;
	СекундВЧасе = 3600;
	СекундВСутках = 86400;
	ЧасовВСутках = 24;
	МинутВЧасе = 60;
	
	КоличествоНедель = Цел(Время / СекундВСутках / ДнейВНеделе);
	КоличествоДней   = Цел(Время / СекундВСутках);
	КоличествоЧасов  = Цел(Время / СекундВЧасе);
	КоличествоМинут  = Цел(Время / СекундВМинуте);
	КоличествоСекунд = Цел(Время);
	
	КоличествоСекунд = КоличествоСекунд - КоличествоМинут * СекундВМинуте;
	КоличествоМинут  = КоличествоМинут - КоличествоЧасов * МинутВЧасе;
	КоличествоЧасов  = КоличествоЧасов - КоличествоДней * ЧасовВСутках;
	КоличествоДней   = КоличествоДней - КоличествоНедель * ДнейВНеделе;

	ВыводМинут 		 = 2;
	
	Если Не ВыводитьСекунды Тогда
		КоличествоСекунд = 0;
	КонецЕсли;
	
	Если КоличествоНедель > 0 И КоличествоДней + КоличествоЧасов + КоличествоМинут + КоличествоСекунд = 0 Тогда
		Результат = Строка(КоличествоНедель) + " нед.";
	ИначеЕсли КоличествоСекунд < 1 И КоличествоНедель + КоличествоДней + КоличествоЧасов + КоличествоМинут = 0 Тогда
		Результат = Строка(Окр(Время, 1)) + " мс.";
	Иначе
		КоличествоДней = КоличествоДней + КоличествоНедель * ДнейВНеделе;
		
		Счетчик = 0;
		Если КоличествоДней > 0 Тогда
			Результат = Результат + Строка(КоличествоДней) + " дн. ";
			Счетчик = Счетчик + 1;
		КонецЕсли;
		
		Если КоличествоЧасов > 0 Тогда
			Результат = Результат + Строка(КоличествоЧасов) + " ч. ";
			Счетчик = Счетчик + 1;
		КонецЕсли;
		
		Если (ПолноеПредставление Или Счетчик < ВыводМинут) И КоличествоМинут > 0 Тогда
			Результат = Результат + Строка(КоличествоМинут) + " мин. ";
			Счетчик = Счетчик + 1;
		КонецЕсли;
		
		НужноВыводитьСекунды = (ПолноеПредставление Или Счетчик < ВыводМинут) 
			И (КоличествоСекунд > 0 Или КоличествоНедель + КоличествоДней + КоличествоЧасов + КоличествоМинут = 0);
		Если НужноВыводитьСекунды Тогда
			Результат = Результат + Строка(КоличествоСекунд) + " сек.";
		КонецЕсли;
		
	КонецЕсли;
	
	Возврат СокрП(Результат);
	
КонецФункции

Процедура ПриСозданииОбъекта()

	ГлавныйЗамер = СтруктураПараметровЗамера("actions");
	СтрокаКоманды = СтрСоединить(Новый Массив(АргументыКоманднойСтроки), " ");
	ГлавныйЗамер.Аргументы = СтрокаКоманды;	
	
КонецПроцедуры

#КонецОбласти