let bluer = document.getElementById("bluer_input");
let bluer_barras = document.getElementById("bluer_barras");

function mostrarBluer (){
    if(window.getComputedStyle(bluer).display == "none"){
        bluer.style.display = "initial"
        bluer_barras.setAttribute("aria-label","fechar bluer")
        bluer_barras.setAttribute("aria-expande","true")
    }else{
        bluer.style.display = "none"
        bluer_barras.setAttribute("aria-label","abrir bluer")
        bluer_barras.setAttribute("aria-expande","false")
    }
}