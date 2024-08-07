
&НаКлиенте
Процедура РасчитатьСпринтыКоманда(Команда)
	РасчетСВыходными = Объект.СпринтыСУчетомВыходных;	
	Если РасчетСВыходными = Истина Тогда
		РасчетСпринтовСУчетомВыходных();
	Иначе
		РасчетСпринтовБезУчетаВыходных();		
	КонецЕсли;
	
КонецПроцедуры 

&НаКлиенте
Процедура РасчетСпринтовСУчетомВыходных()
	ИмяПроекта = Объект.Наименование;
	ДлиннаСпринтаДляРасчета = Объект.ПоКакойДлиннеСчитатьСпринт - 1;
	Объект.СпринтыПроекта.Очистить();
	Объект.РасчетДэйли.Очистить();
	Объект.РасчетРетроспектив.Очистить();
	Объект.СпринтРевью.Очистить();
	
	НачалоПроекта = Объект.ДатаНачалаПроекта;
	ОкончаниеПроекта = Объект.ДатаОкончанияПроекта;
	РабочиеДниВПроекте = Новый Массив;
	ДатаЦикла = НачалоПроекта;
	//В какие даты посчитать спринты(за исключением сб и вс, короче оставляем дни периода без выходных);
	//Это для того чтобы избежать сложных конструкций и сначала получить рабочии дни всего проекта
	Пока ДатаЦикла <= ОкончаниеПроекта     Цикл
		ДеньНедели = Формат(ДатаЦикла, "ДФ = ддд");
		Если ДеньНедели <> "Сб" И ДеньНедели <> "Вс" Тогда
			СтруктураДатаДень = Новый Структура;
			СтруктураДатаДень.Вставить("Дата",ДатаЦикла);
			СтруктураДатаДень.Вставить("ДеньНедели", Формат(ДатаЦикла, "ДФ = ддд"));
			РабочиеДниВПроекте.Добавить(СтруктураДатаДень);
			
		КонецЕсли;
		ДатаЦикла = ДатаЦикла + 86400;
		
		
	КонецЦикла;
	
	
	
	МассивЛинейкаСпринтов = Новый Массив;
	НомерСпринта = 1;
	Для каждого ДниСпринтов Из РабочиеДниВПроекте Цикл
		Если МассивЛинейкаСпринтов.Количество() <= ДлиннаСпринтаДляРасчета Тогда
			СтруктураСпринтов = Новый Структура;
			СтруктураСпринтов.Вставить("НомерСпринта",НомерСпринта);
			СтруктураСпринтов.Вставить("Дата",ДниСпринтов.Дата);
			МассивЛинейкаСпринтов.Добавить(СтруктураСпринтов);
		Иначе
			ТаблицаСпринтов = Объект.СпринтыПроекта.Добавить();
			ТаблицаРетро = Объект.РасчетРетроспектив.Добавить();
			ТаблицаСпринтРевью = Объект.СпринтРевью.Добавить();
			ТаблицаСпринтов.НомерСпринта = МассивЛинейкаСпринтов[0].НомерСпринта;
			ТаблицаСпринтов.ДатаНачалаСпринта = МассивЛинейкаСпринтов[0].Дата;
			ПоследнийИндекс = МассивЛинейкаСпринтов.Получить(МассивЛинейкаСпринтов.Количество() - 1); 
			ТаблицаСпринтов.ДатаОкончанияСпринта = ПоследнийИндекс.Дата;
			ТаблицаСпринтов.ДлиннаСпринта = МассивЛинейкаСпринтов.Количество(); 
			ТаблицаСпринтов.ИмяСпринта = Строка ("Спринт " + МассивЛинейкаСпринтов[0].НомерСпринта + ":" + ВРег(" _укажите цель спринта_ ") + " " + Формат(МассивЛинейкаСпринтов[0].Дата,"ДЛФ = Д") + " - " + Формат(ПоследнийИндекс.Дата,"ДЛФ = Д"));
			ааа = ТаблицаСпринтов.ИмяСпринта;
			//Здесь добавляем ретроспективу на каждый последний день спринта
			ТаблицаРетро.ДатаРетроспективы = ПоследнийИндекс.Дата;
			ТаблицаРетро.ДеньНеделиРетро = Формат(ТаблицаРетро.ДатаРетроспективы, "ДФ = ддд");
			ТаблицаРетро.ДлительностьРетро = 60;
			//Здесь добавляем ретроспективу на каждый последний день спринта
			
			//Здесь добавляем спринт ревью на каждый последний день спринта
			ТаблицаСпринтРевью.ДатаРевью = ПоследнийИндекс.Дата;
			ТаблицаСпринтРевью.ДеньНеделиРевью = Формат(ТаблицаРетро.ДатаРетроспективы, "ДФ = ддд");
			ТаблицаСпринтРевью.ДлительностьРевью = 60;
			//Здесь добавляем спринт ревью на каждый последний день спринта
			
			МассивЛинейкаСпринтов.Очистить();
			НомерСпринта = НомерСпринта + 1; 
			СтруктураСпринтов = Новый Структура;
			СтруктураСпринтов.Вставить("НомерСпринта",НомерСпринта);
			СтруктураСпринтов.Вставить("Дата",ДниСпринтов.Дата);
			МассивЛинейкаСпринтов.Добавить(СтруктураСпринтов);
		КонецЕсли;		
	КонецЦикла;
	
	//Оставшиеся дни не вошедшие в длинну спринта, делаем спринт из остатков
	ТаблицаСпринтов = Объект.СпринтыПроекта.Добавить();
	ТаблицаРетро = Объект.РасчетРетроспектив.Добавить();
	ТаблицаСпринтРевью = Объект.СпринтРевью.Добавить();
	
	ТаблицаСпринтов.НомерСпринта = МассивЛинейкаСпринтов[0].НомерСпринта;
	ТаблицаСпринтов.ДатаНачалаСпринта = МассивЛинейкаСпринтов[0].Дата; 
	ПоследнийИндексПоследнегоСпринта = МассивЛинейкаСпринтов.Получить(МассивЛинейкаСпринтов.Количество() - 1);
	ТаблицаСпринтов.ДатаОкончанияСпринта = ПоследнийИндексПоследнегоСпринта.Дата;
	
	ТаблицаСпринтов.ДлиннаСпринта = МассивЛинейкаСпринтов.Количество();
	
	ТаблицаСпринтов.ИмяСпринта = Строка ("Спринт " + МассивЛинейкаСпринтов[0].НомерСпринта + ":" 
	+ ВРег(" _укажите цель спринта_ ") + " " + Формат(МассивЛинейкаСпринтов[0].Дата,"ДЛФ = Д") 
	+ " - " + Формат(ПоследнийИндекс.Дата,"ДЛФ = Д"));
	//Здесь добавляем ретроспективу на каждый последний день спринта
	ТаблицаРетро.ДатаРетроспективы = ПоследнийИндексПоследнегоСпринта.Дата;
	ТаблицаРетро.ДеньНеделиРетро = Формат(ПоследнийИндексПоследнегоСпринта.Дата, "ДФ = ддд");
	ТаблицаРетро.ДлительностьРетро = 7;
	//Здесь добавляем ретроспективу на каждый последний день спринта
	
	//Здесь добавляем спринт ревью на каждый последний день спринта остатки в линейке
	ТаблицаСпринтРевью.ДатаРевью = ПоследнийИндексПоследнегоСпринта.Дата;
	ТаблицаСпринтРевью.ДеньНеделиРевью = Формат(ПоследнийИндексПоследнегоСпринта.Дата, "ДФ = ддд");
	ТаблицаСпринтРевью.ДлительностьРевью = 7;
	//Здесь добавляем спринт ревью на каждый последний день спринта остатки в линейке
	
	
	
	
	//Создаем дэйли на каждый рабочий день спринта
	
	Для каждого ДниСпринтов Из РабочиеДниВПроекте Цикл
		ТаблицаДэйли = Объект.РасчетДэйли.Добавить();
		ТаблицаДэйли.ДатаДэйли = ДниСпринтов.Дата;
		ТаблицаДэйли.ДеньНеделиДэйли = ДниСпринтов.ДеньНедели;
		ТаблицаДэйли.ДлительностьДэйли = 30;
		
		
		
	КонецЦикла;	
	
