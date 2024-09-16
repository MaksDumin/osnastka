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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css"/>
    <title>Подробнее</title>
    <meta charset="UTF-8">

</head>
<body>
<input type="hidden" name = "succesName" id="succesName" value="${works.designation}">
<h4>Подробнее</h4>
<#if images??>
    <#list images as img>
        <a href="#" data-bs-toggle = "modal" data-bs-target = "#imageModal${img.id}">
            <img src="/images/${img.id}" height="200px"/><br><br>
        </a>
        <div class="modal fade" id="imageModal${img.id}" tabindex="-1" aria-labelledby="imageModalLabel${img.id}" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="imageModalLabel${img.id}">Изображение</h5>
                        <button type="button" class="btn-close" data-bs-dismiss = "modal" aria-label="Закрыть"></button>
                    </div>
                    <div class="moda-body">
                        <img src="/images/${img.id}" class="img-fluid" alt="Изображение">
                    </div>
                </div>
            </div>
        </div>
    </#list>
<#else>
    <p>Изображения отсутствуют</p>
</#if>
<b>Наименование оснастки: </b>${works.designation}<br>
<b>Типа оснастки: </b> <span id="type"></span><br>
<b>Вид оснастки: </b><span id="vid"></span><br>
<b>Исполнение: </b><span id="isp"></span><br>
<b>Примечание: </b>${works.notes}<br>
<b>Адрес: </b>${works.address}<br>
<b>Количество: </b>${works.qty}<br>
<b>Склад: </b>${works.storage}<br>
<b>Склад хранения: </b>${works.parentStorage}<br>
<#--Изменение количества-->
<div class="modal fade" id="exampleQty" tabindex="-1" aria-labelledby="exampleQtyLable" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleQtyLabel">Изменение количества</h5>
                <button type="button" class="btn-close" data-bs-dismiss = "modal" aria-label="Закрыть"></button>
            </div>
            <div class="modal-body">
                <form action="/work/update-qty/${works.id}" method="post">
                    <div class="mb-3">
                        <input type="number" class="form-control" id="qty" name="qty" placeholder = "Укажите новое количество" value="${works.qty} required">
                    </div>
                    <button type="submit" class="btn btn-primary">Обновить количество</button>
                </form>
            </div>
        </div>
    </div>
</div>
<#--Изменение адреса хранения-->
<div class="modal fade" id="exampleStorage" tabindex="-1" aria-labelledby="exampleStorageLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Перемещение оснастки</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
            </div>
            <div class="modal-body">
                <form action="/work/update/${works.id}" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <select type="text" class="form-select" placeholder="Укажите новый склад" name="storage" id="newStorage" data-bs-toggle = "popover" data-bs-trigger = "manual"
                                data-bs-placeholder="top" title="Текущий склад хранения" data-bs-content="${works.storage}">
                            <option value="Цех 1">Цех 1</option>
                            <option value="Цех 3">Цех 3</option>
                            <option value="Цех 4">Цех 4</option>
                            <option value="Цех 5">Цех 5</option>
                            <option value="Цех 6">Цех 6</option>
                            <option value="Цех 7">Цех 7</option>
                            <option value="Цех 8">Цех 8</option>
                            <option value="УПИО">УПИО</option>
                        </select>
                        <br>
                        <br>
                        <input type="text" id="address" class="form-control" name="address" placeholder="Укажите новый адрес">
                    </div>
                    <br><br>
                    <div class="form-group">
                        <input type="number" id="quantityToMove" name="quantityToMove" min="1" max="${works.qty}" class="form-control" placeholder="Введите кол-во к перемещению" required>
                    </div>
                    <br>
                    <input type="file" name="file1" class="form-control">
                    <#if errorMessage??>
                        <div class="alert alert-danger" role="alert">
                            ${errorMessage}
                        </div>
                    </#if>
                    <br>
                    <button type="submit" class="btn btn-success">Сохранить</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                </form>
            </div>
        </div>
    </div>
