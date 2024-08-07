#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	НачалоМесяцаОтображение = НачалоДня(ТекущаяДата());	
	КонецМесяцаОтображение =  КонецДня(НачалоМесяцаОтображение + 3024000);
	ПланировщикМероприятийП = ПланировщикМероприятий;
	ПланировщикМероприятийП.НачалоПериодаОтображения = НачалоМесяцаОтображение;
	ПланировщикМероприятийП.КонецПериодаОтображения = КонецМесяцаОтображение;
	
	ПланировщикМероприятийП.ТекущиеПериодыОтображения.Добавить(ПланировщикМероприятийП.НачалоПериодаОтображения , ПланировщикМероприятийП.КонецПериодаОтображения );
	Оповестить("МероприятияПроекта");
КонецПроцедуры

&НаКлиенте
Процедура СписокМероприятийКоманда(Команда)
	ФормаСпискаМероприятий = ПолучитьФорму("Справочник.МероприятияПредприятия.ФормаСписка");
	ФормаСпискаМероприятий.Открыть();
КонецПроцедуры

&НаСервереБезКонтекста
Функция  ОбновитьМероприятияКомандаНаСервере()
	ЗапросМероприятий = Новый Запрос;
	ЗапросМероприятий.УстановитьПараметр("НачалоНедели", НачалоДня(ТекущаяДата()));
	ЗапросМероприятий.УстановитьПараметр("КонецНедели", КонецДня(НачалоДня(ТекущаяДата()) + 3024000));
	ЗапросМероприятий.Текст = "ВЫБРАТЬ
	|	МероприятияПредприятия.Ссылка КАК Ссылка,
	|	МероприятияПредприятия.Наименование КАК Наименование,
	|	МероприятияПредприятия.ДатаНачалаМероприятия КАК ДатаНачалаМероприятия,
	|	МероприятияПредприятия.ДатаОкончанияМероприятия КАК ДатаОкончанияМероприятия
	|ИЗ
	|	Справочник.МероприятияПредприятия КАК МероприятияПредприятия
	|ГДЕ
	|	МероприятияПредприятия.ДатаОкончанияМероприятия МЕЖДУ &НачалоНедели И &КонецНедели";
	ЗапросМероприятийРезультат = ЗапросМероприятий.Выполнить().Выгрузить();
	
	МассивСтруктурМероприятий = Новый Массив;
	Для Каждого Мероприятие Из ЗапросМероприятийРезультат Цикл
		СтруктураМероприятия = Новый Структура("Ссылка, Наименование, ДатаНачалаМероприятия, ДатаОкончанияМероприятия");
		СтруктураМероприятия.Вставить("Ссылка", Мероприятие.Ссылка);
		СтруктураМероприятия.Вставить("Наименование", Мероприятие.Наименование);
		СтруктураМероприятия.Вставить("ДатаНачалаМероприятия", Мероприятие.ДатаНачалаМероприятия);
		СтруктураМероприятия.Вставить("ДатаОкончанияМероприятия", Мероприятие.ДатаОкончанияМероприятия);
		МассивСтруктурМероприятий.Добавить(СтруктураМероприятия);
		
	КонецЦикла;
	
	Возврат МассивСтруктурМероприятий;
	
КонецФункции

&НаКлиенте
Процедура ОбновитьМероприятияКоманда(Команда)
	МероприятияНаНеделю = ОбновитьМероприятияКомандаНаСервере();
	ПланировщикМероприятий.Элементы.Очистить();
	Для Каждого Мероприятия Из МероприятияНаНеделю Цикл
		НовоеМероприятие = ПланировщикМероприятий.Элементы.Добавить(Мероприятия.ДатаНачалаМероприятия,Мероприятия.ДатаОкончанияМероприятия);
		НовоеМероприятие.Текст = Мероприятия.Наименование;
		НовоеМероприятие.Значение = ПолучитьНавигационнуюСсылку(Мероприятия.Ссылка);
	КонецЦикла;
	Оповестить("ИзменилсяСписокМероприятий");
	
	
КонецПроцедуры





&НаКлиенте
Процедура ПланировщикМероприятийПередНачаломБыстрогоРедактирования(Элемент, СтандартнаяОбработка)
	СтандартнаяОбработка = Ложь;
	ПерейтиПоНавигационнойСсылке(Элемент.ВыделенныеЭлементы[0].Значение);
КонецПроцедуры





&НаКлиенте
Процедура ОбработкаОповещения(ИмяСобытия, Параметр, Источник) Экспорт
	Если ИмяСобытия = "МероприятияПроекта" Тогда
		//ОбработкаОповещенияНаСервере(Параметр);
		ОбновитьМероприятияКоманда(Неопределено);				
	КонецЕсли;
	Если ИмяСобытия = "ИзмененыВстречи" Тогда
		ОбновитьМероприятияКоманда(Неопределено);				
	КонецЕсли;
	
	
КонецПроцедуры

&НаКлиенте
Процедура МероприятияСегодняКоманда(Команда)
	Элементы.Группа1.Видимость = Ложь;
	Элементы.Группа2.Видимость = Истина;
	ПланировщикМероприятийП = ПланировщикМероприятий;
	ПланировщикМероприятийП.ТекущиеПериодыОтображения.Очистить();
	НачалоМесяцаОтображение = НачалоДня(ТекущаяДата());	
	КонецМесяцаОтображение =  КонецДня(ТекущаяДата());	
	ПланировщикМероприятийП.НачалоПериодаОтображения = НачалоМесяцаОтображение;
	ПланировщикМероприятийП.КонецПериодаОтображения = КонецМесяцаОтображение;
	ПланировщикМероприятийП.ТекущиеПериодыОтображения.Добавить(ПланировщикМероприятийП.НачалоПериодаОтображения,ПланировщикМероприятийП.КонецПериодаОтображения); 
	ПланировщикМероприятийП.ШкалаВремени.Положение = ПоложениеШкалыВремени.Лево;
	Значение = ПланировщикМероприятийП.ШкалаВремени.Элементы.Получить(0);
	Значение.Кратность = 10;
	ПланировщикМероприятийП.МинимальнаяВысотаСтроки = 2;
	
КонецПроцедуры

&НаКлиенте
Процедура ЗакрытьМероприятияСегодня(Команда)
	Элементы.Группа2.Видимость = Ложь;
	Элементы.Группа1.Видимость = Истина;
	ПланировщикМероприятийП = ПланировщикМероприятий;
	ПланировщикМероприятийП.ТекущиеПериодыОтображения.Очистить();
	НачалоМесяцаОтображение = НачалоДня(ТекущаяДата());	
	КонецМесяцаОтображение =  КонецДня(НачалоМесяцаОтображение) + 3024000;	
	ПланировщикМероприятийП.НачалоПериодаОтображения = НачалоМесяцаОтображение;
	ПланировщикМероприятийП.КонецПериодаОтображения = КонецМесяцаОтображение;
	ПланировщикМероприятийП.ШкалаВремени.Положение = ПоложениеШкалыВремени.Верх;
	ПланировщикМероприятийП.МинимальнаяШиринаКолонки = 7;
	ПланировщикМероприятийП.МинимальнаяВысотаСтроки = 3;
	Значение = ПланировщикМероприятийП.ШкалаВремени.Элементы.Получить(0);
	Значение.Кратность = 30;
	ПланировщикМероприятийП.ТекущиеПериодыОтображения.Добавить(ПланировщикМероприятийП.НачалоПериодаОтображения,ПланировщикМероприятийП.КонецПериодаОтображения);
	
КонецПроцедуры

#КонецОбласти








