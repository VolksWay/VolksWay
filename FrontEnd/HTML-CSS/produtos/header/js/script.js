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
<<<<<<< HEAD
        menu.style.display = "none";
        /* menu_barras.setAttribute("aria-label", "Abrir um menu");
        menu_barras.setAttribute("aria-expanded", "false"); */
=======
        menu.style.display ="none";
        /* menu_barras.setAttribute("aria-label", "Abrir um menu");
        menu_barras.setAttribute("aria-expanded","false"); */
>>>>>>> e8d4eedf6176cf36afbe65af919980f60a6e9785
        menu_barras.ariaLabel = "Abrir um menu";
        menu_barras.ariaExpanded = "false";
    }
}