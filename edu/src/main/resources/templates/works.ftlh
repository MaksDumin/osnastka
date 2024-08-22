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
    <script>
        function updateFullName() {
            const type = document.getElementById('type').value;
            const vid = document.getElementById('vid').value;
            const number = document.getElementById('number').value;
            const harakt = document.getElementById('harakt').value;
            const du = document.getElementById('du').value;
            const pu = document.getElementById('pu').value;
            const diam = document.getElementById('diam').value;
            const ispol = document.getElementById('ispol').value;
            var slechDu = '';
            var slechPu = '';
            var slechD = '';
            var slesh = '';
            document.getElementById('harakt').disabled = false;
            document.getElementById('du').disabled = false;
            document.getElementById('pu').disabled = false;
            document.getElementById('diam').disabled = false;
            document.getElementById('ispol').disabled = false;

            if (document.getElementById('type').value == "П." && document.getElementById('vid').value == "ГИ-") {
                document.getElementById('harakt').disabled = true;
                document.getElementById('du').disabled = true;
                document.getElementById('ispol').disabled = true;
                document.getElementById('harakt').value = '';
                document.getElementById('du').value = '';
                document.getElementById('ispol').value = '';
                slechPu = '-';
                slesh = '-';
                slechD = '-';
                var fullName = '';
                fullName = type + vid + number + slechD + diam + slesh + pu;
                document.getElementById('succesName').value = fullName;
            } else if (document.getElementById('type').value == "З." && document.getElementById('vid').value == "ГИ-") {
                document.getElementById('harakt').disabled = true;
                document.getElementById('diam').disabled = true;
                document.getElementById('harakt').value = '';
                document.getElementById('diam').value = '';
                slechDu = '-Ду';
                slechPu = '-';
                slesh = '-';
                var fullName = '';
                fullName = type + vid + number + (harakt.disabled ? '' :  harakt) + slechDu + du + slechPu + pu + (diam.disabled ? '' : (slechD + diam)) + slesh + ispol;
                document.getElementById('succesName').value = fullName;
            } else {
                document.getElementById('du').disabled = true;
                document.getElementById('pu').disabled = true;
                document.getElementById('diam').disabled = true;
                document.getElementById('ispol').disabled = true;
                slechDu = '';
                slechPu = '';
                slechD ='';
                slesh = '-';
                fullName = type + vid + number + slesh + harakt;
                document.getElementById('succesName').value = fullName;
            }

            console.log (fullName);
            document.getElementById('fullName').value = fullName;
        }
        document.addEventListener('DOMContentLoaded', function() {
            const inputs = ['type', 'vid', 'number','harakt','du','pu','diam','ispol'];
            inputs.forEach(id => {
                document.getElementById(id).addEventListener('input', updateFullName);
            });
            updateFullName();
        });
    </script>
</head>
<body>
<h3 style="margin-left: 1vh">Доступная оснастка</h3>

