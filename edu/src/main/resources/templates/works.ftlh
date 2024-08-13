<!doctype html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>

    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css"/>
    <title>works</title>
    <meta charset="UTF-8">
</head>
<body>
<h3 style="margin-left: 1vh">Доступная оснастка</h3>

<form action="/" method="get">
    <label for="search" class="form-label" style="margin-left: 1vh">Поиск оснастки</label>
    <div class="container" style="max-width: 100%">
        <div class="row" style="max-width: 100%">
            <div class="col-sm-3" style="max-width: 100%">
                <input type="text" class="form-control" id="search" style="max-width: 100%" placeholder="Введите наименование оснастки" name="designation"> <br>
            </div>
            <div class="col-sm-1">
                <input type="submit" class="btn btn-primary" value="Поиск"/>
            </div>
            <div class="col-sm-8"></div>
        </div>
    </div>
    <!-- Кнопка-триггер модального окна -->
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"
            style="margin-left: 1vh">
        Добавить новую оснастку
    </button>
    <br><br>
</form>

<table class="table">
    <thead class="table-success">
    <tr>
        <th scope="col">Наименование оснастки</th>
        <th scope="col">Примечание</th>
        <th scope="col">Кол-во</th>
        <th scope="col">Склад</th>
        <th scope="col">Адрес</th>
        <th scope="col">Детально</th>
    </tr>
    </thead>
    <#list works as work>
        <tbody class="table-light">
        <tr>
            <th scope="row">${work.designation}</th>
            <th scope="row">${work.notes}</th>
            <th scope="row">${work.qty}</th>
            <th scope="row">${work.storage}</th>
            <th scope="row">${work.address}</th>
            <th scope="row"><a href="/work/${work.id}"><i class="bi bi-arrow-up-right-square-fill fa-2xs"></i></a></th>
        </tr>
        </tbody>
    <#else>
        <h3>Оснастки нет</h3>
    </#list>
</table>
</div>
<hr>

<!-- Модальное окно -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Заголовок модального окна</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
            </div>
            <div class="modal-body">
                <form action="/work/create" method="post">
                    Наименование оснастик: <input type="text" class="form-control"
                                                  placeholder="Введите шифр и наименование" name="designation"/><br><br>
                    Примечание: <input type="text" class="form-control" placeholder="Укажите для чего применяется"
                                       name="notes"/><br><br>
                    Кол-во: <input type="text" class="form-control" placeholder="Укажите кол-во" name="qty"/><br><br>
                    Склад: <select type="text" class="form-select" placeholder="Укажите склад" name="storage">
                        <option value="Цех 1">Цех 1</option>
                        <option value="Цех 3">Цех 3</option>
                        <option value="Цех 4">Цех 4</option>
                        <option value="Цех 5">Цех 5</option>
                        <option value="Цех 6">Цех 6</option>
                        <option value="Цех 7">Цех 7</option>
                        <option value="Цех 8">Цех 8</option>
                        <option value="УИО">УИО</option>
                        <option value="УТО">УТО</option>
                    </select><br><br>
                    Адрес: <input type="text" class="form-control" placeholder="Укажите адрес хранения" name="address"/><br><br>
                    <input type="submit" class="btn btn-primary" value="Добавить оснастку">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="script.js"></script>
</body>
</html>