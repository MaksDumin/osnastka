<!doctype html>
<html lang="en" xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
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
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <script type="text/javascript" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
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
                document.getElementById('harakt').classList.remove('is-invalid');
                document.getElementById('du').disabled = true;
                document.getElementById('du').classList.remove('is-invalid');
                document.getElementById('ispol').disabled = true;
                document.getElementById('ispol').classList.remove('is-invalid');
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
                document.getElementById('harakt').classList.remove('is-invalid');
                document.getElementById('diam').disabled = true;
                document.getElementById('diam').classList.remove('is-invalid');
                document.getElementById('harakt').value = '';
                document.getElementById('diam').value = '';
                slechDu = '-Ду';
                slechPu = '-';
                slesh = '-';
                var fullName = '';
                fullName = type + vid + number + (harakt.disabled ? '' : harakt) + slechDu + du + slechPu + pu + (diam.disabled ? '' : (slechD + diam)) + slesh + ispol;
                document.getElementById('succesName').value = fullName;
            } else {
                const flexChecked = document.getElementById("flex").checked;
                if (flexChecked) {
                    document.getElementById('harakt').hidden = false;
                    document.getElementById('harakt').disabled = false;
                    var fullName = type + vid + number + "-" + harakt;
                } else {
                    document.getElementById('harakt').hidden = true;
                    document.getElementById('harakt').disabled = true;
                    document.getElementById('harakt').classList.remove('is-invalid');
                    document.getElementById('harakt').value = '';
                    var fullName = type + vid + number;
                }
                document.getElementById('du').disabled = true;
                document.getElementById('pu').disabled = true;
                document.getElementById('diam').disabled = true;
                document.getElementById('ispol').disabled = true;
                document.getElementById('du').classList.remove('is-invalid');
                document.getElementById('pu').classList.remove('is-invalid');
                document.getElementById('diam').classList.remove('is-invalid');
                document.getElementById('ispol').classList.remove('is-invalid');
                slechDu = '';
                slechPu = '';
                slechD = '';
                slesh = '-';
                document.getElementById('succesName').value = fullName;
            }
            console.log(fullName);
            document.getElementById('fullName').value = fullName;
        }

        document.addEventListener('DOMContentLoaded', function () {
            const inputs = ['type', 'vid', 'number', 'harakt', 'du', 'pu', 'diam', 'ispol'];
            inputs.forEach(id => {
                document.getElementById(id).addEventListener('input', updateFullName);
            });
            document.getElementById('flex').addEventListener('input', updateFullName);
            updateFullName();
        });
    </script>
</head>
<body>
<div class="container-fluid">
    <h3 style="margin-left: 1vh">Доступная оснастка</h3>
    <form action="/" method="get" id="searchForm">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="d-flex justify-content-end">
                    <button type="button" class="btn btn-transparent" data-bs-toggle="modal"
                            data-bs-target="#exampleModal" style="margin-left: 1vh"><i class="bi bi-plus-lg"> Добавить
                            оснастку</i></button>
                </div>
            </div>
        </div>
        <label for="search" class="form-label" style="margin-left: 1vh">Поиск оснастки</label>
        <div class="container-f">
            <div class="row mb-2">
                <div class="col-auto">
                    <div class="input-group">
                        <div class="input-container">
                            <input type="text" class="form-control" id="search" placeholder="Поиск оснастки"
                                   name="designation">
                            <button type="submit" class="btn btn-link search-btn" style="margin-right: 1%"><i
                                        class="bi bi-search"></i></button>
                        </div>
                        <button type="submit" class="btn btn-link" onclick="resetDesignation()"><i
                                    class="bi bi-x-lg"></i></button>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row g-0">
                <div class="col-auto">
                    <div class="input-group">
                        <select class="form-select" id="storageSelect">
                            <option value="" disabled selected hidden>Сортировка по складу</option>
                            <option value="Цех 1">Цех 1</option>
                            <option value="Цех 3">Цех 3</option>
                            <option value="Цех 4">Цех 4</option>
                            <option value="Цех 5">Цех 5</option>
                            <option value="Цех 6">Цех 6</option>
                            <option value="Цех 7">Цех 7</option>
                            <option value="Цех 8">Цех 8</option>
                            <option value="УИО">УПИО</option>
                        </select>
                        <button type="submit" class="btn btn-link" onclick="resetStorage()"><i class="bi bi-x-lg"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <input type="hidden" name="storage" id="storage" value="">
        <br>
    </form>
    <div class="table-container">
        <table id="equipmentTable" class="table table-bordered table-hover table-sm">
            <thead class="table table-success">
            <tr>
                <th scope="col" class="sortable">Шифр оснастки</th>
                <th scope="col">Наименование</th>
                <th scope="col">Примечание</th>
                <th scope="col">Кол-во</th>
                <th scope="col" class="sortable">Склад</th>
                <th scope="col">Адрес</th>
                <th scope="col">Детально</th>
            </tr>
            </thead>
            <div class="row" id="bot">
                <#list works as work>
                    <tbody class="table-light">
                    <tr>
                        <th scope="row">${work.designation}</th>
                        <th scope="row">${work.names}</th>
                        <th scope="row">${work.notes}</th>
                        <th scope="row">${work.qty}</th>
                        <th scope="row">${work.storage}</th>
                        <th scope="row">${work.address}</th>
                        <th scope="row"><a href="/work/${work.id}"><i
                                        class="bi bi-arrow-up-right-square-fill fa-2xs"></i></a></th>
                    </tr>
                    </tbody>
                <#else>
                    <h3>Оснастки нет</h3>
                </#list>
        </table>
    </div>