КонецПроцедуры




&НаКлиенте
Процедура РасчетСпринтовБезУчетаВыходных()
	ДлиннаСпринтаДляРасчета = Объект.ПоКакойДлиннеСчитатьСпринт - 1;
	Объект.СпринтыПроекта.Очистить();
	Объект.РасчетДэйли.Очистить();
	Объект.РасчетРетроспектив.Очистить();
	Объект.СпринтРевью.Очистить();
	
	
	
	НачалоПроекта = Объект.ДатаНачалаПроекта;
	ОкончаниеПроекта = Объект.ДатаОкончанияПроекта;
	РабочиеДниВПроекте = Новый Массив;
	ДатаЦикла = НачалоПроекта;
	
	//В какие даты посчитать спринты(за исключением сб и вс, короче оставляем дни периода без выходных);
	//Это для того чтобы избежать сложных конструкций и сначала получить рабочии дни всего проекта
	Пока ДатаЦикла <= ОкончаниеПроекта     Цикл
		ДеньНедели = Формат(ДатаЦикла, "ДФ = ддд");
		
		СтруктураДатаДень = Новый Структура;
		СтруктураДатаДень.Вставить("Дата",ДатаЦикла);
		СтруктураДатаДень.Вставить("ДеньНедели", Формат(ДатаЦикла, "ДФ = ддд"));
		РабочиеДниВПроекте.Добавить(СтруктураДатаДень);
		
		
		ДатаЦикла = ДатаЦикла + 86400;
		
		
	КонецЦикла;
	
	
	
	МассивЛинейкаСпринтов = Новый Массив;
	НомерСпринта = 1;
	Для каждого ДниСпринтов Из РабочиеДниВПроекте Цикл
		Если МассивЛинейкаСпринтов.Количество() <= ДлиннаСпринтаДляРасчета Тогда
			СтруктураСпринтов = Новый Структура;
			СтруктураСпринтов.Вставить("НомерСпринта",НомерСпринта);
			СтруктураСпринтов.Вставить("Дата",ДниСпринтов.Дата);
			МассивЛинейкаСпринтов.Добавить(СтруктураСпринтов);
		Иначе
			ТаблицаСпринтов = Объект.СпринтыПроекта.Добавить();
			ТаблицаРетро = Объект.РасчетРетроспектив.Добавить();
			ТаблицаСпринтРевью = Объект.СпринтРевью.Добавить();
			
			ТаблицаСпринтов.НомерСпринта = МассивЛинейкаСпринтов[0].НомерСпринта;
			ТаблицаСпринтов.ДатаНачалаСпринта = МассивЛинейкаСпринтов[0].Дата;
			ПоследнийИндекс = МассивЛинейкаСпринтов.Получить(МассивЛинейкаСпринтов.Количество() - 1); 
			ТаблицаСпринтов.ДатаОкончанияСпринта = ПоследнийИндекс.Дата;
			ТаблицаСпринтов.ДлиннаСпринта = МассивЛинейкаСпринтов.Количество();
			ТаблицаСпринтов.ИмяСпринта = Строка ("Спринт " + МассивЛинейкаСпринтов[0].НомерСпринта + ":" + ВРег(" _укажите цель спринта_ ") + " " + Формат(МассивЛинейкаСпринтов[0].Дата,"ДЛФ = Д") + " - " + Формат(ПоследнийИндекс.Дата,"ДЛФ = Д"));
			
			//Здесь добавляем ретроспективу на каждый последний день спринта
			ТаблицаРетро.ДатаРетроспективы = ПоследнийИндекс.Дата;
			ТаблицаРетро.ДеньНеделиРетро = Формат(ТаблицаРетро.ДатаРетроспективы, "ДФ = ддд");
			ТаблицаРетро.ДлительностьРетро = 7;
			//Здесь добавляем ретроспективу на каждый последний день спринта
			
			//Здесь добавляем спринт ревью на каждый последний день спринта
			ТаблицаСпринтРевью.ДатаРевью = ПоследнийИндекс.Дата;
			ТаблицаСпринтРевью.ДеньНеделиРевью = Формат(ТаблицаРетро.ДатаРетроспективы, "ДФ = ддд");
			ТаблицаСпринтРевью.ДлительностьРевью = 7;
			//Здесь добавляем спринт ревью на каждый последний день спринта
			
			МассивЛинейкаСпринтов.Очистить();
			НомерСпринта = НомерСпринта + 1; 
			СтруктураСпринтов = Новый Структура;
			СтруктураСпринтов.Вставить("НомерСпринта",НомерСпринта);
			СтруктураСпринтов.Вставить("Дата",ДниСпринтов.Дата);
			МассивЛинейкаСпринтов.Добавить(СтруктураСпринтов);			
		КонецЕсли;		
	КонецЦикла;
	
	//Оставшиеся дни не вошедшие в длинну спринта, делаем спринт из остатков
	ТаблицаСпринтов = Объект.СпринтыПроекта.Добавить();
	ТаблицаРетро = Объект.РасчетРетроспектив.Добавить();
	ТаблицаСпринтРевью = Объект.СпринтРевью.Добавить();
	
	ТаблицаСпринтов.НомерСпринта = МассивЛинейкаСпринтов[0].НомерСпринта;
	ТаблицаСпринтов.ДатаНачалаСпринта = МассивЛинейкаСпринтов[0].Дата; 
	ПоследнийИндексПоследнегоСпринта = МассивЛинейкаСпринтов.Получить(МассивЛинейкаСпринтов.Количество() - 1);
	ТаблицаСпринтов.ДатаОкончанияСпринта = ПоследнийИндексПоследнегоСпринта.Дата;
	ТаблицаСпринтов.ДлиннаСпринта = МассивЛинейкаСпринтов.Количество();
	
	ТаблицаСпринтов.ИмяСпринта = Строка ("Спринт " + МассивЛинейкаСпринтов[0].НомерСпринта + ":" 
	+ ВРег(" _укажите цель спринта_ ") + " " + Формат(МассивЛинейкаСпринтов[0].Дата,"ДЛФ = Д") 
	+ " - " + Формат(ПоследнийИндекс.Дата,"ДЛФ = Д"));
	
	//Здесь добавляем ретроспективу на каждый последний день спринта остатки в линейке
	ТаблицаРетро.ДатаРетроспективы = ПоследнийИндексПоследнегоСпринта.Дата;
	ТаблицаРетро.ДеньНеделиРетро = Формат(ПоследнийИндексПоследнегоСпринта.Дата, "ДФ = ддд");
	ТаблицаРетро.ДлительностьРетро = 7;
	//Здесь добавляем ретроспективу на каждый последний день спринта остатки в линейке
	
	//Здесь добавляем спринт ревью на каждый последний день спринта остатки в линейке
	ТаблицаСпринтРевью.ДатаРевью = ПоследнийИндексПоследнегоСпринта.Дата;
	ТаблицаСпринтРевью.ДеньНеделиРевью = Формат(ПоследнийИндексПоследнегоСпринта.Дата, "ДФ = ддд");
	ТаблицаСпринтРевью.ДлительностьРевью = 7;
	//Здесь добавляем спринт ревью на каждый последний день спринта остатки в линейке
	
	
	
	//Создаем дэйли на каждый рабочий день спринта
	Для каждого ДниСпринтов Из РабочиеДниВПроекте Цикл
		ТаблицаДэйли = Объект.РасчетДэйли.Добавить();
		ТаблицаДэйли.ДатаДэйли = ДниСпринтов.Дата;
		ТаблицаДэйли.ДеньНеделиДэйли = ДниСпринтов.ДеньНедели;
		ТаблицаДэйли.ДлительностьДэйли = 3;
		
		
	КонецЦикла;
