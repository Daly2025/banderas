function cargarBanderas(){
    fetch("https://restcountries.com/v3.1/all")
    .then(response => {
        $("#cargando").hide();
        return response.json();
    })
    .then(data => {
        let banderas = document.getElementById("banderas");
        for (let i = 0; i < data.length; i++) {
            let img = document.createElement("img");
            img.src = data[i].flags.png;
            img.className = "bandera";
            img.alt = data[i].name.common;
            banderas.appendChild(img);
        }

        // Asignamos el evento de clic a las banderas una vez que están agregadas al DOM
        $(".bandera").click(function(){
            alert($(this).attr("alt"));
        });
    })
    .catch(error => console.error(error));
}

// Llamamos a la función para cargar las banderas después de 2 segundos
setTimeout(cargarBanderas, 2000);

