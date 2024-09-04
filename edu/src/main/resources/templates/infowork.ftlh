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

    <#--Ссылка на PDF файл-->
    <#if works.pasport??>
        <b>Паспорт: </b> <a href="/pasport/${works.pasport.id}" target="_blank">Посмотреть паспорт</a><br>
        <#else>
        Паспорт отсутствует
    </#if>
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
                            <select type="text" class="form-select" placeholder="Укажите новый склад" name="storage" id="newStorage">
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
                            <input type="number" id = "qtyToDelete" class="form-control" placeholder="введите кол-во к списанию" name="quantityToDelete" min="1" max="${works.qty}" required>
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
    <#--Изменение файлов-->
    <form action="/work/update-image/{id}" method="post" enctype="multipart/form-data">
    <div class="modal fade" id="exampleFile" tabindex="-1" aria-labelledby="exampleFileLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Изменение файлов</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
                </div>
                <div class="modal-body">
                    <label>Фотография</label>
                    <input type="file" class="form-control" name="file1">
                    <br>
                    <label>Паспорт</label>
                    <input type="file" class="form-control" name="file2">
                    <br>
                        <button type="submit" class="btn btn-success">Сохранить</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                </div>
            </div>
        </div>
    </div>
    </form>
    <#--Валидация-->
    <div class="modal fade" id="exampleValid" tabindex="-1" aria-labelledby="exampleValidLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Введите токен</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
                </div>
                <div class="modal-body">
                    <input class="form-control" id="validInput" name="validInput" placeholder="Введите токен" data-bs-toggle="popover" data-bs-trigger="manual" data-bs-placeholder="top"
                    title="Неверный токен!" data-bs-content="За токеном обратитесь к системному администратору">
                    <br>
                    <button type="submit" class="btn btn-success" id="goValid">Ввод</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                </div>
            </div>
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
            <br>
                <div class="col-sm-2">
                <button type="submit" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#exampleStorage">Переместить</button>
            </div>
            <div class="col-sm-8">
                <button type="submit" class="btn btn-warning" data-bs-toggle = "modal" data-bs-target = "#exampleValid">Изменить файлы</button>
            </div>
        </div>
    </div>
    <br>
    <script>
        const a = document.getElementById('succesName').value;
        const textType = document.getElementById('type');
        const textVid = document.getElementById('vid');
        const textIspol = document.getElementById('isp');
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
        document.addEventListener("DOMContentLoaded", function () {
            const validInput = document.getElementById("validInput");
            const goValidButton = document.getElementById("goValid");
            const exampleValidModal = new bootstrap.Modal(document.getElementById('exampleValid'));
            const exampleFileModal = new bootstrap.Modal(document.getElementById('exampleFile'));
            const popover = new bootstrap.Popover(validInput);
            goValidButton.addEventListener("click", function () {
                const token = validInput.value;
                if (token === "12345") {
                    exampleValidModal.hide();
                    exampleFileModal.show();
                } else {
                  validInput.classList.add("is-invalid");
                  popover.show();
                  setTimeout(function (){
                      popover.hide();
                  }, 3000);
                }
            });
            validInput.addEventListener("focus", function (){
                validInput.value = "";
                popover.hide();
                validInput.classList.remove("is-invalid");
            });
        });
    </script>
    </body>
    </html>
