Функция ПараметрыMD() Экспорт

	ПараметрыMD = Новый Структура;
	ПараметрыMD.Вставить("РежимОтладки", Ложь);
	ПараметрыMD.Вставить("СтруктураДокументации", Новый Массив());	
	ПараметрыMD.Вставить("ТекущаяСтраница", "");
	ПараметрыMD.Вставить("strictMode", Истина);
	ПараметрыMD.Вставить("safeMode", Ложь);
	ПараметрыMD.Вставить("markupEscaped", Истина);
	ПараметрыMD.Вставить("breaksEnabled", Ложь);
	ПараметрыMD.Вставить("urlsLinked", Истина);
	ПараметрыMD.Вставить("RegEx", Неопределено);
	ПараметрыMD.Вставить("Стили", "");
	ПараметрыMD.Вставить("СкриптыHead", "");
	ПараметрыMD.Вставить("СкриптыBody", "");
	ПараметрыMD.Вставить("ТолькоТекстMD", Истина);
	ПараметрыMD.Вставить("Заголовки", "");
	
	ПараметрыMD.Вставить("DefinitionData", Неопределено);
	ПараметрыMD.Вставить("instances", Новый Массив());
	ПараметрыMD.Вставить("regexHtmlAttribute", "[a-zA-Z_:][\w:.-]*(?:\s*=\s*(?:[^""\'=<>`\s]+|""[^""]*""|\'[^\']*\'))?");
	ПараметрыMD.Вставить("inlineMarkerList", "=!*_&[:<`~\");
	
	ПараметрыMD.Вставить("Шаблоны", Неопределено);
	
	// Параметры страницы.
	ПараметрыСтраницы = Новый Структура();
	ПараметрыСтраницы.Вставить("Наименование", "База знаний");
	ПараметрыСтраницы.Вставить("ТекущееПространство", Неопределено);
	ПараметрыСтраницы.Вставить("ТекущаяСтраница", Неопределено);
	
	ПараметрыMD.Вставить("ПараметрыСтраницы", ПараметрыСтраницы);
	
	// Параметры пространства.
	ПараметрыПространства = Новый Структура();
	ПараметрыПространства.Вставить("Адрес", "Пространство");
	ПараметрыПространства.Вставить("ДоступныеПространства", Новый Массив());
	
	ПараметрыMD.Вставить("ПараметрыПространства", ПараметрыПространства);

    // specialCharacters.
	specialCharacters = Новый Массив;
	specialCharacters.Добавить("\");
	specialCharacters.Добавить("`");
	specialCharacters.Добавить("*");
	specialCharacters.Добавить("_");
	specialCharacters.Добавить("{");
	specialCharacters.Добавить("}");
	specialCharacters.Добавить("[");
	specialCharacters.Добавить("]");
	specialCharacters.Добавить("(");
	specialCharacters.Добавить(")");
	specialCharacters.Добавить(">");
	specialCharacters.Добавить("#");
	specialCharacters.Добавить("+");
	specialCharacters.Добавить("-");
	specialCharacters.Добавить(".");
	specialCharacters.Добавить("!");
	specialCharacters.Добавить("|");
	specialCharacters.Добавить("~");
	specialCharacters.Добавить("=");
	ПараметрыMD.Вставить("specialCharacters", specialCharacters);    
	
    // StrongRegex.
	StrongRegex = Новый Соответствие;
	StrongRegex.Вставить("*", "/^[*]{2}((?:\\\\\*|[^*]|[*][^*]*[*])+?)[*]{2}(?![*])/s");
	StrongRegex.Вставить("_", "/^__((?:\\\\_|[^_]|_[^_]*_)+?)__(?!_)/us");
	
	StrongRegex = Новый ФиксированноеСоответствие(StrongRegex);
	ПараметрыMD.Вставить("StrongRegex", StrongRegex);
	
    // EmRegex.
	EmRegex = Новый Соответствие;
	EmRegex.Вставить("*", "/^[*]((?:\\\\\*|[^*]|[*][*][^*]+?[*][*])+?)[*](?![*])/s");
	EmRegex.Вставить("_", "/^_((?:\\\\_|[^_]|__[^_]*__)+?)_(?!_)\b/us");
	
	EmRegex = Новый ФиксированноеСоответствие(EmRegex);
	ПараметрыMD.Вставить("EmRegex", EmRegex);
	
    // voidElements.
	voidElements = Новый Массив;
	voidElements.Добавить("area");
	voidElements.Добавить("base");
	voidElements.Добавить("br");
	voidElements.Добавить("col");
	voidElements.Добавить("command");
	voidElements.Добавить("embed");
	voidElements.Добавить("hr");
	voidElements.Добавить("img");
	voidElements.Добавить("input");
	voidElements.Добавить("link");
	voidElements.Добавить("meta");
	voidElements.Добавить("param");
	voidElements.Добавить("source");
	voidElements = Новый ФиксированныйМассив(voidElements);
	ПараметрыMD.Вставить("voidElements", voidElements);
	
    // textLevelElements.
	textLevelElements = Новый Массив;
	textLevelElements.Добавить("a");
	textLevelElements.Добавить("b");
	textLevelElements.Добавить("i");
	textLevelElements.Добавить("q");
	textLevelElements.Добавить("s");
	textLevelElements.Добавить("u");

	textLevelElements.Добавить("br");
	textLevelElements.Добавить("em");
	textLevelElements.Добавить("rp");
	textLevelElements.Добавить("rt");
	textLevelElements.Добавить("tt");
	textLevelElements.Добавить("xm");

	textLevelElements.Добавить("bdo");
	textLevelElements.Добавить("big");
	textLevelElements.Добавить("del");
	textLevelElements.Добавить("ins");
	textLevelElements.Добавить("kbd");
	textLevelElements.Добавить("sub");
	textLevelElements.Добавить("sup");
	textLevelElements.Добавить("var");
	textLevelElements.Добавить("wbr");

	textLevelElements.Добавить("abbr");
	textLevelElements.Добавить("cite");
	textLevelElements.Добавить("code");
	textLevelElements.Добавить("font");
	
	textLevelElements.Добавить("nobr");
	textLevelElements.Добавить("ruby");
	textLevelElements.Добавить("span");
	textLevelElements.Добавить("time");

	textLevelElements.Добавить("blink");
	textLevelElements.Добавить("small");

	textLevelElements.Добавить("strong");
	textLevelElements.Добавить("strike");
	textLevelElements.Добавить("spacer");
	textLevelElements.Добавить("nextid");

	textLevelElements.Добавить("marquee");
	textLevelElements.Добавить("listing");
	textLevelElements.Добавить("acronym");

	textLevelElements.Добавить("basefont");
	
	textLevelElements = Новый ФиксированныйМассив(textLevelElements);
	ПараметрыMD.Вставить("textLevelElements", textLevelElements);
	    
    // safeLinksWhitelist.
	safeLinksWhitelist = Новый Массив;
	safeLinksWhitelist.Добавить("http://");
	safeLinksWhitelist.Добавить("https://");
	safeLinksWhitelist.Добавить("ftp://");
	safeLinksWhitelist.Добавить("ftps://");
	safeLinksWhitelist.Добавить("mailto:");
	safeLinksWhitelist.Добавить("tel:");
	safeLinksWhitelist.Добавить("data:image/png;base64,");
	safeLinksWhitelist.Добавить("data:image/gif;base64,");
	safeLinksWhitelist.Добавить("data:image/jpeg;base64,");
	safeLinksWhitelist.Добавить("irc:");
	safeLinksWhitelist.Добавить("ircs:");
	safeLinksWhitelist.Добавить("git:");
	safeLinksWhitelist.Добавить("ssh:");
	safeLinksWhitelist.Добавить("news:");
	safeLinksWhitelist.Добавить("steam:");
	safeLinksWhitelist = Новый ФиксированныйМассив(safeLinksWhitelist);
	ПараметрыMD.Вставить("safeLinksWhitelist", safeLinksWhitelist);
    
    // BlockTypes.
	BlockTypes = Новый Соответствие();

	мМассив = Новый Массив;
	мМассив.Добавить("Header");
	мМассив = Новый ФиксированныйМассив(мМассив);
	BlockTypes.Вставить("#", мМассив);

	мМассив = Новый Массив;
	мМассив.Добавить("Rule");
	мМассив.Добавить("List");
	мМассив = Новый ФиксированныйМассив(мМассив);
	BlockTypes.Вставить("*", мМассив);

	мМассив = Новый Массив;
	мМассив.Добавить("List");
	мМассив = Новый ФиксированныйМассив(мМассив);
	BlockTypes.Вставить("+", мМассив);

	мМассив = Новый Массив;
	мМассив.Добавить("SetextHeader");
	мМассив.Добавить("Table");
	мМассив.Добавить("Rule");
	мМассив.Добавить("List");
	мМассив = Новый ФиксированныйМассив(мМассив);
	BlockTypes.Вставить("-", мМассив);

	мМассив = Новый Массив;
	мМассив.Добавить("List");
	мМассив = Новый ФиксированныйМассив(мМассив);
	BlockTypes.Вставить("0", мМассив);

	мМассив = Новый Массив;
	мМассив.Добавить("List");
	мМассив = Новый ФиксированныйМассив(мМассив);
	BlockTypes.Вставить("1", мМассив);

	мМассив = Новый Массив;
	мМассив.Добавить("List");
	мМассив = Новый ФиксированныйМассив(мМассив);
	BlockTypes.Вставить("2", мМассив);

	мМассив = Новый Массив;
	мМассив.Добавить("List");
	мМассив = Новый ФиксированныйМассив(мМассив);
	BlockTypes.Вставить("3", мМассив);

	мМассив = Новый Массив;
	мМассив.Добавить("List");
	мМассив = Новый ФиксированныйМассив(мМассив);
	BlockTypes.Вставить("4", мМассив);

	мМассив = Новый Массив;
	мМассив.Добавить("List");
	мМассив = Новый ФиксированныйМассив(мМассив);
	BlockTypes.Вставить("5", мМассив);

	мМассив = Новый Массив;
	мМассив.Добавить("List");
	мМассив = Новый ФиксированныйМассив(мМассив);
	BlockTypes.Вставить("6", мМассив);

	мМассив = Новый Массив;
	мМассив.Добавить("List");
	мМассив = Новый ФиксированныйМассив(мМассив);
	BlockTypes.Вставить("7", мМассив);

	мМассив = Новый Массив;
	мМассив.Добавить("List");
	мМассив = Новый ФиксированныйМассив(мМассив);
	BlockTypes.Вставить("8", мМассив);

	мМассив = Новый Массив;
	мМассив.Добавить("List");
	мМассив = Новый ФиксированныйМассив(мМассив);
	BlockTypes.Вставить("9", мМассив);

	мМассив = Новый Массив;
	мМассив.Добавить("Table");
	мМассив = Новый ФиксированныйМассив(мМассив);
	BlockTypes.Вставить(":", мМассив);

	мМассив = Новый Массив;
	мМассив.Добавить("Comment");
	мМассив.Добавить("Markup");
	мМассив = Новый ФиксированныйМассив(мМассив);
	BlockTypes.Вставить("<", мМассив);

	мМассив = Новый Массив;
	мМассив.Добавить("SetextHeader");
	мМассив = Новый ФиксированныйМассив(мМассив);
	BlockTypes.Вставить("=", мМассив);

	мМассив = Новый Массив;
	мМассив.Добавить("Quote");
	мМассив = Новый ФиксированныйМассив(мМассив);
	BlockTypes.Вставить(">", мМассив);

	мМассив = Новый Массив;
	мМассив.Добавить("Reference");
	мМассив = Новый ФиксированныйМассив(мМассив);
	BlockTypes.Вставить("[", мМассив);

	мМассив = Новый Массив;
	мМассив.Добавить("Rule");
	мМассив = Новый ФиксированныйМассив(мМассив);
	BlockTypes.Вставить("_", мМассив);

	мМассив = Новый Массив;
	мМассив.Добавить("FencedCode");
	мМассив = Новый ФиксированныйМассив(мМассив);
	BlockTypes.Вставить("`", мМассив);

	мМассив = Новый Массив;
	мМассив.Добавить("Alert");
	мМассив = Новый ФиксированныйМассив(мМассив);
	BlockTypes.Вставить("!", мМассив);

	мМассив = Новый Массив;
	мМассив.Добавить("Table");
	мМассив = Новый ФиксированныйМассив(мМассив);
	BlockTypes.Вставить("|", мМассив);

	мМассив = Новый Массив;
	мМассив.Добавить("FencedCode");
	мМассив = Новый ФиксированныйМассив(мМассив);
	BlockTypes.Вставить("~", мМассив);
	
	BlockTypes = Новый ФиксированноеСоответствие(BlockTypes);
	ПараметрыMD.Вставить("BlockTypes", BlockTypes);
    
    // unmarkedBlockTypes.
	unmarkedBlockTypes = Новый Массив;
	unmarkedBlockTypes.Добавить("Code");
	unmarkedBlockTypes = Новый ФиксированныйМассив(unmarkedBlockTypes);
	ПараметрыMD.Вставить("unmarkedBlockTypes", unmarkedBlockTypes);
    
    // InlineTypes.
	InlineTypes = Новый Соответствие();

	мМассив = Новый Массив;
	мМассив.Добавить("Image");
	мМассив = Новый ФиксированныйМассив(мМассив);
	InlineTypes.Вставить("!", мМассив);

	мМассив = Новый Массив;
	мМассив.Добавить("SpecialCharacter");
	мМассив.Добавить("CodeSecurity");
	мМассив = Новый ФиксированныйМассив(мМассив);
	InlineTypes.Вставить("&", мМассив);

	мМассив = Новый Массив;
	мМассив.Добавить("Emphasis");
	мМассив = Новый ФиксированныйМассив(мМассив);
	InlineTypes.Вставить("*", мМассив);

	мМассив = Новый Массив;
	мМассив.Добавить("Url");
	мМассив = Новый ФиксированныйМассив(мМассив);
	InlineTypes.Вставить(":", мМассив);

	мМассив = Новый Массив;
	мМассив.Добавить("EmailTag");
	мМассив.Добавить("UrlTag");
	мМассив.Добавить("Markup");
	мМассив.Добавить("CodeSecurity");
	мМассив = Новый ФиксированныйМассив(мМассив);
	InlineTypes.Вставить("<", мМассив);

	мМассив = Новый Массив;
	мМассив.Добавить("CodeSecurity");
	мМассив = Новый ФиксированныйМассив(мМассив);
	InlineTypes.Вставить(">", мМассив);

	мМассив = Новый Массив;
	мМассив.Добавить("CodeSecurity");
	мМассив = Новый ФиксированныйМассив(мМассив);
	InlineTypes.Вставить("""", мМассив);

	мМассив = Новый Массив;
	мМассив.Добавить("CodeSecurity");
	мМассив = Новый ФиксированныйМассив(мМассив);
	InlineTypes.Вставить("'", мМассив);

	мМассив = Новый Массив;
	мМассив.Добавить("Button");
	мМассив.Добавить("Link");
	мМассив.Добавить("Checkbox");
	мМассив = Новый ФиксированныйМассив(мМассив);
	InlineTypes.Вставить("[", мМассив);

	мМассив = Новый Массив;
	мМассив.Добавить("Emphasis");
	мМассив = Новый ФиксированныйМассив(мМассив);
	InlineTypes.Вставить("_", мМассив);

	мМассив = Новый Массив;
	мМассив.Добавить("Code");
	мМассив = Новый ФиксированныйМассив(мМассив);
	InlineTypes.Вставить("`", мМассив);

	мМассив = Новый Массив;
	мМассив.Добавить("Strikethrough");
	мМассив = Новый ФиксированныйМассив(мМассив);
	InlineTypes.Вставить("~", мМассив);

	мМассив = Новый Массив;
	мМассив.Добавить("EscapeSequence");
	мМассив = Новый ФиксированныйМассив(мМассив);
	InlineTypes.Вставить("\", мМассив);
	
	мМассив = Новый Массив;
	мМассив.Добавить("Mark");
	мМассив = Новый ФиксированныйМассив(мМассив);
	InlineTypes.Вставить("=", мМассив);
		
	InlineTypes = Новый ФиксированноеСоответствие(InlineTypes);
	ПараметрыMD.Вставить("InlineTypes", InlineTypes);

	// Массив якорей.
	ПараметрыMD.Вставить("Якоря", Новый Массив());

	Возврат ПараметрыMD;

КонецФункции

Функция ПространствоКонструктор() Экспорт

	мПространство = Новый Структура();
	мПространство.Вставить("Наименование", "");
	мПространство.Вставить("Адрес", "");

	Возврат мПространство;
	
КонецФункции

Функция ОбработатьТекстMD(ПараметрыMD, ТекстMD) Экспорт
	
	Если ПараметрыMD.Шаблоны = Неопределено Тогда
		ВызватьИсключение НСтр("ru='Шаблоны в параметрах не заполнены.'"); 
	КонецЕсли;
	
	Замер = ТекущаяУниверсальнаяДатаВМиллисекундах();

	Elements = textElements(ПараметрыMD, ТекстMD);
	
    // convert to markup
    СтрокиHTML = Новый Массив();
	elements(ПараметрыMD, Elements, СтрокиHTML);
	Если ПараметрыMD.ТолькоТекстMD Тогда
		Возврат СокрП(СтрСоединить(СтрокиHTML));
	КонецЕсли;

	Шаблон = ПараметрыMD.Шаблоны.layout_main.standart;
	headers = Новый Массив();
	headers.Добавить(ПараметрыMD.Заголовки);
	headers.Добавить(ПараметрыMD.Стили);
	
	Параметры = Новый Структура();
	Параметры.Вставить("headers", СтрСоединить(headers, Символы.ПС));
	Параметры.Вставить("title", ПараметрыMD.ПараметрыСтраницы.Наименование);
	Параметры.Вставить("scripts_head", ПараметрыMD.СкриптыHead);
	Параметры.Вставить("scripts_body", ПараметрыMD.СкриптыBody);
	Параметры.Вставить("header", ПараметрыMD.Шаблоны.layout_header.standart);
	Параметры.Вставить("leftbar", СформироватьLeftbar(ПараметрыMD));
	Параметры.Вставить("content", trim(СтрСоединить(СтрокиHTML)));
	Параметры.Вставить("footer_content", ПараметрыMD.Шаблоны.layout_footer_content.standart);
	Параметры.Вставить("footer", СформироватьFooter(ПараметрыMD));
	Параметры.Вставить("rightbar", ПараметрыMD.Шаблоны.layout_rightbar.standart);

	СтрокиHTML = Новый Массив();
	ЗаполнитьПараметры(ПараметрыMD, Шаблон, Параметры, СтрокиHTML);
	
	ТекстHTML = СтрСоединить(СтрокиHTML);
	Возврат ТекстHTML;

КонецФункции

Функция СформироватьFooter(ПараметрыMD)

	Шаблон = ПараметрыMD.Шаблоны.layout_footer.standart;

	мПараметры = Новый Структура();
	мПараметры.Вставить("current_page", ПараметрыMD.ТекущаяСтраница);	
	
	СтрокиHTML = Новый Массив;
	ЗаполнитьПараметры(ПараметрыMD, Шаблон, мПараметры, СтрокиHTML);
	
	Возврат СтрСоединить(СтрокиHTML);
	
КонецФункции

Функция СформироватьLeftbar(ПараметрыMD)
	
	СтрокиHTML = Новый Массив();
	ЗаполнитьДеревоРекурсивно(ПараметрыMD, ПараметрыMD.СтруктураДокументации, СтрокиHTML);

	// LeftBar.
	мПараметры = Новый Структура();
	мПараметры.Вставить("list_items", СтрСоединить(СтрокиHTML));
	
	ПространстваСтрокой = "";
	Для Каждого мПространство Из ПараметрыMD.ПараметрыПространства.ДоступныеПространства Цикл
		// TODO: необходмио использовать шаблоны а не прямые HTML фрагменты.
		Если мПространство.Адрес = ПараметрыMD.ПараметрыПространства.Адрес Тогда
			ПространстваСтрокой = ПространстваСтрокой + "</br><b>" + мПространство.Наименование + "</b>" 
		Иначе
			ПространстваСтрокой = ПространстваСтрокой + "</br>" +  мПространство.Наименование; 
		КонецЕсли;
	КонецЦикла;
	мПараметры.Вставить("spaces", ПространстваСтрокой);
	
	мШаблон = ПараметрыMD.Шаблоны.layout_leftbar.standart;
	
	СтрокиHTML = Новый Массив();
	ЗаполнитьПараметры(ПараметрыMD, мШаблон, мПараметры, СтрокиHTML);

	ТекстHTML = СтрСоединить(СтрокиHTML);
	Возврат ТекстHTML;

КонецФункции

Процедура ЗаполнитьДеревоРекурсивно(ПараметрыMD, МассивЭлементов, СтрокиHTML)

	Для Каждого Элемент Из МассивЭлементов Цикл
		Если Элемент.ЭтоГруппа Тогда
			мШаблон = ПараметрыMD.Шаблоны.layout_leftbar.list_item_group;
			ЗаполнитьПараметры(ПараметрыMD, мШаблон, Элемент.Параметры, СтрокиHTML);
			
			ЗаполнитьДеревоРекурсивно(ПараметрыMD, Элемент.Элементы, СтрокиHTML);

			мШаблон = ПараметрыMD.Шаблоны.layout_leftbar.list_item_group_closing_tags;
			ЗаполнитьПараметры(ПараметрыMD, мШаблон, Элемент.Параметры, СтрокиHTML);
		Иначе
			мШаблон = ПараметрыMD.Шаблоны.layout_leftbar.list_item;
			ЗаполнитьПараметры(ПараметрыMD, мШаблон, Элемент.Параметры, СтрокиHTML);
		КонецЕсли;
	КонецЦикла;

КонецПроцедуры

Функция textElements(ПараметрыMD, text)
    // make sure no definitions are set
	ПараметрыMD.DefinitionData = Новый Структура;

    // standardize line breaks
	text = СтрЗаменить(text, Символы.ВК + Символы.ПС, Символы.ПС);
	text = СтрЗаменить(text, Символы.ВК, Символы.ПС);
	
    // remove surrounding line breaks
	text = trim(text, Символы.ПС);

    // split text into lines
	lines = СтрРазделить(text, Символы.ПС);

    // iterate through lines to identify blocks
	Возврат linesElements(ПараметрыMD, lines);

КонецФункции

// Blocks

Процедура lines(ПараметрыMD, lines, СтрокиHTML)
	
	elements(ПараметрыMD, linesElements(ПараметрыMD, lines), СтрокиHTML);
	
КонецПроцедуры

Функция linesElements(ПараметрыMD, lines)
	Elements = Новый Массив;
	CurrentBlock = Неопределено;
	мПродолжитьОсновнуюИтерацию = Ложь;

	Для Каждого line Из lines Цикл
		Если ПустаяСтрока(СокрП(line)) Тогда
			Если CurrentBlock <> Неопределено Тогда
				CurrentBlock.Вставить("interrupted", ?(CurrentBlock.Свойство("interrupted"), CurrentBlock.interrupted
					+ 1, 1));
			КонецЕсли;

			Продолжить;
		КонецЕсли;

		// Заменяем табуляции на 4 пробела.
		мТабуляцияНайдена = strstr(line, Символы.Таб, Истина);
		Пока мТабуляцияНайдена <> Ложь Цикл
			мРазмер = 4 - СтрДлина(мТабуляцияНайдена) % 4;
			line = мТабуляцияНайдена + str_repeat(" ", мРазмер) + substr(line, СтрДлина(мТабуляцияНайдена) + 1);
			мТабуляцияНайдена = strstr(line, Символы.Таб, Истина);
		КонецЦикла;

		Если Лев(line, 1) <> " " Тогда
			indent = 0;
			text = line;
		Иначе
			indent = strspn(line, " ");
			text = ?(indent > 0, substr(line, indent), line);
		КонецЕсли;

		LineStructure = Новый Структура;
		LineStructure.Вставить("body", line);
		LineStructure.Вставить("indent", indent);
		LineStructure.Вставить("text", text);
		Если CurrentBlock <> Неопределено И CurrentBlock.Свойство("continuable") Тогда

			Если CurrentBlock.type = "List" Тогда
				Block = blockListContinue(ПараметрыMD, LineStructure, CurrentBlock);
			ИначеЕсли CurrentBlock.type = "Code" Тогда
				Block = blockCodeContinue(ПараметрыMD, LineStructure, CurrentBlock);
			ИначеЕсли CurrentBlock.type = "FencedCode" Тогда
				Block = blockFencedCodeContinue(ПараметрыMD, LineStructure, CurrentBlock);
			ИначеЕсли CurrentBlock.type = "Comment" Тогда
				Block = blockCommentContinue(ПараметрыMD, LineStructure, CurrentBlock);
			ИначеЕсли CurrentBlock.type = "Quote" Тогда
				Block = blockQuoteContinue(ПараметрыMD, LineStructure, CurrentBlock);
			ИначеЕсли CurrentBlock.type = "Table" Тогда
				Block = blockTableContinue(ПараметрыMD, LineStructure, CurrentBlock);
			ИначеЕсли CurrentBlock.type = "Alert" Тогда
				Block = blockAlertContinue(ПараметрыMD, LineStructure, CurrentBlock);
			Иначе
				ВызватьИсключение СтрШаблон(НСтр("ru='Имя метода не найдено: %1'"), "block" + CurrentBlock.type + "Continue");
			КонецЕсли;

			Если Block <> Неопределено Тогда
				CurrentBlock = Block;

				Продолжить;
			КонецЕсли;

			Если isBlockCompletable(CurrentBlock.type) Тогда
				Если CurrentBlock.type = "List" Тогда
					Block = blockListComplete(ПараметрыMD, CurrentBlock);
				ИначеЕсли CurrentBlock.type = "Code" Тогда
					Block = blockCodeComplete(ПараметрыMD, CurrentBlock);
				ИначеЕсли CurrentBlock.type = "FencedCode" Тогда
					Block = blockFencedCodeComplete(ПараметрыMD, CurrentBlock);
				ИначеЕсли CurrentBlock.type = "Alert" Тогда
					Block = blockAlertComplete(ПараметрыMD, CurrentBlock);
				Иначе
					ВызватьИсключение СтрШаблон(НСтр("ru='Имя метода не найдено: %1'"), "block" + CurrentBlock.type + "Complete");
				КонецЕсли;
			КонецЕсли;
		КонецЕсли;

           // ~

		marker = Лев(text, 1);

           // ~

	   blockTypes = Новый Массив;
	   Для Каждого ЭлементМассива Из ПараметрыMD.unmarkedBlockTypes Цикл
		   blockTypes.Добавить(ЭлементМассива);
	   КонецЦикла;
		  
		Если ПараметрыMD.BlockTypes.Получить(marker) <> Неопределено Тогда
			Для Каждого blockType Из ПараметрыMD.BlockTypes[marker] Цикл
				blockTypes.Добавить(blockType);
			КонецЦикла;
		КонецЕсли;

           //
           // ~
		Для Каждого blockType Из blockTypes Цикл
			Если blockType = "Code" Тогда
				Block = blockCode(ПараметрыMD, LineStructure, CurrentBlock);
			ИначеЕсли blockType = "Rule" Тогда
				Block = blockRule(ПараметрыMD, LineStructure, CurrentBlock);
			ИначеЕсли blockType = "List" Тогда
				Block = blockList(ПараметрыMD, LineStructure, CurrentBlock);
			ИначеЕсли blockType = "Reference" Тогда
				Block = blockReference(ПараметрыMD, LineStructure, CurrentBlock);
			ИначеЕсли blockType = "Header" Тогда
				Block = blockHeader(ПараметрыMD, LineStructure, CurrentBlock);
			ИначеЕсли blockType = "FencedCode" Тогда
				Block = blockFencedCode(ПараметрыMD, LineStructure, CurrentBlock);
			ИначеЕсли blockType = "Comment" Тогда
				Block = blockComment(ПараметрыMD, LineStructure, CurrentBlock);
			ИначеЕсли blockType = "Markup" Тогда
				Block = blockMarkup(ПараметрыMD, LineStructure, CurrentBlock);
			ИначеЕсли blockType = "SetextHeader" Тогда
				Block = blockSetextHeader(ПараметрыMD, LineStructure, CurrentBlock);
			ИначеЕсли blockType = "Quote" Тогда
				Block = blockQuote(ПараметрыMD, LineStructure, CurrentBlock);
			ИначеЕсли blockType = "Table" Тогда
				Block = blockTable(ПараметрыMD, LineStructure, CurrentBlock);
			ИначеЕсли blockType = "Alert" Тогда
				Block = blockAlert(ПараметрыMD, LineStructure, CurrentBlock);
			Иначе
				ВызватьИсключение СтрШаблон(НСтр("ru='Имя метода не найдено: %1'"), "Block" + blockType);
			КонецЕсли;

			Если Block <> Неопределено Тогда
				Block.Вставить("type", blockType);

				Если Не Block.Свойство("identified") Тогда
					Если CurrentBlock <> Неопределено Тогда
						Elements.Добавить(extractElement(CurrentBlock));
					КонецЕсли;

					Block.Вставить("identified", Истина);
				КонецЕсли;

				Если isBlockContinuable(blockType) Тогда
					Block.Вставить("continuable", Истина);
				КонецЕсли;

				CurrentBlock = Block;
				мПродолжитьОсновнуюИтерацию = Истина;
				Прервать;
			КонецЕсли;
		КонецЦикла;

		Если мПродолжитьОсновнуюИтерацию Тогда
			мПродолжитьОсновнуюИтерацию = Ложь;
			Продолжить;
		КонецЕсли;
           // ~

		Если CurrentBlock <> Неопределено И CurrentBlock.type = "Paragraph" Тогда
			Block = paragraphContinue(ПараметрыMD, LineStructure, CurrentBlock);
		КонецЕсли;

		Если Block <> Неопределено Тогда
			CurrentBlock = Block;
		Иначе
			Если CurrentBlock <> Неопределено Тогда
				Elements.Добавить(extractElement(CurrentBlock));
			КонецЕсли;

			CurrentBlock = paragraph(ПараметрыMD, LineStructure);

			CurrentBlock.Вставить("identified", Истина);
		КонецЕсли;
	КонецЦикла;

       // ~

	Если CurrentBlock <> Неопределено И CurrentBlock.Свойство("continuable") И isBlockCompletable(CurrentBlock.type) Тогда

		Если CurrentBlock.type = "List" Тогда
			CurrentBlock = blockListComplete(ПараметрыMD, CurrentBlock);
		ИначеЕсли CurrentBlock.type = "FencedCode" Тогда
			CurrentBlock = blockFencedCodeComplete(ПараметрыMD, CurrentBlock);
		ИначеЕсли CurrentBlock.type = "Code" Тогда
			CurrentBlock = blockCodeComplete(ПараметрыMD, CurrentBlock);
		ИначеЕсли CurrentBlock.type = "Alert" Тогда
			CurrentBlock = blockAlertComplete(ПараметрыMD, CurrentBlock);
		Иначе
			ВызватьИсключение СтрШаблон(НСтр("ru='Имя метода не найдено: %1'"), "block" + CurrentBlock.type + "Complete");
		КонецЕсли;

	КонецЕсли;

       // ~

	Если CurrentBlock <> Неопределено Тогда
		Elements.Добавить(extractElement(CurrentBlock));
	КонецЕсли;

	Возврат Elements;
	
КонецФункции

Функция extractElement(Component)
	
	Если Не Component.Свойство("element") Тогда

		Если Component.Свойство("markup") Тогда
			Component.Вставить("element", Новый Структура("rawHtml", Component["markup"]));
		ИначеЕсли Component.Свойство("hidden") Тогда
			Component.вставить("element", Новый Структура());
		КонецЕсли;

	КонецЕсли;

	Возврат Component["element"];
	
КонецФункции

Функция isBlockContinuable(Type)
	Возврат МетодСуществует("block" + Type + "Continue");
КонецФункции

Функция isBlockCompletable(Type)
	Возврат МетодСуществует("block" + Type + "Complete");
КонецФункции


#Область БлочныеЭлементы

// Table //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Функция blockTable(ПараметрыMD, Line, Знач Block = Неопределено)

	Если Block = Неопределено Или Block["type"] <> "Paragraph" Или Block.Свойство("interrupted") Тогда
		Возврат Неопределено;
	КонецЕсли;

	Если СтрНайти(Block["element"]["handler"]["argument"], "|") = 0 И СтрНайти(Line["text"], "|") = 0 И СтрНайти(
		Line["text"], ":") = 0 Или СтрНайти(Block["element"]["handler"]["argument"], Символы.ПС) > 0 Тогда
		Возврат Неопределено;
	КонецЕсли;

	Если chop(Line["text"], " -:|") <> "" Тогда
		Возврат Неопределено;
	КонецЕсли;

	alignments = Новый Массив;

	divider = Line["text"];

	divider = trim(divider);
	divider = trim(divider, "|");

	dividerCells = СтрРазделить(divider, "|");

	Для Каждого dividerCell Из dividerCells Цикл

		dividerCell = trim(dividerCell);

		Если dividerCell = "" Тогда
			Возврат Неопределено;
		КонецЕсли;

		alignment = Неопределено;

		Если Лев(dividerCell, 1) = ":" Тогда
			alignment = "left";
		КонецЕсли;

		Если substr(dividerCell, -1) = ":" Тогда
			alignment = ?(alignment = "left", "center", "right");
		КонецЕсли;

		alignments.Добавить(alignment);
	КонецЦикла;

	HeaderElements = Новый Массив;

	header = Block["element"]["handler"]["argument"];

	header = trim(header);
	header = trim(header, "|");

	headerCells = СтрРазделить(header, "|");

	Если headerCells.Количество() <> alignments.Количество() Тогда
		Возврат Неопределено;
	КонецЕсли;

	Для index = 0 По headerCells.Количество() - 1 Цикл

		headerCell = trim(headerCells[index]);

		handler = Новый Структура;
		handler.Вставить("Функция", "lineElements");
		handler.Вставить("argument", headerCell);
		handler.Вставить("destination", "elements");

		мПараметры = Новый Структура();
		мПараметры.Вставить("text", handler);
		мПараметры.Вставить("style", "");

		HeaderElement = Новый Структура;
		HeaderElement.Вставить("Шаблон", ПараметрыMD.Шаблоны.el_table.column_header);
		HeaderElement.Вставить("Параметры", мПараметры);

		alignment = alignments[index];
		Если alignment <> Неопределено Тогда
			мПараметры.style("style", "style=""text-align: " + alignment + ";""");
		КонецЕсли;

		HeaderElements.Добавить(HeaderElement);
	КонецЦикла;

	Параметры = Новый Структура();
	Параметры.Вставить("columns_header", HeaderElements);
	Параметры.Вставить("rows_body", Новый Массив());

	Element = Новый Структура;
	Element.Вставить("Шаблон", ПараметрыMD.Шаблоны.el_table.main);
	Element.Вставить("Параметры", Параметры);

	Block = Новый Структура;
	Block.Вставить("alignments", alignments);
	Block.Вставить("identified", Истина);
	Block.Вставить("element", Element);

	Возврат Block;

КонецФункции

Функция blockTableContinue(ПараметрыMD, Line, Знач Block)

	Если Block.Свойство("interrupted") Тогда
		Возврат Неопределено;
	КонецЕсли;

	Если Block["alignments"].Количество() = 1 Или Лев(Line["text"], 1) = "|" Или СтрНайти(Line["text"], "|") > 0 Тогда
		ColumnsBody = Новый Массив;

		row = Line["text"];

		row = trim(row);
		row = trim(row, "|");

		matches = Неопределено;
		preg_match_all(ПараметрыMD, "/(?:(\\\\[|])|[^|`]|`[^`]+`|`)+/", row, matches);

		cells = array_slice(matches[0], 0, Block["alignments"].Количество());

		Для index = 0 По cells.Количество() - 1 Цикл

			cell = trim(cells[index]);

			handler = Новый Структура;
			handler.Вставить("Функция", "lineElements");
			handler.Вставить("argument", cell);
			handler.Вставить("destination", "elements");
			
			мПараметры = Новый Структура();
			мПараметры.Вставить("text", handler);
			мПараметры.Вставить("style", "");

			Element = Новый Структура;
			Element.Вставить("Шаблон", ПараметрыMD.Шаблоны.el_table.column_body);
			Element.Вставить("Параметры", мПараметры);

			Если Block["alignments"].Количество() > index И Block["alignments"][index] <> Неопределено Тогда
				мПараметры.style("style", "style=""text-align: " + Block["alignments"][index] + ";""");
			КонецЕсли;

			ColumnsBody.Добавить(Element);
		КонецЦикла;

		Параметры = Новый Структура();
		Параметры.Вставить("columns_body", ColumnsBody);
		
		Element = Новый Структура;
		Element.Вставить("Шаблон", ПараметрыMD.Шаблоны.el_table.row_body);
		Element.Вставить("Параметры", Параметры);

		Block["element"]["Параметры"]["rows_body"].Добавить(Element);

		Возврат Block;
	КонецЕсли;

КонецФункции

// Quote //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Функция blockQuote(ПараметрыMD, Line, Знач CurrentBlock)

	matches = Неопределено;
	Если preg_match(ПараметрыMD, "/^>[ ]?(.*)/", Line["text"], matches) Тогда

		argument = Новый Массив;
		argument.Добавить(matches[1]);

		handler = Новый Структура;
		handler.Вставить("Функция", "linesElements");
		handler.Вставить("argument", argument);
		handler.Вставить("destination", "elements");

		Параметры = Новый Структура();
		Параметры.Вставить("text", handler);
		
		element = Новый Структура;
		element.Вставить("Шаблон", ПараметрыMD.Шаблоны.el_quote.standart);
		element.Вставить("Параметры", Параметры);

		Block = Новый Структура;
		Block.Вставить("element", element);

		Возврат Block;

	КонецЕсли;

КонецФункции

Функция blockQuoteContinue(ПараметрыMD, Line, Знач Block)

	Если Block.Свойство("interrupted") Тогда
		Возврат Неопределено;
	КонецЕсли;

	matches = Неопределено;
	Если Лев(Line["text"], 1) = ">" И preg_match(ПараметрыMD, "/^>[ ]?(.*)/", Line["text"], matches) Тогда

		Block["element"]["Параметры"]["text"]["argument"].Добавить(matches[1]);
		Возврат Block;

	КонецЕсли;

	Если Не Block.Свойство("interrupted") Тогда

		Block["element"]["Параметры"]["text"]["argument"].Добавить(Line["text"]);
		Возврат Block;

	КонецЕсли;

КонецФункции

// paragraph //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Функция paragraph(ПараметрыMD, Line)

	handler = Новый Структура;
	handler.Вставить("Функция", "lineElements");
	handler.Вставить("argument", Line["text"]);
	handler.Вставить("destination", "elements");

	element = Новый Структура;
	element.Вставить("name", "p");
	element.Вставить("handler", handler);

	Result = Новый Структура;
	Result.Вставить("type", "Paragraph");
	Result.Вставить("element", element);

	Возврат Result;

КонецФункции

Функция paragraphContinue(ПараметрыMD, Line, Знач Block)

	Если Block.Свойство("interrupted") Тогда
		Возврат Неопределено;
	КонецЕсли;

	Block["element"]["handler"]["argument"] = Block["element"]["handler"]["argument"] + Символы.ПС + Line["text"];

	Возврат Block;

КонецФункции

// Setext //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Функция blockSetextHeader(ПараметрыMD, Line, Знач Block = Неопределено, Знач CurrentBlock = Неопределено)

	Если Block = Неопределено Или Block["type"] <> "Paragraph" Или Block.Свойство("interrupted") Тогда
		Возврат Неопределено;
	КонецЕсли;

	Если Line["indent"] < 4 И chop(chop(Line["text"], " "), Лев(Line["text"], 1)) = "" Тогда

		мИмя = ?(Лев(Line["text"], 1) = "=", "h1", "h2");
		Шаблон = ПараметрыMD.Шаблоны.el_header[мИмя];
			
		Element = Новый Структура;
		Element.Вставить("Шаблон", Шаблон);
			
		Параметры = Новый Структура();
		Параметры.Вставить("text", Block.Element.Handler);
		Параметры.Вставить("id", СформироватьИдентификаторИзСтроки(ПараметрыMD, Block.Element.Handler.argument));
		Element.Вставить("Параметры", Параметры);

		Block.Удалить("Element");
		Block.Вставить("Element", Element);
		
		Возврат Block;

	КонецЕсли;

КонецФункции

// Markup //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Функция blockMarkup(ПараметрыMD, Line, Знач CurrentBlock)

	Если ПараметрыMD.markupEscaped Или ПараметрыMD.safeMode Тогда
		Возврат Неопределено;
	КонецЕсли;

	matches = Неопределено;
	Если preg_match(ПараметрыMD, "/^<[\/]?(\w*)(?:[ ]*" + ПараметрыMD.regexHtmlAttribute + ")*[ ]*(\/)?>/",
		Line["text"], matches) Тогда

		element = НРег(matches[1]);

		Если in_array(element, ПараметрыMD.textLevelElements) Тогда
			Возврат Неопределено;
		КонецЕсли;

		element = Новый Структура;
		element.Вставить("rawHtml", Line["text"]);
		element.Вставить("autobreak", Истина);

		Block = Новый Структура;
		Block.Вставить("name", matches[1]);
		Block.Вставить("element", element);

		Возврат Block;

	КонецЕсли;

КонецФункции

Функция blockMarkupContinue(ПараметрыMD, Line, Знач Block)

	Если Block.Свойство("closed") Или Block.Свойство("interrupted") Тогда
		Возврат Неопределено;
	КонецЕсли;

	Block["element"]["rawHtml"] = Block["element"]["rawHtml"] + Символы.ПС + Line["body"];

	Возврат Block;

КонецФункции

// Comment  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Функция blockComment(ПараметрыMD, Line, Знач CurrentBlock = Неопределено)

	Если ПараметрыMD.markupEscaped Или ПараметрыMD.safeMode Тогда
		Возврат Неопределено;
	КонецЕсли;

	Если СтрНайти(Line["text"], "<!--") = 0 Тогда

		element = Новый Структура;
		element.Вставить("rawHtml", Line["body"]);
		element.Вставить("autobreak", Истина);

		Block = Новый Структура;
		Block.Вставить("element", element);

		Если СтрНайти(Line["text"], "-->") > 0 Тогда
			Block.Вставить("closed", Истина);
		КонецЕсли;

		Возврат Block;

	КонецЕсли;

КонецФункции

Функция blockCommentContinue(ПараметрыMD, Line, Знач Block)

	Если Block.Свойство("closed") Тогда
		Возврат Неопределено;
	КонецЕсли;

	Block["element"]["rawHtml"] = Block["element"]["rawHtml"] + Символы.ПС + Line["body"];

	Если СтрНайти(Line["text"], "-->") > 0 Тогда
		Block.Вставить("closed", Истина);
	КонецЕсли;

	Возврат Block;

КонецФункции

// Alert (docsinum) //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Функция blockAlert(ПараметрыMD, Line, Знач CurrentBlock)
	
	мСимволПосле = Сред(Line["text"], 4, 1);
	Если Лев(Line["text"], 3) <> "!!!" Или мСимволПосле = "!" Тогда
		Возврат Неопределено;
	КонецЕсли;
	marker = "!";
	
	matches = Неопределено;
	
	Параметры = Новый Структура();
	Если СокрП(Line["text"]) = "!!!" Тогда

		Шаблон = ПараметрыMD.Шаблоны.el_Alert["primitive"];
		Параметры.Вставить("variants", "primary");

	ИначеЕсли мСимволПосле <> " " И мСимволПосле <> "" 
		И preg_match(ПараметрыMD, "/^!!!(\b\w+\b) (.*)/", Line["text"], matches) Тогда
		
		handler = Новый Структура;
		handler.Вставить("Функция", "lineElements");
		handler.Вставить("argument", matches[2]);
		handler.Вставить("destination", "elements");

		Параметры.Вставить("title", handler);
		Параметры.Вставить("variants", matches[1]);

		ИмяШаблона = "withTitle" + Параметры.variants;
		Если ПараметрыMD.Шаблоны.el_Alert.Свойство(ИмяШаблона) Тогда
			Шаблон = ПараметрыMD.Шаблоны.el_Alert[ИмяШаблона];
		Иначе
			Шаблон = ПараметрыMD.Шаблоны.el_Alert["withTitle"];
		КонецЕсли;

	ИначеЕсли мСимволПосле <> " " И мСимволПосле <> "" 
		И preg_match(ПараметрыMD, "/^!!!(\b\w+\b)/", Line["text"], matches) Тогда
		
		Параметры.Вставить("variants", matches[1]);
		ИмяШаблона = "primitive" + Параметры.variants;
		Если ПараметрыMD.Шаблоны.el_Alert.Свойство(ИмяШаблона) Тогда
			Шаблон = ПараметрыMD.Шаблоны.el_Alert[ИмяШаблона];
		Иначе
			Шаблон = ПараметрыMD.Шаблоны.el_Alert["primitive"];
		КонецЕсли;

	ИначеЕсли мСимволПосле = " " 
		И preg_match(ПараметрыMD, "/^!!! (.*)/", Line["text"], matches) Тогда
		
		handler = Новый Структура;
		handler.Вставить("Функция", "lineElements");
		handler.Вставить("argument", matches[1]);
		handler.Вставить("destination", "elements");

		Параметры.Вставить("title", handler);
		Параметры.Вставить("variants", "primary");
		
		Шаблон = ПараметрыMD.Шаблоны.el_Alert["withTitle"];
		
	КонецЕсли;

	Параметры.Вставить("text", Новый Массив());

	Element = Новый Структура;
	Element.Вставить("Параметры", Параметры);
	Element.Вставить("Шаблон", Шаблон);

	Block = Новый Структура;
	Block.Вставить("char", marker);
	Block.Вставить("element", Element);
	
	Возврат Block;

КонецФункции

Функция blockAlertContinue(ПараметрыMD, Line, Знач Block)
		
	Если Block.Свойство("complete") Тогда
		Возврат Неопределено;
	КонецЕсли;

	len = strspn(Line["text"], Block["char"]);
	Если chop(substr(Line["text"], len)) = "" Тогда
		Block.Вставить("complete", True);
		Возврат Block;
	КонецЕсли;

	handler = Новый Структура;
	handler.Вставить("Функция", "lineElements");
	handler.Вставить("argument", Line.text);
	handler.Вставить("destination", "elements");

	element = Новый Структура;
	element.Вставить("name", "p");
	element.Вставить("handler", handler);

	Block.element.Параметры.text.Добавить(element);

	Возврат Block;

КонецФункции

Функция BlockAlertComplete(ПараметрыMD, Знач Block)

	Возврат Block;

КонецФункции

// Fenced Code //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Функция blockFencedCode(ПараметрыMD, Line, Знач CurrentBlock)

	marker = Лев(Line["text"], 1);
	Если marker <> "`" Тогда
		Возврат Неопределено;
	КонецЕсли;
	
	openerLength = strspn(Line["text"], marker);

	Если openerLength < 3 Тогда
		Возврат Неопределено;
	КонецЕсли;

	infostring = trim(substr(Line["text"], openerLength), Символы.Таб + " ");

	Если СтрНайти(infostring, "`") > 0 Тогда
		Возврат Неопределено;
	КонецЕсли;
	
	Параметры = Новый Структура();
	Параметры.Вставить("classLanguage", "language-none");
	Параметры.Вставить("text", Новый Массив());

	Если infostring <> "" Тогда
		
		//	https://www.w3.org/TR/2011/WD-html5-20110525/elements.html#classes
		//	Every HTML element may have a class attribute specified.
		//	The attribute, if specified, must have a value that is a set
		//	of space-separated tokens representing the various classes
		//	that the element belongs to.
		//	[...]
		//	The space characters, for the purposes of this specification,
		//	are U+0020 SPACE, U+0009 CHARACTER TABULATION (tab),
		//	U+000A LINE FEED (LF), U+000C FORM FEED (FF), and
		//	U+000D CARRIAGE RETURN (CR).
		
		Параметры.classLanguage = "language-" + substr(infostring, 0, strcspn(infostring, " " + Символы.Таб + Символы.ПС + Символы.ПФ + Символы.ВК));
		
	КонецЕсли;
	
	Если Параметры.classLanguage = "language-mermaid" Тогда
		Шаблон = ПараметрыMD.Шаблоны.el_fencedCode.mermaid;
	Иначе
		Шаблон = ПараметрыMD.Шаблоны.el_fencedCode.standart;
	КонецЕсли;

	Element = Новый Структура;
	Element.Вставить("Шаблон", Шаблон);
	Element.Вставить("Параметры", Параметры);

	Block = Новый Структура;
	Block.Вставить("char", marker);
	Block.Вставить("openerLength", openerLength);
	Block.Вставить("element", Element);

	Возврат Block;

КонецФункции

Функция blockFencedCodeContinue(ПараметрыMD, Line, Знач Block)
	
	Если Block.Свойство("complete") Тогда
		Возврат Неопределено;
	КонецЕсли;

	Если Block.Свойство("interrupted") Тогда
		Block["element"]["Параметры"]["text"].Добавить(str_repeat(Символы.ПС, Block["interrupted"]));

		Block.Удалить("interrupted");
	КонецЕсли;

	len = strspn(Line["text"], Block["char"]);
	Если len >= Block["openerLength"] И chop(substr(Line["text"], len)) = "" Тогда
		// Block["element"]["Параметры"]["text"] = substr(Block["element"]["Параметры"]["text"], 1);

		Block.Вставить("complete", True);

		Возврат Block;
	КонецЕсли;

	Block["element"]["Параметры"]["text"].Добавить(Line["body"] + Символы.ПС);
	Возврат Block;

КонецФункции

Функция blockFencedCodeComplete(ПараметрыMD, Знач Block)
	
	Индекс = Block["element"]["Параметры"]["text"].Количество() - 1;
	
	Если Индекс >= 0 Тогда
		Block["element"]["Параметры"]["text"][Индекс] = СокрП(Block["element"]["Параметры"]["text"][Индекс]);
	КонецЕсли;

	Возврат Block;

КонецФункции

// Header //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Функция blockHeader(ПараметрыMD, Line, Знач CurrentBlock = Неопределено)
	
	// TODO: ПараметрыMD.strictMode нормально ли отработает?
	Если Лев(СокрЛ(Line["text"]), 1) <> "#" Тогда
		Возврат Неопределено;
	КонецЕсли;
	
	level = strspn(Line["text"], "#");

	Если level > 6 Тогда
		Возврат Неопределено;
	КонецЕсли;

	text = trim(Line["text"], "#");

	Если ПараметрыMD.strictMode И Лев(text, 1) <> " " Тогда
		Возврат Неопределено;
	КонецЕсли;

	Шаблон = ПараметрыMD.Шаблоны.el_header["h" + level];

	text = trim(text, " ");

	Handler = Новый Структура;
	Handler.Вставить("Функция", "lineElements");
	Handler.Вставить("argument", text);
	Handler.Вставить("destination", "elements");
	
	Element = Новый Структура;
	Element.Вставить("Шаблон", Шаблон);
	Element.Вставить("handler", Handler);
	
	Параметры = Новый Структура();
	Параметры.Вставить("text", Handler);
	Параметры.Вставить("id", СформироватьИдентификаторИзСтроки(ПараметрыMD, text));
	Element.Вставить("Параметры", Параметры);

	Result = Новый Структура;
	Result.Вставить("element", Element);

	Возврат Result;

КонецФункции

// Code //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Функция blockCode(ПараметрыMD, Line, Знач Block = Неопределено)
	
	Если (Block <> Неопределено И ТипЗнч(Block["type"]) = Тип("Строка") И ТипЗнч(Block["type"]) = "Paragraph" И Не Block.Свойство("interrupted")) 
		Или Line["indent"] < 4 Тогда
		Возврат Неопределено;
	КонецЕсли;

	Текст = Новый Массив();
	Текст.Добавить(substr(Line["body"], 4));

	Параметры = Новый Структура();
	Параметры.Вставить("classLanguage", "language-none");
	Параметры.Вставить("text", Текст);

	Element = Новый Структура;
	Element.Вставить("Шаблон", ПараметрыMD.Шаблоны.el_fencedCode.standart);
	Element.Вставить("Параметры", Параметры);

	Block = Новый Структура;
	Block.Вставить("element", Element);

	Возврат Block;

КонецФункции

Функция blockCodeContinue(ПараметрыMD, Line, Знач Block)
	
	Если Line["indent"] >= 4 Тогда
		Если Block.Свойство("interrupted") Тогда
			
			Block["element"]["Параметры"]["text"].Добавить(str_repeat(Символы.ПС, Block["interrupted"]));
			Block.Удалить("interrupted");

		КонецЕсли;

		text = substr(Line["body"], 4);
		Block["element"]["Параметры"]["text"].Добавить(Символы.ПС + text);
		
		Возврат Block;
		
	КонецЕсли;
	
КонецФункции

Функция blockCodeComplete(ПараметрыMD, Знач Block)

	Возврат Block;

КонецФункции

// Rule //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Функция blockRule(ПараметрыMD, Line, Знач CurrentBlock = Неопределено)

	marker = Лев(Line["text"], 1);
	
	Если marker <> "-" И marker <> "_" И marker <> "*" Тогда
		Возврат Неопределено;
	КонецЕсли;

	Если КоличествоПодстрок(Line["text"], marker) >= 3 И chop(Line["text"], " " + marker) = "" Тогда
		Element = Новый Структура;
		Element.Вставить("Параметры", Новый Структура());
		Element.Вставить("Шаблон", ПараметрыMD.Шаблоны.el_rule.hr);

		Block = Новый Структура;
		Block.Вставить("element", Element);

		Возврат Block;
	КонецЕсли;

	Возврат Неопределено;

КонецФункции

// Reference //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Функция blockReference(ПараметрыMD, Line, Знач CurrentBlock = Неопределено)
	
	Если СтрНайти(Line["text"], "]") = 0 Или СтрНайти(Line["text"], "[") = 0 Или СтрНайти(Line["text"], ":") = 0 Тогда
		Возврат Неопределено;
	КонецЕсли;

	matches = Неопределено;
	Если preg_match(ПараметрыMD,
		"/^\[(.+?)\]:[ ]*<?(\S+?)>?(?:[ ]+[""\'(](.+)[""\')])?[ ]*$/", Line["text"], matches) Тогда

 		id = НРег(matches[1]);

		Data = Новый Структура;
		Data.Вставить("url", matches[2]);
		Data.Вставить("title", ?(matches.Количество() > 3, matches[3], Неопределено));

		Reference = Новый Соответствие;
		Reference.Вставить(id, data);
		ПараметрыMD.DefinitionData.Вставить("Reference", Reference);

		Block = Новый Структура;
		Block.Вставить("element", Новый Структура);

		Возврат Block;

	КонецЕсли;

	Возврат Неопределено;

КонецФункции

// List //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Функция blockList(ПараметрыMD, Line, Знач CurrentBlock = Неопределено)

	marker = Лев(СокрЛ(Line["text"]), 1);
	Если СтрНайти("0123456789-+*", marker) = 0 Тогда
		Возврат Неопределено;
	КонецЕсли;
	
	Если marker = "-" Или marker = "+" Или marker = "*" Тогда
		name = "ul";
		Шаблон = ПараметрыMD.Шаблоны.el_list.unordered_list;
		pattern = "[*+-]";
	Иначе		
		name = "ol";
		Шаблон = ПараметрыMD.Шаблоны.el_list.ordered_list;
		pattern = "[0-9]{1,9}[.\)]";
	КонецЕсли;
	matches = Неопределено;
	Если preg_match(ПараметрыMD, "/^(" + pattern + "([ ]+|$))(.*)/", Line["text"], matches) Тогда
		ДлинаОтступаПослеМаркера = СтрДлина(matches[2]);

		Если ДлинаОтступаПослеМаркера >= 5 Тогда
			ДлинаОтступаПослеМаркера = ДлинаОтступаПослеМаркера - 1;
			matches[1] = substr(matches[1], 0, -ДлинаОтступаПослеМаркера);
			
			мСтроки = Новый Массив();
			мСтроки.Добавить(str_repeat(" ", ДлинаОтступаПослеМаркера));
			мСтроки.Добавить(matches[3]);
			matches[3] = СтрСоединить(мСтроки);

		ИначеЕсли ДлинаОтступаПослеМаркера = 0 Тогда
			
			мСтроки = Новый Массив();
			мСтроки.Добавить(matches[1]);
			мСтроки.Добавить(" ");
			matches[1] = СтрСоединить(мСтроки);;
		КонецЕсли;

		markerWithoutWhitespace = strstr(matches[1], " ", Истина);
		markerType = ?(name = "ul", markerWithoutWhitespace, substr(markerWithoutWhitespace, -1));
		
		Параметры = Новый Структура();
		Параметры.Вставить("elements", Новый Массив());

		element = Новый Структура;
		element.Вставить("Шаблон", Шаблон);
		element.Вставить("Параметры", Параметры);

		data = Новый Структура;
		data.Вставить("type", name);
		data.Вставить("marker", matches[1]);
		data.Вставить("markerType", markerType);
		data.Вставить("markerTypeRegex", ЭкранироватьСимволыРегВыражения(markerType, "/"));

		Block = Новый Структура;
		Block.Вставить("indent", Line["indent"]);
		Block.Вставить("pattern", pattern);
		Block.Вставить("data", data);
		Block.Вставить("element", element);

		Если name = "ol" Тогда
			Параметры.Вставить("start", "");

			мСтрока = ltrim(strstr(matches[1], markerType, Истина), "0");
			listStart = ?(Не ПустаяСтрока(мСтрока), мСтрока, "0");

			Если listStart <> "1" Тогда
				Если CurrentBlock <> Неопределено И CurrentBlock["type"] = "Paragraph" И Не CurrentBlock.Свойство("interrupted") Тогда
					Возврат Неопределено;
				КонецЕсли;
				Параметры.Вставить("start", "start=""" + Формат(listStart, "ЧГ=0") + """");

				Block["element"].Вставить("attributes", Новый Структура("start", listStart));
			КонецЕсли;
		КонецЕсли;

		argument = Новый Массив;
		Если Не ПустаяСтрока(matches[3]) Тогда
			argument.Добавить(matches[3]);
		КонецЕсли;
		
		handler = Новый Структура;
		handler.Вставить("Функция", "li");
		handler.Вставить("argument", argument);
		handler.Вставить("destination", "elements");
		
		ПараметрыСтроки = Новый Структура();
		ПараметрыСтроки.Вставить("text", handler);

		li = Новый Структура;
		li.Вставить("Шаблон", ПараметрыMD.Шаблоны.el_list.line);
		li.Вставить("Параметры", ПараметрыСтроки);
		Block.Вставить("li", li);

		Block["element"]["Параметры"]["elements"].Добавить(li);

		Возврат Block;

	КонецЕсли;

	Возврат Неопределено;

КонецФункции

Функция blockListContinue(ПараметрыMD, Line, Знач Block)

	Если Block.Свойство("interrupted") И (Не Block.Свойство("li") Или Block["li"]["Параметры"]["text"]["argument"].Количество()
		= 0) Тогда
		Возврат Неопределено;
	КонецЕсли;

	requiredIndent = Block["indent"] + СтрДлина(Block["data"]["marker"]);

	matches = Неопределено;
	Если Line["indent"] < requiredIndent И ((Block["data"]["type"] = "ol" И preg_match(ПараметрыMD, "/^[0-9]+"
		+ Block["data"]["markerTypeRegex"] + "(?:[ ]+(.*)|$)/", Line["text"], matches)) Или (Block["data"]["type"] = "ul"
		И preg_match(ПараметрыMD, "/^" + Block["data"]["markerTypeRegex"] + "(?:[ ]+(.*)|$)/", Line["text"], matches))) Тогда
		Если Block.Свойство("interrupted") Тогда
			Block["li"]["Параметры"]["text"]["argument"].Добавить("");
			Block.Вставить("loose", Истина);

			Block.Удалить("interrupted");
		КонецЕсли;

		Block.Удалить("li");

		text = ?(matches.Количество() > 1, matches[1], "");

		Block["indent"] = Line["indent"];

		argument = Новый Массив;
		argument.Добавить(text);

		handler = Новый Структура;
		handler.Вставить("Функция", "li");
		handler.Вставить("argument", argument);
		handler.Вставить("destination", "elements");  
		
		ПараметрыСтроки = Новый Структура();
		ПараметрыСтроки.Вставить("text", handler);

		li = Новый Структура;
		li.Вставить("Шаблон", ПараметрыMD.Шаблоны.el_list.line);
		li.Вставить("Параметры", ПараметрыСтроки);

		Block.Вставить("li", li);

		Block["element"]["Параметры"]["elements"].Добавить(li);
		Возврат Block;
	ИначеЕсли Line["indent"] < requiredIndent И blockList(ПараметрыMD, Line) <> Неопределено Тогда
		Возврат Неопределено;
	КонецЕсли;

	Если Лев(Line["text"], 1) = "[" И blockReference(ПараметрыMD, Line) <> Неопределено Тогда
		Возврат Block;
	КонецЕсли;

	Если Line["indent"] >= requiredIndent Тогда
		Если Block.Свойство("interrupted") Тогда
			Block["li"]["Параметры"]["text"]["argument"].Добавить("");

			Block.Вставить("loose", Истина);

			Block.Удалить("interrupted");
		КонецЕсли;

		text = substr(Line["body"], requiredIndent);

		Block["li"]["Параметры"]["text"]["argument"].Добавить(text);

		Возврат Block;
	КонецЕсли;

	Если Не Block.Свойство("interrupted") Тогда
		text = preg_replace(ПараметрыMD, "/^[ ]{0," + requiredIndent + "}/", "", Line["body"]);

		Block["li"]["Параметры"]["text"]["argument"].Добавить(text);

		Возврат Block;
	КонецЕсли;
КонецФункции

Функция blockListComplete(ПараметрыMD, Знач Block)
	Если Block.Свойство("loose") Тогда

		Для Индекс = 0 По Block["element"]["Параметры"]["elements"].Количество() - 1 Цикл
			Если Block["element"]["Параметры"]["elements"][Индекс]["Параметры"]["text"]["argument"] <> "" Тогда
				Block["element"]["Параметры"]["elements"][Индекс]["Параметры"]["text"]["argument"].Добавить("");
			КонецЕсли;
		КонецЦикла;
	КонецЕсли;

	Возврат Block;
КонецФункции

#КонецОбласти

#Область ОднострочныеЭлементыInline

Функция inlineText(ПараметрыMD, Знач text)

	Inline = Новый Структура;
	Inline.Вставить("extent", СтрДлина(text));
	Inline.Вставить("element", Новый Структура);

	Elements = Новый Массив;
	Elements.Добавить(Новый Структура("name", "br"));
	Elements.Добавить(Новый Структура("text", Символы.ПС));

	Pattern = ?(ПараметрыMD.breaksEnabled, "/[ ]*\n/", "/(?:[ ]+\\\\|[ ]{2,})\n/");
	text = pregReplaceElements(ПараметрыMD, Pattern, Elements, text);

	Inline["element"].Вставить("elements", text);

	Возврат Inline;

КонецФункции

Функция inlineCode(ПараметрыMD, Excerpt)

	marker = Лев(Excerpt["text"], 1);

	matches = Неопределено;
	Если preg_match(ПараметрыMD, "/^([" + marker + "]+)[ ]*(.+?)[ ]*(?<![" + marker + "])\1(?!" + marker + ")/s",
		Excerpt["text"], matches) Тогда

		text = matches[2];
		text = preg_replace(ПараметрыMD, "/[ ]*\n", " ", text);

		Параметры = Новый Структура();
		Параметры.Вставить("text", text);

		element = Новый Структура;
		element.Вставить("Шаблон", ПараметрыMD.Шаблоны.el_inline.code);
		element.Вставить("Параметры", Параметры);

		Result = Новый Структура;
		Result.Вставить("extent", СтрДлина(matches[0]));
		Result.Вставить("element", element);

		Возврат Result;

	КонецЕсли;

КонецФункции

Функция inlineEmailTag(ПараметрыMD, Excerpt)

	hostnameLabel = "[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?";

	commonMarkEmail = "[a-zA-Z0-9.!#$%&\'*+\/=?^_`{|}~-]+@" + hostnameLabel + "(?:\." + hostnameLabel + ")*)";

	matches = Неопределено;
	Если СтрНайти(Excerpt["text"], ">") > 0 И preg_match(ПараметрыMD, "/^<((mailto:)?" + commonMarkEmail + ">/i",
		Excerpt["text"], matches) Тогда
		url = matches[1];

		Если matches.Количество() > 2 Тогда
			url = "mailto:" + url;
		КонецЕсли;

		Параметры = Новый Структура;
		Параметры.Вставить("href", url);
		Параметры.Вставить("text", matches[1]);

		element = Новый Структура;
		element.Вставить("Шаблон", ПараметрыMD.Шаблоны.el_inline.emailTag);
		element.Вставить("Параметры", Параметры);

		Result = Новый Структура;
		Result.Вставить("extent", СтрДлина(matches[0]));
		Result.Вставить("element", element);

		Возврат Result;

	КонецЕсли;

КонецФункции

Функция inlineEscapeSequence(ПараметрыMD, Excerpt)

	Если СтрДлина(Excerpt["text"]) > 1 И in_array(Сред(Excerpt["text"], 2, 1), ПараметрыMD.specialCharacters) Тогда

		element = Новый Структура;
		element.Вставить("rawHtml", Сред(Excerpt["text"], 2, 1));

		Result = Новый Структура;
		Result.Вставить("element", element);
		Result.Вставить("extent", 2);

		Возврат Result;

	КонецЕсли;

КонецФункции

Функция inlineImage(ПараметрыMD, Excerpt)

	Если СтрДлина(Excerpt["text"]) < 2 Или Сред(Excerpt["text"], 2, 1) <> "[" Тогда
		Возврат Неопределено;
	КонецЕсли;

	Excerpt["text"] = substr(Excerpt["text"], 1);

	Link = inlineLink(ПараметрыMD, Excerpt);

	Если Link = Неопределено Тогда
		Возврат Неопределено;
	КонецЕсли;

	Шаблон = ПараметрыMD.Шаблоны.el_inline.image;

	Параметры = Новый Структура;
	Параметры.Вставить("src", Link["element"]["Параметры"]["href"]);
	Параметры.Вставить("alt", Link["element"]["Параметры"]["text"]["argument"]);

	element = Новый Структура;
	element.Вставить("Шаблон", Шаблон);
	element.Вставить("Параметры", Параметры);
	element.Вставить("autobreak", Истина);

	Inline = Новый Структура;
	Inline.Вставить("extent", Link["extent"] + 1);
	Inline.Вставить("element", element);

	Возврат Inline;

КонецФункции

Функция inlineMarkup(ПараметрыMD, Excerpt)

	Если ПараметрыMD.markupEscaped Или ПараметрыMD.safeMode Или СтрНайти(Excerpt["text"], ">") = 0 Тогда

		Возврат Неопределено;

	КонецЕсли;

	matches = Неопределено;
	Если Лев(Excerpt["text"], 1) = "/" И preg_match(ПараметрыMD, "/^<\/\w[\w-]*[ ]*>/s", Excerpt["text"], matches) Тогда

		element = Новый Структура;
		element.Вставить("rawHtml", matches[0]);

		Result = Новый Структура;
		Result.Вставить("element", element);
		Result.Вставить("extent", СтрДлина(matches[0]));

		Возврат Result;

	КонецЕсли;

	matches = Неопределено;
	Если Лев(Excerpt["text"], 1) = "!" И preg_match(ПараметрыMD, "/^<!---?[^>-](?:-?[^-])*-->/s", Excerpt["text"],
		matches) Тогда

		element = Новый Структура;
		element.Вставить("rawHtml", matches[0]);

		Result = Новый Структура;
		Result.Вставить("element", element);
		Result.Вставить("extent", СтрДлина(matches[0]));

		Возврат Result;

	КонецЕсли;

	matches = Неопределено;
	Если Лев(Excerpt["text"], 1) <> " " И preg_match(ПараметрыMD, "/^<\w[\w-]*(?:[ ]*"
		+ ПараметрыMD.regexHtmlAttribute + ")*[ ]*\/?>/s", Excerpt["text"], matches) Тогда

		element = Новый Структура;
		element.Вставить("rawHtml", matches[0]);

		Result = Новый Структура;
		Result.Вставить("element", element);
		Result.Вставить("extent", СтрДлина(matches[0]));

		Возврат Result;

	КонецЕсли;

КонецФункции

Функция inlineSpecialCharacter(ПараметрыMD, Excerpt)
	
	matches = Неопределено;
	Если substr(Excerpt["text"], 1) <> " " И СтрНайти(Excerpt["text"], ";") > 0
		И preg_match(ПараметрыMD, "/^&(#?[0-9a-zA-Z]+);/", Excerpt["text"], matches) Тогда
		
		element = Новый Структура();
		element.Вставить("rawHtml", "&" + matches[1] + ";");
		
		result = Новый Структура();
		result.Вставить("element", element);
		result.Вставить("extent", СтрДлина(matches[0]));
		
		Возврат result;
		
	КонецЕсли;

	Возврат Неопределено;

КонецФункции

Функция inlineStrikethrough(ПараметрыMD, Excerpt)

	Если СтрДлина(Excerpt["text"]) < 2 Тогда
		Возврат Неопределено;
	КонецЕсли;

	matches = Неопределено;
	Если Лев(Excerpt["text"], 1) = "~" И preg_match(ПараметрыMD, "^[~]{2}((?:\\\\\~|[^*]|[*][^*]*[*])+?)[~]{2}(?![*])", Excerpt["text"],
		matches) Тогда

		handler = Новый Структура;
		handler.Вставить("Функция", "lineElements");
		handler.Вставить("argument", matches[1]);
		handler.Вставить("destination", "elements");

		Параметры = Новый Структура();
		Параметры.Вставить("text", handler);

		element = Новый Структура;
		element.Вставить("Шаблон", ПараметрыMD.Шаблоны.el_inline.strikeThrough);
		element.Вставить("Параметры", Параметры);

		Result = Новый Структура;
		Result.Вставить("extent", СтрДлина(matches[0]));
		Result.Вставить("element", element);

		Возврат Result;

	КонецЕсли;

КонецФункции

Функция inlineUrlTag(ПараметрыMD, Excerpt)

	matches = Неопределено;
	Если СтрНайти(Excerpt["text"], ">") > 0 И preg_match(ПараметрыMD, "/^<(\w+:\/{2}[^ >]+)>/i", Excerpt["text"],
		matches) Тогда

		url = matches[1];

		Параметры = Новый Структура;
		Параметры.Вставить("href", url);

		element = Новый Структура;
		element.Вставить("Шаблон", ПараметрыMD.Шаблоны.el_inline.UrlTag);
		element.Вставить("Параметры", Параметры);

		result = Новый Структура;
		result.Вставить("extent", СтрДлина(matches[0]));
		result.Вставить("element", element);
		Возврат result;

	КонецЕсли;

КонецФункции

Функция inlineUrl(ПараметрыMD, Excerpt)

	Если ПараметрыMD.urlsLinked <> Истина Или СтрДлина(Excerpt["text"]) < 3 Или Сред(Excerpt["text"], 3, 1) <> "/" Тогда
		Возврат Неопределено;
	КонецЕсли;

	matches = Неопределено;
	ПозицияHttp = СтрНайти(Excerpt["context"], "http");
	Если ПозицияHttp > 0 И preg_match(ПараметрыMD, "/\bhttps?:[\/]{2}[^\s<]+\b\/*/ui",
		Excerpt["context"], matches) Тогда
		url = matches[0];

		Параметры = Новый Структура;
		Параметры.Вставить("href", url);

		Element = Новый Структура;
		Element.Вставить("Шаблон", ПараметрыMD.Шаблоны.el_inline.url);
		Element.Вставить("Параметры", Параметры);

		Inline = Новый Структура;
		Inline.Вставить("extent", СтрДлина(matches[0]));
		Inline.Вставить("position", ПозицияHttp - 1);
		Inline.Вставить("element", Element);

		Возврат Inline;
	КонецЕсли;

КонецФункции

Функция inlineLink(ПараметрыMD, Excerpt)
	
	extent = 0;
	remainder = Excerpt["text"];
	matches = Неопределено;
	Если preg_match(ПараметрыMD, "/\[([\S\s]*)\]/", remainder, matches) Тогда
		argument = matches[1];

		extent = extent + СтрДлина(matches[0]);

		remainder = substr(remainder, extent);
	Иначе
		Возврат Неопределено;
	КонецЕсли;

	handler = Новый Структура;
	handler.Вставить("Функция", "lineElements");
	handler.Вставить("argument", argument);
	handler.Вставить("destination", "elements");
	
	Параметры = Новый Структура;
	Параметры.Вставить("href", Неопределено);
	Параметры.Вставить("title", Неопределено);
	Параметры.Вставить("text", handler);

	НеВложенные = Новый Структура;
	НеВложенные.Вставить("Url", "Link");

	Element = Новый Структура;
	Element.Вставить("Шаблон", ПараметрыMD.Шаблоны.el_inline.link);
	Element.Вставить("НеВложенные", НеВложенные);
	Element.Вставить("Параметры", Параметры);

	matches = Неопределено;
	Если preg_match(ПараметрыMD, "/^[(]\s*((?:[^ ()]+|[(][^ )]+[)])+)(?:[ ]+(""[^""]*""|\'[^\']*\'))?\s*[)]/",
		remainder, matches) Тогда
		Element["Параметры"]["href"] = matches[1];

		Если matches.Количество() > 2 Тогда
			Element["Параметры"]["title"] = substr(matches[2], 1, -1);
		КонецЕсли;

		extent = extent + СтрДлина(matches[0]);
	ИначеЕсли preg_match(ПараметрыMD, "/^\s*\[(.*?)\]/", remainder, matches) Тогда
		definition = ?(СтрДлина(matches[1]) = 1, matches[1], handler["argument"]);
		definition = НРег(definition);

		extent = extent + СтрДлина(matches[0]);

	Иначе
		definition = НРег(handler["argument"]);

		Если ПараметрыMD.DefinitionData <> Неопределено Или ПараметрыMD.DefinitionData.Свойство("Reference")
			Или ПараметрыMD.DefinitionData["Reference"].Получить(definition) = Неопределено Тогда
			Возврат Неопределено;
		КонецЕсли;

		Definition = ПараметрыMD.DefinitionData["Reference"].Получить(definition);

		Element["Параметры"]["href"] = Definition["url"];
		Element["Параметры"]["title"] = Definition["title"];
	КонецЕсли;

	Array = Новый Структура;
	Array.Вставить("extent", extent);
	Array.Вставить("element", Element);

	Возврат Array;

КонецФункции

Функция inlineButton(ПараметрыMD, Excerpt)
	
	extent = 0;
	remainder = Excerpt["text"];
	matches = Неопределено;
	Если preg_match(ПараметрыMD, "/^\[!button ((?:[^][]+)*)\]/", remainder, matches) Тогда
		
		Параметры = Новый Структура;

		argument = matches[1];
		extent = extent + СтрДлина(matches[0]);
		remainder = substr(remainder, extent);
		
		matches = Неопределено;
		Если preg_match(ПараметрыMD, "/(\w+?)=(?:""|')(.+?)(?:""|')/", argument, matches) Тогда
			Индекс = 0;
			Пока matches.Количество() >= Индекс + 3 Цикл
				Параметры.Вставить(matches[Индекс + 1], matches[Индекс + 2]);
				Индекс = Индекс + 3;
			КонецЦикла;
		КонецЕсли;
	
	Иначе
		Возврат Неопределено;
	КонецЕсли;
	
	handler = Новый Структура;
	handler.Вставить("Функция", "lineElements");
	handler.Вставить("argument", argument);
	handler.Вставить("destination", "elements");
	
	Параметры.Вставить("href", Неопределено);
	Параметры.Вставить("title", Неопределено);
	Параметры.Вставить("text", handler);

	НеВложенные = Новый Структура;
	НеВложенные.Вставить("Url", "Link");

	Element = Новый Структура;
	Element.Вставить("Шаблон", ПараметрыMD.Шаблоны.el_inline.button);
	Element.Вставить("НеВложенные", НеВложенные);
	Element.Вставить("Параметры", Параметры);

	matches = Неопределено;
	Если preg_match(ПараметрыMD, "/^[(]\s*((?:[^ ()]+|[(][^ )]+[)])+)(?:[ ]+(""[^""]*""|\'[^\']*\'))?\s*[)]/",
		remainder, matches) Тогда
		Element["Параметры"]["href"] = matches[1];

		Если matches.Количество() > 2 Тогда
			Element["Параметры"]["title"] = substr(matches[2], 1, -1);
		КонецЕсли;

		extent = extent + СтрДлина(matches[0]);
	ИначеЕсли preg_match(ПараметрыMD, "/^\s*\[(.*?)\]/", remainder, matches) Тогда
		definition = ?(СтрДлина(matches[1]) = 1, matches[1], handler["argument"]);
		definition = НРег(definition);

		extent = extent + СтрДлина(matches[0]);

	Иначе
		definition = НРег(handler["argument"]);

		Если ПараметрыMD.DefinitionData <> Неопределено Или ПараметрыMD.DefinitionData.Свойство("Reference")
			Или ПараметрыMD.DefinitionData["Reference"].Получить(definition) = Неопределено Тогда
			Возврат Неопределено;
		КонецЕсли;

		Definition = ПараметрыMD.DefinitionData["Reference"].Получить(definition);

		Element["Параметры"]["href"] = Definition["url"];
		Element["Параметры"]["title"] = Definition["title"];
	КонецЕсли;

	Array = Новый Структура;
	Array.Вставить("extent", extent);
	Array.Вставить("element", Element);

	Возврат Array;

КонецФункции

Функция inlineEmphasis(ПараметрыMD, Excerpt)

	marker = Лев(Excerpt["text"], 1);
	Если ПустаяСтрока(marker) Тогда
		Возврат Неопределено;
	КонецЕсли;

	matches = Неопределено;
	Если Сред(Excerpt["text"], 2, 1) = marker И preg_match(ПараметрыMD, ПараметрыMD.StrongRegex[marker],
		Excerpt["text"], matches) Тогда
		Шаблон = ПараметрыMD.Шаблоны.el_inline.emphasisStrong;
	ИначеЕсли preg_match(ПараметрыMD, ПараметрыMD.EmRegex[marker], Excerpt["text"], matches) Тогда
		Шаблон = ПараметрыMD.Шаблоны.el_inline.emphasisEm;
	Иначе
		Возврат Неопределено;
	КонецЕсли;

	Handler = Новый Структура;
	Handler.Вставить("Функция", "lineElements");
	Handler.Вставить("argument", matches[1]);
	Handler.Вставить("destination", "elements");

	Element = Новый Структура;
	Element.Вставить("Шаблон", Шаблон);

	Параметры = Новый Структура();
	Параметры.Вставить("text", Handler);
	Element.Вставить("Параметры", Параметры);

	Inline = Новый Структура;
	Inline.Вставить("extent", СтрДлина(matches[0]));
	Inline.Вставить("element", Element);

	Возврат Inline;

КонецФункции

Функция inlineCheckbox(ПараметрыMD, Excerpt)

	marker = Лев(Excerpt["text"], 1);
	Если ПустаяСтрока(marker) Тогда
		Возврат Неопределено;
	КонецЕсли;

	matches = Неопределено;
	Если preg_match(ПараметрыMD, "/^(\[ \]|\[x\]|\[X\]|\[х\]|\[Х\])/s", Excerpt["text"], matches) Тогда
		Если matches[0] = "[ ]" Тогда
			Шаблон = ПараметрыMD.Шаблоны.el_inline.checkbox;
		Иначе
			Шаблон = ПараметрыMD.Шаблоны.el_inline.checkboxChecked;
		КонецЕсли
	Иначе
		Возврат Неопределено;
	КонецЕсли;

	Element = Новый Структура;
	Element.Вставить("Шаблон", Шаблон);

	Inline = Новый Структура;
	Inline.Вставить("extent", СтрДлина(matches[0]));
	Inline.Вставить("element", Element);

	Возврат Inline;

КонецФункции

Функция inlineMark(ПараметрыMD, Excerpt)

	Если СтрДлина(Excerpt["text"]) < 2 Тогда
		Возврат Неопределено;
	КонецЕсли;

	matches = Неопределено;
	Если Лев(Excerpt["text"], 1) = "=" И preg_match(ПараметрыMD, "/^[=]{2}((?:\\\\\=|[^*]|[*][^*]*[*])+?)[=]{2}(?![*])/s",
	 Excerpt["text"], matches) Тогда

		handler = Новый Структура;
		handler.Вставить("Функция", "lineElements");
		handler.Вставить("argument", matches[1]);
		handler.Вставить("destination", "elements");

		Параметры = Новый Структура();
		Параметры.Вставить("text", handler);

		element = Новый Структура;
		element.Вставить("Шаблон", ПараметрыMD.Шаблоны.el_inline.mark);
		element.Вставить("Параметры", Параметры);

		Result = Новый Структура;
		Result.Вставить("extent", СтрДлина(matches[0]));
		Result.Вставить("element", element);

		Возврат Result;

	КонецЕсли;

КонецФункции

#КонецОбласти
//
// Inline Elements
//

Процедура line(ПараметрыMD, text, НеВложенные = Неопределено, СтрокиHTML)

	Если НеВложенные = Неопределено Тогда
		НеВложенные = Новый Структура;
	КонецЕсли;
	
	СтрокиHTML = Новый Массив();
	elements(ПараметрыMD, lineElements(ПараметрыMD, text, НеВложенные), СтрокиHTML);
	
КонецПроцедуры

Функция lineElements(ПараметрыMD, text, НеВложенные = Неопределено)

	Если НеВложенные = Неопределено Тогда
		НеВложенные = Новый Структура;
	КонецЕсли;
	
        // standardize line breaks
	text = str_replace(Символы.ВК + Символы.ПС, Символы.ПС, text);
	text = str_replace(Символы.ВК, Символы.ПС, text);

	Elements = Новый Массив;

	НеВложенные = ?(НеВложенные.Количество() = 0, Новый Структура, НеВложенные);

       // VarExcerpt is based on the first occurrence of a marker
	мПродолжитьОсновнуюИтерацию = Ложь;
	VarExcerpt = strpbrk(text, ПараметрыMD.inlineMarkerList);
	Пока VarExcerpt <> Ложь Цикл

		marker = Лев(VarExcerpt, 1);

		markerPosition = СтрДлина(text) - СтрДлина(VarExcerpt);
		Excerpt = Новый Структура("text, context", VarExcerpt, text);
		
		Для Каждого inlineType Из ПараметрыMD.InlineTypes[marker] Цикл
			
			// check to see Если the current inline type is nestable in the current context
			Если НеВложенные.Свойство(inlineType) Тогда
				Продолжить;
			КонецЕсли;
			
			Если inlineType = "Emphasis" Тогда
				Inline = inlineEmphasis(ПараметрыMD, Excerpt);
			ИначеЕсли inlineType = "Link" Тогда
				Inline = inlineLink(ПараметрыMD, Excerpt);
			ИначеЕсли inlineType = "Url" Тогда
				Inline = inlineUrl(ПараметрыMD, Excerpt);
			ИначеЕсли inlineType = "UrlTag" Тогда
				Inline = inlineUrlTag(ПараметрыMD, Excerpt);
			ИначеЕсли inlineType = "Strikethrough" Тогда
				Inline = inlineStrikethrough(ПараметрыMD, Excerpt);
			ИначеЕсли inlineType = "Image" Тогда
				Inline = inlineImage(ПараметрыMD, Excerpt);
			ИначеЕсли inlineType = "EmailTag" Тогда
				Inline = inlineEmailTag(ПараметрыMD, Excerpt);
			ИначеЕсли inlineType = "Markup" Тогда
				Inline = inlineMarkup(ПараметрыMD, Excerpt);
			ИначеЕсли inlineType = "EscapeSequence" Тогда
				Inline = inlineEscapeSequence(ПараметрыMD, Excerpt);
			ИначеЕсли inlineType = "Code" Тогда
				Inline = inlineCode(ПараметрыMD, Excerpt);
			ИначеЕсли inlineType = "SpecialCharacter" Тогда
				Inline = inlineSpecialCharacter(ПараметрыMD, Excerpt);
			ИначеЕсли inlineType = "Checkbox" Тогда
				Inline = inlineCheckbox(ПараметрыMD, Excerpt);
			ИначеЕсли inlineType = "Button" Тогда
				Inline = inlineButton(ПараметрыMD, Excerpt);
			ИначеЕсли inlineType = "Mark" Тогда
				Inline = inlineMark(ПараметрыMD, Excerpt);
			ИначеЕсли inlineType = "CodeSecurity" Тогда
			
				Если marker = "&" Тогда
					БезопасныйМаркер = "&amp;";
				ИначеЕсли marker = "'" Тогда
					БезопасныйМаркер = "&#8216;";
				ИначеЕсли marker = """" Тогда
					БезопасныйМаркер = "&quot;";
				ИначеЕсли marker = "<" Тогда
					БезопасныйМаркер =  "&lt;";
				ИначеЕсли marker = ">" Тогда
					БезопасныйМаркер ="&gt;";
				КонецЕсли;
				
				Если БезопасныйМаркер <> "" Тогда
					text = Сред(text, 1, markerPosition)
						+ БезопасныйМаркер 
						+ Сред(text, markerPosition + 2, СтрДлина(text));
					markerPosition = markerPosition + СтрДлина(БезопасныйМаркер) - 1;
				КонецЕсли;	
				Продолжить;
			Иначе
				ВызватьИсключение СтрШаблон(НСтр("ru='Имя метода не найдено: %1'"), "inline" + inlineType);
			КонецЕсли;

			Если Inline = Неопределено Тогда
				Продолжить;
			КонецЕсли;

			// makes sure that the inline belongs to "our" marker

			Если Inline.Свойство("position") И Inline.Свойство("position") > markerPosition Тогда
				Продолжить;
			КонецЕсли;

			// sets a default inline position

			Если Не Inline.Свойство("position") Тогда
				Inline.Вставить("position", markerPosition);
			КонецЕсли;

			// cause the new element to "inherit" our non nestables
			Inline["element"].Вставить("НеВложенные", ?(Inline["element"].Свойство("НеВложенные"), array_merge(
				Inline["element"]["НеВложенные"], НеВложенные), НеВложенные));

			// Вставляем текст, который идет до inline, избавляемся от опознавательных знаков.
			unmarkedText = substr(text, 0, Inline["position"]);
			InlineText = inlineText(ПараметрыMD, unmarkedText);
			Elements.Добавить(InlineText["element"]);

			// Вставляем найденный inline.
			Elements.Добавить(extractElement(Inline));

			// Удаляем обработанный текст.
			text = substr(text, Inline["position"] + Inline["extent"]);

			мПродолжитьОсновнуюИтерацию = Истина;
			Прервать;
		КонецЦикла;

		Если мПродолжитьОсновнуюИтерацию Тогда
			VarExcerpt = strpbrk(text, ПараметрыMD.inlineMarkerList);
			мПродолжитьОсновнуюИтерацию = Ложь;
			Продолжить;
		КонецЕсли;

        // the marker does not belong to an inline

		unmarkedText = substr(text, 0, markerPosition + 1);

		InlineText = inlineText(ПараметрыMD, unmarkedText);
		Elements.Добавить(InlineText["element"]);

		text = substr(text, markerPosition + 1);
		VarExcerpt = strpbrk(text, ПараметрыMD.inlineMarkerList);
	КонецЦикла;

	InlineText = inlineText(ПараметрыMD, text);
	Elements.Добавить(InlineText["element"]);
	Для Индекс = 0 По Elements.Количество() - 1 Цикл
		Если Не Elements[Индекс].Свойство("autobreak") Тогда
			Elements[Индекс].Вставить("autobreak", Ложь);
		КонецЕсли;
	КонецЦикла;

	Возврат Elements;

КонецФункции

//    //
//    // ~
//    //



//    // ~

//    Функция unmarkedText(text)
//    {
//        Inline = inlineText(text);
//        Возврат element(Inline["element"]);
//    }

//    //
//    // Handlers
//    //

Функция handle(ПараметрыMD, Element)

	Если Element.Свойство("handler") Тогда
		Если Не Element.Свойство("НеВложенные") Тогда
			Element.Вставить("НеВложенные", Новый Массив);
		КонецЕсли;

		Если ТипЗнч(Element["handler"]) = Тип("Строка") Тогда
			Обработчик = Element["handler"];
			argument = Element["text"];
			Element.Удалить("text");
			destination = "rawHtml";
		Иначе
			Обработчик = Element["handler"]["Функция"];
			argument = Element["handler"]["argument"];
			destination = Element["handler"]["destination"];
		КонецЕсли;

		Если Обработчик = "li" Тогда
			Element.Вставить(destination, li(ПараметрыMD, argument));
		ИначеЕсли Обработчик = "lineElements" Тогда
			Element.Вставить(destination, lineElements(ПараметрыMD, argument, Element["НеВложенные"]));
		ИначеЕсли Обработчик = "linesElements" Тогда
			Element.Вставить(destination, linesElements(ПараметрыMD, argument));
		Иначе
			ВызватьИсключение СтрШаблон(НСтр("ru='Обработчик не найден: %1'"), Обработчик);
		КонецЕсли;

		Если destination = "handler" Тогда
			Element = handle(ПараметрыMD, Element);
		КонецЕсли;

		Element.Удалить("handler");
	КонецЕсли;

	Возврат Element;

КонецФункции

//    Функция handleElementRecursive(array Element)
//    {
//        Возврат elementApplyRecursive(array(this, "handle"), Element);
//    }

//    Функция handleElementsRecursive(array Elements)
//    {
//        Возврат elementsApplyRecursive(array(this, "handle"), Elements);
//    }

//    Функция elementApplyRecursive(closure, array Element)
//    {
//        Element = call_user_func(closure, Element);

//        Если (isset(Element["elements"]))
//        {
//            Element["elements"] = elementsApplyRecursive(closure, Element["elements"]);
//        }
//        ИначеЕсли (isset(Element["element"]))
//        {
//            Element["element"] = elementApplyRecursive(closure, Element["element"]);
//        }

//        Возврат Element;
//    }

//    Функция elementApplyRecursiveDepthFirst(closure, array Element)
//    {
//        Если (isset(Element["elements"]))
//        {
//            Element["elements"] = elementsApplyRecursiveDepthFirst(closure, Element["elements"]);
//        }
//        ИначеЕсли (isset(Element["element"]))
//        {
//            Element["element"] = elementsApplyRecursiveDepthFirst(closure, Element["element"]);
//        }

//        Element = call_user_func(closure, Element);

//        Возврат Element;
//    }

//    Функция elementsApplyRecursive(closure, array Elements)
//    {
//        foreach (Elements as &Element)
//        {
//            Element = elementApplyRecursive(closure, Element);
//        }

//        Возврат Elements;
//    }

//    Функция elementsApplyRecursiveDepthFirst(closure, array Elements)
//    {
//        foreach (Elements as &Element)
//        {
//            Element = elementApplyRecursiveDepthFirst(closure, Element);
//        }

//        Возврат Elements;
//    }

Процедура ЗаполнитьПараметры(ПараметрыMD, Шаблон, Параметры, СтрокиHTML)
	
	ДлинаШаблона = СтрДлина(Шаблон);
	Указатель = 0;
	Пока Истина Цикл
		
		Указатель = Указатель + 1;
		
		Если Указатель >= ДлинаШаблона Тогда
			Прервать;
		КонецЕсли;

		НачалоТега = СтрНайти(Шаблон, "{{", , Указатель);
		
		Если НачалоТега = 0 Тогда
			мДобавляемаяЧасть = Сред(Шаблон, Указатель);
			СтрокиHTML.Добавить(мДобавляемаяЧасть);
			Прервать;
		КонецЕсли;

		КонецТега = СтрНайти(Шаблон, "}}", , Указатель);

		мДобавляемаяЧасть = Сред(Шаблон, Указатель, НачалоТега - Указатель);
		СтрокиHTML.Добавить(мДобавляемаяЧасть);
		
		ИмяПараметра = Сред(Шаблон, НачалоТега + 2, КонецТега - НачалоТега - 2);
		
		ПоУмолчанию = Неопределено;
		мПозиция = СтрНайти(ИмяПараметра, "??");
		Если мПозиция > 0 Тогда
			ПоУмолчанию = Сред(ИмяПараметра, мПозиция + 2);
			ИмяПараметра = Сред(ИмяПараметра, 1, мПозиция - 1);
		КонецЕсли;

		Если Не Параметры.Свойство(ИмяПараметра) Тогда
			Если ПоУмолчанию <> Неопределено Тогда
				Параметры.Вставить(ИмяПараметра, ПоУмолчанию);
			Иначе
				Указатель = КонецТега + 1;
				Продолжить;
			КонецЕсли;
		КонецЕсли;
		
		Если ТипЗнч(Параметры[ИмяПараметра]) = Тип("Структура") Тогда
			мЭлемент = handle(ПараметрыMD, Новый Структура("handler", Параметры[ИмяПараметра]));
			element(ПараметрыMD, мЭлемент, СтрокиHTML);
		ИначеЕсли ТипЗнч(Параметры[ИмяПараметра]) = Тип("Массив") Тогда
			Для Каждого мЭлементМассива Из Параметры[ИмяПараметра] Цикл 
				Если ТипЗнч(мЭлементМассива) = Тип("Структура") Тогда
					мЭлементМассива = handle(ПараметрыMD, мЭлементМассива);
					element(ПараметрыMD, мЭлементМассива, СтрокиHTML);
				Иначе
					СтрокиHTML.Добавить(мЭлементМассива);
				КонецЕсли;
			КонецЦикла;
		Иначе
			СтрокиHTML.Добавить(Параметры[ИмяПараметра]);
		КонецЕсли;

		Указатель = КонецТега + 1;
		
	КонецЦикла;

КонецПроцедуры

Процедура element(ПараметрыMD, Element, СтрокиHTML)
	
	Если ПараметрыMD.safeMode Тогда
        // TODO: Доделать данный режим.
        // Element = sanitiseElement(Element);
	КонецЕсли;

	Если Element.Свойство("Шаблон") Тогда
			
		ЗаполнитьПараметры(ПараметрыMD, Element.Шаблон, Element.Параметры, СтрокиHTML);

		Возврат;

	КонецЕсли;

    // identity map Если element has no handler
	
	Element = handle(ПараметрыMD, Element);

	hasName = Element.Свойство("name");

	Если hasName Тогда
		СтрокиHTML.Добавить("<" + Element["name"]);
		Если Element.Свойство("attributes") Тогда
			Для Каждого Поле Из Element["attributes"] Цикл
				Если Поле.Значение = Неопределено Тогда
					Продолжить;
				КонецЕсли;
				СтрокиHTML.Добавить(" ");
				СтрокиHTML.Добавить(Поле.Ключ);
				СтрокиHTML.Добавить("=""");
				СтрокиHTML.Добавить(escape(Поле.Значение));
				СтрокиHTML.Добавить("""");
			КонецЦикла;
		КонецЕсли;
	КонецЕсли;

	permitRawHtml = Ложь;

	Если Element.Свойство("text") Тогда
		text = Element["text"];
	ИначеЕсли Element.Свойство("rawHtml") Тогда
		text = Element["rawHtml"];

		allowRawHtmlInSafeMode = ?(Element.Свойство("allowRawHtmlInSafeMode"), Element["allowRawHtmlInSafeMode"], Ложь);
		permitRawHtml = Не ПараметрыMD.safeMode Или allowRawHtmlInSafeMode;
	КонецЕсли;

	hasContent = text <> Неопределено Или Element.Свойство("element") Или Element.Свойство("elements");

	Если hasContent Тогда
		СтрокиHTML.Добавить(?(hasName, ">", ""));

		Если Element.Свойство("elements") Тогда
			elements(ПараметрыMD, Element["elements"], СтрокиHTML);
		ИначеЕсли Element.Свойство("element") Тогда
			element(ПараметрыMD, Element["element"], СтрокиHTML);
		Иначе
			Если Не permitRawHtml Тогда
				СтрокиHTML.Добавить(escape(text, Истина));
			Иначе
				СтрокиHTML.Добавить(text);
			КонецЕсли;
		КонецЕсли;
		
		Если hasName Тогда
			СтрокиHTML.Добавить("</" + Element["name"] + ">");
		КонецЕсли;

	ИначеЕсли hasName Тогда
		СтрокиHTML.Добавить(" />");
	КонецЕсли;

КонецПроцедуры

Процедура elements(ПараметрыMD, Elements, СтрокиHTML)

	autoBreak = Истина;

	Для Каждого Element Из Elements Цикл
		
		Если Не ЗначениеЗаполнено(Element) Тогда
			Продолжить;
		КонецЕсли;

		autoBreakNext = ?(Element.Свойство("autobreak"), Element.autobreak, Element.Свойство("name"));
		// (autobreak === Ложь) covers both sides of an element
		autoBreak = ?(Не autoBreak, autoBreak, autoBreakNext);
		
		СтрокиHTML.Добавить(?(autoBreak, Символы.ПС, ""));
		element(ПараметрыMD, Element, СтрокиHTML);
		autoBreak = autoBreakNext;

	КонецЦикла;
	
	СтрокиHTML.Добавить(?(autoBreak, Символы.ПС, ""));

КонецПроцедуры

// ~

Функция li(ПараметрыMD, lines)
	Elements = linesElements(ПараметрыMD, lines);

	Если Не in_array("", lines) И Elements.Количество() > 0 И Elements[0].Свойство("name") И ТипЗнч(Elements[0].name) = Тип("Строка")
		И Elements[0].name = "p" Тогда
		Elements[0].Удалить("name");
	КонецЕсли;

	Возврат Elements;
КонецФункции

//    //
//    // AST Convenience
//    //

//    /**
//     * Replace occurrences regexp with Elements in text. Return an array of
//     * elements representing the replacement.
//     */
Функция pregReplaceElements(ПараметрыMD, regexp, Elements, text)

	newElements = Новый Массив;

	matches = Неопределено;
	Пока preg_match(ПараметрыMD, regexp, text, matches, "PREG_OFFSET_CAPTURE") Цикл

		offset = matches[0][1]; 
		before = substr(text, 0, offset);

		after = substr(text, Число(offset) + Число(СтрДлина(matches[0][0])));

		newElements.Добавить(Новый Структура("text", before));

		Для Каждого Element Из Elements Цикл
			newElements.Добавить(Element);
		КонецЦикла;

		text = after;
	КонецЦикла;

	newElements.Добавить(Новый Структура("text", text));

	Возврат newElements;

КонецФункции

//    //
//    // Deprecated Methods
//    //

//    Функция parse(text)
//    {
//        markup = text(text);

//        Возврат markup;
//    }

//    Функция sanitiseElement(array Element)
//    {
//        static goodAttribute = "/^[a-zA-Z0-9][a-zA-Z0-9-_]*+$/";
//        static safeUrlNameToAtt  = array(
//            "a"   => "href",
//            "img" => "src",
//        );

//        Если ( Не isset(Element["name"]))
//        {
//            unset(Element["attributes"]);
//            Возврат Element;
//        }

//        Если (isset(safeUrlNameToAtt[Element["name"]]))
//        {
//            Element = filterUnsafeUrlInAttribute(Element, safeUrlNameToAtt[Element["name"]]);
//        }

//        Если ( Не empty(Element["attributes"]))
//        {
//            foreach (Element["attributes"] as att => val)
//            {
//                // filter out badly parsed attribute
//                Если ( Не preg_match(ПараметрыMD, goodAttribute, att))
//                {
//                    unset(Element["attributes"][att]);
//                }
//                // dump onevent attribute
//                ИначеЕсли (self::striAtStart(att, "on"))
//                {
//                    unset(Element["attributes"][att]);
//                }
//            }
//        }

//        Возврат Element;
//    }

//    Функция filterUnsafeUrlInAttribute(array Element, attribute)
//    {
//        foreach (ПараметрыMD.safeLinksWhitelist as scheme)
//        {
//            Если (self::striAtStart(Element["attributes"][attribute], scheme))
//            {
//                Возврат Element;
//            }
//        }

//        Element["attributes"][attribute] = str_replace(":", "%3A", Element["attributes"][attribute]);

//        Возврат Element;
//    }

//    //
//    // Static Methods
//    //

Функция escape(text, allowQuotes = Ложь)
    // TODO: Избавиться от спец символов аналог htmlspecialchars;
    // Возврат htmlspecialchars(text, allowQuotes ? ENT_NOQUOTES : ENT_QUOTES, "UTF-8");
	Возврат text;
КонецФункции

//    static Функция striAtStart(string, needle)
//    {
//        len = СтрДлина(needle);

//        Если (len > СтрДлина(string))
//        {
//            Возврат Ложь;
//        }
//        Иначе
//        {
//            Возврат НРег(substr(string, 0, len)) === НРег(needle);
//        }
//    }

//    static Функция instance(name = "default")
//    {
//        Если (isset(self::instances[name]))
//        {
//            Возврат self::instances[name];
//        }

//        instance = new static();

//        self::instances[name] = instance;

//        Возврат instance;
//    }


/////////////// PHP to 1C

Функция in_array(Знач Значение, Массив)
	Возврат Массив.Найти(Значение) <> Неопределено;
КонецФункции

Функция trim(Строка, Символы = Неопределено) Экспорт

	ДлинаСимволов = СтрДлина(Символы);
	Если Символы = Неопределено Или ПустаяСтрока(Символы) Тогда
		Возврат СокрЛП(Строка);
	КонецЕсли;

	Результат = chop(Строка, Символы);
	Результат = ltrim(Результат, Символы);

	Возврат Результат;

КонецФункции

Функция chop(Строка, Символы = Неопределено)

	Если Символы = Неопределено Или Символы = "" Тогда
		Возврат СокрП(Строка);
	КонецЕсли;

	Результат = Строка;
	Пока Прав(Результат, 1) <> "" И СтрНайти(Символы, Прав(Результат, 1)) > 0 Цикл
		Результат = Лев(Результат, СтрДлина(Результат) - 1);
	КонецЦикла;

	Возврат Результат;

КонецФункции

Функция ltrim(Строка, Символы = Неопределено)

	Если Символы = Неопределено Или Символы = "" Тогда
		Возврат СокрП(Строка);
	КонецЕсли;

	Результат = Строка;
	Пока Лев(Результат, 1) <> "" И СтрНайти(Символы, Лев(Результат, 1)) > 0 Цикл
		Результат = Прав(Результат, СтрДлина(Результат) - 1);
	КонецЦикла;

	Возврат Результат;

КонецФункции

Функция str_replace(search, replace, subject, count = Неопределено)

	Возврат СтрЗаменить(subject, search, replace)

КонецФункции

Функция strstr(haystack, needle, before_needle = Ложь)

	Позиция = СтрНайти(haystack, needle);
	Если Позиция = 0 Тогда
		Возврат Ложь;
	КонецЕсли;

	Если before_needle И (Позиция - 1) = 0 Тогда
		Возврат "";
	ИначеЕсли before_needle Тогда
		Возврат Сред(haystack, 1, Позиция - 1);
	Иначе
		Возврат Сред(haystack, Позиция, СтрДлина(haystack));
	КонецЕсли;

КонецФункции

Функция str_repeat(Знач input, Знач multiplier)

	Результат = "";
	Для Шаг = 1 По multiplier Цикл
		Результат = Результат + input;
	КонецЦикла;

	Возврат Результат;

КонецФункции

Функция substr(Знач string, Знач offset, Знач length = Неопределено)

	Если offset < 0 Тогда
		string = Прав(string, СтрДлина(offset) - 1);
		offset = 1;
	Иначе
		offset = offset + 1;
	КонецЕсли;

	Если length = Неопределено Тогда
		length = СтрДлина(string);
	ИначеЕсли length < 0 Тогда
		length = СтрДлина(string) + length;
	КонецЕсли;

	length = length - offset + 1;

	Возврат Сред(string, offset, length);

КонецФункции

Функция strspn(str1, str2)

	Результат = 0;
	Для Шаг = 1 По СтрДлина(str1) Цикл
		Символ = Сред(str1, Шаг, 1);
		Если СтрНайти(str2, Символ) = 0 Тогда
			Возврат Результат;
		КонецЕсли;
		Результат = Результат + 1;
	КонецЦикла;

	Возврат Результат;

КонецФункции

Функция strcspn(Строка, Символы)

	Результат = 0;
	Для Шаг = 1 По СтрДлина(Строка) Цикл
		Символ = Сред(Строка, Шаг, 1);
		Если СтрНайти(Символы, Символ) > 0 Тогда
			Возврат Результат;
		КонецЕсли;
		Результат = Результат + 1;
	КонецЦикла;

	Возврат Результат;

КонецФункции

Функция strpbrk(Знач Строка, Знач Символы)

	Для Шаг = 1 По СтрДлина(Строка) Цикл
		Символ = Сред(Строка, Шаг, 1);
		Если СтрНайти(Символы, Символ) > 0 Тогда
			Возврат Сред(Строка, Шаг, СтрДлина(Строка));
		КонецЕсли;
	КонецЦикла;

	Возврат Ложь;

КонецФункции

// Функция формируется прогрммно скриптом в репозитории docsinum/СформироватьМетодМетодСуществет.os
//
Функция МетодСуществует(Знач Метод)

	Метод = НРег(Метод);
	
	Если
			Метод = "параметрыmd"
			Или Метод = "сформироватьhtml"
			Или Метод = "textelements" 
			Или Метод = "blockalertcomplete" 
			Или Метод = "lineselements"
			Или Метод = "extractelement"
			Или Метод = "isblockcontinuable"
			Или Метод = "isblockcompletable"
			Или Метод = "blocktable"
			Или Метод = "blocktablecontinue"
			Или Метод = "blockquote"
			Или Метод = "blockquotecontinue"
			Или Метод = "paragraph"
			Или Метод = "paragraphcontinue"
			Или Метод = "blocksetextheader"
			Или Метод = "blockmarkup"
			Или Метод = "blockmarkupcontinue"
			Или Метод = "blockcomment"
			Или Метод = "blockcommentcontinue"
			Или Метод = "blockalert"
			Или Метод = "blockalertcontinue"
			Или Метод = "blockfencedcode"
			Или Метод = "blockfencedcodecontinue"
			Или Метод = "blockfencedcodecomplete"
			Или Метод = "blockheader"
			Или Метод = "blockcode"
			Или Метод = "blockcodecontinue"
			Или Метод = "blockcodecomplete"
			Или Метод = "blockrule"
			Или Метод = "blockreference"
			Или Метод = "blocklist"
			Или Метод = "blocklistcontinue"
			Или Метод = "blocklistcomplete"
			Или Метод = "inlinetext"
			Или Метод = "inlinecode"
			Или Метод = "inlineemailtag"
			Или Метод = "inlineescapesequence"
			Или Метод = "inlineimage"
			Или Метод = "inlinemarkup"
			Или Метод = "inlinespecialcharacter"
			Или Метод = "inlinestrikethrough"
			Или Метод = "inlineurltag"
			Или Метод = "inlineurl"
			Или Метод = "inlinelink"
			Или Метод = "inlineemphasis"
			Или Метод = "inlinemark"
			Или Метод = "lineelements"
			Или Метод = "unmarkedtext"
			Или Метод = "handle"
			Или Метод = "handleelementrecursive"
			Или Метод = "handleelementsrecursive"
			Или Метод = "elementapplyrecursive"
			Или Метод = "elementapplyrecursivedepthfirst"
			Или Метод = "elementsapplyrecursive"
			Или Метод = "elementsapplyrecursivedepthfirst"
			Или Метод = "li"
			Или Метод = "pregreplaceelements"
			Или Метод = "parse"
			Или Метод = "sanitiseelement"
			Или Метод = "filterunsafeurlinattribute"
			Или Метод = "escape"
			Или Метод = "striatstart"
			Или Метод = "instance"
			Или Метод = "in_array"
			Или Метод = "trim"
			Или Метод = "chop"
			Или Метод = "ltrim"
			Или Метод = "str_replace"
			Или Метод = "strstr"
			Или Метод = "str_repeat"
			Или Метод = "substr"
			Или Метод = "strspn"
			Или Метод = "strcspn"
			Или Метод = "strpbrk"
			Или Метод = "методсуществует"
			Или Метод = "array_combine"
			Или Метод = "array_merge"
			Или Метод = "preg_match"
			Или Метод = "preg_match_all"
			Или Метод = "array_slice"
			Или Метод = "preg_replace"
			Или Метод = "количествоподстрок"
			Или Метод = "экранироватьсимволырегвыражения"  Тогда
			Возврат Истина;
	КонецЕсли;
	
	Возврат Ложь;
	
КонецФункции

Функция array_combine(Массив1, Массив2)

	Если Массив1.Количество() <> Массив2.Количество() Тогда
		Возврат Ложь;
	КонецЕсли;

	Результат = Новый Структура;

	Для Индекс = 0 По Массив1.Количество() - 1 Цикл
		Результат.Вставить(Строка(Массив1[Индекс]), Массив2[Индекс]);
	КонецЦикла;

	Возврат Результат;

КонецФункции

Функция array_merge(Структура1, Структура2)

	Результат = Новый Структура;

	Для Каждого Элемент Из Структура1 Цикл
		Результат.Вставить(Элемент.Ключ, Элемент.Значение);
	КонецЦикла;

	Для Каждого Элемент Из Структура2 Цикл
		Результат.Вставить(Элемент.Ключ, Элемент.Значение);
	КонецЦикла;

	Возврат Результат;

КонецФункции

Функция preg_match(ПараметрыMD, Знач pattern, subject, matches = Неопределено, flags = "", offset = 0)

	Если Лев(pattern, 1) = "/" Тогда
		pattern = Прав(pattern, СтрДлина(pattern) - 1);
	КонецЕсли;

	Если Прав(pattern, 1) = "/" Тогда
		pattern = Лев(pattern, СтрДлина(pattern) - 1);
	КонецЕсли;

	мПараметр = "/s";
	мДлинаПараметра = СтрДлина(мПараметр);
	Если Прав(pattern, мДлинаПараметра) = мПараметр Тогда
		МногострочныйРежим = Ложь;
		pattern = Лев(pattern, СтрДлина(pattern) - мДлинаПараметра);
	Иначе
		МногострочныйРежим = Истина;
	КонецЕсли;

	мПараметр = "/i";
	мДлинаПараметра = СтрДлина(мПараметр);
	Если Прав(pattern, мДлинаПараметра) = мПараметр Тогда
		ИгнорироватьРегистр = Истина;
		pattern = Лев(pattern, СтрДлина(pattern) - мДлинаПараметра);
	Иначе
		ИгнорироватьРегистр = Ложь;
	КонецЕсли;

	мПараметр = "/us";
	мДлинаПараметра = СтрДлина(мПараметр);
	Если Прав(pattern, мДлинаПараметра) = мПараметр Тогда
		МногострочныйРежим = Ложь;
		pattern = Лев(pattern, СтрДлина(pattern) - мДлинаПараметра);
	Иначе
		МногострочныйРежим = Истина;
	КонецЕсли;

	мПараметр = "/ui";
	мДлинаПараметра = СтрДлина(мПараметр);
	Если Прав(pattern, мДлинаПараметра) = мПараметр Тогда
		МногострочныйРежим = Ложь;
		pattern = Лев(pattern, СтрДлина(pattern) - мДлинаПараметра);
	Иначе
		МногострочныйРежим = Истина;
	КонецЕсли;

	Если ПараметрыMD.Свойство("ЭтоOneScript") Тогда

		РегВыражение = ПараметрыMD.МетодыOneScript.СоздатьРегулярноеВыражение(pattern);
		РегВыражение.Многострочный = МногострочныйРежим;

		Совпадения = РегВыражение.НайтиСовпадения(subject);
		matches = Новый Массив;
		Для Каждого Совпадение Из Совпадения Цикл
			Если flags = "PREG_OFFSET_CAPTURE" Тогда
				мЭлемент = Новый Массив;
				Для Каждого Группа Из Совпадение.Группы Цикл
					мЭлемент.Добавить(Прав(Группа.Значение, 1));
					мЭлемент.Добавить(Группа.Индекс + Группа.Длина - 1);
				КонецЦикла;
				matches.Добавить(мЭлемент);
			Иначе
				Для Каждого Группа Из Совпадение.Группы Цикл
					matches.Добавить(Группа.Значение);
				КонецЦикла;
			КонецЕсли;
		КонецЦикла;

	Иначе
		РегВыражение = ПараметрыMD.RegEx;

		РегВыражение.НайтиСовпадения(subject, pattern, Истина);
		matches = Новый Массив;
		Пока РегВыражение.Следующий() Цикл
			Если flags = "PREG_OFFSET_CAPTURE" Тогда
				мЭлемент = Новый Массив;
				мЭлемент.Добавить(Прав(РегВыражение.ТекущееЗначение, 1));
				мЭлемент.Добавить(РегВыражение.FirstIndex + СтрДлина(РегВыражение.ТекущееЗначение) - 1);
				matches.Добавить(мЭлемент);
			Иначе
				matches.Добавить(РегВыражение.ТекущееЗначение);
				Для Шаг = 0 По РегВыражение.КоличествоВложенныхГрупп() - 1 Цикл
					matches.Добавить(РегВыражение.ПолучитьПодгруппу(Шаг));
				КонецЦикла;
			КонецЕсли;
		КонецЦикла;

		// TODO: Внедрить фрагмент кода для платформы 8.3.23, только учесть что на рег.выражении \[((?:[^][]+)*)\] выдает ошибку, возможно надо написать вот так \[((?:[^]\[]+)*)\]
		//	
		// matches = Новый Массив;
		//	Совпадения = СтрНайтиВсеПоРегулярномуВыражению(subject, pattern, Истина); 	
		//	Для Каждого Совпадение Из Совпадения Цикл					
		//		matches.Добавить(Совпадение.Значение);
		//		Группы = Совпадение.ПолучитьГруппы();
		//		Если flags = "PREG_OFFSET_CAPTURE" Тогда
		//			мЭлемент = Новый Массив;
		//			Для Каждого Группа Из Группы Цикл
		//				мЭлемент.Добавить(Прав(Группа.Значение, 1));
		//				мЭлемент.Добавить(Группа.Индекс + Группа.Длина - 1);
		//			КонецЦикла;
		//			matches.Добавить(мЭлемент);
		//		Иначе
		//			Для Каждого Группа Из Группы Цикл
		//				matches.Добавить(Группа.Значение);
		//			КонецЦикла;
		//		КонецЕсли;
		//	КонецЦикла;


	КонецЕсли;

	Возврат matches.Количество() > 0;

КонецФункции

Функция preg_match_all(ПараметрыMD, Знач pattern, Знач subject, matches = Неопределено, Знач flags = "", Знач offset = 0)

	Если Лев(pattern, 1) = "/" Тогда
		pattern = Прав(pattern, СтрДлина(pattern) - 1);
	КонецЕсли;

	Если Прав(pattern, 1) = "/" Тогда
		pattern = Лев(pattern, СтрДлина(pattern) - 1);
	КонецЕсли;

	мПараметр = "/s";
	мДлинаПараметра = СтрДлина(мПараметр);
	Если Прав(pattern, мДлинаПараметра) = мПараметр Тогда
		МногострочныйРежим = Ложь;
		pattern = Лев(pattern, СтрДлина(pattern) - мДлинаПараметра);
	Иначе
		МногострочныйРежим = Истина;
	КонецЕсли;

	мПараметр = "/i";
	мДлинаПараметра = СтрДлина(мПараметр);
	Если Прав(pattern, мДлинаПараметра) = мПараметр Тогда
		МногострочныйРежим = Ложь;
		pattern = Лев(pattern, СтрДлина(pattern) - мДлинаПараметра);
	Иначе
		МногострочныйРежим = Истина;
	КонецЕсли;

	мПараметр = "/us";
	мДлинаПараметра = СтрДлина(мПараметр);
	Если Прав(pattern, мДлинаПараметра) = мПараметр Тогда
		МногострочныйРежим = Ложь;
		pattern = Лев(pattern, СтрДлина(pattern) - мДлинаПараметра);
	Иначе
		МногострочныйРежим = Истина;
	КонецЕсли;

	Если ПараметрыMD.Свойство("ЭтоOneScript") Тогда

		РегВыражение = ПараметрыMD.МетодыOneScript.СоздатьРегулярноеВыражение(pattern);
		РегВыражение.Многострочный = МногострочныйРежим;

		Совпадения = РегВыражение.НайтиСовпадения(subject);
		matches = Новый Массив;
		Для Каждого Совпадение Из Совпадения Цикл
			Индекс = 0;
			Для Каждого Группа Из Совпадение.Группы Цикл
				Если matches.Количество() < Индекс + 1 Тогда
					matches.Добавить(Новый Массив);
				КонецЕсли;

				matches[Индекс].Добавить(Группа.Значение);

				Индекс = Индекс + 1;
			КонецЦикла;
		КонецЦикла;

	Иначе
		РегВыражение = ПараметрыMD.RegEx;
		РегВыражение.ВсеСовпадения = Истина;
		РегВыражение.НайтиСовпадения(subject, pattern, Истина);
		matches = Новый Массив;
		Совпадения = Новый Массив;
		Пока РегВыражение.Следующий() Цикл
			Совпадения.Добавить(РегВыражение.ТекущееЗначение);
		КонецЦикла;
		matches.Добавить(Совпадения);

		//	TODO: Внедрить фрагмент кода для платформы 8.3.23
		//
		//	matches = Новый Массив;
		//	Совпадения = СтрНайтиВсеПоРегулярномуВыражению(subject, pattern, Истина); 	
		//	мМассив = Новый Массив();
		//	Для Каждого Совпадение Из Совпадения Цикл					
		//		мМассив.Добавить(Совпадение.Значение);
		//	КонецЦикла;
		//	matches.Добавить(мМассив)

	КонецЕсли;

	Возврат matches.Количество() > 0;

КонецФункции

Функция array_slice(Массив, Знач НачальныйИндекс = 0, Знач КоличествоЭлементов = 99999999999999)

	Если НачальныйИндекс < 0 Тогда
		НачальныйИндекс = Массив.Количество() + НачальныйИндекс + 1;
	КонецЕсли;

	НовыйМассив = Новый Массив;
	Для Индекс = НачальныйИндекс По Массив.Количество() - 1 Цикл
		НовыйМассив.Добавить(Массив[Индекс]);
		Если НовыйМассив.Количество() = КоличествоЭлементов Тогда
			Прервать;
		КонецЕсли;
	КонецЦикла;

	Возврат НовыйМассив;

КонецФункции

Функция preg_replace(ПараметрыMD, Знач pattern, Знач replacement, Знач subject)

	Если Лев(pattern, 1) = "/" Тогда
		pattern = Прав(pattern, СтрДлина(pattern) - 1);
	КонецЕсли;

	Если Прав(pattern, 1) = "/" Тогда
		pattern = Лев(pattern, СтрДлина(pattern) - 1);
	КонецЕсли;

	мПараметр = "/s";
	мДлинаПараметра = СтрДлина(мПараметр);
	Если Прав(pattern, мДлинаПараметра) = "/s" Тогда
		МногострочныйРежим = Ложь;
		pattern = Лев(pattern, СтрДлина(pattern) - мДлинаПараметра);
	Иначе
		МногострочныйРежим = Истина;
	КонецЕсли;

	Если ПараметрыMD.Свойство("ЭтоOneScript") Тогда
		РегВыражение = ПараметрыMD.МетодыOneScript.СоздатьРегулярноеВыражение(pattern);
		РегВыражение.Многострочный = МногострочныйРежим;
		result = РегВыражение.Заменить(subject, replacement);
	Иначе
		РегВыражение = ПараметрыMD.RegEx;
		result = РегВыражение.Заменить(subject, pattern, replacement);
		
		//	TODO: Внедрить фрагмент кода для платформы 8.3.23
		//	result = СтрЗаменитьПоРегулярномуВыражению(subject, pattern, replacement);

	КонецЕсли;

	Возврат result;

КонецФункции

Функция КоличествоПодстрок(исходнаяСтрока, подстрока)
    // TODO: КАк это можно ускорить? Возможно потоки содержат методы для поиска подстроки?, возможно посмотреть в строковых функциях БСП метод который делает это.
	// Ищем все вхождения подстроки в исходную строку.
	//Количество = 0;
	//Позиция = 0;
	//ПервыйВход = Истина;
	//Пока ПервыйВход Или Позиция <> 0 Цикл
	//	ПервыйВход = Ложь;
	//	Если Позиция + 1 > СтрДлина(исходнаяСтрока) Тогда
	//		Прервать;
	//	КонецЕсли;
	//	Позиция = СтрНайти(исходнаяСтрока, подстрока, , Позиция + 1);
	//	Если Позиция > 0 Тогда
	//		Количество = Количество + 1;
	//	КонецЕсли;
	//КонецЦикла;
	
	Позиция = СтрНайти(исходнаяСтрока, подстрока);
	Если Позиция > 0 Тогда
		Количество = 1;
	Иначе
		Возврат 0;
	КонецЕсли;
	
	Пока Позиция <> 0 Цикл
		Если Позиция + 1 > СтрДлина(исходнаяСтрока) Тогда
			Прервать;
		КонецЕсли;
		Позиция = СтрНайти(исходнаяСтрока, подстрока, , Позиция + 1);
		Если Позиция > 0 Тогда
			Количество = Количество + 1;
		КонецЕсли;
	КонецЦикла;	
	
	// Возвращаем количество вхождений.
	Возврат Количество;

КонецФункции

Функция ЭкранироватьСимволыРегВыражения(pattern, ДополнительныйСимвол) Экспорт

	Результат = "";
	мДлина = СтрДлина(pattern);
	ЭкранируемыеСимволы = ".\+*?[^]$(){}=!<>|:-#";
	Для Индекс = 1 По мДлина Цикл
		Символ = Сред(pattern, Индекс, 1);

		Если Символ = ДополнительныйСимвол Или СтрНайти(ЭкранируемыеСимволы, Символ) > 1 Тогда
			Результат = Результат + "\";
		КонецЕсли;

		Результат = Результат + Символ;
	КонецЦикла;

	Возврат Результат;

КонецФункции

Функция СформироватьИдентификаторИзСтроки(ПараметрыMD, Знач Строка)
	
	Результат = СтрокаЛатиницей(Строка);
	ПараметрыMD.Якоря.Добавить(Результат);

	НайденныеЯкоря = НайтиЗначенияПоСовпадению(ПараметрыMD.Якоря, Результат);
	Если НайденныеЯкоря.Количество() > 1 Тогда
		Результат = Результат + "-" + НайденныеЯкоря.Количество();
	КонецЕсли;

	Возврат Результат;

КонецФункции

// Преобразует исходную строку в транслит.
//
// Параметры:
//  Значение - Строка - произвольная строка.
//
// Возвращаемое значение:
//  Строка - строка, в которой кириллица заменена на транслит.
//
Функция СтрокаЛатиницей(Знач Значение)
	
	ПравилаТранслитерации = Новый Соответствие();
	ЗаполнениеПравилТранслитерации(ПравилаТранслитерации);
	
	Результат = "";
	Значение  = НРег(СокрЛП(Значение));
	
	Для Позиция = 1 По СтрДлина(Значение) Цикл
		Символ = Сред(Значение, Позиция, 1);
		СимволЛатиницей = ПравилаТранслитерации[Символ];
		
		Если СимволЛатиницей = Неопределено Тогда
			Продолжить;
		КонецЕсли;
		
		Результат = Результат + СимволЛатиницей;
	КонецЦикла;
	
	Пока СтрНайти(Результат, "--") <> 0 Цикл
		Результат = СтрЗаменить(Результат, "--", "-");		
	КонецЦикла;
	
	Возврат Результат;

КонецФункции

Процедура ЗаполнениеПравилТранслитерации(Правила)
	
	// Кириллица.
	Правила.Вставить("а", "a");
	Правила.Вставить("б", "b");
	Правила.Вставить("в", "v");
	Правила.Вставить("г", "g");
	Правила.Вставить("д", "d");
	Правила.Вставить("е", "e");
	Правила.Вставить("ё", "e");
	Правила.Вставить("ж", "zh");
	Правила.Вставить("з", "z");
	Правила.Вставить("и", "i");
	Правила.Вставить("й", "y");
	Правила.Вставить("к", "k");
	Правила.Вставить("л", "l");
	Правила.Вставить("м", "m");
	Правила.Вставить("н", "n");
	Правила.Вставить("о", "o");
	Правила.Вставить("п", "p");
	Правила.Вставить("р", "r");
	Правила.Вставить("с", "s");
	Правила.Вставить("т", "t");
	Правила.Вставить("у", "u");
	Правила.Вставить("ф", "f");
	Правила.Вставить("х", "kh");
	Правила.Вставить("ц", "ts");
	Правила.Вставить("ч", "ch");
	Правила.Вставить("ш", "sh");
	Правила.Вставить("щ", "shch");
	Правила.Вставить("ы", "y");
	Правила.Вставить("э", "e");
	Правила.Вставить("ю", "yu");
	Правила.Вставить("я", "ya");
	
	// Латиница.
	Правила.Вставить("a", "a");
	Правила.Вставить("b", "b");
	Правила.Вставить("c", "c");
	Правила.Вставить("d", "d");
	Правила.Вставить("e", "e");
	Правила.Вставить("f", "f");
	Правила.Вставить("g", "g");
	Правила.Вставить("h", "h");
	Правила.Вставить("i", "i");
	Правила.Вставить("j", "j");
	Правила.Вставить("k", "k");
	Правила.Вставить("l", "l");
	Правила.Вставить("m", "m");
	Правила.Вставить("n", "n");
	Правила.Вставить("o", "o");
	Правила.Вставить("p", "p");
	Правила.Вставить("q", "q");
	Правила.Вставить("r", "r");
	Правила.Вставить("s", "s");
	Правила.Вставить("t", "t");
	Правила.Вставить("u", "u");
	Правила.Вставить("v", "v");
	Правила.Вставить("w", "w");
	Правила.Вставить("x", "x");
	Правила.Вставить("y", "y");
	Правила.Вставить("z", "z");
	
	// Цифры.
	Правила.Вставить("0", "0");
	Правила.Вставить("1", "1");
	Правила.Вставить("2", "2");
	Правила.Вставить("3", "3");
	Правила.Вставить("4", "4");
	Правила.Вставить("5", "5");
	Правила.Вставить("6", "6");
	Правила.Вставить("7", "7");
	Правила.Вставить("8", "8");
	Правила.Вставить("9", "9");

	// Остальные символы.
	Правила.Вставить("-", "-");
	Правила.Вставить("_", "-");
	Правила.Вставить(" ", "-");

КонецПроцедуры

Функция НайтиЗначенияПоСовпадению(Массив, Знач Значение)
	
	Результат = Новый Массив;
	
	Для Каждого Элемент Из Массив Цикл
		
		Если Элемент = Значение Тогда
			Результат.Добавить(Элемент);
		КонецЕсли;
		
	КонецЦикла;
	
	Возврат Результат;

КонецФункции

#Область ПарсерYAML

Функция РазобратьYAML(ТекстYAML) Экспорт
	
	// Приводим переносы строк к единому виду.
	ТекстYAML = СтрЗаменить(ТекстYAML, Символы.ВК + Символы.ПС, Символы.ПС);
	ТекстYAML = СтрЗаменить(ТекстYAML, Символы.ВК, Символы.ПС);
	ТекстYAML = СтрЗаменить(ТекстYAML, Символы.Таб, "  ");

	Пока СтрНайти(ТекстYAML, " " + Символы.ПС) > 0 Цикл
		ТекстYAML = СтрЗаменить(ТекстYAML, " " + Символы.ПС, Символы.ПС);
	КонецЦикла;
		
	Пока СтрНайти(ТекстYAML, Символы.ПС + Символы.ПС) > 0 Цикл
		ТекстYAML = СтрЗаменить(ТекстYAML, Символы.ПС + Символы.ПС, Символы.ПС);
	КонецЦикла;
	
	СтрокиYAML = СтрРазделить(ТекстYAML, Символы.ПС);
	КоличествоСтрок = СтрокиYAML.Количество();
	Если КоличествоСтрок > 0 И Лев(СтрокиYAML[0], 1) = " " Тогда
		мДлинаОтступа = СтрДлина(СтрокиYAML[0]) - СтрДлина(СокрЛ(СтрокиYAML[0]));
		Для мИндекс = 0 По КоличествоСтрок - 1 Цикл
			СтрокиYAML[мИндекс] = Прав(СтрокиYAML[мИндекс], СтрДлина(СтрокиYAML[мИндекс]) - мДлинаОтступа);
		КонецЦикла;
	КонецЕсли;

	// Разбираем YAML.
	БуферТекущегоЗначение = Новый Массив();
	Многострочность = Ложь;
	Результат = Неопределено;
	Для Индекс = 0 По КоличествоСтрок - 1 Цикл
		ЭтоПоследняяСтрока = Индекс = КоличествоСтрок - 1;
		ТекущаяСтрока = СтрокиYAML[Индекс];
		ТекущаяСтрокаСокр = СокрЛП(ТекущаяСтрока);
		Если ПустаяСтрока(ТекущаяСтрокаСокр) Тогда
			Продолжить;
		КонецЕсли;
		ПервыйСимвол = Лев(СокрЛП(ТекущаяСтрокаСокр), 1);
		Ключ = Неопределено;
		Значение = Неопределено;

		Если ПервыйСимвол = "-" Тогда
			
			ТекстYAML = СтрСоединить(СтрокиYAML, Символы.ПС);
			ДлинаОтступа = СтрДлина(ТекущаяСтрока) - СтрДлина(СокрЛ(ТекущаяСтрока));
			Отсутп = Сред(ТекущаяСтрока, 1, ДлинаОтступа);
			ТекстYAML = Символы.ПС + ТекстYAML;
			ТекстYAML = СтрЗаменить(ТекстYAML, "&", "{{амперсанд}}");
			ТекстYAML = СтрЗаменить(ТекстYAML, Символы.ПС + Отсутп + "- ", "&");
			ТекстYAML = СтрЗаменить(ТекстYAML, Символы.ПС + Отсутп + "  ", Символы.ПС);
			МассивYAML = СтрРазделить(ТекстYAML, "&", Ложь);
			Для мИндекс = 0 По МассивYAML.Количество() - 1 Цикл
				МассивYAML[мИндекс] = СтрЗаменить(МассивYAML[мИндекс], "{{амперсанд}}", "&");
				МассивYAML[мИндекс] = РазобратьYAML(МассивYAML[мИндекс]);
			КонецЦикла;
			Значение = МассивYAML;
		Иначе
			Двоеточие		= Найти(ТекущаяСтрокаСокр, ":");
			Если Двоеточие > 0 Тогда
				Ключ	= Лев(ТекущаяСтрокаСокр, Двоеточие - 1);
				Значение	= СокрЛП(Сред(ТекущаяСтрокаСокр, Двоеточие + 2));	
				БуферТекущегоЗначение.Добавить(Значение);
			Иначе
				БуферТекущегоЗначение.Добавить(ТекущаяСтрокаСокр);
			КонецЕсли;

			Если Не ЭтоПоследняяСтрока Тогда
				ДлинаОтступа = Неопределено;
				СледующаяСтрока = СтрокиYAML[Индекс + 1];
				СледующийПервыйСимвол = Лев(СледующаяСтрока, 1);
				Пока СледующийПервыйСимвол = " " Или СледующийПервыйСимвол = "-" Цикл
					
					Индекс = Индекс + 1;

					Если СокрЛП(СледующаяСтрока) = "" Тогда
						Продолжить;
					КонецЕсли;
					
					ЭтоПоследняяСтрока = Индекс = (КоличествоСтрок - 1);
					ТекущаяСтрока = СтрокиYAML[Индекс];
					ТекущаяСтрокаСокр = СокрЛП(ТекущаяСтрока);
					ПервыйСимвол = Лев(СокрЛП(ТекущаяСтрока), 1);
					
					Если ДлинаОтступа = Неопределено Тогда
						ДлинаОтступа = СтрДлина(ТекущаяСтрока) - СтрДлина(СокрЛ(ТекущаяСтрока));
					КонецЕсли;

					БуферТекущегоЗначение.Добавить(Сред(СледующаяСтрока, ДлинаОтступа + 1));
	
					Если ЭтоПоследняяСтрока Тогда
						Прервать;
					КонецЕсли;
	
					СледующаяСтрока = СтрокиYAML[Индекс + 1];
					СледующийПервыйСимвол = Лев(СледующаяСтрока, 1);			
				КонецЦикла
				
			КонецЕсли;	
		
			Если БуферТекущегоЗначение.Количество() > 0 И СокрЛП(БуферТекущегоЗначение[0]) = "<" Тогда
				БуферТекущегоЗначение.Удалить(0);		
				Многострочность = Истина;
			КонецЕсли;

			мТекстYAML = СтрСоединить(БуферТекущегоЗначение, Символы.ПС);
			БуферТекущегоЗначение = Новый Массив();
			Если мТекстYAML = ТекстYAML Тогда
				Значение = мТекстYAML;
			Иначе
				Значение = РазобратьYAML(мТекстYAML);
			КонецЕсли;

		КонецЕсли;

		Если Ключ <> Неопределено Тогда
			Если Результат = Неопределено Тогда
				Результат = Новый Структура();
			КонецЕсли;
			Результат.Вставить(Ключ, Значение);
		ИначеЕсли Ключ = Неопределено И ТипЗнч(Значение) = Тип("Массив") Тогда
			Результат = Значение;
			Прервать;
		Иначе
			Если Результат = Неопределено Тогда
				Результат = "";
			КонецЕсли;

			Если Многострочность Тогда
				Результат = Результат + Символы.ПС + Значение;
			Иначе
				Результат = Результат + " " + СокрЛП(Значение);
			КонецЕсли;
		КонецЕсли;

	КонецЦикла; 
	
	Если ТипЗнч(Результат) = Тип("Строка") Тогда
		Результат = СокрЛП(Результат);
	КонецЕсли;

	Возврат Результат;

КонецФункции

#КонецОбласти