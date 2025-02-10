function cargarBanderas() {
    // Mostrar el mensaje de carga
    $("#cargando").show();

    // Realizar la petición fetch
    fetch("https://restcountries.com/v3.1/all")
        .then(response => {
            // Ocultar el mensaje de carga cuando la respuesta se haya recibido
            $("#cargando").hide();

            // Devolver el cuerpo de la respuesta como JSON
            return response.json();
        })
        .then(data => {
            // Obtener el contenedor donde se agregarán las banderas
            let banderas = document.getElementById("banderas");

            // Recorrer todos los países y agregar sus banderas
            for (let i = 0; i < data.length; i++) {
                let img = document.createElement("img");

                // Obtener la URL de la bandera
                img.src = data[i].flags.png;

                // Agregar el nombre del país como texto alternativo
                img.alt = data[i].name.common;

                // Añadir la imagen al contenedor
                banderas.appendChild(img);
            }
        })
        .catch(error => {
            // En caso de error, mostrarlo en la consola
            console.error(error);
        });
}

// Llamar a la función para cargar las banderas después de 5 segundos
setTimeout(cargarBanderas, 1000);

