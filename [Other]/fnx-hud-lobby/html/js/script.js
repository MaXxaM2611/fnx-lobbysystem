window.addEventListener('message', function(event) {
    switch(event.data.action) {
        case "hud_active":
            document.getElementById("hud_text").innerHTML = event.data.text;
            document.getElementById("hud_container").classList.remove("fadeOut");
            document.getElementById("hud_container").classList.add("fadeIn");
            break;
        case "kd_active":
            document.getElementById("kd_text").innerHTML = event.data.text;
            document.getElementById("kd_container").classList.remove("fadeOut");
            document.getElementById("kd_container").classList.add("fadeIn");
            break;
        case "kdred_active":
            document.getElementById("kdred_text").innerHTML = event.data.text;
            document.getElementById("kdred_container").classList.remove("fadeOut");
            document.getElementById("kdred_container").classList.add("fadeIn");
            break;
        case "free_close":
            document.getElementById("kd_container").classList.remove("fadeIn");
            break;
        case "kd_clode":
            document.getElementById("kdred_container").classList.remove("fadeIn");
            break;
        case "hud_clode":
            document.getElementById("hud_container").classList.remove("fadeIn");
            break;  
    }
})



