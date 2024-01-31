#Область ПрограммныйИнтерфейс

Функция Шаблон_gfm() Экспорт

	Шаблон = Новый Структура();

	// el_alert.
	мГруппа = Новый Структура();

	мТекст = "<div class=""flex mb-6"">
			|    <div class=""shrink-0 w-1 rounded-tl rounded-bl bg-blue-500 dark-bg-blue-400""></div>
			|    <div class=""flex w-full py-4 border border-l-0 border-gray-300 rounded-tr rounded-br doc-alert bg-white dark-bg-dark-700 dark-border-dark-700""
			|        role=""alert"">
			|        <div class=""flex items-center ml-4 h-7""><svg xmlns=""http://www.w3.org/2000/svg""
			|                class=""mb-px text-blue-500 dark-text-blue-400"" width=""22"" height=""22"" viewBox=""0 0 24 24""
			|                role=""presentation"">
			|                <g fill=""currentColor"">
			|                    <g>
			|                        <path
			|                            d=""M12 1C5.93 1 1 5.93 1 12s4.93 11 11 11 11-4.93 11-11S18.07 1 12 1zm0 20c-4.96 0-9-4.04-9-9s4.04-9 9-9 9 4.04 9 9-4.04 9-9 9z"">
			|                        </path>
			|                        <path
			|                            d=""M12 11c-.55 0-1 .45-1 1v4c0 .55.45 1 1 1s1-.45 1-1v-4c0-.55-.45-1-1-1zM12.01 7c-.56 0-1 .45-1 1s.45 1 1 1 1-.45 1-1-.45-1-1-1z"">
			|                        </path>
			|                        <path fill=""none"" d=""M0 0h24v24H0z""></path>
			|                    </g>
			|                </g>
			|            </svg></div>
			|        <div class=""pr-5 ml-3 w-full"">{{text}}</div>
			|    </div>
			|</div>";
	мГруппа.Вставить("primitive", мТекст);

 	мТекст = "<div class=""flex mb-6"">
			|    <div class=""shrink-0 w-1 rounded-tl rounded-bl bg-blue-500 dark-bg-blue-400""></div>
			|    <div class=""flex w-full py-4 border border-l-0 border-gray-300 rounded-tr rounded-br doc-alert bg-white dark-bg-dark-700 dark-border-dark-700""
			|        role=""alert"">
			|        <div class=""flex items-center ml-4 h-7""><svg xmlns=""http://www.w3.org/2000/svg""
			|                class=""mb-px text-blue-500 dark-text-blue-400"" width=""22"" height=""22"" viewBox=""0 0 24 24""
			|                role=""presentation"">
			|                <g fill=""currentColor"">
			|                    <g>
			|                        <path
			|                            d=""M12 1C5.93 1 1 5.93 1 12s4.93 11 11 11 11-4.93 11-11S18.07 1 12 1zm0 20c-4.96 0-9-4.04-9-9s4.04-9 9-9 9 4.04 9 9-4.04 9-9 9z"">
			|                        </path>
			|                        <path
			|                            d=""M12 11c-.55 0-1 .45-1 1v4c0 .55.45 1 1 1s1-.45 1-1v-4c0-.55-.45-1-1-1zM12.01 7c-.56 0-1 .45-1 1s.45 1 1 1 1-.45 1-1-.45-1-1-1z"">
			|                        </path>
			|                        <path fill=""none"" d=""M0 0h24v24H0z""></path>
			|                    </g>
			|                </g>
			|            </svg></div>
			|        <div class=""pr-5 ml-3 w-full""><h1>{{title}}</h1>{{text}}</div>
			|    </div>
			|</div>";
	мГруппа.Вставить("withTitle", мТекст);

 	мГруппа = Новый ФиксированнаяСтруктура(мГруппа);
	Шаблон.Вставить("el_alert", мГруппа);

	// el_code.
	мГруппа = Новый Структура();

	мТекст = "<div class=""codeblock-wrapper""><div class=""codeblock relative""><div class=""absolute top-0 right-0 z-5""><div class=""mr-1.5 mt-1.5"" data-v-cf3656fa=""""><div aria-describedby=""tooltip"" data-v-cf3656fa=""""><button class=""flex items-center justify-center shrink-0 transition-colors duration-200 ease-in focus:outline-none w-10 h-10 text-dark-350 hover:text-white bg-dark-850 dark-bg-dark-800 bg-opacity-50 dark-bg-opacity-50 rounded-full""><svg xmlns=""http://www.w3.org/2000/svg"" class=""mb-px"" width=""16"" height=""16"" viewBox=""0 0 24 24"" role=""presentation""><g fill=""currentColor""><g><path d=""M20 8h-9c-1.65 0-3 1.35-3 3v9c0 1.65 1.35 3 3 3h9c1.65 0 3-1.35 3-3v-9c0-1.65-1.35-3-3-3zm1 12c0 .55-.45 1-1 1h-9c-.55 0-1-.45-1-1v-9c0-.55.45-1 1-1h9c.55 0 1 .45 1 1v9z""></path><path d=""M5 14H4c-.55 0-1-.45-1-1V4c0-.55.45-1 1-1h9c.55 0 1 .45 1 1v1c0 .55.45 1 1 1s1-.45 1-1V4c0-1.65-1.35-3-3-3H4C2.35 1 1 2.35 1 4v9c0 1.65 1.35 3 3 3h1c.55 0 1-.45 1-1s-.45-1-1-1z""></path></g></g></svg></button></div>></div></div><pre class=""language-none"" data-simplebar=""init""><div class=""simplebar-wrapper"" style=""margin: -16px -20px;""><div class=""simplebar-height-auto-observer-wrapper""><div class=""simplebar-height-auto-observer""></div></div><div class=""simplebar-mask""><div class=""simplebar-offset"" style=""right: 0px; bottom: 0px;""><div class=""simplebar-content-wrapper"" tabindex=""0"" role=""region"" aria-label=""scrollable content"" style=""height: auto; overflow: hidden;""><div class=""simplebar-content"" style=""padding: 16px 20px;""><code class=""language-none"">{{text}}</code></div></div></div></div><div class=""simplebar-placeholder"" style=""width: auto; height: 53px;""></div></div><div class=""simplebar-track simplebar-horizontal"" style=""visibility: hidden;""><div class=""simplebar-scrollbar"" style=""width: 0px; display: none;""></div></div><div class=""simplebar-track simplebar-vertical"" style=""visibility: hidden;""><div class=""simplebar-scrollbar"" style=""height: 0px; display: none;""></div></div></pre></div></div>";
	мГруппа.Вставить("standart", мТекст);

 	мТекст = "<div class=""tab-content""><div class=""codeblock-wrapper""><div class=""codeblock relative""><div class=""absolute top-0 right-0 z-5""><div class=""mr-1.5 mt-14"" data-v-cf3656fa=""""><div aria-describedby=""tooltip"" data-v-cf3656fa=""""><button class=""flex items-center justify-center shrink-0 transition-colors duration-200 ease-in focus:outline-none w-10 h-10 text-dark-350 hover:text-white bg-dark-850 dark-bg-dark-800 bg-opacity-50 dark-bg-opacity-50 rounded-full""><svg xmlns=""http://www.w3.org/2000/svg"" class=""mb-px"" width=""16"" height=""16"" viewBox=""0 0 24 24"" role=""presentation""><g fill=""currentColor""><g><path d=""M20 8h-9c-1.65 0-3 1.35-3 3v9c0 1.65 1.35 3 3 3h9c1.65 0 3-1.35 3-3v-9c0-1.65-1.35-3-3-3zm1 12c0 .55-.45 1-1 1h-9c-.55 0-1-.45-1-1v-9c0-.55.45-1 1-1h9c.55 0 1 .45 1 1v9z""></path><path d=""M5 14H4c-.55 0-1-.45-1-1V4c0-.55.45-1 1-1h9c.55 0 1 .45 1 1v1c0 .55.45 1 1 1s1-.45 1-1V4c0-1.65-1.35-3-3-3H4C2.35 1 1 2.35 1 4v9c0 1.65 1.35 3 3 3h1c.55 0 1-.45 1-1s-.45-1-1-1z""></path></g></g></svg></button></div></div></div><div class=""codeblock-title"">{{title}}</div><pre class=""language-none"" tabindex=""0"" data-simplebar=""init""><div class=""simplebar-wrapper"" style=""margin: -16px -20px;""><div class=""simplebar-height-auto-observer-wrapper""><div class=""simplebar-height-auto-observer""></div></div><div class=""simplebar-mask""><div class=""simplebar-offset"" style=""right: 0px; bottom: 0px;""><div class=""simplebar-content-wrapper"" tabindex=""0"" role=""region"" aria-label=""scrollable content"" style=""height: auto; overflow: hidden;""><div class=""simplebar-content"" style=""padding: 16px 20px;""><code class=""language-none"">{{text}}</code></div></div></div></div><div class=""simplebar-placeholder"" style=""width: auto; height: 53px;""></div></div><div class=""simplebar-track simplebar-horizontal"" style=""visibility: hidden;""><div class=""simplebar-scrollbar"" style=""width: 0px; display: none;""></div></div><div class=""simplebar-track simplebar-vertical"" style=""visibility: hidden;""><div class=""simplebar-scrollbar"" style=""height: 0px; display: none;""></div></div></pre></div></div></div>";
	мГруппа.Вставить("standartWithTitle", мТекст);

 	мГруппа = Новый ФиксированнаяСтруктура(мГруппа);
	Шаблон.Вставить("el_code", мГруппа);

	// el_comment.
	мГруппа = Новый Структура();

	мТекст = "<blockquote>{{text}}</blockquote>";
	мГруппа.Вставить("standart", мТекст);

 	мГруппа = Новый ФиксированнаяСтруктура(мГруппа);
	Шаблон.Вставить("el_comment", мГруппа);

	// el_fencedCode.
	мГруппа = Новый Структура();

	мТекст = "<pre><code class=""{{classLanguage}}""></code>{{text}}</pre>";
	мГруппа.Вставить("standart", мТекст);

 	мТекст = "<pre><code class=""{{classLanguage}}""></code>{{text}}</pre>";
	мГруппа.Вставить("mermaid", мТекст);

 	мГруппа = Новый ФиксированнаяСтруктура(мГруппа);
	Шаблон.Вставить("el_fencedCode", мГруппа);

	// el_fileDownload.
	мГруппа = Новый Структура();

	мТекст = "<div class=""mb-6 px-5 py-4 flex justify-between relative border border-gray-300 hover:border-gray-400 dark-border-dark-650 dark-hover:border-dark-450 rounded transition-colors duration-150""><div class=""flex items-center text-blue-500 dark-text-blue-400""><span class=""inline-block mb-px""><svg xmlns=""http://www.w3.org/2000/svg"" width=""20"" height=""20"" viewBox=""0 0 24 24"" role=""presentation"" fill=""currentColor""><path fill=""none"" d=""M0 0h24v24H0z""></path><path d=""M21 14c-.55 0-1 .45-1 1v4c0 .55-.45 1-1 1H5c-.55 0-1-.45-1-1v-4c0-.55-.45-1-1-1s-1 .45-1 1v4c0 1.65 1.35 3 3 3h14c1.65 0 3-1.35 3-3v-4c0-.55-.45-1-1-1z""></path><path d=""M11.29 15.71c.09.09.2.17.33.22.12.04.25.07.38.07s.26-.03.38-.08.23-.12.33-.22l5-5a.996.996 0 10-1.41-1.41l-3.3 3.3V3c0-.55-.45-1-1-1s-1 .45-1 1v9.59l-3.29-3.3A.996.996 0 106.3 10.7l4.99 5.01z""></path></svg></span><span class=""inline-block font-medium ml-2"">{{representation}}</span></div><div class=""flex items-center text-xs text-gray-400 dark-text-dark-400""><span>{{name}}</span><span class=""inline-block ml-2"">36B</span></div><a href=""{{url}}"" class=""absolute block inset-0"" target=""_blank"" download=""{{name}}""></a></div>";
	мГруппа.Вставить("standart", мТекст);

 	мТекст = "<div class=""mb-6 px-5 py-4 flex justify-between relative border border-gray-300 hover:border-gray-400 dark-border-dark-650 dark-hover:border-dark-450 rounded transition-colors duration-150""><div class=""flex items-center text-blue-500 dark-text-blue-400""><span class=""inline-block mb-px"">{{icon}}</span><span class=""inline-block font-medium ml-2"">{{representation}}</span></div><div class=""flex items-center text-xs text-gray-400 dark-text-dark-400""><span>{{name}}</span><span class=""inline-block ml-2"">36B</span></div><a href=""{{url}}"" class=""absolute block inset-0"" target=""_blank"" download=""{{name}}""></a></div>";
	мГруппа.Вставить("standartCustomIcon", мТекст);

 	мТекст = "<span><img class=""mb-px inline-flex mr-2"" width=""18"" src=""{{icon}}""></span>";
	мГруппа.Вставить("icon_file", мТекст);

 	мТекст = "<span>{{icon}}</span>";
	мГруппа.Вставить("icon_svg", мТекст);

 	мТекст = "<span class=""docs-emoji mr-2"">{{icon}}</span>";
	мГруппа.Вставить("icon_emoji", мТекст);

 	мГруппа = Новый ФиксированнаяСтруктура(мГруппа);
	Шаблон.Вставить("el_fileDownload", мГруппа);

	// el_header.
	мГруппа = Новый Структура();

	мТекст = "<h1>{{text}}</h1>";
	мГруппа.Вставить("h1", мТекст);

 	мТекст = "<h2>{{text}}</h2>";
	мГруппа.Вставить("h2", мТекст);

 	мТекст = "<h3>{{text}}</h3>";
	мГруппа.Вставить("h3", мТекст);

 	мТекст = "<h4>{{text}}</h4>";
	мГруппа.Вставить("h4", мТекст);

 	мТекст = "<h5>{{text}}</h5>";
	мГруппа.Вставить("h5", мТекст);

 	мТекст = "<h6>{{text}}</h6>";
	мГруппа.Вставить("h6", мТекст);

 	мГруппа = Новый ФиксированнаяСтруктура(мГруппа);
	Шаблон.Вставить("el_header", мГруппа);

	// el_inline.
	мГруппа = Новый Структура();

	мТекст = "<strong>{{text}}</strong>";
	мГруппа.Вставить("emphasisStrong", мТекст);

 	мТекст = "<em>{{text}}</em>";
	мГруппа.Вставить("emphasisEm", мТекст);

 	мТекст = "<a href=""{{href}}"" title=""{{title}}"">{{text}}</a>";
	мГруппа.Вставить("link", мТекст);

 	мТекст = "<a href=""{{href}}"">{{href}}</a>";
	мГруппа.Вставить("url", мТекст);

 	мТекст = "<a href=""{{href}}"">{{href}}</a>";
	мГруппа.Вставить("urlTag", мТекст);

 	мТекст = "<del>{{text}}</del>";
	мГруппа.Вставить("strikeThrough", мТекст);

 	мТекст = "<figure class=""content-center""><img src=""{{src}}"" alt=""{{alt}}""><figcaption class=""caption""></figcaption></figure>";
	мГруппа.Вставить("image", мТекст);

 	мТекст = "<a href=""{{href}}"">{{text}}</a>";
	мГруппа.Вставить("emailTag", мТекст);

 	мТекст = "<code>{{text}}</code>";
	мГруппа.Вставить("code", мТекст);

 	мТекст = "<input disabled type=""checkbox"">";
	мГруппа.Вставить("checkbox", мТекст);

 	мТекст = "<input disabled type=""checkbox"" checked>";
	мГруппа.Вставить("checkboxChecked", мТекст);

 	мТекст = "<button href=""{{href}}"" title=""{{title}}"" class=""no-link inline-flex items-center font-medium cursor-pointer transition-colors duration-200 ease-out focus:outline-none bg-blue-500 hover:bg-blue-700 text-white px-4 h-10 text-sm rounded-md param1-{{color??primary}} param2-{{param2}} param3-{{param3}}""><span>{{name??Кнопка}}</span></button>";
	мГруппа.Вставить("button", мТекст);

 	мГруппа = Новый ФиксированнаяСтруктура(мГруппа);
	Шаблон.Вставить("el_inline", мГруппа);

	// el_list.
	мГруппа = Новый Структура();

	мТекст = "<ol {{start}}>{{elements}}</ol>";
	мГруппа.Вставить("ordered_list", мТекст);

 	мТекст = "<ul>{{elements}}</ul>";
	мГруппа.Вставить("unordered_list", мТекст);

 	мТекст = "<li>{{text}}</li>";
	мГруппа.Вставить("line", мТекст);

 	мГруппа = Новый ФиксированнаяСтруктура(мГруппа);
	Шаблон.Вставить("el_list", мГруппа);

	// el_markup.
	мГруппа = Новый Структура();

	мТекст = "<p>Не реализовано</p>";
	мГруппа.Вставить("standart", мТекст);

 	мГруппа = Новый ФиксированнаяСтруктура(мГруппа);
	Шаблон.Вставить("el_markup", мГруппа);

	// el_panel.
	мГруппа = Новый Структура();

	мТекст = "<p>Не реализовано</p>";
	мГруппа.Вставить("standart", мТекст);

 	мГруппа = Новый ФиксированнаяСтруктура(мГруппа);
	Шаблон.Вставить("el_panel", мГруппа);

	// el_quote.
	мГруппа = Новый Структура();

	мТекст = "<blockquote>{{text}}</blockquote>";
	мГруппа.Вставить("standart", мТекст);

 	мГруппа = Новый ФиксированнаяСтруктура(мГруппа);
	Шаблон.Вставить("el_quote", мГруппа);

	// el_reference.
	мГруппа = Новый Структура();

	мТекст = "<a href=""url"">{{text}}</a>";
	мГруппа.Вставить("standart", мТекст);

 	мГруппа = Новый ФиксированнаяСтруктура(мГруппа);
	Шаблон.Вставить("el_reference", мГруппа);

	// el_rule.
	мГруппа = Новый Структура();

	мТекст = "<hr>";
	мГруппа.Вставить("hr", мТекст);

 	мГруппа = Новый ФиксированнаяСтруктура(мГруппа);
	Шаблон.Вставить("el_rule", мГруппа);

	// el_setextHeader.
	мГруппа = Новый Структура();

	мТекст = "<p>Не реализовано</p>";
	мГруппа.Вставить("standart", мТекст);

 	мГруппа = Новый ФиксированнаяСтруктура(мГруппа);
	Шаблон.Вставить("el_setextHeader", мГруппа);

	// el_table.
	мГруппа = Новый Структура();

	мТекст = "<div class=""table-wrapper scrollbar"" data-simplebar=""init"">
			|    <div class=""simplebar-wrapper"" style=""margin: 0px;"">
			|        <div class=""simplebar-height-auto-observer-wrapper"">
			|            <div class=""simplebar-height-auto-observer""></div>
			|        </div>
			|        <div class=""simplebar-mask"">
			|            <div class=""simplebar-offset"" style=""right: 0px; bottom: 0px;"">
			|                <div class=""simplebar-content-wrapper"" tabindex=""0"" role=""region"" aria-label=""scrollable content""
			|                    style=""height: auto; overflow: hidden;"">
			|                    <div class=""simplebar-content"" style=""padding: 0px;"">
			|                        <table class=""comfortable"">
			|                            <thead>
			|                                <tr>
			|                                    {{columns_header}}
			|                                </tr>
			|                            </thead>
			|                            <tbody>
			|                                {{rows_body}}
			|                            </tbody>
			|                        </table>
			|                    </div>
			|                </div>
			|            </div>
			|        </div>
			|        <div class=""simplebar-placeholder"" style=""width: auto; height: 243px;""></div>
			|    </div>
			|    <div class=""simplebar-track simplebar-horizontal"" style=""visibility: hidden;"">
			|        <div class=""simplebar-scrollbar"" style=""width: 0px; display: none;""></div>
			|    </div>
			|    <div class=""simplebar-track simplebar-vertical"" style=""visibility: hidden;"">
			|        <div class=""simplebar-scrollbar"" style=""height: 0px; display: none;""></div>
			|    </div>
			|</div>";
	мГруппа.Вставить("main", мТекст);

 	мТекст = "<th {{style}}>{{text}}</th>";
	мГруппа.Вставить("column_header", мТекст);

 	мТекст = "<tr>{{columns_body}}</tr>";
	мГруппа.Вставить("row_body", мТекст);

 	мТекст = "<td {{style}}>{{text}}</td>";
	мГруппа.Вставить("column_body", мТекст);

 	мГруппа = Новый ФиксированнаяСтруктура(мГруппа);
	Шаблон.Вставить("el_table", мГруппа);

	// layout_footer.
	мГруппа = Новый Структура();

	мТекст = "<footer class=""clear-both"">
			|    <div class=""flex flex-wrap items-center justify-between mt-14""><a
			|            class=""my-2.5 inline-flex items-center text-sm whitespace-nowrap text-blue-500 dark-text-blue-400 hover:text-blue-700 hover:underline""
			|            onclick=""sendEvent('EDIT_PAGE', '{{current_page}}')"" target=""_blank"" rel=""noopener""><svg
			|                class=""mr-1.5"" xmlns=""http://www.w3.org/2000/svg"" width=""18"" height=""18"" viewBox=""0 0 24 24""
			|                fill=""currentColor"" overflow=""visible"">
			|                <path
			|                    d=""M20 12c-.55 0-1 .45-1 1v7c0 .55-.45 1-1 1H4c-.55 0-1-.45-1-1V6c0-.55.45-1 1-1h7c.55 0 1-.45 1-1s-.45-1-1-1H4C2.35 3 1 4.35 1 6v14c0 1.65 1.35 3 3 3h14c1.65 0 3-1.35 3-3v-7c0-.55-.45-1-1-1z"">
			|                </path>
			|                <path
			|                    d=""M22.21 1.79c-1.18-1.18-3.24-1.18-4.41 0l-9.5 9.5c-.13.13-.22.29-.26.46l-1 4c-.08.34.01.7.26.95.18.2.44.3.7.3.08 0 .16-.01.24-.03l4-1c.18-.04.34-.13.46-.26l9.5-9.5c1.22-1.22 1.22-3.2.01-4.42zm-1.42 3l-9.3 9.3-2.11.53.53-2.11 9.3-9.3c.42-.42 1.16-.42 1.59 0 .43.43.43 1.15-.01 1.58z"">
			|                </path>
			|                <path fill=""none"" d=""M0 0h24v24H0z""></path>
			|            </svg><span>Edit this page</span></a></div>
			|    <nav class=""flex mt-14"">
			|        <div class=""w-1/2""></div>
			|        <div class=""w-1/2""><a
			|                class=""px-5 py-4 -mx-px h-full flex items-center justify-end break-normal font-medium text-blue-500 dark-text-blue-400 border border-gray-300 hover:border-gray-400 dark-border-dark-650 dark-hover:border-dark-450 rounded-l rounded-r-lg transition-colors duration-150 relative hover:z-5""
			|                href=""pro/""><span><span
			|                        class=""block text-xs font-normal text-right text-gray-400 dark-text-dark-400"">Next</span><span
			|                        class=""block mt-1""></span></span><svg xmlns=""http://www.w3.org/2000/svg""
			|                    class=""ml-3"" width=""24"" height=""24"" viewBox=""0 0 24 24"" fill=""currentColor"" overflow=""visible"">
			|                    <path
			|                        d=""M19.92 12.38a1 1 0 00-.22-1.09l-7-7a.996.996 0 10-1.41 1.41l5.3 5.3H5c-.55 0-1 .45-1 1s.45 1 1 1h11.59l-5.29 5.29a.996.996 0 000 1.41c.19.2.44.3.7.3s.51-.1.71-.29l7-7c.09-.09.16-.21.21-.33z"">
			|                    </path>
			|                    <path fill=""none"" d=""M0 0h24v24H0z""></path>
			|                </svg></a></div>
			|    </nav>
			|</footer>";
	мГруппа.Вставить("standart", мТекст);

 	мГруппа = Новый ФиксированнаяСтруктура(мГруппа);
	Шаблон.Вставить("layout_footer", мГруппа);

	// layout_footer_content.
	мГруппа = Новый Структура();

	мТекст = "<div class=""border-t dark-border-dark-650 pt-6 mb-8"">
			|    <footer class=""flex flex-wrap items-center justify-between"">
			|        <div>
			|            <ul class=""flex flex-wrap items-center text-sm"">
			|                <li><a class=""inline-flex items-center mr-4 py-2 text-sm whitespace-nowrap transition-colors duration-200 ease-linear text-blue-500 dark-text-blue-400 hover:text-blue-800 dark-hover:text-blue-200 md:mb-0""
			|                        href=""about/""><svg xmlns=""http://www.w3.org/2000/svg"" class=""mb-px mr-1"" width=""18""
			|                            height=""18"" viewBox=""0 0 24 24"" role=""presentation"">
			|                            <g fill=""currentColor"">
			|                                <path
			|                                    d=""M10.97 8.265a1.45 1.45 0 00-.487.57.75.75 0 01-1.341-.67c.2-.402.513-.826.997-1.148C10.627 6.69 11.244 6.5 12 6.5c.658 0 1.369.195 1.934.619a2.45 2.45 0 011.004 2.006c0 1.033-.513 1.72-1.027 2.215-.19.183-.399.358-.579.508l-.147.123a4.329 4.329 0 00-.435.409v1.37a.75.75 0 11-1.5 0v-1.473c0-.237.067-.504.247-.736.22-.28.486-.517.718-.714l.183-.153.001-.001c.172-.143.324-.27.47-.412.368-.355.569-.676.569-1.136a.953.953 0 00-.404-.806C12.766 8.118 12.384 8 12 8c-.494 0-.814.121-1.03.265zM13 17a1 1 0 11-2 0 1 1 0 012 0z"">
			|                                </path>
			|                                <path fill-rule=""evenodd""
			|                                    d=""M12 1C5.925 1 1 5.925 1 12s4.925 11 11 11 11-4.925 11-11S18.075 1 12 1zM2.5 12a9.5 9.5 0 1119 0 9.5 9.5 0 01-19 0z"">
			|                                </path>
			|                            </g>
			|                        </svg><span>About</span></a></li>
			|                <li><a class=""inline-flex items-center mr-4 py-2 text-sm whitespace-nowrap transition-colors duration-200 ease-linear text-blue-500 dark-text-blue-400 hover:text-blue-800 dark-hover:text-blue-200 md:mb-0""
			|                        href=""license/""><svg xmlns=""http://www.w3.org/2000/svg"" class=""mb-px mr-1"" width=""18""
			|                            height=""18"" viewBox=""0 0 24 24"" role=""presentation"">
			|                            <g fill=""currentColor"">
			|                                <path
			|                                    d=""M16.53 9.78a.75.75 0 00-1.06-1.06L11 13.19l-1.97-1.97a.75.75 0 00-1.06 1.06l2.5 2.5a.75.75 0 001.06 0l5-5z"">
			|                                </path>
			|                                <path fill-rule=""evenodd""
			|                                    d=""M12.54.637a1.75 1.75 0 00-1.08 0L3.21 3.312A1.75 1.75 0 002 4.976V10c0 6.19 3.77 10.705 9.401 12.83.386.145.812.145 1.198 0C18.229 20.704 22 16.19 22 10V4.976c0-.759-.49-1.43-1.21-1.664L12.54.637zm-.617 1.426a.25.25 0 01.154 0l8.25 2.676a.25.25 0 01.173.237V10c0 5.461-3.28 9.483-8.43 11.426a.2.2 0 01-.14 0C6.78 19.483 3.5 15.46 3.5 10V4.976c0-.108.069-.203.173-.237l8.25-2.676z"">
			|                                </path>
			|                            </g>
			|                        </svg><span>License</span></a></li>
			|            </ul>
			|        </div>
			|    </footer>
			|</div>";
	мГруппа.Вставить("standart", мТекст);

 	мГруппа = Новый ФиксированнаяСтруктура(мГруппа);
	Шаблон.Вставить("layout_footer_content", мГруппа);

	// layout_header.
	мГруппа = Новый Структура();

	мТекст = "<header id=""docs-site-header""
			|    class=""sticky top-0 z-30 flex w-full h-16 bg-white border-b border-gray-200 md:h-20 dark-bg-dark-850 dark-border-dark-650"">
			|    <div class=""container relative flex items-center justify-between grow pr-6 md:justify-start""><button
			|            class=""skeleton docs-mobile-menu-button flex items-center justify-center shrink-0 overflow-hidden dark-text-white focus:outline-none rounded-full w-10 h-10 ml-3.5 md:hidden""><svg
			|                xmlns=""http://www.w3.org/2000/svg"" class=""mb-px shrink-0"" width=""24"" height=""24"" viewBox=""0 0 24 24""
			|                role=""presentation"" style=""margin-bottom: 0px;"">
			|                <g fill=""currentColor"">
			|                    <path d=""M2 4h20v2H2zM2 11h20v2H2zM2 18h20v2H2z""></path>
			|                </g>
			|            </svg></button>
			|        <div id=""docs-sidebar-toggle""><button
			|                class=""flex items-center justify-center shrink-0 overflow-hidden transition-colors duration-200 ease-in hover:bg-gray-200 focus:outline-none focus:bg-gray-300 dark-text-white dark-hover:bg-dark-500 dark-focus:bg-dark-450 rounded-full w-10 h-10 ml-3.5 md:hidden""><svg
			|                    xmlns=""http://www.w3.org/2000/svg"" class=""mb-px shrink-0"" width=""24"" height=""24""
			|                    viewBox=""0 0 24 24"" role=""presentation"" style=""margin-bottom: 0px;"">
			|                    <g fill=""currentColor"">
			|                        <path d=""M2 4h20v2H2zM2 11h20v2H2zM2 18h20v2H2z""></path>
			|                    </g>
			|                </svg></button></div>
			|        <div class=""flex justify-between md:grow"">
			|            <nav class=""hidden md:flex"">
			|                <ul class=""flex flex-col mb-4 md:pl-16 md:mb-0 md:flex-row md:items-center"">
			|                    <li class=""mr-6""><a
			|                            class=""py-2 md:mb-0 inline-flex items-center text-sm whitespace-nowrap transition-colors duration-200 ease-linear md:text-blue-500 dark-text-blue-400 hover:text-blue-800 dark-hover:text-blue-200""
			|                            href=""""><svg xmlns=""http://www.w3.org/2000/svg"" class=""mb-px mr-1"" width=""18""
			|                                height=""18"" viewBox=""0 0 24 24"" role=""presentation"">
			|                                <g fill=""currentColor"">
			|                                    <path fill-rule=""evenodd""
			|                                        d=""M11.03 2.59a1.5 1.5 0 011.94 0l7.5 6.363a1.5 1.5 0 01.53 1.144V19.5a1.5 1.5 0 01-1.5 1.5h-5.75a.75.75 0 01-.75-.75V14h-2v6.25a.75.75 0 01-.75.75H4.5A1.5 1.5 0 013 19.5v-9.403c0-.44.194-.859.53-1.144l7.5-6.363zM12 3.734l-7.5 6.363V19.5h5v-6.25a.75.75 0 01.75-.75h3.5a.75.75 0 01.75.75v6.25h5v-9.403L12 3.734z"">
			|                                    </path>
			|                                </g>
			|                            </svg><span>Home</span></a></li>
			|                    <li class=""mr-6""><a
			|                            class=""py-2 md:mb-0 inline-flex items-center text-sm whitespace-nowrap transition-colors duration-200 ease-linear md:text-blue-500 dark-text-blue-400 hover:text-blue-800 dark-hover:text-blue-200""
			|                            href=""pro/""><svg xmlns=""http://www.w3.org/2000/svg"" class=""mb-px mr-1"" width=""18""
			|                                height=""18"" viewBox=""0 0 24 24"" role=""presentation"">
			|                                <g fill=""currentColor"">
			|                                    <path fill-rule=""evenodd""
			|                                        d=""M12 .25a.75.75 0 01.673.418l3.058 6.197 6.839.994a.75.75 0 01.415 1.279l-4.948 4.823 1.168 6.811a.75.75 0 01-1.088.791L12 18.347l-6.117 3.216a.75.75 0 01-1.088-.79l1.168-6.812-4.948-4.823a.75.75 0 01.416-1.28l6.838-.993L11.328.668A.75.75 0 0112 .25zm0 2.445L9.44 7.882a.75.75 0 01-.565.41l-5.725.832 4.143 4.038a.75.75 0 01.215.664l-.978 5.702 5.121-2.692a.75.75 0 01.698 0l5.12 2.692-.977-5.702a.75.75 0 01.215-.664l4.143-4.038-5.725-.831a.75.75 0 01-.565-.41L12 2.694z"">
			|                                    </path>
			|                                </g>
			|                            </svg><span>Pricing</span></a></li>
			|                </ul>
			|            </nav>
			|            <div class=""flex justify-end grow skeleton"">
			|                <div class=""relative hidden w-40 lg:block lg:max-w-sm lg:ml-auto"">
			|                    <div class=""absolute flex items-center justify-center h-full pl-3 dark-text-dark-300""><svg
			|                            xmlns=""http://www.w3.org/2000/svg"" class=""icon-base"" width=""16"" height=""16""
			|                            viewBox=""0 0 24 24"" aria-labelledby=""icon"" role=""presentation""
			|                            style=""margin-bottom: 1px;"">
			|                            <g fill=""currentColor"">
			|                                <path
			|                                    d=""M21.71 20.29l-3.68-3.68A8.963 8.963 0 0020 11c0-4.96-4.04-9-9-9s-9 4.04-9 9 4.04 9 9 9c2.12 0 4.07-.74 5.61-1.97l3.68 3.68c.2.19.45.29.71.29s.51-.1.71-.29c.39-.39.39-1.03 0-1.42zM4 11c0-3.86 3.14-7 7-7s7 3.14 7 7c0 1.92-.78 3.66-2.04 4.93-.01.01-.02.01-.02.01-.01.01-.01.01-.01.02A6.98 6.98 0 0111 18c-3.86 0-7-3.14-7-7z"">
			|                                </path>
			|                            </g>
			|                        </svg></div><input
			|                        class=""w-full h-10 transition-colors duration-200 ease-in bg-gray-200 border border-transparent rounded md:text-sm hover:bg-white hover:border-gray-300 focus:outline-none focus:bg-white focus:border-gray-500 dark-bg-dark-600 dark-border-dark-600 placeholder-gray-400 dark-placeholder-dark-400""
			|                        type=""text"" placeholder=""Search"" style=""padding: 0.625rem 0.75rem 0.625rem 2rem;"">
			|                </div>
			|                <div class=""flex items-center justify-center w-10 h-10 lg:hidden""><svg
			|                        xmlns=""http://www.w3.org/2000/svg"" class=""shrink-0 icon-base"" width=""20"" height=""20""
			|                        viewBox=""0 0 24 24"" aria-labelledby=""icon"" role=""presentation"" style=""margin-bottom: 0px;"">
			|                        <g fill=""currentColor"">
			|                            <path
			|                                d=""M21.71 20.29l-3.68-3.68A8.963 8.963 0 0020 11c0-4.96-4.04-9-9-9s-9 4.04-9 9 4.04 9 9 9c2.12 0 4.07-.74 5.61-1.97l3.68 3.68c.2.19.45.29.71.29s.51-.1.71-.29c.39-.39.39-1.03 0-1.42zM4 11c0-3.86 3.14-7 7-7s7 3.14 7 7c0 1.92-.78 3.66-2.04 4.93-.01.01-.02.01-.02.01-.01.01-.01.01-.01.02A6.98 6.98 0 0111 18c-3.86 0-7-3.14-7-7z"">
			|                            </path>
			|                        </g>
			|                    </svg></div>
			|                <div class=""w-10 h-10 lg:ml-2""></div>
			|                <div class=""flex items-center justify-center w-10 h-10"" style=""margin-right: -0.625rem;""><svg
			|                        xmlns=""http://www.w3.org/2000/svg"" class=""shrink-0 icon-base"" width=""22"" height=""22""
			|                        viewBox=""0 0 24 24"" aria-labelledby=""icon"" role=""presentation"" style=""margin-bottom: 0px;"">
			|                        <g fill=""currentColor"">
			|                            <g>
			|                                <path
			|                                    d=""M12.01 6.01c-.55 0-1 .45-1 1V12a1 1 0 00.4.8l3 2.22a.985.985 0 001.39-.2.996.996 0 00-.21-1.4l-2.6-1.92V7.01c.02-.55-.43-1-.98-1z"">
			|                                </path>
			|                                <path
			|                                    d=""M12.01 1.91c-5.33 0-9.69 4.16-10.05 9.4l-.29-.26a.997.997 0 10-1.34 1.48l1.97 1.79c.19.17.43.26.67.26s.48-.09.67-.26l1.97-1.79a.997.997 0 10-1.34-1.48l-.31.28c.34-4.14 3.82-7.41 8.05-7.41 4.46 0 8.08 3.63 8.08 8.09s-3.63 8.08-8.08 8.08c-2.18 0-4.22-.85-5.75-2.4a.996.996 0 10-1.42 1.4 10.02 10.02 0 007.17 2.99c5.56 0 10.08-4.52 10.08-10.08.01-5.56-4.52-10.09-10.08-10.09z"">
			|                                </path>
			|                            </g>
			|                        </g>
			|                    </svg></div>
			|            </div>
			|            <div class=""flex justify-end grow"">
			|                <div id=""docs-mobile-search-button""><button
			|                        class=""flex items-center justify-center shrink-0 overflow-hidden transition-colors duration-200 ease-in hover:bg-gray-200 focus:outline-none focus:bg-gray-300 dark-text-white dark-hover:bg-dark-500 dark-focus:bg-dark-450 rounded-full w-10 h-10 lg:hidden""><svg
			|                            xmlns=""http://www.w3.org/2000/svg"" class=""mb-px shrink-0"" width=""20"" height=""20""
			|                            viewBox=""0 0 24 24"" role=""presentation"" style=""margin-bottom: 0px;"">
			|                            <g fill=""currentColor"">
			|                                <path
			|                                    d=""M21.71 20.29l-3.68-3.68A8.963 8.963 0 0020 11c0-4.96-4.04-9-9-9s-9 4.04-9 9 4.04 9 9 9c2.12 0 4.07-.74 5.61-1.97l3.68 3.68c.2.19.45.29.71.29s.51-.1.71-.29c.39-.39.39-1.03 0-1.42zM4 11c0-3.86 3.14-7 7-7s7 3.14 7 7c0 1.92-.78 3.66-2.04 4.93-.01.01-.02.01-.02.01-.01.01-.01.01-.01.02A6.98 6.98 0 0111 18c-3.86 0-7-3.14-7-7z"">
			|                                </path>
			|                            </g>
			|                        </svg></button></div>
			|                <div
			|                    class=""absolute hidden transition-all duration-300 ease-out right-25 lg:flex lg:flex-col lg:ml-auto w-40"">
			|                    <div class=""relative self-end transition-all duration-300 ease-out w-40"">
			|                        <div class=""absolute flex items-center justify-center h-full pl-3""><svg
			|                                xmlns=""http://www.w3.org/2000/svg"" class=""mb-px"" width=""16"" height=""16""
			|                                viewBox=""0 0 24 24"" role=""presentation"">
			|                                <g fill=""currentColor"">
			|                                    <path
			|                                        d=""M21.71 20.29l-3.68-3.68A8.963 8.963 0 0020 11c0-4.96-4.04-9-9-9s-9 4.04-9 9 4.04 9 9 9c2.12 0 4.07-.74 5.61-1.97l3.68 3.68c.2.19.45.29.71.29s.51-.1.71-.29c.39-.39.39-1.03 0-1.42zM4 11c0-3.86 3.14-7 7-7s7 3.14 7 7c0 1.92-.78 3.66-2.04 4.93-.01.01-.02.01-.02.01-.01.01-.01.01-.01.02A6.98 6.98 0 0111 18c-3.86 0-7-3.14-7-7z"">
			|                                    </path>
			|                                </g>
			|                            </svg></div><input
			|                            class=""w-full h-10 pl-8 leading-10 text-left text-gray-600 transition-colors duration-200 ease-in bg-gray-200 border border-transparent rounded sm:text-sm hover:bg-white hover:border-gray-300 focus:outline-none focus:border-gray-500 focus:bg-white dark-bg-dark-550 dark-border-dark-600 dark-hover:bg-dark-450 dark-focus:bg-dark-450 dark-focus:border-dark-450 dark-text-white placeholder-gray-400 dark-placeholder-dark-400""
			|                            type=""text"" autocomplete=""off"" spellcheck=""false"" aria-label=""Search""
			|                            placeholder=""Search"" style=""padding: 0.625rem 0.75rem 0.625rem 2rem;"">
			|                    </div>
			|                </div><button
			|                    class=""flex items-center justify-center shrink-0 overflow-hidden transition-colors duration-200 ease-in hover:bg-gray-200 focus:outline-none focus:bg-gray-300 dark-text-white dark-hover:bg-dark-500 dark-focus:bg-dark-450 rounded-full w-10 h-10 lg:ml-2""><svg
			|                        xmlns=""http://www.w3.org/2000/svg"" class=""mb-px shrink-0"" width=""20"" height=""20""
			|                        viewBox=""0 0 24 24"" role=""presentation"" style=""margin-bottom: 0px;"">
			|                        <g fill=""currentColor"">
			|                            <path
			|                                d=""M12 6c-3.31 0-6 2.69-6 6s2.69 6 6 6 6-2.69 6-6-2.69-6-6-6zm0 10c-2.21 0-4-1.79-4-4s1.79-4 4-4 4 1.79 4 4-1.79 4-4 4zM12 4c.55 0 1-.45 1-1V1c0-.55-.45-1-1-1s-1 .45-1 1v2c0 .55.45 1 1 1zM12 20c-.55 0-1 .45-1 1v2c0 .55.45 1 1 1s1-.45 1-1v-2c0-.55-.45-1-1-1zM4.93 6.35c.2.2.45.29.71.29s.51-.1.71-.29a.996.996 0 000-1.41L4.93 3.51a.996.996 0 10-1.41 1.41l1.41 1.43zM19.07 17.65a.996.996 0 10-1.41 1.41l1.42 1.42c.2.2.45.29.71.29s.51-.1.71-.29a.996.996 0 000-1.41l-1.43-1.42zM4 12c0-.55-.45-1-1-1H1c-.55 0-1 .45-1 1s.45 1 1 1h2c.55 0 1-.45 1-1zM23 11h-2c-.55 0-1 .45-1 1s.45 1 1 1h2c.55 0 1-.45 1-1s-.45-1-1-1zM4.93 17.65l-1.42 1.42a.996.996 0 00.71 1.7c.26 0 .51-.1.71-.29l1.42-1.42c.39-.39.39-1.02 0-1.41s-1.03-.39-1.42 0zM18.36 6.64c.26 0 .51-.1.71-.29l1.42-1.42a.996.996 0 10-1.41-1.41l-1.42 1.42a.996.996 0 00.7 1.7z"">
			|                            </path>
			|                        </g>
			|                    </svg></button>
			|                <div class=""relative"" style=""margin-right: -0.625rem;"">
			|                    <div class="""" role=""button"" aria-has-popup=""true"" aria-expanded=""false""><button
			|                            class=""flex items-center justify-center shrink-0 overflow-hidden transition-colors duration-200 ease-in hover:bg-gray-200 focus:outline-none focus:bg-gray-300 dark-text-white dark-hover:bg-dark-500 dark-focus:bg-dark-450 rounded-full w-10 h-10 -mb-0.5""><svg
			|                                xmlns=""http://www.w3.org/2000/svg"" class=""mb-px shrink-0"" width=""22"" height=""22""
			|                                viewBox=""0 0 24 24"" role=""presentation"" style=""margin-bottom: 0px;"">
			|                                <g fill=""currentColor"">
			|                                    <g>
			|                                        <path
			|                                            d=""M12.01 6.01c-.55 0-1 .45-1 1V12a1 1 0 00.4.8l3 2.22a.985.985 0 001.39-.2.996.996 0 00-.21-1.4l-2.6-1.92V7.01c.02-.55-.43-1-.98-1z"">
			|                                        </path>
			|                                        <path
			|                                            d=""M12.01 1.91c-5.33 0-9.69 4.16-10.05 9.4l-.29-.26a.997.997 0 10-1.34 1.48l1.97 1.79c.19.17.43.26.67.26s.48-.09.67-.26l1.97-1.79a.997.997 0 10-1.34-1.48l-.31.28c.34-4.14 3.82-7.41 8.05-7.41 4.46 0 8.08 3.63 8.08 8.09s-3.63 8.08-8.08 8.08c-2.18 0-4.22-.85-5.75-2.4a.996.996 0 10-1.42 1.4 10.02 10.02 0 007.17 2.99c5.56 0 10.08-4.52 10.08-10.08.01-5.56-4.52-10.09-10.08-10.09z"">
			|                                        </path>
			|                                    </g>
			|                                </g>
			|                            </svg></button></div>
			|                    <div class=""absolute z-30 py-2 mt-2 bg-white border border-gray-300 rounded shadow-lg dark-bg-dark-650 dark-border-dark-500 right-0""
			|                        style=""min-width: 18rem; display: none;"">
			|                        <div
			|                            class=""flex justify-between px-5 py-3 -mt-1 border-b border-gray-200 dark-border-dark-650"">
			|                            <div class=""flex text-sm text-gray-500 dark-text-dark-350""><svg
			|                                    xmlns=""http://www.w3.org/2000/svg"" class=""mb-px mr-3 mt-0.75"" width=""15""
			|                                    height=""15"" viewBox=""0 0 24 24"" role=""presentation"">
			|                                    <g fill=""currentColor"">
			|                                        <g>
			|                                            <path
			|                                                d=""M12.01 6.01c-.55 0-1 .45-1 1V12a1 1 0 00.4.8l3 2.22a.985.985 0 001.39-.2.996.996 0 00-.21-1.4l-2.6-1.92V7.01c.02-.55-.43-1-.98-1z"">
			|                                            </path>
			|                                            <path
			|                                                d=""M12.01 1.91c-5.33 0-9.69 4.16-10.05 9.4l-.29-.26a.997.997 0 10-1.34 1.48l1.97 1.79c.19.17.43.26.67.26s.48-.09.67-.26l1.97-1.79a.997.997 0 10-1.34-1.48l-.31.28c.34-4.14 3.82-7.41 8.05-7.41 4.46 0 8.08 3.63 8.08 8.09s-3.63 8.08-8.08 8.08c-2.18 0-4.22-.85-5.75-2.4a.996.996 0 10-1.42 1.4 10.02 10.02 0 007.17 2.99c5.56 0 10.08-4.52 10.08-10.08.01-5.56-4.52-10.09-10.08-10.09z"">
			|                                            </path>
			|                                        </g>
			|                                    </g>
			|                                </svg><span>History</span></div><button
			|                                class=""text-xs text-blue-500 dark-text-blue-400 focus:outline-none hover:text-blue-900 dark-hover:text-blue-200"">
			|                                Clear </button>
			|                        </div>
			|                        <ul class=""mt-2"">
			|                            <li><a class=""flex justify-between px-5 py-1.5 text-sm whitespace-nowrap group hover:bg-gray-200 dark-hover:bg-dark-500""
			|                                    href=""./""><span class=""flex""><svg xmlns=""http://www.w3.org/2000/svg""
			|                                            class=""mb-px mr-3 mt-0.75"" width=""15"" height=""15"" viewBox=""0 0 24 24""
			|                                            role=""presentation"">
			|                                            <g fill=""currentColor"">
			|                                                <path
			|                                                    d=""M20.92 8.62a.875.875 0 00-.22-.32l-7-7A.995.995 0 0013 1H6C4.35 1 3 2.35 3 4v16c0 1.65 1.35 3 3 3h12c1.65 0 3-1.35 3-3V9c0-.13-.03-.26-.08-.38zM14 4.41L17.59 8H14V4.41zM18 21H6c-.55 0-1-.45-1-1V4c0-.55.45-1 1-1h6v6c0 .55.45 1 1 1h6v10c0 .55-.45 1-1 1z"">
			|                                                </path>
			|                                            </g>
			|                                        </svg><span>What is?</span></span><span
			|                                        class=""invisible ml-5 text-xs text-gray-600 group-hover:visible dark-text-dark-350""></span></a>
			|                            </li>
			|                            <li><a class=""flex justify-between px-5 py-1.5 text-sm whitespace-nowrap group hover:bg-gray-200 dark-hover:bg-dark-500""
			|                                    href=""./components/button/""><span class=""flex""><svg
			|                                            xmlns=""http://www.w3.org/2000/svg"" class=""mb-px mr-3 mt-0.75"" width=""15""
			|                                            height=""15"" viewBox=""0 0 24 24"" role=""presentation"">
			|                                            <g fill=""currentColor"">
			|                                                <path
			|                                                    d=""M20.92 8.62a.875.875 0 00-.22-.32l-7-7A.995.995 0 0013 1H6C4.35 1 3 2.35 3 4v16c0 1.65 1.35 3 3 3h12c1.65 0 3-1.35 3-3V9c0-.13-.03-.26-.08-.38zM14 4.41L17.59 8H14V4.41zM18 21H6c-.55 0-1-.45-1-1V4c0-.55.45-1 1-1h6v6c0 .55.45 1 1 1h6v10c0 .55-.45 1-1 1z"">
			|                                                </path>
			|                                            </g>
			|                                        </svg><span>Button</span></span><span
			|                                        class=""invisible ml-5 text-xs text-gray-600 group-hover:visible dark-text-dark-350""></span></a>
			|                            </li>
			|                            <li><a class=""flex justify-between px-5 py-1.5 text-sm whitespace-nowrap group hover:bg-gray-200 dark-hover:bg-dark-500""
			|                                    href=""./components/""><span class=""flex""><svg xmlns=""http://www.w3.org/2000/svg""
			|                                            class=""mb-px mr-3 mt-0.75"" width=""15"" height=""15"" viewBox=""0 0 24 24""
			|                                            role=""presentation"">
			|                                            <g fill=""currentColor"">
			|                                                <path
			|                                                    d=""M20.92 8.62a.875.875 0 00-.22-.32l-7-7A.995.995 0 0013 1H6C4.35 1 3 2.35 3 4v16c0 1.65 1.35 3 3 3h12c1.65 0 3-1.35 3-3V9c0-.13-.03-.26-.08-.38zM14 4.41L17.59 8H14V4.41zM18 21H6c-.55 0-1-.45-1-1V4c0-.55.45-1 1-1h6v6c0 .55.45 1 1 1h6v10c0 .55-.45 1-1 1z"">
			|                                                </path>
			|                                            </g>
			|                                        </svg><span>Components</span></span><span
			|                                        class=""invisible ml-5 text-xs text-gray-600 group-hover:visible dark-text-dark-350""></span></a>
			|                            </li>
			|                            <li><a class=""flex justify-between px-5 py-1.5 text-sm whitespace-nowrap group hover:bg-gray-200 dark-hover:bg-dark-500""
			|                                    href=""./components/mermaid/""><span class=""flex""><svg
			|                                            xmlns=""http://www.w3.org/2000/svg"" class=""mb-px mr-3 mt-0.75"" width=""15""
			|                                            height=""15"" viewBox=""0 0 24 24"" role=""presentation"">
			|                                            <g fill=""currentColor"">
			|                                                <path
			|                                                    d=""M20.92 8.62a.875.875 0 00-.22-.32l-7-7A.995.995 0 0013 1H6C4.35 1 3 2.35 3 4v16c0 1.65 1.35 3 3 3h12c1.65 0 3-1.35 3-3V9c0-.13-.03-.26-.08-.38zM14 4.41L17.59 8H14V4.41zM18 21H6c-.55 0-1-.45-1-1V4c0-.55.45-1 1-1h6v6c0 .55.45 1 1 1h6v10c0 .55-.45 1-1 1z"">
			|                                                </path>
			|                                            </g>
			|                                        </svg><span>Mermaid</span></span><span
			|                                        class=""invisible ml-5 text-xs text-gray-600 group-hover:visible dark-text-dark-350""></span></a>
			|                            </li>
			|                            <li><a class=""flex justify-between px-5 py-1.5 text-sm whitespace-nowrap group hover:bg-gray-200 dark-hover:bg-dark-500""
			|                                    href=""./components/alert/""><span class=""flex""><svg
			|                                            xmlns=""http://www.w3.org/2000/svg"" class=""mb-px mr-3 mt-0.75"" width=""15""
			|                                            height=""15"" viewBox=""0 0 24 24"" role=""presentation"">
			|                                            <g fill=""currentColor"">
			|                                                <path
			|                                                    d=""M20.92 8.62a.875.875 0 00-.22-.32l-7-7A.995.995 0 0013 1H6C4.35 1 3 2.35 3 4v16c0 1.65 1.35 3 3 3h12c1.65 0 3-1.35 3-3V9c0-.13-.03-.26-.08-.38zM14 4.41L17.59 8H14V4.41zM18 21H6c-.55 0-1-.45-1-1V4c0-.55.45-1 1-1h6v6c0 .55.45 1 1 1h6v10c0 .55-.45 1-1 1z"">
			|                                                </path>
			|                                            </g>
			|                                        </svg><span>Alert</span></span><span
			|                                        class=""invisible ml-5 text-xs text-gray-600 group-hover:visible dark-text-dark-350""></span></a>
			|                            </li>
			|                            <li><a class=""flex justify-between px-5 py-1.5 text-sm whitespace-nowrap group hover:bg-gray-200 dark-hover:bg-dark-500""
			|                                    href=""./about/""><span class=""flex""><svg xmlns=""http://www.w3.org/2000/svg""
			|                                            class=""mb-px mr-3 mt-0.75"" width=""15"" height=""15"" viewBox=""0 0 24 24""
			|                                            role=""presentation"">
			|                                            <g fill=""currentColor"">
			|                                                <path
			|                                                    d=""M20.92 8.62a.875.875 0 00-.22-.32l-7-7A.995.995 0 0013 1H6C4.35 1 3 2.35 3 4v16c0 1.65 1.35 3 3 3h12c1.65 0 3-1.35 3-3V9c0-.13-.03-.26-.08-.38zM14 4.41L17.59 8H14V4.41zM18 21H6c-.55 0-1-.45-1-1V4c0-.55.45-1 1-1h6v6c0 .55.45 1 1 1h6v10c0 .55-.45 1-1 1z"">
			|                                                </path>
			|                                            </g>
			|                                        </svg><span>About</span></span><span
			|                                        class=""invisible ml-5 text-xs text-gray-600 group-hover:visible dark-text-dark-350""></span></a>
			|                            </li>
			|                            <li><a class=""flex justify-between px-5 py-1.5 text-sm whitespace-nowrap group hover:bg-gray-200 dark-hover:bg-dark-500""
			|                                    href=""./samples/basic-project-config/""><span class=""flex""><svg
			|                                            xmlns=""http://www.w3.org/2000/svg"" class=""mb-px mr-3 mt-0.75"" width=""15""
			|                                            height=""15"" viewBox=""0 0 24 24"" role=""presentation"">
			|                                            <g fill=""currentColor"">
			|                                                <path
			|                                                    d=""M20.92 8.62a.875.875 0 00-.22-.32l-7-7A.995.995 0 0013 1H6C4.35 1 3 2.35 3 4v16c0 1.65 1.35 3 3 3h12c1.65 0 3-1.35 3-3V9c0-.13-.03-.26-.08-.38zM14 4.41L17.59 8H14V4.41zM18 21H6c-.55 0-1-.45-1-1V4c0-.55.45-1 1-1h6v6c0 .55.45 1 1 1h6v10c0 .55-.45 1-1 1z"">
			|                                                </path>
			|                                            </g>
			|                                        </svg><span>Basic project config</span></span><span
			|                                        class=""invisible ml-5 text-xs text-gray-600 group-hover:visible dark-text-dark-350""></span></a>
			|                            </li>
			|                            <li><a class=""flex justify-between px-5 py-1.5 text-sm whitespace-nowrap group hover:bg-gray-200 dark-hover:bg-dark-500""
			|                                    href=""./faq/""><span class=""flex""><svg xmlns=""http://www.w3.org/2000/svg""
			|                                            class=""mb-px mr-3 mt-0.75"" width=""15"" height=""15"" viewBox=""0 0 24 24""
			|                                            role=""presentation"">
			|                                            <g fill=""currentColor"">
			|                                                <path
			|                                                    d=""M20.92 8.62a.875.875 0 00-.22-.32l-7-7A.995.995 0 0013 1H6C4.35 1 3 2.35 3 4v16c0 1.65 1.35 3 3 3h12c1.65 0 3-1.35 3-3V9c0-.13-.03-.26-.08-.38zM14 4.41L17.59 8H14V4.41zM18 21H6c-.55 0-1-.45-1-1V4c0-.55.45-1 1-1h6v6c0 .55.45 1 1 1h6v10c0 .55-.45 1-1 1z"">
			|                                                </path>
			|                                            </g>
			|                                        </svg><span>FAQ</span></span><span
			|                                        class=""invisible ml-5 text-xs text-gray-600 group-hover:visible dark-text-dark-350""></span></a>
			|                            </li>
			|                            <li><a class=""flex justify-between px-5 py-1.5 text-sm whitespace-nowrap group hover:bg-gray-200 dark-hover:bg-dark-500""
			|                                    href=""./guides/getting-started/""><span class=""flex""><svg
			|                                            xmlns=""http://www.w3.org/2000/svg"" class=""mb-px mr-3 mt-0.75"" width=""15""
			|                                            height=""15"" viewBox=""0 0 24 24"" role=""presentation"">
			|                                            <g fill=""currentColor"">
			|                                                <path
			|                                                    d=""M20.92 8.62a.875.875 0 00-.22-.32l-7-7A.995.995 0 0013 1H6C4.35 1 3 2.35 3 4v16c0 1.65 1.35 3 3 3h12c1.65 0 3-1.35 3-3V9c0-.13-.03-.26-.08-.38zM14 4.41L17.59 8H14V4.41zM18 21H6c-.55 0-1-.45-1-1V4c0-.55.45-1 1-1h6v6c0 .55.45 1 1 1h6v10c0 .55-.45 1-1 1z"">
			|                                                </path>
			|                                            </g>
			|                                        </svg><span>Getting Started</span></span><span
			|                                        class=""invisible ml-5 text-xs text-gray-600 group-hover:visible dark-text-dark-350""></span></a>
			|                            </li>
			|                            <li><a class=""flex justify-between px-5 py-1.5 text-sm whitespace-nowrap group hover:bg-gray-200 dark-hover:bg-dark-500""
			|                                    href=""./guides/github-actions/""><span class=""flex""><svg
			|                                            xmlns=""http://www.w3.org/2000/svg"" class=""mb-px mr-3 mt-0.75"" width=""15""
			|                                            height=""15"" viewBox=""0 0 24 24"" role=""presentation"">
			|                                            <g fill=""currentColor"">
			|                                                <path
			|                                                    d=""M20.92 8.62a.875.875 0 00-.22-.32l-7-7A.995.995 0 0013 1H6C4.35 1 3 2.35 3 4v16c0 1.65 1.35 3 3 3h12c1.65 0 3-1.35 3-3V9c0-.13-.03-.26-.08-.38zM14 4.41L17.59 8H14V4.41zM18 21H6c-.55 0-1-.45-1-1V4c0-.55.45-1 1-1h6v6c0 .55.45 1 1 1h6v10c0 .55-.45 1-1 1z"">
			|                                                </path>
			|                                            </g>
			|                                        </svg><span>GitHub Actions</span></span><span
			|                                        class=""invisible ml-5 text-xs text-gray-600 group-hover:visible dark-text-dark-350""></span></a>
			|                            </li>
			|                            <li><a class=""flex justify-between px-5 py-1.5 text-sm whitespace-nowrap group hover:bg-gray-200 dark-hover:bg-dark-500""
			|                                    href=""./guides/formatting/""><span class=""flex""><svg
			|                                            xmlns=""http://www.w3.org/2000/svg"" class=""mb-px mr-3 mt-0.75"" width=""15""
			|                                            height=""15"" viewBox=""0 0 24 24"" role=""presentation"">
			|                                            <g fill=""currentColor"">
			|                                                <path
			|                                                    d=""M20.92 8.62a.875.875 0 00-.22-.32l-7-7A.995.995 0 0013 1H6C4.35 1 3 2.35 3 4v16c0 1.65 1.35 3 3 3h12c1.65 0 3-1.35 3-3V9c0-.13-.03-.26-.08-.38zM14 4.41L17.59 8H14V4.41zM18 21H6c-.55 0-1-.45-1-1V4c0-.55.45-1 1-1h6v6c0 .55.45 1 1 1h6v10c0 .55-.45 1-1 1z"">
			|                                                </path>
			|                                            </g>
			|                                        </svg><span>Formatting</span></span><span
			|                                        class=""invisible ml-5 text-xs text-gray-600 group-hover:visible dark-text-dark-350""></span></a>
			|                            </li>
			|                            <li><a class=""flex justify-between px-5 py-1.5 text-sm whitespace-nowrap group hover:bg-gray-200 dark-hover:bg-dark-500""
			|                                    href=""./оборудование/""><span class=""flex""><svg
			|                                            xmlns=""http://www.w3.org/2000/svg"" class=""mb-px mr-3 mt-0.75"" width=""15""
			|                                            height=""15"" viewBox=""0 0 24 24"" role=""presentation"">
			|                                            <g fill=""currentColor"">
			|                                                <path
			|                                                    d=""M20.92 8.62a.875.875 0 00-.22-.32l-7-7A.995.995 0 0013 1H6C4.35 1 3 2.35 3 4v16c0 1.65 1.35 3 3 3h12c1.65 0 3-1.35 3-3V9c0-.13-.03-.26-.08-.38zM14 4.41L17.59 8H14V4.41zM18 21H6c-.55 0-1-.45-1-1V4c0-.55.45-1 1-1h6v6c0 .55.45 1 1 1h6v10c0 .55-.45 1-1 1z"">
			|                                                </path>
			|                                            </g>
			|                                        </svg><span>Привет мир!</span></span><span
			|                                        class=""invisible ml-5 text-xs text-gray-600 group-hover:visible dark-text-dark-350""></span></a>
			|                            </li>
			|                            <li><a class=""flex justify-between px-5 py-1.5 text-sm whitespace-nowrap group hover:bg-gray-200 dark-hover:bg-dark-500""
			|                                    href=""./test/""><span class=""flex""><svg xmlns=""http://www.w3.org/2000/svg""
			|                                            class=""mb-px mr-3 mt-0.75"" width=""15"" height=""15"" viewBox=""0 0 24 24""
			|                                            role=""presentation"">
			|                                            <g fill=""currentColor"">
			|                                                <path
			|                                                    d=""M20.92 8.62a.875.875 0 00-.22-.32l-7-7A.995.995 0 0013 1H6C4.35 1 3 2.35 3 4v16c0 1.65 1.35 3 3 3h12c1.65 0 3-1.35 3-3V9c0-.13-.03-.26-.08-.38zM14 4.41L17.59 8H14V4.41zM18 21H6c-.55 0-1-.45-1-1V4c0-.55.45-1 1-1h6v6c0 .55.45 1 1 1h6v10c0 .55-.45 1-1 1z"">
			|                                                </path>
			|                                            </g>
			|                                        </svg><span>Test</span></span><span
			|                                        class=""invisible ml-5 text-xs text-gray-600 group-hover:visible dark-text-dark-350""></span></a>
			|                            </li>
			|                        </ul>
			|                    </div>
			|                </div>
			|            </div>
			|        </div>
			|    </div>
			|</header>";
	мГруппа.Вставить("standart", мТекст);

 	мГруппа = Новый ФиксированнаяСтруктура(мГруппа);
	Шаблон.Вставить("layout_header", мГруппа);

	// layout_leftbar.
	мГруппа = Новый Структура();

	мТекст = "<aside
			|    class=""fixed top-0 z-40 flex flex-col shrink-0 w-4/5 duration-300 ease-in-out bg-gray-100 border-gray-200 sidebar md:top-20 sm:w-1/2 md:w-75 md:z-0 md:border-r md:h-screen md:sticky md:transition-transform dark-bg-dark-800 dark-border-dark-650"">
			|    <div
			|        class=""flex items-center shrink-0 h-16 px-6 -ml-6 bg-white border-b border-gray-200 md:hidden dark-bg-dark-800 dark-border-dark-650"">
			|        <button
			|            class=""flex items-center justify-center shrink-0 overflow-hidden transition-colors duration-200 ease-in hover:bg-gray-200 focus:outline-none focus:bg-gray-300 dark-text-white dark-hover:bg-dark-500 dark-focus:bg-dark-450 rounded-full w-10 h-10 ml-3.5 md:hidden""><svg
			|                xmlns=""http://www.w3.org/2000/svg"" class=""mb-px shrink-0"" width=""22"" height=""22"" viewBox=""0 0 24 24""
			|                role=""presentation"" style=""margin-bottom: 0px;"">
			|                <g fill=""currentColor"">
			|                    <path
			|                        d=""M19 11H7.41l5.29-5.29a.996.996 0 10-1.41-1.41l-7 7a1 1 0 000 1.42l7 7a1.024 1.024 0 001.42-.01.996.996 0 000-1.41L7.41 13H19c.55 0 1-.45 1-1s-.45-1-1-1z"">
			|                    </path>
			|                </g>
			|            </svg></button>
			|        <div class=""w-full ml-0.5"">
			|            <div class=""relative flex items-center w-full""><input oninput=""filterLeftBar(this)""
			|                    class=""w-full h-8 px-3 py-2 transition-colors duration-200 ease-linear bg-white border border-gray-200 rounded shadow-none md:text-sm focus:outline-none focus:border-gray-600 dark-bg-dark-550 dark-border-dark-600 dark-hover:bg-dark-450 dark-focus:border-dark-450 dark-focus:bg-dark-450 dark-hover:border-dark-450 dark-text-white placeholder-gray-400 dark-placeholder-dark-400""
			|                    type=""text"" placeholder=""Filter""></div>
			|        </div>
			|    </div>
			|    <div
			|        class=""absolute top-0 left-0 right-0 z-5 bg-gray-100 dark-bg-dark-800 h-16 px-6 hidden md:flex items-center"">
			|        <div class=""relative flex items-center w-full""><input oninput=""filterLeftBar(this)""
			|                class=""w-full h-8 px-3 py-2 transition-colors duration-200 ease-linear bg-white border border-gray-200 rounded shadow-none md:text-sm focus:outline-none focus:border-gray-600 dark-bg-dark-550 dark-border-dark-600 dark-hover:bg-dark-450 dark-focus:border-dark-450 dark-focus:bg-dark-450 dark-hover:border-dark-450 dark-text-white placeholder-gray-400 dark-placeholder-dark-400""
			|                type=""text"" placeholder=""Filter""></div>
			|    </div>
			|    <ul class=""overflow-y-auto h-full flex-1 pl-3 mt-4 md:mt-16 mb-4"" data-simplebar=""init"">
			|        <div class=""simplebar-wrapper"" style=""margin: 0px 0px 0px -12px;"">
			|            <div class=""simplebar-height-auto-observer-wrapper"">
			|                <div class=""simplebar-height-auto-observer""></div>
			|            </div>
			|            <div class=""simplebar-mask"">
			|                <div class=""simplebar-offset"" style=""right: 0px; bottom: 0px;"">
			|                    <div class=""simplebar-content-wrapper"" tabindex=""0"" role=""region""
			|                        aria-label=""scrollable content"" style=""height: 100%; overflow: hidden scroll;"">
			|                        <div id=""list_tree"" class=""simplebar-content"" style=""padding: 0px 0px 0px 12px;"">
			|                            {{list_items}}
			|                        </div>
			|                    </div>
			|                </div>
			|            </div>
			|            <div class=""simplebar-placeholder"" style=""width: auto; height: 495px;""></div>
			|        </div>
			|        <div class=""simplebar-track simplebar-horizontal"" style=""visibility: hidden;"">
			|            <div class=""simplebar-scrollbar"" style=""width: 0px; display: none;""></div>
			|        </div>
			|        <div class=""simplebar-track simplebar-vertical"" style=""visibility: visible;"">
			|            <div class=""simplebar-scrollbar""
			|                style=""height: 337px; display: block; transform: translate3d(0px, 0px, 0px);""></div>
			|        </div>
			|    </ul>
			|    <div>
			|        <div class=""shrink-0 mt-auto border-t md:bg-transparent md:border-none dark-border-dark-650"">
			|            <div class=""py-3 px-6 md:hidden border-b dark-border-dark-650"">
			|                <nav>
			|                    <ul class=""flex flex-wrap justify-center items-center"">
			|                        <li class=""mr-6""><a
			|                                class=""block py-1 inline-flex items-center text-sm whitespace-nowrap transition-colors duration-200 ease-linear md:text-blue-500 dark-text-blue-400 hover:text-blue-800 dark-hover:text-blue-200""
			|                                href=""""><svg xmlns=""http://www.w3.org/2000/svg"" class=""mb-px mr-1"" width=""18""
			|                                    height=""18"" viewBox=""0 0 24 24"" role=""presentation"">
			|                                    <g fill=""currentColor"">
			|                                        <path fill-rule=""evenodd""
			|                                            d=""M11.03 2.59a1.5 1.5 0 011.94 0l7.5 6.363a1.5 1.5 0 01.53 1.144V19.5a1.5 1.5 0 01-1.5 1.5h-5.75a.75.75 0 01-.75-.75V14h-2v6.25a.75.75 0 01-.75.75H4.5A1.5 1.5 0 013 19.5v-9.403c0-.44.194-.859.53-1.144l7.5-6.363zM12 3.734l-7.5 6.363V19.5h5v-6.25a.75.75 0 01.75-.75h3.5a.75.75 0 01.75.75v6.25h5v-9.403L12 3.734z"">
			|                                        </path>
			|                                    </g>
			|                                </svg><span>Home</span></a></li>
			|                        <li class=""mr-6""><a
			|                                class=""block py-1 inline-flex items-center text-sm whitespace-nowrap transition-colors duration-200 ease-linear md:text-blue-500 dark-text-blue-400 hover:text-blue-800 dark-hover:text-blue-200""
			|                                href=""pro/""><svg xmlns=""http://www.w3.org/2000/svg"" class=""mb-px mr-1"" width=""18""
			|                                    height=""18"" viewBox=""0 0 24 24"" role=""presentation"">
			|                                    <g fill=""currentColor"">
			|                                        <path fill-rule=""evenodd""
			|                                            d=""M12 .25a.75.75 0 01.673.418l3.058 6.197 6.839.994a.75.75 0 01.415 1.279l-4.948 4.823 1.168 6.811a.75.75 0 01-1.088.791L12 18.347l-6.117 3.216a.75.75 0 01-1.088-.79l1.168-6.812-4.948-4.823a.75.75 0 01.416-1.28l6.838-.993L11.328.668A.75.75 0 0112 .25zm0 2.445L9.44 7.882a.75.75 0 01-.565.41l-5.725.832 4.143 4.038a.75.75 0 01.215.664l-.978 5.702 5.121-2.692a.75.75 0 01.698 0l5.12 2.692-.977-5.702a.75.75 0 01.215-.664l4.143-4.038-5.725-.831a.75.75 0 01-.565-.41L12 2.694z"">
			|                                        </path>
			|                                    </g>
			|                                </svg><span>Pricing</span></a></li>
			|                    </ul>
			|                </nav>
			|            </div>
			|        </div>
			|    </div>
			|</aside>";
	мГруппа.Вставить("standart", мТекст);

 	мТекст = "<li>
			|    <div 
			|        class=""relative flex items-center justify-between break-normal pl-3 pr-4 select-none rounded-l transition-colors ease-out duration-150 text-gray-900 dark-text-dark-250 hover:text-blue-500 dark-hover:text-blue-400"">
			|        <a href=""{{href}}"" class=""flex flex-1 items-center cursor-pointer""><span
			|                class=""flex shrink-0 items-center justify-center w-6 h-6 mr-2""><svg xmlns=""http://www.w3.org/2000/svg"" class=""mb-px w-4.5 h-4.5"" width=""16"" height=""16"" viewBox=""0 0 24 24"" role=""presentation""><g fill=""currentColor""><g><path fill-rule=""evenodd"" d=""M5 2.5a.5.5 0 00-.5.5v18a.5.5 0 00.5.5h14a.5.5 0 00.5-.5V8.5h-4a2 2 0 01-2-2v-4H5zm10 0v4a.5.5 0 00.5.5h4a.5.5 0 00-.146-.336l-4.018-4.018A.5.5 0 0015 2.5zM3 3a2 2 0 012-2h9.982a2 2 0 011.414.586l4.018 4.018A2 2 0 0121 7.018V21a2 2 0 01-2 2H5a2 2 0 01-2-2V3z""></path></g></g></svg>
			|            </span><span class=""text-sm py-1.5"">{{text}}</span>
			|        </a>
			|    </div>
			|</li>";
	мГруппа.Вставить("list_item", мТекст);

 	мТекст = "<li>
			|    <div
			|        class=""relative flex items-center justify-between break-normal pl-3 pr-4 select-none rounded-l transition-colors ease-out duration-150 text-gray-900 dark-text-dark-250 hover:text-blue-500 dark-hover:text-blue-400"">
			|        <a href="""" class=""flex flex-1 items-center cursor-pointer""><span
			|                class=""flex shrink-0 items-center justify-center w-6 h-6 mr-2""><svg xmlns=""http://www.w3.org/2000/svg"" class=""mb-px w-4.5 h-4.5"" width=""16"" height=""16"" viewBox=""0 0 24 24"" role=""presentation""><g fill=""currentColor""><g><path fill-rule=""evenodd"" d=""M3.75 4.5a.25.25 0 00-.25.25v14.5c0 .138.112.25.25.25h16.5a.25.25 0 00.25-.25V7.687a.25.25 0 00-.25-.25h-8.471a1.75 1.75 0 01-1.447-.765L8.928 4.61a.25.25 0 00-.208-.11H3.75zM2 4.75C2 3.784 2.784 3 3.75 3h4.971c.58 0 1.12.286 1.447.765l1.404 2.063a.25.25 0 00.207.11h8.471c.966 0 1.75.783 1.75 1.75V19.25A1.75 1.75 0 0120.25 21H3.75A1.75 1.75 0 012 19.25V4.75z""></path></g></g></svg>
			|            </span><span class=""text-sm py-1.5"">{{text}}</span>
			|        </a>
			|        <div
			|            class=""flex items-center justify-center w-7 h-7 rounded-full transition-colors ease-linear duration-150 group shrink-0 hover:bg-gray-200 dark-hover:bg-dark-500"">
			|            <button 
			|                class=""text-gray-400 dark-text-dark-400 group-hover:text-blue-500 dark-group-hover:text-blue-400 focus:outline-none rotate-90 transition-transform ease-out duration-200""><svg
			|                    xmlns=""http://www.w3.org/2000/svg"" class=""mb-px w-5 h-5"" width=""16"" height=""16""
			|                    viewBox=""0 0 24 24"" role=""presentation"">
			|                    <g fill=""currentColor"">
			|                        <path
			|                            d=""M15.71 11.29l-6-6A.996.996 0 108.3 6.7l5.29 5.3-5.29 5.29a.996.996 0 000 1.41c.19.2.44.3.7.3s.51-.1.71-.29l6-6c.39-.39.39-1.03 0-1.42z"">
			|                        </path>
			|                    </g>
			|                </svg>
			|            </button>
			|        </div>
			|    </div>
			|    <ul class=""ml-4 transition-all duration-200 ease-out"" style=""height: auto;"">
			|        {{list_item}}";
	мГруппа.Вставить("list_item_group", мТекст);

 	мТекст = "</ul>
			|</li>";
	мГруппа.Вставить("list_item_group_closing_tags", мТекст);

 	мГруппа = Новый ФиксированнаяСтруктура(мГруппа);
	Шаблон.Вставить("layout_leftbar", мГруппа);

	// layout_main.
	мГруппа = Новый Структура();

	мТекст = "<!DOCTYPE html>
			|<html lang=""ru"" class=""h-full"">
			|
			|<head>
			|    {{headers}}
			|    {{scripts_head}}
			|</head>
			|
			|<body>
			|    <base href=""1"">
			|    <div id=""docs-app""
			|        class=""relative text-base antialiased text-gray-700 bg-white font-body dark-bg-dark-850 dark-text-dark-300""
			|        data-v-app="""">
			|        <div class=""absolute bottom-0 left-0 bg-gray-100 dark-bg-dark-800"" style=""top: 5rem; right: 50%;""></div>
			|        {{header}}
			|        <div class=""container relative flex bg-white"">
			|            <div
			|                class=""fixed flex flex-col shrink-0 duration-300 ease-in-out bg-gray-100 border-gray-200 sidebar top-20 w-75 border-r h-screen md:sticky transition-transform skeleton dark-bg-dark-800 dark-border-dark-650"">
			|                <div class=""flex items-center h-16 px-6""><input
			|                        class=""w-full h-8 px-3 py-2 transition-colors duration-200 ease-linear bg-white border border-gray-200 rounded shadow-none text-sm focus:outline-none focus:border-gray-600 dark-bg-dark-600 dark-border-dark-600""
			|                        type=""text"" placeholder=""Filter""></div>
			|                <div class=""pl-6 mb-4 mt-1"">
			|                    <div class=""w-32 h-3 mb-4 bg-gray-200 rounded-full loading dark-bg-dark-600""></div>
			|                    <div class=""w-48 h-3 mb-4 bg-gray-200 rounded-full loading dark-bg-dark-600""></div>
			|                    <div class=""w-40 h-3 mb-4 bg-gray-200 rounded-full loading dark-bg-dark-600""></div>
			|                    <div class=""w-32 h-3 mb-4 bg-gray-200 rounded-full loading dark-bg-dark-600""></div>
			|                    <div class=""w-48 h-3 mb-4 bg-gray-200 rounded-full loading dark-bg-dark-600""></div>
			|                    <div class=""w-40 h-3 mb-4 bg-gray-200 rounded-full loading dark-bg-dark-600""></div>
			|                </div>
			|            </div>
			|            {{leftbar}}
			|            <div class=""grow min-w-0 dark-bg-dark-850"">
			|                <div class=""flex"">
			|                    <div class=""grow min-w-0 px-6 md:px-16"">
			|                        <main class=""relative pt-6 pb-16"">
			|                            <div class=""docs-markdown"" id=""docs-content"" style=""position: relative;"">
			|                                {{content}}
			|                            </div>
			|                            {{footer_content}}
			|                        </main>
			|                        {{footer}}
			|                    </div>
			|                    <div
			|                        class=""fixed top-0 bottom-0 right-0 translate-x-full bg-white border-gray-200 lg:sticky lg:border-l lg:shrink-0 lg:pt-6 lg:transform-none sm:w-1/2 lg:w-64 lg:z-0 md:w-104 sidebar-right skeleton dark-bg-dark-850 dark-border-dark-650"">
			|                        <div class=""pl-5"">
			|                            <div class=""w-32 h-3 mb-4 bg-gray-200 dark-bg-dark-600 rounded-full loading""></div>
			|                            <div class=""w-48 h-3 mb-4 bg-gray-200 dark-bg-dark-600 rounded-full loading""></div>
			|                            <div class=""w-40 h-3 mb-4 bg-gray-200 dark-bg-dark-600 rounded-full loading""></div>
			|                        </div>
			|                    </div>
			|                    {{rightbar}}
			|                </div>
			|            </div>
			|        </div>
			|        <div class=""fixed top-0 bottom-0 right-0 z-40 w-4/5 h-full transition-transform duration-300 ease-in-out bg-white focus:outline-none dark-bg-dark-850 translate-x-full md:w-104""
			|            tabindex=""-1"">
			|            <div class=""flex flex-col h-full"">
			|                <div class=""flex items-center justify-between shrink-0 h-16 bg-white md:h-20 dark-bg-dark-850"">
			|                    <div class=""relative ml-3 w-full"">
			|                        <div class=""absolute flex items-center justify-center h-full pl-3""><svg
			|                                xmlns=""http://www.w3.org/2000/svg"" class=""mb-px"" width=""16"" height=""16""
			|                                viewBox=""0 0 24 24"" role=""presentation"">
			|                                <g fill=""currentColor"">
			|                                    <path
			|                                        d=""M21.71 20.29l-3.68-3.68A8.963 8.963 0 0020 11c0-4.96-4.04-9-9-9s-9 4.04-9 9 4.04 9 9 9c2.12 0 4.07-.74 5.61-1.97l3.68 3.68c.2.19.45.29.71.29s.51-.1.71-.29c.39-.39.39-1.03 0-1.42zM4 11c0-3.86 3.14-7 7-7s7 3.14 7 7c0 1.92-.78 3.66-2.04 4.93-.01.01-.02.01-.02.01-.01.01-.01.01-.01.02A6.98 6.98 0 0111 18c-3.86 0-7-3.14-7-7z"">
			|                                    </path>
			|                                </g>
			|                            </svg></div><input
			|                            class=""w-full h-10 pl-8 leading-10 text-left text-gray-600 transition-colors duration-200 ease-in bg-gray-200 border border-transparent rounded sm:text-sm hover:bg-white hover:border-gray-300 focus:outline-none focus:border-gray-500 focus:bg-white dark-bg-dark-550 dark-border-dark-600 dark-hover:bg-dark-450 dark-focus:bg-dark-450 dark-focus:border-dark-450 dark-text-white placeholder-gray-400 dark-placeholder-dark-400""
			|                            type=""text"" autocomplete=""off"" spellcheck=""false"" aria-label=""Search"" placeholder=""Search""
			|                            style=""padding: 0.625rem 0.75rem 0.625rem 2rem;"">
			|                    </div><button
			|                        class=""flex items-center justify-center shrink-0 overflow-hidden transition-colors duration-200 ease-in hover:bg-gray-200 focus:outline-none focus:bg-gray-300 dark-text-white dark-hover:bg-dark-500 dark-focus:bg-dark-450 rounded-full w-10 h-10 ml-3""
			|                        style=""margin-right: 0.875rem;""><svg xmlns=""http://www.w3.org/2000/svg"" class=""mb-px shrink-0""
			|                            width=""22"" height=""22"" viewBox=""0 0 24 24"" role=""presentation"" style=""margin-bottom: 0px;"">
			|                            <g fill=""currentColor"">
			|                                <path
			|                                    d=""M19.92 12.38a1 1 0 00-.22-1.09l-7-7a.996.996 0 10-1.41 1.41l5.3 5.3H5c-.55 0-1 .45-1 1s.45 1 1 1h11.59l-5.29 5.29a.996.996 0 000 1.41c.19.2.44.3.7.3s.51-.1.71-.29l7-7c.09-.09.16-.21.21-.33z"">
			|                                </path>
			|                            </g>
			|                        </svg></button>
			|                </div>
			|            </div>
			|        </div><button
			|            class=""fixed bottom-6 right-6 w-12 h-12 flex items-center justify-center rounded-full bg-white bg-opacity-70 hover:bg-gray-200 dark-bg-dark-850 dark-hover:bg-dark-450 z-40 focus:outline-none transition duration-300 linear border border-gray-400 border-opacity-50 hover:border-opacity-10 dark-border-dark-450 dark-bg-opacity-70""><svg
			|                xmlns=""http://www.w3.org/2000/svg"" class=""mb-px w-7 h-7 text-blue-500 dark-text-blue-400"" width=""16""
			|                height=""16"" viewBox=""0 0 24 24"" role=""presentation"">
			|                <g fill=""currentColor"">
			|                    <path
			|                        d=""M19.71 11.29l-7-7a1 1 0 00-1.42 0l-7 7A.996.996 0 105.7 12.7L11 7.41V19c0 .55.45 1 1 1s1-.45 1-1V7.41l5.29 5.29c.2.2.45.3.71.3s.51-.1.71-.29c.39-.39.39-1.03 0-1.42z"">
			|                    </path>
			|                </g>
			|            </svg></button>
			|    </div>
			|
			|    <script>
			|    	var config = {
			|    	startOnLoad:true,
			|    	theme: '{{mermaid_theme??forest}}',
			|    	flowchart:{
			|    			useMaxWidth:false,
			|    			htmlLabels:true
			|    		}
			|    	};
			|    	mermaid.initialize(config);
			|    	window.mermaid.init(undefined, document.querySelectorAll('.language-mermaid'));
			|    </script>
			|    {{scripts_body}}
			|</body>";
	мГруппа.Вставить("standart", мТекст);

 	мГруппа = Новый ФиксированнаяСтруктура(мГруппа);
	Шаблон.Вставить("layout_main", мГруппа);

	// layout_rightbar.
	мГруппа = Новый Структура();

	мТекст = "<div class=""fixed top-0 bottom-0 right-0 z-40 w-4/5 text-sm transition-transform duration-300 ease-in-out bg-white border-gray-200 sidebar-right sm:w-1/2 md:w-104 lg:z-0 lg:sticky lg:w-64 lg:shrink-0 lg:transform-none lg:border-l lg:shadow-none lg:pt-6 focus:outline-none dark-bg-dark-800 lg:dark-bg-dark-850 dark-border-dark-650 translate-x-full lg:top-20""
			|    data-v-3955b324="""" style=""height: calc(100vh - 5rem);"">
			|    <div id=""docs-sidebar-right"" class=""w-full h-full overflow-auto"" data-v-3955b324="""" data-simplebar=""init"">
			|        <div class=""simplebar-wrapper"" style=""margin: 0px;"">
			|            <div class=""simplebar-height-auto-observer-wrapper"">
			|                <div class=""simplebar-height-auto-observer""></div>
			|            </div>
			|            <div class=""simplebar-mask"">
			|                <div class=""simplebar-offset"" style=""right: 0px; bottom: 0px;"">
			|                    <div class=""simplebar-content-wrapper"" tabindex=""0"" role=""region""
			|                        aria-label=""scrollable content"" style=""height: 100%; overflow: hidden;"">
			|                        <div class=""simplebar-content"" style=""padding: 0px;"">
			|                            <div class=""flex items-center justify-between h-16 mb-4 border-b lg:border-none lg:h-auto dark-border-dark-650""
			|                                data-v-3955b324="""">
			|                                <h6 class=""px-5 text-gray-500 dark-text-dark-400"" data-v-3955b324="""">Contents</h6>
			|                                <button
			|                                    class=""flex items-center justify-center shrink-0 overflow-hidden transition-colors duration-200 ease-in hover:bg-gray-200 focus:outline-none focus:bg-gray-300 dark-text-white dark-hover:bg-dark-500 dark-focus:bg-dark-450 rounded-full w-10 h-10 ml-3 lg:hidden""
			|                                    data-v-3955b324="""" style=""margin-right: 0.875rem;""><svg
			|                                        xmlns=""http://www.w3.org/2000/svg"" class=""mb-px shrink-0"" width=""22""
			|                                        height=""22"" viewBox=""0 0 24 24"" role=""presentation""
			|                                        style=""margin-bottom: 0px;"">
			|                                        <g fill=""currentColor"">
			|                                            <path
			|                                                d=""M19.92 12.38a1 1 0 00-.22-1.09l-7-7a.996.996 0 10-1.41 1.41l5.3 5.3H5c-.55 0-1 .45-1 1s.45 1 1 1h11.59l-5.29 5.29a.996.996 0 000 1.41c.19.2.44.3.7.3s.51-.1.71-.29l7-7c.09-.09.16-.21.21-.33z""
			|                                                data-v-3955b324=""""></path>
			|                                        </g>
			|                                    </svg></button>
			|                            </div>
			|                            <ul data-v-3955b324="""">
			|                                <li><a href=""#quick-start"" aria-disabled=""false""
			|                                        class=""relative block px-5 py-1 toc-link hover:text-blue-500 dark-text-dark-300 dark-hover:text-blue-400"">Quick
			|                                        start <div class="""" style=""width: 1px;""></div></a></li>
			|                                <li><a href=""#features"" aria-disabled=""false""
			|                                        class=""relative block px-5 py-1 toc-link hover:text-blue-500 dark-text-dark-300 dark-hover:text-blue-400"">Features
			|                                        <div class="""" style=""width: 1px;""></div></a></li>
			|                                <li><a href=""#support"" aria-disabled=""false""
			|                                        class=""relative block px-5 py-1 toc-link text-blue-500 dark-text-blue-400"">Support
			|                                        <div class=""absolute top-0 left-0 h-full bg-blue-500 dark-bg-blue-400""
			|                                            style=""width: 1px;""></div></a></li>
			|                            </ul>
			|                        </div>
			|                    </div>
			|                </div>
			|            </div>
			|            <div class=""simplebar-placeholder"" style=""width: auto; height: 124px;""></div>
			|        </div>
			|        <div class=""simplebar-track simplebar-horizontal"" style=""visibility: hidden;"">
			|            <div class=""simplebar-scrollbar"" style=""width: 0px; display: none;""></div>
			|        </div>
			|        <div class=""simplebar-track simplebar-vertical"" style=""visibility: hidden;"">
			|            <div class=""simplebar-scrollbar"" style=""height: 0px; display: none;""></div>
			|        </div>
			|    </div>
			|</div>";
	мГруппа.Вставить("standart", мТекст);

 	мГруппа = Новый ФиксированнаяСтруктура(мГруппа);
	Шаблон.Вставить("layout_rightbar", мГруппа);

	Шаблон = Новый ФиксированнаяСтруктура(Шаблон);
	Возврат Шаблон;
	
КонецФункции

#КонецОбласти