</div>
</div>
</div>
<hr>
<!-- Модальное окно -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Создание новой записи</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
            </div>
            <div class="modal-body">
                <form action="/work/create" method="post" enctype="multipart/form-data" class="was-validated">
                    <div class="mb-3">
                        <select class="form-select is-invalid" aria-label="Выбор типа оснастки" id="type" required
                                aria-label="select example">
                            <option value="">Выбор типа оснастки:</option>
                            <option value="З.">Заглушка</option>
                            <option value="К.">Кондуктор</option>
                            <option value="М.">Мебель</option>
                            <option value="П.">Приспособления</option>
                            <option value="С.">Стенд</option>
                            <option value="Ш.">Шаблон</option>
                        </select>
                    </div>
                    <p/>
                    <div class="mb-2">
                        <select class="form-select is-invalid" aria-label="Назначение (вид) оснастки" id="vid" required
                                aria-label="select example">
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
                    <p/>
                    <input type="text" aria-label="Наименование" class = "form-control is-invalid" placeholder="Введите наименовние" id="names" name="names" required >
                    <p/>
                    <div class="mb-2">
                        <textarea class="form-control is-invalid" id="number" placeholder="Порядковый номер"
                                  required></textarea>
                    </div>
                    <p/>
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" id="flex">
                        <label class="form-check-label" for="flex">Наличие характеристики</label>
                    </div>
                    <p/>
                    <input type="text" aria-label="Характеристики" class="form-control" placeholder="Характеристики"
                           id="harakt">
                    <p/>
                    <div class="input-group">
                        <input type="text" aria-label="Ду" class="form-control is-invalid" placeholder="Ду" id="du"
                               required>
                        <input type="text" aria-label="Pу" class="form-control is-invalid" placeholder="Pу" id="pu"
                               required>
                        <input type="text" aria-label="Диаметр" class="form-control is-invalid" placeholder="Диаметр"
                               id="diam" required>
                        <select type="text" class="form-control is-invalid" placeholder="Исполнение" id="ispol"
                                required>
                            <option value="" Укажите исполенние></option>
                            <option value="B">B</option>
                            <option value="C">C</option>
                            <option value="D">D</option>
                            <option value="E">E</option>
                            <option value="F">F</option>
                            <option value="J">J</option>
                        </select>
                    </div>
                    <p/>
                    <textarea class="form-control is-invalid" placeholder="Полное наиименование" id="fullName"
                              required></textarea>
            </div>
            <input type="text" id="succesName" class="form-control" placeholder="Введите шифр и наименование"
                   name="designation" style="visibility: hidden" required/>

            <input type="text" class="form-control" placeholder="Укажите для чего применяется"
                   name="notes"/>
            <p/>
            <div class="input-group was-validated">
                <input type="text" class="form-control is-invalid" placeholder="Укажите кол-во" name="qty" required/>
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
                </select>
            </div>
            <br>
            <select type="text" class="form-select" name="parentStorage" required>
                <option value="">Укажите склад хранения</option>
                <option value="-">-</option>
                <option value="Цех 1">Цех 1</option>
                <option value="Цех 3">Цех 3</option>
                <option value="Цех 4">Цех 4</option>
                <option value="Цех 5">Цех 5</option>
                <option value="Цех 6">Цех 6</option>
                <option value="Цех 7">Цех 7</option>
                <option value="Цех 8">Цех 8</option>
                <option value="УИО">УПИО</option>
            </select>
            <p/>
            <div class="input-group">
                <input type="text" class="form-control" placeholder="Укажите адрес хранения" name="address"/>
            </div>
            <br>
            <input type="file" name="file1" class="form-control">
            <p/>
            <input type="file" class="form-control" id="pdfFile" name="pdfFile" accept=".pdf" placeholder="Фото/Чертёж">
            <br>
            <input type="submit" class="btn btn-success" value="Добавить оснастку">
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
        storageValue = getParametrByName('storage');
    }

    function resetDesignation() {
        document.getElementById('search').value = '';
        let form = document.getElementById('searchForm');
        let url = new URL(form.action);
        url.searchParams.set('storage', storageValue);
        window.location.href = url.toString();
    }
