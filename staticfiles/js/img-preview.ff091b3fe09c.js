document.getElementById('id_imagen').addEventListener('change', function (e) {
    var input = e.target;
    var reader = new FileReader();
    reader.onload = function () {
        var img = document.getElementById('imgProducto');
        img.src = reader.result;
        img.style.display = 'block';

        // Actualizar la imagen actual
        document.getElementById('imgProducto').src = reader.result;
    };
    reader.readAsDataURL(input.files[0]);
});