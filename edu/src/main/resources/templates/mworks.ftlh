<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>WorksMobile</title>
</head>
<body>
<form action="/m" method="get" id="msearchForm">
</form>
<table class="table">
    <thead>
    <tr>
        <th scope="col">Оснастка</th>
        <th scope="col"><a class="btn btn-link" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">...</a></th>
    </tr>
    <div class="collapse" id="collapseExample">
        <div class="card card-body">
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
            <input type="hidden" name="storage" id="storage" value="">
        </div>
    </div>
    </thead>
    <tbody>
    <#list mworks as work>
    <tr>
        <th scope="row">${work.designation} ${work.names}</th>
        <th scope="row"><a href="/work/${work.id}">...</a></th>
        <td></td>
    </tr>
    </#list>
    <#if mworks?size == 0>
        <h2> Список пуст</h2>
    </#if>
    </tbody>
</table>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const storageSelect = document.getElementById('storageSelect');
        const storageInput = document.getElementById('storage');
        storageSelect.addEventListener('change', function () {
            storageInput.value = storageSelect.value;
            let form = document.getElementById('msearchForm');
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
</body>
</html>