</div>
<#--Удаление запаса-->
<div class="modal fade" id="exampleDelete" tabindex="-1" aria-labelledby="exampleDeleteLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">УДАЛИТЬ ЗАПИСЬ?</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
            </div>
            <div class="modal-body">
                <form action="/work/delete/${works.id}" method="post">
                    <div class="form-group">
                        <input type="number" id = "qtyToDelete" class="form-control" placeholder="Введите кол-во к списанию" name="quantityToDelete" min="1" max="${works.qty}" required>
                        <br>
                    </div>
                    <#if errorMessage??>
                        <div class="alert alert-danger" role="alert">
                            ${errorMessage}
                        </div>
                    </#if>
                    <input type="submit" class="btn btn-danger" value="Удалить">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                </form> </div>
        </div>
    </div>
</div>
<#--Валидация удаления-->
<div class = "modal fade" id="valid" tabindex="-1" aria-labelledby="exampleValidLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleValidLable">Введите токен администратора</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
            </div>
            <div class="modal-body">
                <input type="text" class="form-control" id="validInput" placeholder="Укажите токен">
                <br>
                <input type="submit" class="btn btn-danger" value="Ввод" id="goValidButton">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
            </div>
        </div>
    </div>
</div>
<#--Валидация количества-->
<div class = "modal fade" id="validQty" tabindex="-1" aria-labelledby="exampleValidQtyLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleValidQtyLable">Введите токен администратора</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
            </div>
            <div class="modal-body">
                <input type="text" class="form-control" id="validInputQty" placeholder="Укажите токен">
                <br>
                <input type="submit" class="btn btn-danger" value="Ввод" id="goValidQtyButton">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
            </div>
        </div>
    </div>
</div>
<hr>
<div class="container" style="max-width: 100%">
    <div class="row" style="max-width: 100%">
        <div class="col-sm-2" style="max-width: 100%">
            <button type="submit" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#valid">Удалить</button>
        </div>
        <br>
        <br>
        <div class="col-sm-2">
            <button type="submit" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#exampleStorage">Переместить</button>
        </div>
        <br>
        <br>
        <div class="col-sm-2">
            <button type="submit" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#validQty">Изменить количество</button>
        </div>
        <#--            <div class="col-sm-2">-->
        <#--                <button type="submit" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#replaceImageModal">Изменить изображение</button>-->
        <#--            </div>-->
    </div>
