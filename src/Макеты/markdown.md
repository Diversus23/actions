##### Зачем нужна команда markdown?

Команда `changelog convert` рассчитана на формат [Keep a Changelog](http://keepachangelog.com/): файл разбирается на версии по заголовкам вида `## [1.0.0.0] - 2023-01-01`, и каждая версия оформляется отдельным элементом шаблона.

Команда `markdown` работает с **произвольным** документом Markdown, в котором версий нет: инструкцией по установке, описанием продукта, README. Документ конвертируется целиком и подставляется в шаблон оформления.

##### Чем конвертируется

Конвертация выполняется библиотекой [oscript-md](https://github.com/Segate-ekb/oscript-md) — Markdown-парсером на чистом OneScript (CommonMark 0.31.2 + расширения GitHub Flavored Markdown). Сторонние приложения при этом не запускаются, поэтому команда одинаково работает и на Windows, и в Linux-контейнерах.

##### Шаблоны оформления

Используются те же шаблоны, что и у `changelog convert`, но только HTML-варианты: `Simple.html`, `SimpleWithoutVersion.html`, `Standart.html`, `Softonit.html`, `Letter.html`. Шаблон элемента версии (`*Item.html`) не применяется — весь документ подставляется в `{{Text}}`.

Список доступных шаблонов:

```cmd
oscript src\actions.os markdown templates
```
