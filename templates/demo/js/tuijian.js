$(function(){

    //推荐阅读
    var p7swiper = new Swiper('.picture-7 .swiper-container', {
        speed:800,
        spaceBetween : 20,
        loop:true,
        autoplay : {
        delay:5000
        },
        disableOnInteraction: false,
        pagination: {
            el: '.picture-7 .swiper-pagination',
            clickable :true,
        }
    })

})