<form action="/" method="get" id = "searchForm">
    <label for="search" class="form-label" style="margin-left: 1vh">Поиск оснастки</label>
    <div class="container" style="max-width: 100%">
        <div class="row" style="max-width: 100%">
            <div class="col-sm-3" style="max-width: 100%">
                <input type="text" class="form-control" id="search" style="max-width: 100%" placeholder="Введите наименование оснастки" name="designation"> <br>
            </div>
            <div class="col-sm-1">
                <input type="submit" class="btn btn-primary" value="Поиск"/>
            </div>
            <div class="col-sm-8">
                <input type="submit" class="btn btn-primary" value="Очистить поиск" onclick="resetDesignation()">
            </div>
            <input type="hidden" name = "storage" id="storage" value="">
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
                <form action="/work/create" method="post" enctype="multipart/form-data" class="was-validated">
                        <div class="mb-3">
                            <select class="form-select is-invalid" aria-label="Выбор типа оснастки" id="type" required aria-label="select example">
                                <option value="">Выбор типа оснастки:</option>
                                <option value="З.">Заглушка</option>
                                <option value="К.">Кондуктор</option>
                                <option value="М.">Мебель</option>
                                <option value="П.">Приспособления</option>
                                <option value="С.">Стенд</option>
                                <option value="Ш.">Шаблон</option>
                            </select>
                        </div>
                        <br>
                        <div class="mb-2">
                            <select class="form-select is-invalid" aria-label="Назначение (вид) оснастки" id="vid" required aria-label="select example">
                                <option value="">Назначение (вид) оснастки:</option>
                                <option value="АК-">Антикоррозионные работы</option>
                                <option value="ВН-">Вспомогательного назначения</option>
                                <option value="ГИ-">Гидроиспытательные работы</option>
                                <option value="КР-">Крепёжные работы</option>
                                <option value="ЛГ-">Листогибочные работы</option>
                                <option value="МК-">Маркировочные работы</option>
                                <option value="ОП-">Опорно-поддерживающая оснастка</option>
                                <option value="ПИ-">Пневмоиспытательные работы</option>
                                <option value="ПО-">Подготовительные работы</option>
                                <option value="ПР-">Прочего назначения</option>
                                <option value="ПШ-">Прессово-штамповые работы</option>
                                <option value="СБ-">Сборочные работы</option>
                                <option value="СВ-">Сварочные работы</option>
                                <option value="СЛ-">Слесарные работы</option>
                                <option value="СР-">Сверлильные работы</option>
                                <option value="СТ-">Строгальные работы</option>
                                <option value="ТГ-">Трубогибочные работы</option>
                                <option value="ТК-">Токарные работы</option>
                                <option value="ТО-">Термическая обработка</option>
                                <option value="ТП-">Транспортировочные работы</option>
                                <option value="ТР-">Термическая обработка</option>
                                <option value="УП-">Упаковочные работы</option>
                                <option value="ФЗ-">Фрезерные работы</option>
                            </select>
                        </div>
                        <br>
                        <div class="mb-2">
                            <textarea class="form-control is-invalid" id="number" placeholder="Порядковый номер" required></textarea>
                        </div>
                    <br>
                    <input type="text" aria-label="Диаметр" class="form-control is-invalid" placeholder="Характеристики" id="harakt" required>
                    <br>
                    <div class="input-group">
                        <input type="text" aria-label="Ду" class="form-control is-invalid" placeholder="Ду" id="du" required>
                        <input type="text" aria-label="Pу" class="form-control is-invalid" placeholder="Pу" id="pu" required>
                        <input type="text" aria-label="Диаметр" class="form-control is-invalid" placeholder="Диаметр" id="diam" required>
                        <input type="text" aria-label="Исполнение" class="form-control is-invalid" placeholder="Исполнение" id="ispol"required >
                    </div>
                    <br>
                    <textarea class="form-control is-invalid" placeholder="Полное наиименование" id="fullName" required></textarea>
            </div>
                    <input type="text" id="succesName" class="form-control" placeholder="Введите шифр и наименование" name="designation" style="visibility: hidden"/>

                    <input type="text" class="form-control" placeholder="Укажите для чего применяется"
                                       name="notes"/>
            <br>
            <div class="input-group was-validated" >
                    <input type="text" class="form-control is-invalid"  placeholder="Укажите кол-во" name="qty" required/><br>
                    <select type="text" class="form-select is-invalid" name="storage" required>
                        <option value="">Укажите склад</option>
                        <option value="Цех 1">Цех 1</option>
                        <option value="Цех 3">Цех 3</option>
                        <option value="Цех 4">Цех 4</option>
                        <option value="Цех 5">Цех 5</option>
                        <option value="Цех 6">Цех 6</option>
                        <option value="Цех 7">Цех 7</option>
                        <option value="Цех 8">Цех 8</option>
                        <option value="УИО">УПИО</option>
                    </select><br>
                </div>
            <br>
            <div class="input-group">
                    <input type="text" class="form-control" placeholder="Укажите адрес хранения" name="address"/><br>
            </div>
            <br>
            <input type="file" name="file1" class="form-control"> <br>
            <br>
                    <input type="submit" class="btn btn-success" value="Добавить оснастку">
            <br>
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Закрыть</button>
            <hr>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function getParametrByName(name) {
        let url = new URL(window.location.href);
        return url.searchParams.get(name);
    }
    let storageValue = getParametrByName('storage');
    if (storageValue) {
        document.getElementById('storage').value = storageValue;
    }
    function resetDesignation() {
        document.getElementById('search').value = '';
        let form = document.getElementById('searchForm');
        let url = new URL(form.action);
        url.searchParams.set('storage', storageValue);
        window.location.href = url.toString();
    }
</script>
</body>
</html>