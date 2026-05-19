// BUTTON EVENT

document
.getElementById("exploreBtn")
.addEventListener("click", function(){

    alert("Welcome to PTK Brooms!");

});



// NAVBAR SHADOW ON SCROLL

window.addEventListener("scroll", function(){

    let navbar = document.querySelector("nav");

    if(window.scrollY > 50){

        navbar.style.background = "rgba(0,0,0,0.9)";

    }

    else{

        navbar.style.background = "rgba(0,0,0,0.5)";
    }

});