КонецПроцедуры




//Получить список спринтов проекта для выбора
&НаКлиенте
Процедура ПланированиеСпринтовИмяСпринтаНачалоВыбора(Элемент, ДанныеВыбора, ВыборДобавлением, СтандартнаяОбработка)
	ТабличнаяЧастьСпринтов =  Объект.СпринтыПроекта;
	СписокСпринтов = Новый СписокЗначений;
	Для Каждого Спринт Из ТабличнаяЧастьСпринтов Цикл
		СписокСпринтов.Добавить(Спринт.ИмяСпринта,Спринт.ИмяСпринта); 
	КонецЦикла;
	
	ПослевыбораЭлементаСписка = Новый ОписаниеОповещения("ПослевыбораЭлементаСписка", ЭтотОбъект);
	СписокСпринтов.ПоказатьВыборЭлемента(ПослевыбораЭлементаСписка, "Выберите Sprint");
КонецПроцедуры

&НаКлиенте
Процедура ПослевыбораЭлементаСписка(ВыбранныйЭлемент, ДополнительныеПараметры) Экспорт
	ЭтотОбъект.ТекущийЭлемент.ТекущиеДанные.ИмяСпринта = ВыбранныйЭлемент.Значение;
КонецПроцедуры


//Добавляем в планировщик инвайт дэйли с зависимостью к проекту

