// BSLLS:MissingParameterDescription-off
// BSLLS:UnusedParameters-off
// BSLLS:UnusedLocalMethod-off
Процедура ПриЗагрузкеБиблиотеки(Знач Путь, СтандартнаяОбработка, Отказ)
	
	СтандартнаяОбработка = Ложь;
	Файлы = НайтиФайлы(Путь, "*.*");
	Для Каждого Файл Из Файлы Цикл
		ДобавитьМакет(Файл.ПолноеИмя, СтрШаблон("/Макеты/%1", Файл.ИмяБезРасширения));
	КонецЦикла;

КонецПроцедуры
// BSLLS:UnusedLocalMethod-on
// BSLLS:UnusedParameters-on
// BSLLS:MissingParameterDescription-on