

//@skip-check module-region-empty
#Область ПрограммныйИнтерфейс

// Код процедур и функций

#КонецОбласти
//@skip-check module-region-empty
#Область СлужебныйПрограммныйИнтерфейс

// Код процедур и функций

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура ЦиклУдалений(ПараметрыПроцедуры) Экспорт
	
	МассивОтбор = Новый Массив();
	Массив = Новый Массив();
	МассивОтбор.Добавить(Метаданные.Справочники.МероприятияПредприятия);

	НачатьТранзакцию();
	УдалитьОбъекты(ПараметрыПроцедуры,Ложь,,Массив,МассивОтбор);
	ЗафиксироватьТранзакцию();
	
	
КонецПроцедуры

#КонецОбласти