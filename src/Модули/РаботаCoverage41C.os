﻿#Использовать logos

// Лог системы
Перем Лог;

#Область ПрограммныйИнтерфейс

// Проверяет установку EDT
//
// Возвращаемое значение:
//	Булево - EDT установлено
//
Функция ПроверитьУстановкуCoverage41C() Экспорт

	Возврат ЗначениеЗаполнено(ОбщегоНазначения.НайтиПриложениеВСистеме("Coverage41"));

КонецФункции

#КонецОбласти

Лог = ПараметрыСистемы.Лог();