#Использовать fs
#Использовать tempfiles
#Использовать logos

// Системный лог
Перем Лог;

//	Возвращает содержимое файла, читая его в правильной кодировке
// Параметры:
//  ПутьКФайлу - Строка - Полный путь к файлу
//	Кодировка - Строка - кодировка файла. Если Неопределено, то вычисляется автоматически
//
//  Возвращаемое значение:
//   Строка - Содержимое файла
//
Функция ПрочитатьТекстФайла(Знач ПутьКФайлу, Знач Кодировка = Неопределено) Экспорт
	
	Если НЕ ФайлСуществует(ПутьКФайлу) Тогда
		Возврат "";
	КонецЕсли;

	Если Кодировка = Неопределено Тогда
		Кодировка = ОпределитьКодировку(ПутьКФайлу);
	КонецЕсли;
	Текст = Новый ЧтениеТекста();
	Текст.Открыть(ПутьКФайлу, Кодировка);
	
	СодержимоеФайла = Текст.Прочитать();
	Если СодержимоеФайла = Неопределено Тогда
		СодержимоеФайла = "";
	КонецЕсли;
	
	Текст.Закрыть();
	
	Возврат СодержимоеФайла;
	
КонецФункции // ПрочитатьТекстФайла

//	Определяет кодировку файла и записывает содержимое в файл
//
// Параметры:
//	ПутьКФайлу 		- Строка - Полный путь к файлу
//	СодержимоеФайла	- Строка - Текст для записи
//	Кодировка - Строка - кодировка файла. Если Неопределено, то вычисляется автоматически
Процедура ЗаписатьТекстФайла(Знач ПутьКФайлу, Знач СодержимоеФайла, Знач Кодировка = Неопределено) Экспорт
	
	Если Кодировка = Неопределено Тогда
		Кодировка = ОпределитьКодировку(ПутьКФайлу);
	КонецЕсли;
	ЗаписьТекста = Новый ЗаписьТекста(ПутьКФайлу, Кодировка, , , Символы.ПС);
	
	ЗаписьТекста.Записать(СодержимоеФайла);
	ЗаписьТекста.Закрыть();
	
КонецПроцедуры // ЗаписатьТекстФайла

//	Добавляет текст в файл.
//
// Параметры:
//	ПутьКФайлу 		- Строка - Полный путь к файлу
//	Текст	- Строка - Текст для записи
//	НоваяСтрока - Булево - запись будет добавлена с новой строки или нет
Процедура ДобавитьТекстКФайлу(Знач ПутьКФайлу, Знач Текст = "", Знач НоваяСтрока = Ложь) Экспорт
	
	Если ФайлСуществует(ПутьКФайлу) Тогда
		Кодировка = ОпределитьКодировку(ПутьКФайлу);
		ТекстФайла = ПрочитатьТекстФайла(ПутьКФайлу, Кодировка);
	Иначе
		Кодировка = КодировкаТекста.UTF8;
		ТекстФайла = "";
	КонецЕсли;

	Если НоваяСтрока = Истина И НЕ ПустаяСтрока(ТекстФайла) Тогда
		ТекстФайла = ТекстФайла + Символы.ПС;
	КонецЕсли;
	ТекстФайла = ТекстФайла + Текст;

	ЗаписатьТекстФайла(ПутьКФайлу, ТекстФайла, Кодировка);
	
КонецПроцедуры // ЗаписатьТекстФайла

// ОпределитьКодировку
//	Читает первые 3 байта файла и ищет маркер BOM кодировки UTF-8
// Параметры:
//   ПутьКФайлу - Строка - Полный путь к файлу
//
//  Возвращаемое значение:
//   Перечисление - Кодировка файла
//
Функция ОпределитьКодировку(Знач ПутьКФайлу) Экспорт

	Если НЕ ФайлСуществует(ПутьКФайлу) Тогда
		Возврат КодировкаТекста.UTF8;
	КонецЕсли;
	
	МаркерUTFBOM = СтрРазделить("239 187 191", " ");
	ЧтениеДанных = Новый ЧтениеДанных(ПутьКФайлу);
	Буфер = Новый БуферДвоичныхДанных(МаркерUTFBOM.Количество());
	
	ЧтениеДанных.ПрочитатьВБуферДвоичныхДанных(Буфер, , МаркерUTFBOM.Количество());
	Сч = 0;
	ЕстьBOM = Истина;
	
	Для Каждого Байт Из Буфер Цикл
		Если МаркерUTFBOM[Сч] <> Строка(Байт) Тогда
			ЕстьBOM = Ложь;
			Прервать;
		КонецЕсли;
		Сч = Сч + 1;
	КонецЦикла;
	
	ЧтениеДанных.Закрыть();
	
	Возврат ?(ЕстьBOM, КодировкаТекста.UTF8, КодировкаТекста.UTF8NoBOM);
	
