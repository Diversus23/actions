﻿#Использовать logos
#Использовать 1connector

// Лог приложения
Перем Лог;

#Область ПрограммныйИнтерфейс

// Инициализирует параметры для обфускации
//
// Возвращаемое значение:
//	Структура - структура настроек
//
Функция КонструкторОбфускации() Экспорт

    НастройкиОбфускации = Новый Структура();
    // Ключ API
    НастройкиОбфускации.Вставить("ApiKey",           "");
     // Общий модуль обрабатываем
    НастройкиОбфускации.Вставить("ModuleType",       "CommonModule");
    // Обязательный реквизит
    НастройкиОбфускации.Вставить("ByteCode",         0);
    // Шифровать строки
    НастройкиОбфускации.Вставить("EncryptStrings",   0);
    // Контроль потока
    НастройкиОбфускации.Вставить("ControlFlow",      0);
    // Форматировать результат
    НастройкиОбфускации.Вставить("FormatResult",     0);
    НастройкиОбфускации.Вставить("KeepCase",         0);
    // Для модулей форм и объектов, включить в код тесты проверки реквизитов
    НастройкиОбфускации.Вставить("InsertTests",      0);
    НастройкиОбфускации.Вставить("ControlFlowLevel", 0);
	
	Возврат НастройкиОбфускации;

КонецФункции

// Инициализирует параметры для обфускации общего модуля
//
// Возвращаемое значение:
//	Структура - структура настроек
//
Функция КонструкторОбфускацииОбщегоМодуля() Экспорт

    НастройкиОбфускации = КонструкторОбфускации();

    НастройкиОбфускации.Вставить("ModuleType", "CommonModule");
    НастройкиОбфускации.Вставить("ByteCode", 1);
    НастройкиОбфускации.Вставить("EncryptStrings", 1);
    НастройкиОбфускации.Вставить("ControlFlow", 1);
    НастройкиОбфускации.Вставить("InsertTests", 1);
    НастройкиОбфускации.Вставить("ControlFlowLevel", 1);
	
	Возврат НастройкиОбфускации;
	
КонецФункции

// Инициализирует параметры для обфускации скрипта OneScript
//
// Возвращаемое значение:
//	Структура - структура настроек
//
Функция КонструкторОбфускацииСкриптаOneScript() Экспорт

    НастройкиОбфускации = КонструкторОбфускации();

    НастройкиОбфускации.Вставить("ModuleType", "ObjectModule");
    НастройкиОбфускации.Вставить("ByteCode", 0);
    НастройкиОбфускации.Вставить("EncryptStrings", 0);
    НастройкиОбфускации.Вставить("ControlFlow", 0);
    НастройкиОбфускации.Вставить("InsertTests", 0);
    НастройкиОбфускации.Вставить("ControlFlowLevel", -1);
	
	Возврат НастройкиОбфускации;
	
КонецФункции

// Производит обфускацию файла 1С
//
// Параметры:
//  Параметры    - Структура     - настройки обфускации
//
Процедура ОбфускацияФайла1С(Знач Параметры) Экспорт
	
    Лог.Информация("Начало обфускации файла");
    
    Адрес = "https://netlenka.org/Module/ApiClientProtect";
    ИсходныйФайл = Параметры.ИсходныйФайл;   
    ОбфусцированныйФайл = Параметры.ФайлРезультат;    

	ТекстовыйФайл = Новый ТекстовыйДокумент();
	ТекстовыйФайл.Прочитать(ИсходныйФайл, КодировкаТекста.UTF8);
	ДанныеДляОбфускации = "";
	Текст = ТекстовыйФайл.ПолучитьТекст();	
	Для Индекс = 1 По СтрЧислоСтрок(Текст) Цикл
		ДанныеДляОбфускации = ДанныеДляОбфускации + СтрПолучитьСтроку(Текст, Индекс) + Символы.ВК + Символы.ПС;
	КонецЦикла;
		
	Структура = Параметры.НастройкиОбфускации;
	Структура.Вставить("Text", ДанныеДляОбфускации); // Текст, который нужно обфусцировать
	
	ЗаписьJSON = Новый ЗаписьJSON();
	ЗаписьJSON.УстановитьСтроку();
	ЗаписатьJSON(ЗаписьJSON, Структура);
	ТекстЗапросаJSON = ЗаписьJSON.Закрыть();
		
	Данные = Новый Структура;
	Данные.Вставить("inputData", ТекстЗапросаJSON);
	Лог.Информация("Отправка запроса серверу обфускации");
	Ответ = КоннекторHTTP.Post(Адрес, Данные);
	ЧтениеJSON = Новый ЧтениеJSON();
	ЧтениеJSON.УстановитьСтроку(Ответ.Текст());
	Структура = ПрочитатьJSON(ЧтениеJSON);
	ЧтениеJSON.Закрыть();	
	КодУспешно = 200;

	Если Структура.StatusCode = КодУспешно Тогда 
		ЧтениеJSON = Новый ЧтениеJSON();
		ЧтениеJSON.УстановитьСтроку(Структура.Content);
		Структура = ПрочитатьJSON(ЧтениеJSON);
		ЧтениеJSON.Закрыть();

		Если ВРег(ОбфусцированныйФайл) = ВРег(ИсходныйФайл) Тогда
			УдалитьФайлы(ОбфусцированныйФайл);
		КонецЕсли;

		// Записываем в кодивроке UTF-8.
		ЗТ = Новый ЗаписьТекста(ОбфусцированныйФайл, "windows-1251"); 
		ЗТ.Закрыть(); 		
		ЗТ = Новый ЗаписьТекста(ОбфусцированныйФайл, "UTF-8", , Истина);
		ЗТ.Записать(Структура.Text);
		ЗТ.Закрыть();

		Лог.Информация("Обфускация файла успешно завершена");
	Иначе
		ОбщегоНазначения.ЗавершениеРаботыОшибка("Произошла ошибка обфускации %1 (%2)",
			Структура.Content, Структура.StatusCode);
	КонецЕсли;
	
	Лог.Информация("Окончание процесса обфускации");

КонецПроцедуры

#КонецОбласти

Лог = ПараметрыСистемы.Лог();