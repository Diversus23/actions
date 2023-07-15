#Использовать logos
#Использовать cli
#Использовать "."

// Обработчик выполнения команды
//
// Параметры:
//   КомандаПриложения - КомандаПриложения - Выполняемая команда
//
Процедура ВыполнитьКоманду(Знач КомандаПриложения) Экспорт
    
    КомандаПриложения.ВывестиСправку();
    
КонецПроцедуры

Процедура ВыполнитьПриложение(Приложение)

    Приложение.ДобавитьКоманду("allure",
        "Команды для работы с Allure",
        Новый Allure());

    Приложение.ДобавитьКоманду("allure-docker-service",
        "Команды для работы с Allure Docker Service",
        Новый AllureDockerService());

    Приложение.ДобавитьКоманду("autodoc",
        "Автоформирование документации по этому проекту Actions. Системная команда",
        Новый Autodoc());

    Приложение.ДобавитьКоманду("changelog",
        "Команды работы с ChangeLog.md",
        Новый ChangeLog());
    
    Приложение.ДобавитьКоманду("checksum",
        "Выводит в консоль контрольную сумма файла или директории в формате md5",
        Новый Checksum());

    Приложение.ДобавитьКоманду("coverage41c",
        "Команды для работы с Coverage41C для анализа покрытия кода",
        Новый Coverage41C());

    Приложение.ДобавитьКоманду("doctor",
        "Проверка среды actions и зависимостей. Информирует, что не установлено для работы.",
        Новый Doctor());

    Приложение.ДобавитьКоманду("edt",
        "Команды для работы с 1C:Enterprise Development Tools (EDT)",
        Новый Edt());

    Приложение.ДобавитьКоманду("fs",
        "Команды для работы с файловой системой",
        Новый Fs());

    Приложение.ДобавитьКоманду("ftp",
        "Команды для работы с FTP",
        Новый Ftp());

    Приложение.ДобавитьКоманду("http",
        "Команды работы с HTTP",
        Новый Http());

    Приложение.ДобавитьКоманду("infobase",
        "Команды для работы с информационными базами 1C",
        Новый InfoBase());

    Приложение.ДобавитьКоманду("json",
        "Команды для работы с json-файлами",
        Новый Json());

    Приложение.ДобавитьКоманду("newsletter",
        "Создание новостных рассылок через сторонние сервисы рассылок",
        Новый NewsLetter());    

    Приложение.ДобавитьКоманду("obfuscation",
        "Обфускация (запутывание) кода на языке 1С",
        Новый Obfuscation());

    Приложение.ДобавитьКоманду("pause",
        "Пауза в результате которой приложение ожидает некоторое время",
        Новый Pause());

    Приложение.ДобавитьКоманду("vanessa-automation",
		"Работа с тестированием и запуск тестов для информационной базы 1С с помощью Vanessa Automation",
		Новый VanessaAutomation());

    Приложение.ДобавитьКоманду("zip",
        "Команды работы с ZIP-архивами",
        Новый Zip());
        
    Приложение.Опция("verbose v", Ложь, "Вывод отладочной информации в процессе выполнения")
    .Флаговый()
    .ВОкружении("ACTIONS_VERBOSE");
    
    Приложение.Опция("settings s", "", "Путь к файлу настроек (по умолчанию: ../env.json)")
    .ТСтрока()
    .ВОкружении("ACTIONS_SETTINGS");
    
    Приложение.УстановитьОсновноеДействие(ЭтотОбъект);
    
    Приложение.Запустить(АргументыКоманднойСтроки);
    
КонецПроцедуры

// Функция - проверяет, что приложение запущено в режиме тестирования
//
// Возвращаемое значение:
//   Булево  - Истина - приложение запущено в режиме тестирования
//
Функция ЭтоТест()
    
    Попытка
        Возврат ЭтотОбъект.ЭтоТест;
    Исключение
        Возврат Ложь;
    КонецПопытки;
    
КонецФункции // ЭтоТест()

/////////////////////////////////////////////////////////////////////////

ПараметрыСистемы.Лог = Логирование.ПолучитьЛог(ПараметрыСистемы.ИмяЛогаСистемы());
ПараметрыСистемы.ЭтоWindows = ОбщегоНазначения.ЭтоWindows();

Попытка
    
    ПараметрыСистемы.Приложение = Новый КонсольноеПриложение(ПараметрыСистемы.ИмяПриложения(), 
        ПараметрыСистемы.ОписаниеПриложения());
    ПараметрыСистемы.Приложение.Версия("version", ПараметрыСистемы.Версия());

    ВыполнитьПриложение(ПараметрыСистемы.Приложение);
    
Исключение
    
    ПараметрыСистемы.Лог.КритичнаяОшибка(ОписаниеОшибки());
    ВременныеФайлы.Удалить();
    
    Если ЭтоТест() Тогда
        ВызватьИсключение ОписаниеОшибки();
    Иначе
        ЗавершитьРаботу(1);
    КонецЕсли;
    
КонецПопытки;