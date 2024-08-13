<!doctype html>
<html lang="en">
<head>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Подробнее</title>
    <meta charset="UTF-8">

</head>
<body>
<h4>Подробнее</h4>
<b>Наименвоание оснастки:</b>${works.designation}<br>
<b>Примечание: </b>${works.notes}<br>
<b>Адрес: </b>${works.address}<br>
<b>Количество: </b>${works.qty}<br>
<b>Склад: </b>${works.storage}<br>
<hr>
<form action="/work/delete/${works.id}" method="post">
    <input type="submit" value="Удалить">
</form>
</body>
</html>