fetch("https://restcountries.com/v3.1/all")
.then(response => response.json())
.then(data => {
    let banderas = document.getElementById("banderas");
for (let i = 0; i < data.length; i++) {
    let img = document.createElement("img");
    img.src = data[i].flags.png;
    img.alt = data[i].name.common;
    banderas.appendChild(img);
}
})
.catch(error => console.error(error));