&НаКлиенте
Процедура СоздатьВстречиВПланировщике()
	МассивСсылкаИмяПроекта = Новый Массив;
	МассивСсылкаИмяПроекта.Добавить(ПолучитьНавигационнуюСсылку(Объект.Ссылка));
	ИмяПроекта = ПолучитьПредставленияНавигационныхСсылок(МассивСсылкаИмяПроекта);
	ВсеДэйлики = Объект.РасчетДэйли;
	ВсеРевью = Объект.СпринтРевью;
	ВсеРетро = Объект.РасчетРетроспектив;
	НачалоПроекта = Объект.ДатаНачалаПроекта;
	КонецПроекта = Объект.ДатаОкончанияПроекта;
	
	
	МассивСтруктурМероприятий = Новый Массив;
	
	
	Для Каждого ДеньДэйли Из ВсеДэйлики Цикл
		СтруктураМероприятия = Новый Структура("Ссылка, Наименование, ДатаНачалаМероприятия, ДатаОкончанияМероприятия");
		НачалоДэйли = ДеньДэйли.ДатаДэйли + 32400;
		ОкончаниеДэйли = НачалоДэйли + 1800;
		СтруктураМероприятия.Вставить("Ссылка",ИмяПроекта[0].НавигационнаяСсылка);
		СтруктураМероприятия.Вставить("Наименование", "Дэйли по проекту " + " «" + ИмяПроекта[0].Текст + "»");
		СтруктураМероприятия.Вставить("ДатаНачалаМероприятия", НачалоДэйли);
		СтруктураМероприятия.Вставить("ДатаОкончанияМероприятия", ОкончаниеДэйли);
		МассивСтруктурМероприятий.Добавить(СтруктураМероприятия);
		
	КонецЦикла;
	
	Для Каждого ДеньРевью Из ВсеРевью Цикл
		СтруктураМероприятия = Новый Структура("Ссылка, Наименование, ДатаНачалаМероприятия, ДатаОкончанияМероприятия");
		НачалоДэйли = ДеньРевью.ДатаРевью + 43200;
		ОкончаниеДэйли = НачалоДэйли + 3600;
		
		СтруктураМероприятия.Вставить("Ссылка",ИмяПроекта[0].НавигационнаяСсылка);
		СтруктураМероприятия.Вставить("Наименование", "Спринт ревью по проекту" + " «" + ИмяПроекта[0].Текст + "»");
		СтруктураМероприятия.Вставить("ДатаНачалаМероприятия", НачалоДэйли);
		СтруктураМероприятия.Вставить("ДатаОкончанияМероприятия", ОкончаниеДэйли);
		МассивСтруктурМероприятий.Добавить(СтруктураМероприятия);		
	КонецЦикла;
	
	Для Каждого ДеньРетро Из ВсеРетро Цикл
		СтруктураМероприятия = Новый Структура("Ссылка, Наименование, ДатаНачалаМероприятия, ДатаОкончанияМероприятия");
		НачалоДэйли = ДеньРетро.ДатаРетроспективы + 57600;
		ОкончаниеДэйли = НачалоДэйли + 10800;
		
		СтруктураМероприятия.Вставить("Ссылка",ИмяПроекта[0].НавигационнаяСсылка);
		СтруктураМероприятия.Вставить("Наименование", "Ретро по спринту проекта " + " «" + ИмяПроекта[0].Текст + "»");
		СтруктураМероприятия.Вставить("ДатаНачалаМероприятия", НачалоДэйли);
		СтруктураМероприятия.Вставить("ДатаОкончанияМероприятия", ОкончаниеДэйли);
		МассивСтруктурМероприятий.Добавить(СтруктураМероприятия);		
	КонецЦикла;
	
	ЗаполнитьМероприятия(МассивСтруктурМероприятий);
	Оповестить("МероприятияПроекта");
	