КонецФункции // ОпределитьКодировку

// Получить абсолютный путь к файлу или каталогу.
//
// Параметры:
//   ПутьКФайлу - Строка - Полный путь к файлу
//
// Возвращаемое значение:
// 	Строка - абсолютный путь к файлу или каталогу.
//
Функция АбсолютныйПуть(Знач ПутьКФайлу) Экспорт
	
	Файл = Новый Файл(УбратьКавычкиВокругПути(ПутьКФайлу));
	Возврат УдалитьПоследнийРазделительПути(Файл.ПолноеИмя);
	
КонецФункции

// Проверяет существование файла.
//
// Параметры:
//   ПутьКФайлу - Строка - Полный путь к файлу
//
// Возвращаемое значение:
// 	Булево - признак существования файла.
//
Функция ФайлСуществует(Знач ПутьКФайлу) Экспорт
	
	Файл = Новый Файл(УбратьКавычкиВокругПути(ПутьКФайлу));
	Возврат Файл.Существует() И НЕ Файл.ЭтоКаталог();
	
КонецФункции

// Проверяет существование каталога
//
// Параметры:
//   Путь - Строка - Полный путь к каталогу
//
// Возвращаемое значение:
// 	Булево - признак существования каталога.
//
Функция КаталогСуществует(Знач Путь) Экспорт
	
	Файл = Новый Файл(УбратьКавычкиВокругПути(Путь));
	Возврат Файл.Существует() И Файл.ЭтоКаталог();
	
КонецФункции

Функция ОбернутьПутьВКавычки(Знач Путь) Экспорт
	
	Результат = Путь;
	Если Прав(Результат, 1) = "\" ИЛИ Прав(Результат, 1) = "/" Тогда
		Результат = Лев(Результат, СтрДлина(Результат) - 1);
	КонецЕсли;
	
	Результат = """" + Результат + """";
	
	Возврат Результат;
	
КонецФункции

Функция УбратьКавычкиВокругПути(Знач Путь) Экспорт
	// NOTICE: https://github.com/xDrivenDevelopment/precommit1c
	// Apache 2.0
	ОбработанныйПуть = Путь;
	
	Если Лев(ОбработанныйПуть, 1) = """" Тогда
		ОбработанныйПуть = Прав(ОбработанныйПуть, СтрДлина(ОбработанныйПуть) - 1);
	КонецЕсли;
	Если Прав(ОбработанныйПуть, 1) = """" Тогда
		ОбработанныйПуть = Лев(ОбработанныйПуть, СтрДлина(ОбработанныйПуть) - 1);
	КонецЕсли;
	
	Возврат ОбработанныйПуть;
	
КонецФункции

// Дополнить разделителем пути
//
// Параметры:
//   Путь - Строка - путь файла или каталога
//
//  Возвращаемое значение:
//   Строка - путь с разделителем пути в конце строки, если его там не было, иначе сам путь
//
Функция ДополнитьРазделителемПути(Знач Путь) Экспорт
	
	Если Прав(Путь, 1) <> ПолучитьРазделительПути() Тогда
		Возврат Путь + ПолучитьРазделительПути();
	КонецЕсли;
	
	Возврат Путь;
	
КонецФункции