</div>
<br>
<script>
    const a = document.getElementById('succesName').value;
    const textType = document.getElementById('type');
    const textVid = document.getElementById('vid');
    const textIspol = document.getElementById('isp');
    var modalElement = document.getElementById('exampleStorage');
    var storageImput = document.getElementById('newStorage');
    switch (true) {
        case a.includes('З.'):
            textType.textContent = 'Заглушка';
            break;
        case a.includes('К.'):
            textType.textContent = 'Кондуктор';
            break;
        case a.includes('М.'):
            textType.textContent = 'Мебель';
            break;
        case a.includes('П.'):
            textType.textContent = 'Приспособления';
            break;
        case a.includes('С.'):
            textType.textContent = 'Стенд';
            break;
        case a.includes('Ш.'):
            textType.textContent = 'Шаблон';
            break;
        default:
            textType.textContent = '';
    }
    switch (true) {
        case a.includes('ВН-'):
            textVid.textContent = 'Вспомогательного назначения';
            break;
        case a.includes('ГИ-'):
            textVid.textContent = 'Гидроиспытательные работы';
            break;
        case a.includes('КР-'):
            textVid.textContent = 'Крепёжные работы';
            break;
        case a.includes('ЛГ-'):
            textVid.textContent = 'Листогибочные работы';
            break;
        case a.includes('МК-'):
            textVid.textContent = 'Маркировочные работы';
            break;
        case a.includes('ОП-'):
            textVid.textContent = 'Опорно-поддерживающая оснастка';
            break;
        case a.includes('ПИ-'):
            textVid.textContent = 'Пневмоиспытательные работы';
            break;
        case a.includes('ПО-'):
            textVid.textContent = 'Подготовительные работы';
            break;
        case a.includes('ПР-'):
            textVid.textContent = 'Прочего назначения';
            break;
        case a.includes('ПШ-'):
            textVid.textContent = 'Прессово-штамповые работы';
            break;
        case a.includes('СБ-'):
            textVid.textContent = 'Сборочные работы';
            break;
        case a.includes('СВ-'):
            textVid.textContent = 'Сварочные работы';
            break;
        case a.includes('СЛ-'):
            textVid.textContent = 'Слесарные работы';
            break;
        case a.includes('СР-'):
            textVid.textContent = 'Сверлильные работы';
            break;
        case a.includes('СТ-'):
            textVid.textContent = 'Строгальные работы';
            break;
        case a.includes('ТГ-'):
            textVid.textContent = 'Трубогибочные работы';
            break;
        case a.includes('ТК-'):
            textVid.textContent = 'Токарные работы';
            break;
        case a.includes('ТО-'):
            textVid.textContent = 'Термическая обработка';
            break;
        case a.includes('ТП-'):
            textVid.textContent = 'Транспортировочные работы';
            break;
        case a.includes('ТР-'):
            textVid.textContent = 'Термическая обработка';
            break;
        case a.includes('УП-'):
            textVid.textContent = 'Упаковочные работы';
            break;
        case a.includes('ФЗ-'):
            textVid.textContent = 'Фрезерные работы';
            break;
        case a.includes('АК-'):
            textVid.textContent = 'Антикоррозионные работы';
            break;
        default:
            textVid.textContent = '';
    }
    switch (true) {
        case a.includes('A'):
            textIspol.textContent = 'A- Без уплотнения'
            break;
        case a.includes('B'):
            textIspol.textContent = 'B - Плоское'
            break;
        case a.includes('C'):
            textIspol.textContent = 'C - Шип выступ'
            break;
        case a.includes('D'):
            textIspol.textContent = 'D - Шип впадина'
            break;
        case a.includes('E'):
            textIspol.textContent = 'E - Выступ'
            break;
        case a.includes('F'):
            textIspol.textContent = 'F - Впадина'
            break;
        case a.includes('J'):
            textIspol.textContent = 'J - Овальная прокладка'
            break;
        default:
            textIspol.textContent = '';
    }
    $(document).ready(function () {
        $('#validInput').popover({
            trigger: 'manual',
            title: 'Неверный токен',
            content: 'Обратитесь к системному администратору',
            placement: 'top',
            container: 'body'
        });
        $('#goValidButton').on('click', function (){
            const validToken = '681272';
            const inputToken = $('#validInput').val();
            if (inputToken === validToken) {
                $('#valid').modal('hide');
                $('#exampleDelete').modal('show');
            } else {
                $('#validInput').addClass('is-invalid');
                $('#validInput').popover('show');
            }
        });
        $('#validInput').on('focus', function (){
            $(this).removeClass('is-invalid');
            $(this).popover('hide');
            $(this).val('');
        });
    });
    $(document).ready(function () {
        $('#validInputQty').popover({
            trigger: 'manual',
            title: 'Неверный токен',
            content: 'Обратитесь к системному администратору',
            placement: 'top',
            container: 'body'
        });
        $('#goValidQtyButton').on('click', function (){
            const validToken = '681272';
            const inputToken = $('#validInputQty').val();
            if (inputToken === validToken) {
                $('#validQty').modal('hide');
                $('#exampleQty').modal('show');
            } else {
                $('#validInputQty').addClass('is-invalid');
                $('#validInputQty').popover('show');
            }
        });
        $('#validInputQty').on('focus', function (){
            $(this).removeClass('is-invalid');
            $(this).popover('hide');
            $(this).val('');
        });
    });
    function showPopover() {
        var popover = new bootstrap.Popover(storageImput, {
            trigger: 'manual'
        });
        popover.show();
    }
    modalElement.addEventListener('shown.bs.modal', function (){
        showPopover();
    })
</script>
</body>
</html>
