#Область СлужебныеПроцедурыИФункции

Функция ТекДата() Экспорт
    ЧасовыеПояса = ПолучитьДопустимыеЧасовыеПояса();
	авав = ЧасовыеПояса[96];
	УстановитьЧасовойПоясСеанса(ЧасовыеПояса[96]);
	Возврат ТекущаяДатаСеанса();
КонецФункции

#КонецОбласти