// Заменяет в пути Windows все разделители "/" на "\", для Linux наоборот
//
// Параметры:
//  Путь  - Строка - исходный путь
//
// Возвращаемое значение:
//	Строка - итоговый путь
//
Функция ЗаменитьРазделителиПутиНаРазделителиОС(Знач Путь) Экспорт
	
    Если ПараметрыСистемы.ЭтоWindows Тогда
        Результат = СтрЗаменить(Путь, "/", "\");
    Иначе
        Результат = СтрЗаменить(Путь, "\", "/");
    КонецЕсли;

	Возврат Результат;

КонецФункции

// Возвращает стандартное имя файла настроек.
//
// Возвращаемое значение:
//   Строка - имя файла с настройками
//
Функция ИмяФайлаНастроек() Экспорт
	
	Возврат "settings.json";
	
КонецФункции // ИмяФайлаНастроек()

Функция НайтиКаталогТекущегоПроекта(Знач Путь) Экспорт
    Результат = "";
    Если ПустаяСтрока(Путь) Тогда
        Попытка
            Команда = Новый КонтролируемыйПроцесс();
            Команда.УстановитьСтрокуЗапуска("git rev-parse --show-toplevel");
            Команда.УстановитьПравильныйКодВозврата(0);
            Команда.Исполнить();
            Результат = СокрЛП(Команда.ПолучитьВывод());
        Исключение
            // некуда выдавать ошибку, логи еще не доступны
            Результат = "..";
        КонецПопытки;
    Иначе
        Результат = Путь;
    КонецЕсли;

    Возврат ЗаменитьРазделителиПутиНаРазделителиОС(Результат);

КонецФункции // НайтиКаталогТекущегоПроекта()

Функция ХэшФайлов(ИмяФайла, Маска = "*") Экспорт

	Хеширование = Новый ХешированиеДанных(ХешФункция["MD5"]);

	Если ФайловыеОперации.ФайлСуществует(ИмяФайла) Тогда
		Хеширование.ДобавитьФайл(ИмяФайла); 
	Иначе
		Файлы = НайтиФайлы(ИмяФайла, Маска, Истина);
		Для Каждого мФайл Из Файлы Цикл
			Если мФайл.ЭтоФайл() Тогда
				Хеширование.ДобавитьФайл(мФайл.ПолноеИмя);
			Иначе
				Хеширование.Добавить(мФайл.Имя);
			КонецЕсли;
		КонецЦикла;
	КонецЕсли;

	Хеш = Строка(Хеширование.ХешСумма);	
	Возврат НРег(СтрЗаменить(Хеш, " ", ""));

КонецФункции

// Гарантирует наличие пустого каталога с указанным именем
//
// Параметры:
//   Путь - Строка - Путь к каталогу
//
Процедура ОбеспечитьПустойКаталог(Знач Путь) Экспорт

    ОбеспечитьКаталог(Путь);
    УдалитьФайлы(Путь, ПолучитьМаскуВсеФайлы());

КонецПроцедуры // ОбеспечитьПустойКаталог()

// Создает наличие пустого каталога во временной папке
//
// Возвращаемое значение:
//   Строка - имя каталога во временной папке
//
Функция ОбеспечитьВременныйКаталог() Экспорт

	Возврат ВременныеФайлы.СоздатьКаталог();

КонецФункции // ОбеспечитьВременныйКаталог()

// Гарантирует наличие каталога с указанным именем
//
// Параметры:
//   Путь - Строка - Путь к каталогу
//
Процедура ОбеспечитьКаталог(Знач Путь) Экспорт

    Объект = Новый Файл(Путь);
    Если Не Объект.Существует() Тогда
        СоздатьКаталог(Путь);
    Иначе
		Если НЕ Объект.ЭтоКаталог() Тогда
        	ВызватьИсключение "Не удается создать каталог " + Путь + ". По данному пути уже существует файл.";
		КонецЕсли;
    КонецЕсли;

КонецПроцедуры // ОбеспечитьКаталог()

Процедура ОбеспечитьСуществованиеКаталоговДляПутей(Знач ПроверятьРодителя, Знач НаборПутей, Знач СообщениеОшибки)
	ЕстьОшибка = Ложь;
	Для Каждого Путь Из НаборПутей Цикл		
		Файл = Новый Файл(Путь);
		Если ПроверятьРодителя Тогда
			НужныйПуть = Файл.Путь;
			Если ПустаяСтрока(НужныйПуть) Тогда
				Возврат;
			КонецЕсли;
		Иначе
			НужныйПуть = Файл.ПолноеИмя;
		КонецЕсли;		
		ОбъектКаталог = Новый Файл(НужныйПуть);

		ФС.ОбеспечитьКаталог(ОбъектКаталог.ПолноеИмя);

		Если Не ОбъектКаталог.Существует() Тогда
			ЕстьОшибка = Истина;
			СообщениеОшибки = СтрШаблон("%1	%2", СообщениеОшибки, ОбъектКаталог.ПолноеИмя);
		КонецЕсли;
	КонецЦикла;

	Если ЕстьОшибка Тогда
		ВызватьИсключение СообщениеОшибки;
	КонецЕсли;

КонецПроцедуры

Процедура ОбеспечитьСуществованиеКаталогов(Знач НаборПутей, Знач СообщениеОшибки) Экспорт
	ОбеспечитьСуществованиеКаталоговДляПутей(Ложь, НаборПутей, СообщениеОшибки);
КонецПроцедуры

Процедура ОбеспечитьСуществованиеРодительскихКаталоговДляПутей(Знач НаборПутей, Знач СообщениеОшибки) Экспорт
	ОбеспечитьСуществованиеКаталоговДляПутей(Истина, НаборПутей, СообщениеОшибки);
КонецПроцедуры

// Удалить последний разделитель пути
//
// Параметры:
//   Путь - Строка - путь файла или каталога
//
//  Возвращаемое значение:
//   Строка - путь без разделителя пути в конце строки, если он там был, иначе сам путь
//
Функция УдалитьПоследнийРазделительПути(Знач Путь) Экспорт
	
	Путь = СокрП(Путь);
	Если НЕ ПустаяСтрока(Путь) Тогда
		Если Прав(Путь, 1) = "\" ИЛИ Прав(Путь, 1) = "/" Тогда
			Возврат Лев(Путь, СтрДлина(Путь) - 1);	
		КонецЕсли;
	КонецЕсли;
	
	Возврат Путь;
	
КонецФункции

// Безопасное удаление файлов или каталогов (если стоит признак для чтения, то перед удалением он будет снят)
//
// Параметры:
//   Путь - Строка - путь файла или каталога
//
//  Возвращаемое значение:
//   Булево - если файл удален успешно, то Истина.
//
Функция БезопасноУдалитьФайл(Знач Путь) Экспорт
	
	Попытка
		УдалитьФайлы(Путь);
		Возврат Истина;
	Исключение
		ТекстОшибки = СтрШаблон("Попытка удаления %1 закончилась неудачей, по причине %2", Путь, ОписаниеОшибки());
		УдаляемыйФайл = Новый Файл(Путь);
		Если УдаляемыйФайл.ЭтоФайл() И УдаляемыйФайл.ПолучитьТолькоЧтение() Тогда
			УдаляемыйФайл.УстановитьТолькоЧтение(Ложь);
			Попытка
				УдалитьФайлы(Путь);
				Возврат Истина;
			Исключение
				Лог.Предупреждение(ТекстОшибки);
			КонецПопытки;
		Иначе
			Лог.Предупреждение(ТекстОшибки);
		КонецЕсли; 
	КонецПопытки;

	Возврат Ложь;
	
КонецФункции

// Удаление файла или каталога если он существует
//
// Параметры:
//   ПутьФайла - Строка - путь файла или каталога
//
Процедура УдалитьФайлЕслиОнСуществует(Знач ПутьФайла) Экспорт
	Ожидаем.Что(ПутьФайла, "УдалитьФайлЕслиОнСуществует: Путь файла должен быть заполнен, а это не так!").Заполнено();

	ПутьФайла = ОбъединитьПути(ТекущийКаталог(), ПутьФайла);
	Файл = Новый Файл(ПутьФайла);
	Если Файл.Существует() Тогда
		УдалитьФайлы(ПутьФайла);
	КонецЕсли;
КонецПроцедуры

// Если источник папка, то он будет скопирован в приемник, иначе скопированы файлы в применик. 
//
// Параметры:
//  Источник - Строка - путь файла или каталога.
//	Приемник - Строка - каталог назначения.
//	ВключаяПодкаталоги - Булево - копировать для каталогов все подкаталоги (истина по умолчанию).
//	УдалитьПослеКопирования - Булево - файлы из источника, будут удалены после удачного копирования (ложь по умолчанию).
//
//  Возвращаемое значение:
//   Булево - если файлы скопированы успешно, то Истина.
//
Функция КопироватьФайлы(Знач Источник, Знач Приемник, Знач ВключаяПодкаталоги = Истина,
	Знач УдалитьПослеКопирования = Ложь) Экспорт
	
	Если КаталогСуществует(Источник) Тогда
		Источник = АбсолютныйПуть(Источник);
	Иначе
		Источник = УбратьКавычкиВокругПути(Источник);		
	КонецЕсли;
	Приемник = АбсолютныйПуть(Приемник);
	ОбеспечитьКаталог(Приемник);
	
	Если ВРег(Источник) = ВРег(Приемник) Тогда
		Лог.Предупреждение("Источник и приемник копирования файлов совпадают <%1>. Копирование не выполнено", 
			Источник);
		Возврат Истина;
	КонецЕсли;

	Если КаталогСуществует(Источник) Тогда
		ПутьИсточника = Источник;
		Маска = "*";
	Иначе
		Файл = Новый Файл(Источник);
		ПутьИсточника = АбсолютныйПуть(Файл.Путь);		
		Маска = Файл.Имя;
	КонецЕсли;

	Если НЕ КаталогСуществует(ПутьИсточника) Тогда
		Лог.Предупреждение("Каталог <%1> не существует. Копирование не выполнено", ПутьИсточника);
		Возврат Истина;
	КонецЕсли;

	Файлы = НайтиФайлы(ПутьИсточника, Маска, ВключаяПодкаталоги);
	Если УдалитьПослеКопирования = Истина Тогда
		Текст = "Файл <%1> перемещен в <%2>";
	Иначе
		Текст = "Файл <%1> скопирован в <%2>";
	КонецЕсли;
	
	Количество = 0;
	Для Каждого Файл Из Файлы Цикл

		ФайлКопирования = СтрЗаменить(Файл.ПолноеИмя, ПутьИсточника, Приемник);
		ПутьФайла = Новый Файл(ФайлКопирования);
		ПутьФайлаКопирования = ПутьФайла.ПолноеИмя;

		Если Файл.ЭтоКаталог() Тогда
			ОбеспечитьКаталог(ПутьФайлаКопирования);
		Иначе			
			ОбеспечитьКаталог(Файл.Путь);

			Если НРег(Файл.ПолноеИмя) = НРег(ФайлКопирования) Тогда
				Лог.Предупреждение("Файл источник <%1> не скопирован, так как совпадает с приемником", Файл.ПолноеИмя);
				Продолжить;
			КонецЕсли;

			Попытка
				КопироватьФайл(Файл.ПолноеИмя, ФайлКопирования);
			Исключение
				Лог.Предупреждение("Файл <%1> не скопирован", Файл.ПолноеИмя);
				Возврат Ложь;
			КонецПопытки;			
			
			Если УдалитьПослеКопирования = Истина Тогда
				БезопасноУдалитьФайл(Файл.ПолноеИмя);
			КонецЕсли;
			Количество = Количество + 1;
			Лог.Информация(Текст, Файл.ПолноеИмя, ФайлКопирования);
		КонецЕсли;
	КонецЦикла;

	Если УдалитьПослеКопирования = Истина Тогда
		Если КаталогСуществует(Источник) Тогда
			БезопасноУдалитьФайл(ПутьИсточника);
		КонецЕсли;
		Текст = "Файлы перемещены в <%1> Количество: %2";
	Иначе
		Текст = "Файлы скопированы в <%1> Количество: %2";
	КонецЕсли;
	Лог.Информация(Текст, ПутьИсточника, Количество);

	Возврат Истина;

КонецФункции

// Это маска файла
//
// Параметры:
//	- МаскаФайла - Строка - Маска файла
//
//  Возвращаемое значение:
//   Булево - Это маска файла
Функция ЭтоМаскаФайла(Знач МаскаФайла) Экспорт

	Возврат СтрНайти(МаскаФайла, "*") > 0 ИЛИ СтрНайти(МаскаФайла, "?") > 0;

КонецФункции

// Получить путь из маски файла
//
// Параметры:
//	- МаскаФайла - Строка - Маска файла
//
// Возвращаемое значение:
//	Строка - Путь до слеша. Пример: ПутьИзМаскиФайла("C:\temp\*.zip") => "C:\temp\"
Функция ПутьИзМаскиФайла(Знач МаскаФайла) Экспорт

	Индекс1 = СтрНайти(МаскаФайла, "*");
	Индекс2 = СтрНайти(МаскаФайла, "?");
	Если Индекс1 = 0 И Индекс2 = 0 Тогда
		Возврат МаскаФайла;
	Иначе
		Индекс = Мин(Индекс1, Индекс2);
		ИндексКонца = СтрНайти(МаскаФайла, ПолучитьРазделительПути(), НаправлениеПоиска.СКонца, Индекс);
		Если ИндексКонца > 0 Тогда
			Возврат Лев(МаскаФайла, ИндексКонца);
		Иначе
			ВызватьИсключение "Ошибка получения пути из маски";
		КонецЕсли;
	КонецЕсли;

КонецФункции

// Поиск файлов в источнике по маске и копирование в приемник. 
//
// Параметры:
//  Источник - Строка - путь файла или каталога.
//	Маска - Строка - маска файлов
//	Приемник - Строка - каталог назначения.
//	ВключаяПодкаталоги - Булево - копировать для каталогов все подкаталоги (истина по умолчанию).
//	УдалитьПослеКопирования - Булево - файлы из источника, будут удалены после удачного копирования (ложь по умолчанию).
//
//  Возвращаемое значение:
//   Булево - если файлы скопированы успешно, то Истина.
//
Функция НайтиИСкопироватьФайлы(Знач Источник, Знач Маска, Знач Приемник, Знач ВключаяПодкаталоги = Истина,
	Знач УдалитьПослеКопирования = Ложь) Экспорт

	Источник = АбсолютныйПуть(Источник);
	Если НЕ КаталогСуществует(Источник) Тогда
		Лог.Предупреждение("Каталог <%1> не существует. Копирование не выполнено", Источник);
		Возврат Истина;
	КонецЕсли;
	Приемник = АбсолютныйПуть(Приемник);
	ОбеспечитьКаталог(Приемник);
	
	Если ВРег(Источник) = ВРег(Приемник) Тогда
		Лог.Предупреждение("Источник и приемник копирования файлов совпадают <%1>. Копирование не выполнено", 
			Источник);
		Возврат Истина;
	КонецЕсли;

	Файлы = НайтиФайлы(Источник, Маска, ВключаяПодкаталоги);
	Если УдалитьПослеКопирования = Истина Тогда
		Текст = "Файл <%1> перемещен в <%2>";
	Иначе
		Текст = "Файл <%1> скопирован в <%2>";
	КонецЕсли;
	
	Количество = 0;
	Для Каждого Файл Из Файлы Цикл
		Если Файл.ЭтоФайл() Тогда
			ФайлКопирования = ОбъединитьПути(Приемник, Файл.Имя);
			Попытка
				КопироватьФайл(Файл.ПолноеИмя, ФайлКопирования);
			Исключение
				Лог.Предупреждение("Файл <%1> не скопирован", Файл.ПолноеИмя);
				Возврат Ложь;
			КонецПопытки;			
			
			Если УдалитьПослеКопирования = Истина Тогда
				БезопасноУдалитьФайл(Файл.ПолноеИмя);
			КонецЕсли;
			Количество = Количество + 1;
			Лог.Информация(Текст, Файл.ПолноеИмя, ФайлКопирования);
		КонецЕсли;
	КонецЦикла;

	Если УдалитьПослеКопирования = Истина Тогда
		Текст = "Файлы перемещены в <%1> Количество: %2";
	Иначе
		Текст = "Файлы скопированы в <%1> Количество: %2";
	КонецЕсли;
	Лог.Информация(Текст, Приемник, Количество);

	Возврат Истина;

КонецФункции

// Возвращает строковое представление размера файла.
//
// Параметры:
//  РазмерЧислом - Число - числовой размер файла.
//
//  Возвращаемое значение:
//   Строка - если файлы скопированы успешно, то Истина.
//
Функция ПредставлениеРазмераФайла(Знач РазмерЧислом) Экспорт

	РазмерКб = 1024;
	ФорматЧисла = "ЧДЦ=1";

	Если РазмерЧислом < РазмерКб Тогда
		Возврат Формат(РазмерЧислом, ФорматЧисла) + " " + НСтр("ru = 'байт'");
	ИначеЕсли РазмерЧислом < РазмерКб * РазмерКб Тогда
		Возврат Формат(РазмерЧислом / РазмерКб, ФорматЧисла) + " " + НСтр("ru = 'КБ'");
	ИначеЕсли РазмерЧислом < РазмерКб * РазмерКб * РазмерКб Тогда
		Возврат Формат(РазмерЧислом / (РазмерКб * РазмерКб), ФорматЧисла) + " " + НСтр("ru = 'МБ'");
	Иначе
		Возврат Формат(РазмерЧислом / (РазмерКб * РазмерКб * РазмерКб), ФорматЧисла) + " " + НСтр("ru = 'ГБ'");
	КонецЕсли;

КонецФункции

Лог = ПараметрыСистемы.Лог();