КонецПроцедуры

&НаСервереБезКонтекста
Процедура ЗаполнитьМероприятия(МассивМероприятий)
	СоздатьВстерчиПотокиВызовСервера.СоздатьВстречиПараллельно(МассивМероприятий);
КонецПроцедуры




&НаСервереБезКонтекста
Процедура ИзменитьВстречиВПланирощикеКомандаНаСервере(СсылкаВстречи)
	ЗапросВстречКУдалению = Новый Запрос;
	ЗапросВстречКУдалению.УстановитьПараметр("УдалитьВстречу",СсылкаВстречи); 
	ЗапросВстречКУдалению.Текст = "ВЫБРАТЬ
	|	МероприятияПредприятия.Ссылка КАК Ссылка,
	|	МероприятияПредприятия.ВерсияДанных КАК ВерсияДанных,
	|	МероприятияПредприятия.ПометкаУдаления КАК ПометкаУдаления,
	|	МероприятияПредприятия.Код КАК Код,
	|	МероприятияПредприятия.Наименование КАК Наименование,
	|	МероприятияПредприятия.ДатаНачалаМероприятия КАК ДатаНачалаМероприятия,
	|	МероприятияПредприятия.ДатаОкончанияМероприятия КАК ДатаОкончанияМероприятия,
	|	МероприятияПредприятия.ОписаниеМероприятия КАК ОписаниеМероприятия,
	|	МероприятияПредприятия.СвязаноС КАК СвязаноС,
	|	МероприятияПредприятия.СсылкаНаСвязноС КАК СсылкаНаСвязноС,
	|	МероприятияПредприятия.Предопределенный КАК Предопределенный,
	|	МероприятияПредприятия.ИмяПредопределенныхДанных КАК ИмяПредопределенныхДанных
	|ИЗ
	|	Справочник.МероприятияПредприятия КАК МероприятияПредприятия
	|ГДЕ
	|	МероприятияПредприятия.СсылкаНаСвязноС = &УдалитьВстречу";
	РезультатЗапросВстречКУдалению = ЗапросВстречКУдалению.Выполнить().Выгрузить();
	МассивНаУдаление = Новый Массив;
	МассивНаУдаление.Добавить("Удалить");
	Для Каждого Мероприятие Из РезультатЗапросВстречКУдалению Цикл 
		УдалитьВстречу = Справочники.МероприятияПредприятия.НайтиПоКоду(Мероприятие.Код);		
		МассивНаУдаление.Добавить(УдалитьВстречу.Ссылка);
		
		
	КонецЦикла;
	УдалениеМероприятийВызовСервера.УдалитьВстречиПараллельно(МассивНаУдаление);
	
КонецПроцедуры 



&НаКлиенте
Процедура ИзменитьВстречиВПланирощикеКоманда(Команда)
	СсылкаВстречи = ПолучитьНавигационнуюСсылку(Объект.Ссылка);
	ИзменитьВстречиВПланирощикеКомандаНаСервере(СсылкаВстречи);
	Оповестить("ИзмененыВстречи");
КонецПроцедуры


//Добавляем в планировщик инвайт дэйли с зависимостью к проекту








