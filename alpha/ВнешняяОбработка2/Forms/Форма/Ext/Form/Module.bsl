﻿&НаСервере
Процедура ПрочитатьСтрокуОтвета(СтрокаОтвета)
	ЧтениеJSON = Новый ЧтениеJSON();
	ЧтениеJSON.УстановитьСтроку(СтрокаОтвета);
	Пока ЧтениеJSON.Прочитать() Цикл
		Сообщить(ЧтениеJSON.ТекущееЗначение);
	КонецЦикла;
	
    //ЧтениеJSON = Новый ЧтениеJSON();
    //ЧтениеJSON.УстановитьСтроку(СтрокаОтвета);
    //Результат = ПрочитатьJSON(ЧтениеJSON);
    //ЧтениеJSON.Закрыть();
        //Если Результат.ok = Истина Тогда
			//Для Каждого СтрокаРезультата Из Результат.result Цикл  
					
                   //Если СтрокаРезультата.message.text = "/start" Тогда
                   //      ВывестиПриветствие(СтрокаРезультата.message.chat.id)
                   //КонецЕсли; 
           //КонецЦикла;
    //КонецЕсли;

КонецПроцедуры

&НаКлиенте
Процедура Получить(Команда)
	Соединение = Новый HTTPСоединение("api.telegram.org",443,,,,, Новый ЗащищенноеСоединениеOpenSSL());
	
	Запрос = Новый HTTPЗапрос("/bot" + Токен + "/getMe");
 	Результат = Соединение.Получить(Запрос);  
	Строка = Результат.ПолучитьТелоКакСтроку("UTF8");
	ЭтотОбъект.Ответ.ДобавитьСтроку(Строка);
	
	json = новый чтениеjson;
	json.УстановитьСтроку(Строка);
	Данные = ПрочитатьJson(json);
	json.Закрыть();
	
	Если Данные.ok = Истина Тогда
		Строка = Данные.result.first_name;
	КонецЕсли;
	ЭтотОбъект.Ответ.ДобавитьСтроку(Строка);
	
	// --------------------------------------------
	Запрос = Новый HTTPЗапрос("/bot" + Токен + "/getUpdates");
 	Результат = Соединение.Получить(Запрос);  
	Строка = Результат.ПолучитьТелоКакСтроку("UTF8");
	ЭтотОбъект.Ответ.ДобавитьСтроку(Строка);
	
	json = новый чтениеjson;
	json.УстановитьСтроку(Строка);
	Данные = ПрочитатьJson(json);
	json.Закрыть();
	
	Если Данные.ok = Истина Тогда
		//Резалт = Новый Массив;
		//Резалт = Данные.result;
		i = 5;
		Для каждого Ответ2 из Данные.result Цикл  
			Ответ2 = Ответ2;
			Сообщение2 = Ответ2.message;
			ОтКого = Сообщение2.from;
			Строка = ОтКого.first_name+" ("+ОтКого.username+", "+ОтКого.id+"): "+Сообщение2.text; 
			ЭтотОбъект.Ответ.ДобавитьСтроку(Строка);
		КонецЦикла;
	КонецЕсли;
		
	i = 5;
	
	
КонецПроцедуры	

&НаКлиенте
Процедура ПолучитьТокен(Команда)
	Текст = Новый ТекстовыйДокумент;
	Текст.Прочитать("C:\tmp\token.txt");
	//Сообщить(Текст.ПолучитьСтроку(1));
	Токен = Текст.ПолучитьСтроку(1);
КонецПроцедуры

&НаКлиенте
Процедура ОтправитьСообщение(Команда)
	Соединение = Новый HTTPСоединение("api.telegram.org",443,,,,, Новый ЗащищенноеСоединениеOpenSSL());
	Запрос = Новый HTTPЗапрос("/bot" + Токен + "/sendMessage?chat_id="+ID+"&text="+Сообщение);
 	Результат = Соединение.Получить(Запрос);  
	Строка = Результат.ПолучитьТелоКакСтроку("UTF8");
	ЭтотОбъект.Ответ.ДобавитьСтроку(Строка);
КонецПроцедуры
