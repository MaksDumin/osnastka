$('select#strg').on('change', function() {
    $('input[name="storage"]').val(this.value);
});