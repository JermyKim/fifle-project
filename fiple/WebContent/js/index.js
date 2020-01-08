$(document).ready(function(e) {
	var conwidth = $(window).width();
	var height1 = $(window).height();
	
	// 브라우저의 height를 구하여 height가 100%될 부분에 height 부여
	$('section .flexslider .slides li').css("height",height1);
	$('section .article-box').css("height",height1);
	
	// 모바일 일 때 height 부여
	if($(window).width() < 1050 ){
		$('nav > ul').css("height",height1);	
	}
	
	// 데스크탑 버전일 때 메인메뉴			
	if(conwidth >1050 ){ 
		$("nav #main-menu li").mouseover(function(){
			$(this).find(".sub-menu").stop().slideDown();	
		});
		$("nav #main-menu li").mouseleave(function(){
			$(this).find(".sub-menu").stop().slideUp();	
		});
		// 헤더와 article-box, footer에 마우스 오버를 했을 때
		$("header, .article-box, footer").mouseover(function(){
			$(".article-box .btn-box .btnBox").css("opacity",1);
		});
		// 헤더와 article-box, footer에 마우스 leave 했을 때
		$("header, .article-box, footer").mouseleave(function(){
			$(".article-box .btn-box .btnBox").css("opacity",0);
		});
	// 모바일 버전일 때 메인메뉴		
	}else if(conwidth <1050 ) { 
		$("nav #trigger").click(function(){
			$("nav #trigger").toggleClass("trigger toggle");
			$("nav #main-menu").stop().slideToggle();				
		});
		$("nav #main-menu li").click(function(){
			$(this).find(".sub-menu").stop().slideToggle();	
		});
	}
	// 데스크탑 푸터쪽 팝오버 
	$('.pop-over > li').click(function(){
		$(this).find('.pop-info').slideToggle(800);	
	});
	$('.exit').click(function(){
		$(this).find('.pop-info').slideDown(800);	
	});
	
	// Flex Slider
	$('.flexslider').flexslider({ animation:"slide" });
	


	// 페이지 전환 효과 
	var elm = "section .box";
	$(elm).each(function (index) {
    // 개별적으로 Wheel 이벤트 적용
	    $(this).on("mousewheel DOMMouseScroll", function (e) {
    	    e.preventDefault();
            var delta = 0;
            if (!event) event = window.event;
            if (event.wheelDelta) {
        		delta = event.wheelDelta / 360;
                 if (window.opera) delta = -delta;
            }else if (event.detail) delta = -event.detail / 5;
            var moveTop = $(window).scrollTop();
            var elmSelecter = $(elm).eq(index);
			
            // 마우스휠을 위에서 아래로
            if (delta < 0) {
            	if ($(elmSelecter).next() != undefined) {
                	try{
                    	moveTop = $(elmSelecter).next().offset().top;
                    }catch(e){}
             	}
            // 마우스휠을 아래에서 위로
            } else {
				if ($(elmSelecter).prev() != undefined) {
					try{
						moveTop = $(elmSelecter).prev().offset().top;
					}catch(e){}
			   }
			}
			// 화면 이동 0.8초(800)
			$("html,body").stop().animate({
				scrollTop: moveTop + 'px'
			}, {
				duration: 800, complete: function () {
				}
			});
		});		
	});
});

