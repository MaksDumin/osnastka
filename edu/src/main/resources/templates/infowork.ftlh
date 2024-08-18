<!doctype html>
<html lang="en">
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
    <title>Подробнее</title>
    <meta charset="UTF-8">
</head>
<body>
<h4>Подробнее</h4>
<#if images??>
<#list images as img>
<img src="/images/${img.id}" height="200px"/><br><br>
</#list>
<#else>
<p> No images</p>
</#if>
<b>Наименование оснастки:</b>${works.designation}<br>
<b>Примечание: </b>${works.notes}<br>
<b>Адрес: </b>${works.address}<br>
<b>Количество: </b>${works.qty}<br>
<b>Склад: </b>${works.storage}<br>

<div class="modal fade" id="exampleStorage" tabindex="-1" aria-labelledby="exampleStorageLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Заголовок модального окна</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
            </div>
            <div class="modal-body">
                <form action="/work/update/${works.id}" method="post">
                    <div class="form-group">
                        <select type="text" class="form-select" placeholder="Укажите новый склад" name="storage" id="newStorage">
                            <option value="Цех 1">Цех 1</option>
                            <option value="Цех 3">Цех 3</option>
                            <option value="Цех 4">Цех 4</option>
                            <option value="Цех 5">Цех 5</option>
                            <option value="Цех 6">Цех 6</option>
                            <option value="Цех 7">Цех 7</option>
                            <option value="Цех 8">Цех 8</option>
                            <option value="УИО">УИО</option>
                            <option value="УТО">УТО</option>
                        </select>
                        <input type="text" class="form-control" placeholder="Укажите новый адресс" name="address" id="newAddress">
                    </div>
                    <br>
                    <button type="submit" class="btn btn-success">New Storage</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="exampleDelete" tabindex="-1" aria-labelledby="exampleDeleteLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Удалить строку?</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
            </div>
            <div class="modal-body">
                <form action="/work/delete/${works.id}" method="post">
                    <input type="submit" class="btn btn-danger" value="Удалить">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                </form> </div>
        </div>
    </div>
</div>
<hr>
<div class="container" style="max-width: 100%">
    <div class="row" style="max-width: 100%">
        <div class="col-sm-2" style="max-width: 100%">
            <button type="submit" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleDelete">Удалить</button>
        </div>
            <br>
            <div class="col-sm-4">
            <button type="submit" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#exampleStorage">Изменить склад</button>
        </div>
        <div class="col-sm-6">
        </div>
    </div>
</div>
</div>
</body>
</html>

