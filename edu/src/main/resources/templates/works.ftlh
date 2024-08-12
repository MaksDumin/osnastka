<!doctype html>
<html lang="en">
<head>

    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>works</title>
    <meta charset="UTF-8">
</head>
<body>
<h1>Доступная оснастка</h1>
<form action="/work" method="get">
    Поиск оснастки: <input type="text" name="title"> <br>
    <input type = "submit" value="Поиск"/>
</form>
<#list works as work>
    <div>
        <p><b>${work.designation}</b>${work.notes}${work.address}${work.qty}${work.storage} | <a href="/work/${work.id}">Подробнее...</a></p>
    </div>
<#else>
    <h3>Оснастки нет</h3>
</#list>
<hr>
<h3>Добавить новую оснастку</h3>
<form action="/work/create" method="post">
    Наименование оснастик: <input type="text" name="designation"/><br><br>
    Примечание: <input type="text" name="notes"/><br><br>
    Адрес: <input type="text" name="address"/><br><br>
    Кол-во: <input type="text" name="qty"/><br><br>
    Склад: <input type="text" name="storage"/><br><br>
    <input type="submit" value="Добавить оснастку">
</form>
</body>
</html>