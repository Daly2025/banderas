
function cargarBanderas(){
    fetch("https://restcountries.com/v3.1/all")
    .then(response =>{
        $("#cargando").hide();
        return response.json()})
    .then(data => {
        let banderas = document.getElementById("banderas");
        for (let i = 0; i < data.length; i++) {
            let img = document.createElement("img");
            img.src = data[i].flags.png;
            img.className = "bandera";
            img.alt = data[i].name.common;
            img.addEventListener("mouseover", onMouseOver);
            banderas.appendChild(img);
        }
        $(".bandera").click(function(){ 
            alert("El país seleccionado es: " + $(this).attr("alt"));
        })
    })
    .catch(error => console.error(error))
};

setTimeout(cargarBanderas, 1000);
function onMouseOver(params) {
    console.log("Mouse sobre la bandera de: " + params.target.alt);
}

