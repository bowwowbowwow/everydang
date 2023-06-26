
// top버튼
$(document).on("click", ".topBtn", function(e){
    e.preventDefault();
    $('html, body').animate({
        scrollTop : 0
    }, 400);
})

// 알람버튼
$(document).on("click", ".user-alarm", function(){
    if($(this).find(".alarm-modal").hasClass("active")){
        $(this).find(".alarm-modal").removeClass("active");
        $("body").on("click",function(){
            $(".alarm-modal").removeClass("active");
        });
    }else {
        $(this).find(".alarm-modal").addClass("active");
    }
})

