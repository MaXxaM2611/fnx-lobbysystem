$(document).ready(function () {
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('https://fnx-menu/close', JSON.stringify({}));
            $(".container").fadeOut(500)
            setTimeout(() => {
                // $(buttons).empty()
                $("button").remove()
            }, 500);
            $("#title").html('')
        }
    }

    window.addEventListener('message', function (event) {
        var item = event.data;
        if(item.addbutton == true) {
            var title = item.title
            var description = item.description
            var server = item.server
            $(".container").fadeIn(500)
            var buttons = []
            var b = (`<button data-server="`+server+`" data-trigger="`+item.trigger+`" data-parm="`+item.par+`" class = "btn"><div class="title">`+title+`</div><div class="description" >`+description+`</div></button>`)
            buttons.push(b)
            $(".container").append(b).fadeIn(400)
        } else if(item.SetTitle == true) {
            $("#title").html(item.title)
        }
    });
    $("body").on("click" , ".btn" , function(){

        $.post('https://fnx-menu/clicked', JSON.stringify({trigger:$(this).attr("data-trigger"),param:$(this).attr("data-parm"),server:$(this).attr("data-server")}));
        $.post('https://fnx-menu/close', JSON.stringify({}));
        $(".container").fadeOut(500)
        setTimeout(() => {
            $("button").remove()
        }, 500);
        $("#title").html('')
    })

 
});
