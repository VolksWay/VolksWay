<<<<<<< HEAD
function btnMenu() {
    let menu = document.getElementById("links");
    let menu_barras = document.getElementById("menu_barras");

    if(window.getComputedStyle(menu).display == "none"){
        //Mostra o menu
        menu.style.display = "flex";
        /* menu_barras.setAttribute("aria-label", "Fechar um menu");
        menu_barras.setAttribute("aria-expanded", "true"); */
        menu_barras.ariaLabel = "Fechar um menu";
        menu_barras.ariaExpanded = "true";
    } else {
        //Esconde o menu
        menu.style.display = "none";
        /* menu_barras.setAttribute("aria-label", "Abrir um menu");
        menu_barras.setAttribute("aria-expanded", "false"); */
        menu_barras.ariaLabel = "Abrir um menu";
        menu_barras.ariaExpanded = "false";
    }
=======
function btnMenu() {
    let menu = document.getElementById("links");
    let menu_barras = document.getElementById("menu_barras");

    if(window.getComputedStyle(menu).display == "none"){
        //Mostra o menu
        menu.style.display = "flex";
        /* menu_barras.setAttribute("aria-label", "Fechar um menu");
        menu_barras.setAttribute("aria-expanded", "true"); */
        menu_barras.ariaLabel = "Fechar um menu";
        menu_barras.ariaExpanded = "true";
    } else {
        //Esconde o menu
        menu.style.display = "none";
        /* menu_barras.setAttribute("aria-label", "Abrir um menu");
        menu_barras.setAttribute("aria-expanded", "false"); */
        menu_barras.ariaLabel = "Abrir um menu";
        menu_barras.ariaExpanded = "false";
    }
>>>>>>> 006e9a45083cdba61e4eaca6ae5f05f8ac51fac2
}