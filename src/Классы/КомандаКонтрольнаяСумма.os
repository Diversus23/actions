﻿Перем Лог;

Процедура ЗарегистрироватьКоманду(Знач ИмяКоманды, Знач Парсер) Экспорт
    
	ТекстКоманды = "Выводит в консоль контрольную сумма файла или директории в формате MD5";
	ОписаниеКоманды = Парсер.ОписаниеКоманды(ИмяКоманды, ТекстКоманды);
	
	Парсер.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды,
		"-file",
		"Исходный файл или директория (обязательный)");

	Парсер.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды,
		"-mask",
		"Маска файлов для контрольной суммы, используется если указана директория.
		|Если параметр не задан для директории, то контрольная сумма будет сформирована по всем файлам (необязательный)");
		
	Парсер.ДобавитьКоманду(ОписаниеКоманды);

КонецПроцедуры

Функция ВыполнитьКоманду(Знач Параметры) Экспорт
    
	ВозможныйРезультат = МенеджерКомандПриложения.РезультатыКоманд();
	Лог = ПараметрыСистемы.ПолучитьЛог();
	
	ИмяФайла = Параметры["-file"];
	Если НЕ ЗначениеЗаполнено(ИмяФайла) Тогда
		Лог.Ошибка("Не заполнен параметр ""-file"" - полный путь к файлу или директории");
		Возврат ВозможныйРезультат.НеверныеПараметры;
	КонецЕсли;

	Маска = Параметры["-mask"];
	Если НЕ ЗначениеЗаполнено(Маска) Тогда
		Маска = "*";
	КонецЕсли;	

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
	Хеш = НРег(СтрЗаменить(Хеш, " ", ""));
	Сообщить(Хеш);			

    Возврат ВозможныйРезультат.Успех;
    
КонецФункции