##### Краткий HTML формат с шаблоном оформления

Выполняем команду changelog c параметром `--template` это создает документ по **ШАБЛОНУ**.

```cmd
oscript src\actions.os changelog convert --in tests\fixtures\changelog.md --out tests\fixtures\changelog.html --template Standart.html
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
<li>Картинка <img src="https://softonit.ru/favicon-32x32.png" alt="Описание"></li>
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

##### Текстовый шаблон -format txt

Выполняем команду changelog для получения текстового :

```cmd
oscript src\actions.os changelog --in tests\fixtures\changelog.md -out tests\fixtures\changelog.txt -template SimpleText.txt
```

Получаем текстовое описание файла changelog.md описанного выше:

```
1.0.0.1
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
1.0.0.0
[*] И простой текст
```