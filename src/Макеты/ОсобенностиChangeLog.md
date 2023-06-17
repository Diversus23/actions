### Что такое лог изменений?

ChangeLog — это файл, который содержит поддерживаемый, хронологически упорядоченный список значимых изменений для каждой версии проекта.

Формат основан на [Keep a Changelog](http://keepachangelog.com/) и этот проект придерживается [Semantic Versioning](http://semver.org/).


### Зачем вести лог изменений?

Чтобы пользователям и контрибуторам было проще в точности понять, какие значимые изменения были внесены в каждый выпуск (или версию) проекта.

### Кому нужен лог изменений?

Людям. Конечные пользователи программного обеспечения, будь то клиенты или разработчики, — это человеческие существа, которым небезразлично, с чем они работают. Когда программное обеспечение изменяется, люди хотят знать, что и почему изменилось.

### Как мне сделать хороший лог-изменений?

#### Руководящие принципы

* Лог-изменений — для людей, а не для машин.
* Для каждой версии без исключения следует создать отдельный раздел.
* Однотипные изменения следует группировать.
* Следует предусмотреть возможность поставить ссылку на любую версию или раздел.
* Последняя версия должна идти в начале файла.
* Указаны даты выпуска каждой версии.

Уточните, следуете ли вы принципам семантического версионирования.

#### Типы изменений

* `Внимание!` — для чего-то важного, о чем стоит сказать отдельно.
* `Добавлено` — для новых функций.
* `Изменено` — для изменений в существующей функциональности.
* `Устарело` — для функций, которые скоро будут удалены.
* `Удалено` — для удалённых на данный момент функций.
* `Исправлено` — для любых исправлений багов.
* `Безопасность` — на случай уязвимостей.

Обратите внимание, что заголовки можно писать как на русском, так и на английском. Т.е. заголовки ниже взаимозаменяемы и являются синонимами:

* Внимание! и Attention! и Новости и News
* Добавлено и Added и Новый функционал
* Изменено и Changed и Изменения
* Устарело и Deprecated
* Исправление ошибок и Fixed и Замечания к обновлению
* Удалено и Removed
* Безопасность и Security

Т.е. можно написать так:

```markdown
## Изменено

* Изменено следующее 1
```

А можно вот так:

```markdown
## Changed

* Change next 1
```

Доступно полно форматирование markdown внутри заметок. Можно начинать строки с символа "*", а можно с "-".

### Как мне тратить меньше усилий на ведение лога изменений?

Держите в начале файла раздел `Unreleased`, позволяющий отслеживать предстоящие изменения.

Это служит достижению двух целей:

1. Люди смогут видеть, каких изменений им можно ожидать в предстоящих выпусках;
2. В момент релиза вы можете переместить изменения из раздела `Unreleased` в раздел нового выпуска.

### Пример файла CHANGELOG

```markdown
Продукт

# Changelog

Все изменения по проекту.

## [1.0.0.0] - 2023-06-15

### Внимание!

* Важная заметка 1 **жирный** *курсив*
* Важная заметка 2 ~~Зачеркнутый~~

### Добавлено

* Добавлено дело 1 ***жирный курсив***
* Добавлено дело 2 `выделенный`
* Картинка ![Описание](https://camo.githubusercontent.com/b0ae38dceb7087a93c566bcf5fd05b0e511edd3d523a290e0a9fe465b4c97df0/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6c6963656e73652d4d49542d696e666f726d6174696f6e616c)
		
### Изменено

* Изменение 1 __снова жиный__ _снова курсив_
* Изменение 2

### Исправлено

* Исправление ошибки

### Безопасность

* Устранена критическая уязвимость

### Устарело

* Модуль "УдалитьОсновныеФункции" более не используется

### Удалено

* Справочник "УдалитьКонтактныеДанные" удален

```

### Краткий HTML формат с параметром -format html

Выполняем команду changelog c `-format html` это создает **КРАТКИЙ** файл HTML без стилей. Т.е. шапка и подвал страницы не будут добавлены в итоговый файл:

```cmd
oscript src\actions.os changelog -file tests\fixtures\changelog.md -outfile tests\fixtures\changelog.html -format html
```

Получаем:

```html
<h3>Внимание!</h3>
<ul class="updnws">
<li>Важная заметка 1 <strong>жирный</strong> <em>курсив</em></li>
<li>Важная заметка 2 <del>Зачеркнутый</del></li>
</ul>
<h3>Добавлено</h3>
<ul class="updnew">
<li>Добавлено дело 1 <strong><em>жирный курсив</strong></em></li>
<li>Добавлено дело 2 <code>выделенный</code></li>
<li>Картинка <img src="https://camo.githubusercontent.com/b0ae38dceb7087a93c566bcf5fd05b0e511edd3d523a290e0a9fe465b4c97df0/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6c6963656e73652d4d49542d696e666f726d6174696f6e616c" alt="Описание"></li>
</ul>
<h3>Изменено</h3>
<ul class="updedt">
<li>Изменение 1 <strong>снова жиный</strong> <em>снова курсив</em></li>
<li>Изменение 2</li>
</ul>
<h3>Исправлено</h3>
<ul class="upderr">
<li>Исправление ошибки</li>
</ul>
<h3>Безопасность</h3>
<ul class="updsec">
<li>Устранена критическая уязвимость</li>
</ul>
<h3>Устарело</h3>
<ul class="upddep">
<li>Модуль "УдалитьОсновныеФункции" более не используется</li>
</ul>
<h3>Удалено</h3>
<ul class="upddel">
<li>Справочник "УдалитьКонтактныеДанные" удален</li>
</ul>
<p></p>
```

### Полный HTML формат с параметром -format htmlfull

Выполняем команду changelog c `-format htmlfull` это создает **ПОЛНЫЙ** файл HTML со всеми стилями. Т.е. шапка и подвал страницы будут добавлены в итоговый файл:

```cmd
oscript src\actions.os changelog -file tests\fixtures\changelog.md -outfile tests\fixtures\changelog.html -format htmlfull
```

Получаем:

```html
<!DOCTYPE html>
<html lang="ru">
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="theme-color" content="#EBF0F3" />
<title>1.0.0.0</title>
<style type="text/css">    
    ul.updsec, ul.upddep, ul.upddel, ul.updedt, ul.upderr, ul.updnew, ul.updnws {
        list-style: none;
        margin-left: 0;
        padding-left: 0;
        text-indent: -.3em;
        margin: 0 0 1rem 0;
    }
    
    ul.updsec li, ul.upddep li, ul.upddel li, ul.updnew li, ul.updedt li, ul.upderr li, ul.updnws li {
        position: relative;
        padding: 2px 0 0 30px;
        margin: 0 5px 5px 0;
    }

    ul.updsec li::before, ul.upddep li::before, ul.upddel li::before, ul.updnew li::before, ul.updedt li::before, ul.upderr li::before, ul.updnws li::before {
        content: "";
        position: absolute;
        top: 0.2em;
        left: 0;
        width: 16px;
        height: 16px;
    }

    .updsec li::before {
        background: url("data:image/svg+xml,%3C%3Fxml version='1.0' encoding='UTF-8'%3F%3E%3Csvg id='_Слой_1' data-name='Слой 1' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3E%3Cdefs%3E%3Cstyle%3E .cls-1 %7B fill: %23fff; %7D .cls-2 %7B fill: none; stroke: %23fff; stroke-miterlimit: 10; stroke-width: 1.81px; %7D .cls-3 %7B fill: %2308a652; %7D %3C/style%3E%3C/defs%3E%3Ccircle class='cls-3' cx='8' cy='8' r='8'/%3E%3Cg%3E%3Crect class='cls-1' x='3.48' y='6.38' width='9.03' height='6.62' rx='.87' ry='.87'/%3E%3Cpath class='cls-2' d='m7.98,3h0c1.32,0,2.39,1.07,2.39,2.39v3.32h-4.77v-3.32c0-1.32,1.07-2.39,2.39-2.39Z'/%3E%3Crect class='cls-3' x='7.37' y='7.84' width='1.26' height='3.16' rx='.63' ry='.63'/%3E%3C/g%3E%3C/svg%3E") no-repeat;
    }

    .upddep li::before {
        background: url("data:image/svg+xml,%3C%3Fxml version='1.0' encoding='UTF-8'%3F%3E%3Csvg id='_Слой_1' data-name='Слой 1' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3E%3Cdefs%3E%3Cstyle%3E .cls-1 %7B fill: %23fff; %7D .cls-2 %7B fill: %23c00; %7D %3C/style%3E%3C/defs%3E%3Ccircle class='cls-2' cx='8' cy='8' r='8'/%3E%3Ccircle class='cls-1' cx='8' cy='8' r='6.46'/%3E%3Cpath class='cls-2' d='m12.34,7.28c-.34-2.09-2.15-3.69-4.34-3.69s-4,1.6-4.34,3.69H.92v1.44h14.15v-1.44h-2.73Z'/%3E%3C/svg%3E") no-repeat;
    }

    .upddel li::before {
        background: url("data:image/svg+xml,%3C%3Fxml version='1.0' encoding='UTF-8'%3F%3E%3Csvg id='_Слой_1' data-name='Слой 1' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3E%3Cdefs%3E%3Cstyle%3E .cls-1 %7B fill: %23fff; %7D .cls-2 %7B fill: none; stroke: %23fff; stroke-miterlimit: 10; stroke-width: 1.8px; %7D .cls-3 %7B fill: %2308a652; %7D %3C/style%3E%3C/defs%3E%3Ccircle class='cls-3' cx='8' cy='8' r='8'/%3E%3Ccircle class='cls-2' cx='8' cy='8' r='5.5'/%3E%3Crect class='cls-1' x='2.59' y='6.99' width='10.83' height='2.03' transform='translate(-3.31 8) rotate(-45)'/%3E%3C/svg%3E") no-repeat;
    }

    .updnew li::before {
        background: url("data:image/svg+xml,%3C%3Fxml version='1.0' encoding='UTF-8'%3F%3E%3Csvg id='_Слой_1' data-name='Слой 1' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3E%3Cdefs%3E%3Cstyle%3E .cls-1 %7B fill: %23fff; %7D .cls-2 %7B fill: %2308a652; %7D %3C/style%3E%3C/defs%3E%3Ccircle class='cls-2' cx='8' cy='8' r='8'/%3E%3Ccircle class='cls-1' cx='8' cy='8' r='3.79'/%3E%3C/svg%3E") no-repeat;
    }
    
    .updedt li::before {
        background: url("data:image/svg+xml,%3C%3Fxml version='1.0' encoding='UTF-8'%3F%3E%3Csvg id='_Слой_1' data-name='Слой 1' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3E%3Cdefs%3E%3Cstyle%3E .cls-1 %7B fill: %23fff; %7D .cls-2 %7B fill: %2308a652; %7D %3C/style%3E%3C/defs%3E%3Ccircle class='cls-2' cx='8' cy='8' r='8'/%3E%3Ccircle class='cls-1' cx='8' cy='8' r='6.46'/%3E%3Ccircle class='cls-2' cx='8' cy='8' r='3.59'/%3E%3C/svg%3E") no-repeat;
    }
    
    .upderr li::before {
        background: url("data:image/svg+xml,%3C%3Fxml version='1.0' encoding='UTF-8'%3F%3E%3Csvg id='_Слой_1' data-name='Слой 1' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3E%3Cdefs%3E%3Cstyle%3E .cls-1 %7B fill: %23fff; %7D .cls-2 %7B fill: %23c00; %7D %3C/style%3E%3C/defs%3E%3Ccircle class='cls-2' cx='8' cy='8' r='8'/%3E%3Ccircle class='cls-1' cx='8' cy='8' r='3.79'/%3E%3C/svg%3E") no-repeat;
    }
    
    .updnws li::before {
        background: url("data:image/svg+xml,%3C%3Fxml version='1.0' encoding='UTF-8'%3F%3E%3Csvg id='_Слой_1' data-name='Слой 1' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3E%3Cdefs%3E%3Cstyle%3E .cls-1 %7B fill: %23fff; %7D .cls-2 %7B fill: %2308a652; %7D %3C/style%3E%3C/defs%3E%3Ccircle class='cls-2' cx='8' cy='8' r='8'/%3E%3Cg%3E%3Crect class='cls-1' x='7.28' y='3.85' width='1.57' height='5.7' rx='.78' ry='.78'/%3E%3Ccircle class='cls-1' cx='8.06' cy='11.42' r='.78'/%3E%3C/g%3E%3C/svg%3E") no-repeat;
    }
</style>
<BODY>
<h3>Внимание!</h3>
<ul class="updnws">
<li>Важная заметка 1 <strong>жирный</strong> <em>курсив</em></li>
<li>Важная заметка 2 <del>Зачеркнутый</del></li>
</ul>
<h3>Добавлено</h3>
<ul class="updnew">
<li>Добавлено дело 1 <strong><em>жирный курсив</strong></em></li>
<li>Добавлено дело 2 <code>выделенный</code></li>
<li>Картинка <img src="https://camo.githubusercontent.com/b0ae38dceb7087a93c566bcf5fd05b0e511edd3d523a290e0a9fe465b4c97df0/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6c6963656e73652d4d49542d696e666f726d6174696f6e616c" alt="Описание"></li>
</ul>
<h3>Изменено</h3>
<ul class="updedt">
<li>Изменение 1 <strong>снова жиный</strong> <em>снова курсив</em></li>
<li>Изменение 2</li>
</ul>
<h3>Исправлено</h3>
<ul class="upderr">
<li>Исправление ошибки</li>
</ul>
<h3>Безопасность</h3>
<ul class="updsec">
<li>Устранена критическая уязвимость</li>
</ul>
<h3>Устарело</h3>
<ul class="upddep">
<li>Модуль "УдалитьОсновныеФункции" более не используется</li>
</ul>
<h3>Удалено</h3>
<ul class="upddel">
<li>Справочник "УдалитьКонтактныеДанные" удален</li>
</ul>
<p></p>

</BODY>
</HTML>
```

Этот файл можно открыть и он будет отображать красивые значки.

### Текстовый формат -format txt

Выполняем команду changelog для получения текстового :

```cmd
oscript src\actions.os changelog -file tests\fixtures\changelog.md -outfile tests\fixtures\changelog.txt -format txt
```

Получаем текстовое описание файла changelog.md описанного выше:

```
[!] Важная заметка 1 [b]жирный[/b] [i]курсив[/i]
[!] Важная заметка 2 [s]Зачеркнутый[/s]
[+] Добавлено дело 1 [b][i]жирный курсив[/b][/i]
[+] Добавлено дело 2 [code]выделенный[/code]
[+] Картинка [img]https://camo.githubusercontent.com/b0ae38dceb7087a93c566bcf5fd05b0e511edd3d523a290e0a9fe465b4c97df0/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6c6963656e73652d4d49542d696e666f726d6174696f6e616c[/img]
[*] Изменение 1 [b]снова жиный[/b] [i]снова курсив[/i]
[*] Изменение 2
[-] Исправление ошибки
[S] Устранена критическая уязвимость
[D] Модуль "УдалитьОсновныеФункции" более не используется
[R] Справочник "УдалитьКонтактныеДанные" удален
```

