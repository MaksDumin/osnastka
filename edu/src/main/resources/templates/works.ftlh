<!doctype html>
<html lang="en">
<head>

    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>works</title>
    <meta charset="UTF-8">
</head>
<body>
<h1>Доступная оснастка</h1>
<form action="/work" method="get">
    Поиск оснастки: <input type="text" name="title"> <br>
    <input type = "submit" value="Поиск"/>
    <br><br>
</form>
<div>
    <table class="table">
        <thead class="table-success">
            <tr>
                <th scope="col">Наименование оснастки</th>
                <th scope="col">Примечание</th>
                <th scope="col">Адрес</th>
                <th scope="col">Кол-во</th>
                <th scope="col">Склад</th>
                <th scope="col">Детально</th>
            </tr>
        </thead>
        <#list works as work>
            <tbody class="table-light">
        <tr>
            <th scope="row">${work.designation}</th>
            <th scope="row">${work.notes}</th>
            <th scope="row">${work.address}</th>
            <th scope="row">${work.qty}</th>
            <th scope="row">${work.storage}</th>
            <th scope="row"><a href="/work/${work.id}">Подробнее...</a> </th>
        </tr>
            </tbody>
<#else>
    <h3>Оснастки нет</h3>
</#list>
    </table>
</div>
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