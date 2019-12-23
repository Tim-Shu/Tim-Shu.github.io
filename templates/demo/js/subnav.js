$(function(){
	$('.subnav ul li').each(function(){
		if( $(this).next('.ul').find('.li').length === 0 ){
			$(this).next('.ul').remove();
		}
	})
	if( $(window).width() >= 992 ){
		$('.subnav ul').show();
		$('.subnav ul li').hover(function(){
			if( $(this).next('.ul').is(':hidden') ){
				$(this).next('.ul').slideDown();
				$(this).siblings('li').next('.ul').stop().slideUp();
			}
		})
	}else{
		$('.subnav ul').hide();
		$('.subnav .biaoti').click(function(){
			if( $('.subnav ul').is(':hidden') ){
				$('.subnav ul').slideDown();
				$(this).addClass('active');
			}else{
				$('.subnav ul').stop().slideUp();
				$(this).removeClass('active');
			}
		})
		$('.subnav ul li').each(function(){
			if( $(this).next('.ul').find('.li').length !== 0 ){
				$(this).find('a').removeAttr('href');
			}
		})
		$('.subnav ul li').click(function(){
			if( $(this).next('.ul').is(':hidden') ){
				$(this).next('.ul').slideDown();
				$(this).siblings('li').next('.ul').stop().slideUp();
			}else{
				$(this).next('.ul').stop().slideUp();
			}
		})
	}
})
		