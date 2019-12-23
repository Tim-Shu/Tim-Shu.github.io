// JavaScript Document

$(function(){

	//图片响应式
	$('.maximg img').css({"max-width":"100%"});

	//pc头部导航锁定
	function hrefA(){
		var href = location.href;
        $("header .menu ul li > a").each(function(index, el) {
            var $this = $(this);
            if ( href.indexOf( $this.attr("href").split(".")[0] ) >= 0 ){
                $this.parent().addClass('active');
            }
        })
        $(".menu-box ul li a").each(function(index, el) {
            var $this = $(this);

            if ( href.indexOf( $this.attr("href").split(".")[0] ) >= 0 ){
                $this.parents('li').addClass('active');
            }
        })
        if( href.indexOf("index") < 1  &&  href.indexOf("asp") < 1 &&  href.indexOf("php") < 1 &&  href.indexOf("html") < 1 ){
        	$("header .menu ul li:nth-child(1)").addClass('active');
        	$(".menu-box ul li:nth-child(1)").addClass('active');
        }
	}
	hrefA();

	//大图
    var bannerswiper = new Swiper('.banner .swiper-container', {
	    speed:800,
	    loop:true,
	    autoplay : {
		   delay:5000
		},
	    disableOnInteraction: false,
	   	pagination: {
		    el: '.banner .swiper-pagination',
		    clickable :true,
		}
	})

	if( $(window).width() <= 991 ){

		//移动端头部导航
		$('.menu-btn').click(function(event){
			if( $('.menu-box').is(':hidden') ){
				$('.menu-btn').addClass('active');
				$('.menu-box').slideDown();
			}else{
				$('.menu-btn').removeClass('active');
				$('.menu-box').stop().slideUp();
			}
		})

	}

	if( $(window).width() <= 767 ){

		//手机端底部
		$('.tabBar ul li').click(function(e){
			if( $(this).hasClass('active') ){
				$(this).removeClass('active');
			}else{
				$(this).addClass('active');
				$(this).siblings('li').removeClass('active');
			}
			e.stopPropagation()
		})
		$('.tabBar ul li .tanchuang').click(function(e){
			$(this).parent('li').addClass('active');
			e.stopPropagation()
		})

		//点击空白区域
		$(window).click(function(){
			$('.tabBar ul li').removeClass('active');
		})

	}
	
})
						