</script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const getCellValue = (row, index) => row.children[index].innerText || row.children[index].textContent;

        const comparer = (index, asc) => (a, b) => ((v1, v2) =>
                v1 !== '' && v2 !== '' && !isNaN(v1) && !isNaN(v2) ? v1 - v2 : v1.toString().localeCompare(v2)
        )(getCellValue(asc ? a : b, index), getCellValue(asc ? b : a, index));

        document.querySelectorAll('th.sortable').forEach(th => th.addEventListener('click', function () {
            const table = th.closest('table');
            Array.from(table.querySelectorAll('tbody > tr'))
                .sort(comparer(Array.from(th.parentNode.children).indexOf(th), this.asc = !this.asc))
                .forEach(tr => table.querySelector('tbody').appendChild(tr));
            th.classList.toggle('asc', this.asc);
            th.classList.toggle('desc', !this.asc);
        }));
    });
</script>
<style>
    th.sortable {
        cursor: pointer;
    }

    th.sortable :after {
        content: '\25B2';
        float: right;
        margin-left: 5px;
        opacity: 0.5;
    }

    th.sortable.asc:after {
        content: '\25B2';
    }

    th.sortable.desc:after {
        content: '\25BC';
    }

    .table-container {
        width: 100%;
        overflow-x: auto;
    }

    table {
        width: 100%;
        table-layout: fixed;
        word-wrap: break-word;
    }

    th, td {
        white-space: nowrap;
    }
</style>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const storageSelect = document.getElementById('storageSelect');
        const storageInput = document.getElementById('storage');
        storageSelect.addEventListener('change', function () {
            storageInput.value = storageSelect.value;
            let form = document.getElementById('searchForm');
            let url = new URL(form.action, window.location.origin);
            url.searchParams.set('storage', storageSelect.value);
            window.location.href = url.toString();
        })
    })

    function resetStorage() {
        let url = new URL(window.location.href);
        url.searchParams.delete('storage');
        document.getElementById('storage').value = '';
        window.location.href = url.toString();
    }
</script>
<style>
    .container {
        padding-left: 0;
        padding-right: 0;
        margin-left: 0;
        margin-right: 0;
    }

    #top {
        position: sticky;
        top: 0;
        z-index: 100;
        background-color: white;
        padding: 10px 0;
    }

    .table-container {
        max-height: 500px;
        overflow-y: auto;
        position: relative;
    }

    .table-container thead th {
        position: sticky;
        top: 0;
        z-index: 10;
        background-color: #d4edda;
    }

    .input-container {
        position: relative;
        display: flex;
        align-items: center;
    }

    .input-container .form-control {
        width: 100%;
        padding-right: 40px;
    }

    .input-container .search-btn {
        position: absolute;
        right: 5px;
        top: 50%;
        transform: translateY(-50%);
        border: none;
        background: transparent;
        cursor: pointer;
    }

    .btn-transparent {
        background-color: transparent;
        color: darkgreen;
    }

    .btn-transparent:hover {
        background-color: rgba(144, 238, 144, 0.2);
        color: darkslateblue;
    }
    .table-container th, .table-container td {
        word-wrap: break-word;
        word-break: break-all;
        white-space: normal;
        overflow-wrap: break-word;
        text-align: left;
        vertical-align: middle;
    }
</style>
</body>
</html>