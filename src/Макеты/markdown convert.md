##### Конвертация произвольного файла Markdown

Выполняем команду `markdown convert` с указанием шаблона оформления:

```cmd
oscript src\actions.os markdown convert --in tests\fixtures\readme.md --out tests\fixtures\readme.html --template Simple.html
```

Из файла `readme.md`:

```markdown
# Инструкция по установке

Произвольный документ **Markdown** без разбивки на версии.

## Требования

* Веб-сервер с поддержкой статики
* Доступ к API 1С
```

Получаем:

```html
<h1>Инструкция по установке</h1>
<p>Произвольный документ <strong>Markdown</strong> без разбивки на версии.</p>
<h2>Требования</h2>
<ul>
<li>Веб-сервер с поддержкой статики</li>
<li>Доступ к API 1С</li>
</ul>
```

##### Полноценный документ с заголовком

Опция `--title` задает заголовок документа (подстановка `{{Title}}` в шаблоне). Если она не указана, используется значение `--productname`.

```cmd
oscript src\actions.os markdown convert --in README.md --out README.html --title "Личный кабинет 2.0"
```

Шаблон по умолчанию — `Github.html`: страница с типографикой в стиле GitHub, без шапки и ссылок на соцсети. Для документа, оформленного как новость об обновлении, укажите `--template Softonit.html`.

##### Подготовка документа для отправки по почте

Опция `--maximgwidth` ограничивает ширину изображений, `--lazyload` включает ленивую загрузку и встраивает в документ `lazysizes.js`, `--minifyhtml` убирает из результата комментарии, лишние пробелы и переводы строк:

```cmd
oscript src\actions.os markdown convert --in README.md --out README.html --template Letter.html --maximgwidth 540 --lazyload --minifyhtml
```

##### Ограничения

Поддерживаются только HTML-шаблоны. При передаче текстового шаблона (например `SimpleText.txt`) команда завершается с ошибкой — для текстового представления используйте `changelog convert`.
