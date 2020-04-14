$(document).ready(function() {


// 공통 레이아웃 include
    $(function(){
        includeLayout();
    });
    function includeLayout(){
        var includeArea = $('[data-include]');
        var self, url;
        $.each(includeArea, function() {
            self = $(this); url = self.data("include");
            self.load(url, function() {
                self.removeAttr("data-include");
            });
        });
    }


// 공통 헤더 검색어창
    //2020-02-20 수정
    /*  
    $('.search-form').focus(function(){
        //$(".gnb-search, .search-form").addClass('on');
        //$(".search-word-wrap").css('display','block');
    });
    $('footer, .search-btn, .auto-complete, .contents, .customer').click(function(){
        $(".gnb-search, .search-form").removeClass('on');
        $(".search-word-wrap").css('display','none');
        $(".auto-complete").removeClass('on');
        $(".auto-complete").css('display','none');
    });*/
    $('html').click(function(e) {
        if(!$(e.target).closest('section').hasClass("header-wrap")) { 
        	$(".gnb-search, .search-form").removeClass('on');
            $(".search-word-wrap").css('display','none');
            $(".auto-complete").removeClass('on');
            $(".auto-complete").css('display','none');
        }
    });
    // 2020-02-20 수정

    // 탭 여닫기
    $(".sch-word-menu").click(function(){
        $(".sch-word-menu, .sch-word-tab").removeClass('on');
        $(this).addClass('on');
        $(this).next().addClass('on');
        $(".delete-btn-wrap").toggleClass('off');
    });
    // 개별 삭제
    $(".sch-delete").click(function(){
        $(this).parent().parent().css('display','none');
    });
    // 전체 삭제
    $("#sch-all-delete").click(function(){
        $(this).parent().siblings(".sch-word-tab.on").removeClass('on');
    });


// 공통 팝업
    $(".popup-open").on("click", function(e){
        $("html, body").addClass("not-scroll");
        $(".popup-dim").fadeIn(150);
    });
    $(".popup-close").on("click", function(){
        $("html, body").removeClass("not-scroll");
        $(".popup-dim").fadeOut(150);
    });


// 공통 snb 메뉴 on
    $(".main .snb .snb-topmenu > li:first-child").addClass('on');
    $(".contents.popular .snb .snb-topmenu > li:nth-child(2)").addClass('on');
    $(".contents.lately .snb .snb-topmenu > li:nth-child(3)").addClass('on');
    $(".contents.dashboard .snb .snb-topmenu > li:nth-child(4)").addClass('on');
    $(".contents.storage .snb .snb-topmenu > li:last-child").addClass('on');


// 공통 모바일 헤더 gnb 메뉴 on
    $(".main .header .mo-gnb > li:first-child").addClass('on');
    $(".popular .header .mo-gnb > li:nth-child(2)").addClass('on');
    $(".contents.lately .header .mo-gnb > li:nth-child(3)").addClass('on');
    $(".contents.dashboard .header .mo-gnb > li:nth-child(4)").addClass('on');
    $(".contents.storage .header .mo-gnb > li:last-child").addClass('on');


// 공통 snb 필터 여닫기
    $(".mo-filter-open").click(function(){
        $(".snb").toggleClass("on");
    });
    $(".mo-filter-open-720").click(function(){
        $(".snb").addClass("on");
        $(".snb-dim").show();
        $("html, body").addClass("not-scroll");
    });
    $(".mo-snb-close").click(function(){
        $(".snb").removeClass("on");
        $(".snb-dim").hide();
        $("html, body").removeClass("not-scroll");
    });
	/* 2020-02-20 */
	$(".mo-search").click(function(){
        $(".m_sear_lay_n").animate({ right: '0' }, 250);
        //$(".snb-dim").show();
        $("html, body").addClass("not-scroll");
    });
	$(".ly_sear").click(function(){
        $(".m_sear_lay_n").animate({ right: '-100%' }, 250);
        //$(".snb-dim").show();
        $("html, body").removeClass("not-scroll");
    });
	/* //2020-02-20 */


// 공통 snb 필터 체크박스 전체 선택
    // 학년
    function sCheckAllFunc( obj ) {
        $("[name=eCheck]").prop("checked", $(obj).prop("checked") );
    }
    function eCheckFunc( obj ) {
    var allObj = $("[name=sCheckAll]");
    var objName = $(obj).attr("name");

    if( $(obj).prop("checked") ) {
        checkBoxLength = $("[name="+ objName +"]").length;
        checkedLength = $("[name="+ objName +"]:checked").length;

        if( checkBoxLength == checkedLength ) {
            allObj.prop("checked", true);
        } else {
            allObj.prop("checked", false);
        }
    }
        else {
            allObj.prop("checked", false);
        }
    }
    $(function(){
        $("[name=sCheckAll]").click(function(){
            sCheckAllFunc( this );
        });
        $("[name=eCheck]").each(function(){
            $(this).click(function(){
                eCheckFunc( $(this) );
            });
        });
    });
    // 교과목
    function iCheckAllFunc( obj ) {
        $("[name=iCheck]").prop("checked", $(obj).prop("checked") );
    }
    function iCheckFunc( obj ) {
    var allObj = $("[name=iCheckAll]");
    var objName = $(obj).attr("name");

    if( $(obj).prop("checked") ) {
        checkBoxLength = $("[name="+ objName +"]").length;
        checkedLength = $("[name="+ objName +"]:checked").length;

        if( checkBoxLength == checkedLength ) {
            allObj.prop("checked", true);
        } else {
            allObj.prop("checked", false);
        }
    }
        else {
            allObj.prop("checked", false);
        }
    }
    $(function(){
        $("[name=iCheckAll]").click(function(){
            iCheckAllFunc( this );
        });
        $("[name=iCheck]").each(function(){
            $(this).click(function(){
                iCheckFunc( $(this) );
            });
        });
    });
    // 콘텐츠 종류
    function cCheckAllFunc( obj ) {
        $("[name=cCheck]").prop("checked", $(obj).prop("checked") );
    }
    function cCheckFunc( obj ) {
    var allObj = $("[name=cCheckAll]");
    var objName = $(obj).attr("name");

    if( $(obj).prop("checked") ) {
        checkBoxLength = $("[name="+ objName +"]").length;
        checkedLength = $("[name="+ objName +"]:checked").length;

        if( checkBoxLength == checkedLength ) {
            allObj.prop("checked", true);
        } else {
            allObj.prop("checked", false);
        }
    }
        else {
            allObj.prop("checked", false);
        }
    }
    $(function(){
        $("[name=cCheckAll]").click(function(){
            cCheckAllFunc( this );
        });
        $("[name=cCheck]").each(function(){
            $(this).click(function(){
                cCheckFunc( $(this) );
            });
        });
    });
    // 서비스 채널
    function scCheckAllFunc( obj ) {
        $("[name=sCheck]").prop("checked", $(obj).prop("checked") );
    }
    function sCheckFunc( obj ) {
    var allObj = $("[name=scCheckAll]");
    var objName = $(obj).attr("name");

    if( $(obj).prop("checked") ) {
        checkBoxLength = $("[name="+ objName +"]").length;
        checkedLength = $("[name="+ objName +"]:checked").length;

        if( checkBoxLength == checkedLength ) {
            allObj.prop("checked", true);
        } else {
            allObj.prop("checked", false);
        }
    }
        else {
            allObj.prop("checked", false);
        }
    }
    $(function(){
        $("[name=scCheckAll]").click(function(){
            scCheckAllFunc( this );
        });
        $("[name=sCheck]").each(function(){
            $(this).click(function(){
                sCheckFunc( $(this) );
            });
        });
    });
    // 전체 초기화
    $(function() {$("#filter-check-disabled").click(function(){
        if($("#filter-check-disabled").prop("checked")) {
            $(".filter-wrap input[type=checkbox]").prop("checked",true);
        } else {
            $(".filter-wrap input[type=checkbox]").prop("checked",false); }
        })
    });
    // 모바일 여닫기
    $(".btn-filter-open").click(function(){
        $(".filter-wrap").slideToggle(250);
        $(this).parent().toggleClass('close');
        $(this).children().toggleClass('on');
    });


// 메인 컨텐츠 슬라이드
/* 2020-03-04 */
    $(window).bind('load resize',function(){
        slide()
    });
    function slide(){
        var ww = $(window).width();
        var mainSlide = $('.main-slide');
		if(ww < 721){
            /*if (typeof mainSlide.data('owl.carousel') != 'undefined') {
                mainSlide.data('owl.carousel').destroy();
            }*/
			$('.main-slide').owlCarousel('destroy'); 
            mainSlide.removeClass('owl-carousel');
        } else{
            mainSlide.addClass('owl-carousel');
            if($('.main-slide.owl-carousel .item').length > 0){
                mainSlide.owlCarousel({
                    items:4,
                    margin:17,
                    nav:true
                });
            }
        }
    }
/* 2020-03-04 */

// 최근 본 컨텐츠 - 서브
   /* $(".lately-list-layout .this-delete").click(function(){
        $(this).parent().parent().parent().hide();
    });*/


// 보관함 - 서브
    function classChkAllFunc( obj ) {
        $("[name=classChk]").prop("checked", $(obj).prop("checked") );
    }
    function classChkFunc( obj ) {
    var allObj = $("[name=classChkAll]");
    var objName = $(obj).attr("name");

    if( $(obj).prop("checked") ) {
        checkBoxLength = $("[name="+ objName +"]").length;
        checkedLength = $("[name="+ objName +"]:checked").length;

        if( checkBoxLength == checkedLength ) {
            allObj.prop("checked", true);
        } else {
            allObj.prop("checked", false);
        }
    }
        else {
            allObj.prop("checked", false);
        }
    }
    $(function(){
        $("[name=classChkAll]").click(function(){
            classChkAllFunc( this );
        });
        $("[name=classChk]").each(function(){
            $(this).click(function(){
                classChkFunc( $(this) );
            });
        });
    });


// 검색결과 더보기 - 서브
    $(".result-btn").click(function(){
        $(this).toggleClass('on');
        $(".result-layout").toggleClass('off');
        $(".result-more-layout").toggleClass('on');
    });


// 고객센터 여닫기
	/* 2020-03-05 */
    $(".tbl-index").click(function(){
        $(this).children(".btn").toggleClass('on');
        $(this).next().toggleClass("on");
		/*$(".cus-tbl-wrap > .tbl-index > .btn").removeClass("on");
        $(this).children(".btn").addClass('on');
        $(".tbl-subject").removeClass("on");
        $(this).next().addClass("on");*/
    });
	/* //2020-03-05 */
    

// 학습뷰어 목차 여닫기
    $(".viewer-pop01-open").click(function(){
        $(".viewer-dim").fadeIn(250);
        $(".viewer-index").addClass("on");
    });
    $(".viewer-pop02-open").click(function(){
        $(".viewer-dim").fadeIn(250);
        $(".viewer-contents").addClass("on");
    });
    $(".viin-close").click(function(){
        $(".viewer-dim").fadeOut(250);
        $(".viewer-index").removeClass("on");
    });
    $(".vicon-close").click(function(){
        $(".viewer-dim").fadeOut(250);
        $(".viewer-contents").removeClass("on");
    });


// 댓글 여닫기
    $(".comment-open").click(function(){
        $(this).next().toggleClass("on");
    });


// 내가 만든 평가 체크박스
    // 초등학년
    function make1CheckAllFunc( obj ) {
        $("[name=makeCheck-E]").prop("checked", $(obj).prop("checked") );
    }
    function make1CheckFunc( obj ) {
    var allObj = $("[name=makeCheckAll-E]");
    var objName = $(obj).attr("name");

    if( $(obj).prop("checked") ) {
        checkBoxLength = $("[name="+ objName +"]").length;
        checkedLength = $("[name="+ objName +"]:checked").length;

        if( checkBoxLength == checkedLength ) {
            allObj.prop("checked", true);
        } else {
            allObj.prop("checked", false);
        }
    }
        else {
            allObj.prop("checked", false);
        }
    }
    $(function(){
        $("[name=makeCheckAll-E]").click(function(){
            make1CheckAllFunc( this );
        });
        $("[name=makeCheck-E]").each(function(){
            $(this).click(function(){
                make1CheckFunc( $(this) );
            });
        });
    });
    // 중학년
    function make2CheckAllFunc( obj ) {
        $("[name=makeCheck-M]").prop("checked", $(obj).prop("checked") );
    }
    function make2CheckFunc( obj ) {
    var allObj = $("[name=makeCheckAll-M]");
    var objName = $(obj).attr("name");

    if( $(obj).prop("checked") ) {
        checkBoxLength = $("[name="+ objName +"]").length;
        checkedLength = $("[name="+ objName +"]:checked").length;

        if( checkBoxLength == checkedLength ) {
            allObj.prop("checked", true);
        } else {
            allObj.prop("checked", false);
        }
    }
        else {
            allObj.prop("checked", false);
        }
    }
    $(function(){
        $("[name=makeCheckAll-M]").click(function(){
            make2CheckAllFunc( this );
        });
        $("[name=makeCheck-M]").each(function(){
            $(this).click(function(){
                make2CheckFunc( $(this) );
            });
        });
    });


// 버튼 sort 토글
    $(".btn-sort").click(function(){
        $(this).toggleClass("on");
    });


// 평가하기 팝업
    // 버튼 토글
    $(".apBtn").click(function(){
        $(".apBtn").removeClass('on');
        $(this).toggleClass('on');
    });
    // 탭 여닫기
    $(".app-all").click(function(){
        $(".tab-dep02, .app-open02").removeClass('on');
        $(".tab-dep01, .app-open01").addClass('on');
    });
    $(".app-num").click(function(){
        $(".tab-dep01, .app-open01").removeClass('on');
        $(".tab-dep02, .app-open02").addClass('on');
    });


// 평가시작 버튼
    $(".make-btn-wrap > .start").click(function(){
        $(this).hide();
        $(this).next().removeClass("off");
    });
    $(".make-btn-wrap > .ing").click(function(){
        $(this).hide();
        $(this).next().removeClass("off");
    });



// 문제풀이 연필, 지우개
    $(".pe-openToggle").click(function(){
        $(this).toggleClass('on');
        $(this).prev().toggleClass('on');
        $(this).prev().children().toggleClass('on');
    });
    $(".pencil").click(function(){
        $(".eraser-big").removeClass('on');
        $(".pencil-big").toggleClass('on');
    });
    $(".eraser").click(function(){
        $(".pencil-big").removeClass('on');
        $(".eraser-big").toggleClass('on');
    });
    $(".pe-close").click(function(){
        $(".pencil-big, .eraser-big").removeClass('on');
    });


// 문제풀이 말풍선
    $(".control").hover(function(){
        $(".bubble-wrap").toggleClass('on');
    });


// 문제 탭
    $(".ex-listTab").click(function(){
        console.log("adddddddddddddddddd");
        console.log(this);
        $(".ex-listTab, .list-area").removeClass('on');
        $(this).addClass('on');
        $(this).next().addClass('on');
    });


// 학습뷰어 슬라이드
    if($('.viewer-slide.owl-carousel .item').length > 0){
        var viewerSlide = $('.viewer-slide.owl-carousel');
        viewerSlide.owlCarousel({
            items:1,
            nav:false
        });
        $('.viewer-slide-wrap > .owl-prev').on('click',function(){
            viewerSlide.trigger('prev.owl.carousel');
            return false;
        })
        $('.viewer-slide-wrap > .owl-next').on('click',function(){
            viewerSlide.trigger('next.owl.carousel');
            return false;
        })
    }


// 학습뷰어 댓글 수정
    $(".comEdit-open").click(function(){
        $(this).parent().parent().parent().parent().hide();
        $(this).parent().parent().parent().parent().siblings(".dep2").children(".comment-before").hide();
        $(this).parent().parent().parent().parent().siblings(".dep2").children(".comment-edit").addClass("on");
        $(".comment-popup").removeClass("on");
    });
    $(".edit-close").click(function(){
        $(this).parent('.comment-edit').removeClass("on");
        $(this).parent().parent().siblings(".dep3").show();
        $(".comment-before").show();
    });


// 상단으로 버튼
    $(".go-top").hide();
    $(function () {
        $(window).scroll(function () {
            if ($(this).scrollTop() > 100) {
                $('.go-top').fadeIn();
            } else {
                $('.go-top').fadeOut();
            }
        });
    });


});


// URL 복사
function copy_to_clipboard() {
    var copyText = document.getElementById("clipInput");
    copyText.select();
    document.execCommand("Copy");
    alert("URL이 복사 되었습니다.");
}


// 좋아요 슬라이드
/* 2020-03-04 */
$(document).ready(function() {
    $(window).bind('load resize',function(){
        slide()
    });
    function slide(){
        var ww = $(window).width();
        var likeSlide = $('.like-slide');
		if(ww < 721){
            /*if (typeof likeSlide.data('owl.carousel') != 'undefined') {
                likeSlide.data('owl.carousel').destroy();
            }*/
			$('.like-slide').owlCarousel('destroy'); 
            likeSlide.removeClass('owl-carousel');
        } else{
            likeSlide.addClass('owl-carousel');
            if($('.like-slide.owl-carousel .item').length > 0){
                likeSlide.owlCarousel({
                    items:3,
                    margin:17,
                    nav:true
                });
            }
        }
    }
});
/* 2020-03-04 */


// HOT 카테고리 슬라이드
$(document).ready(function() {
    $(window).bind('load resize',function(){
        slide()
    })
    function slide(){
        var ww = $(window).width();
        var cateSlide = $('.category-slide');
        if(ww < 721){
            if (typeof cateSlide.data('owl.carousel') != 'undefined') {
                cateSlide.data('owl.carousel').destroy();
            }
            cateSlide.removeClass('owl-carousel');
        } else{
            cateSlide.addClass('owl-carousel');
            if($('.category-slide.owl-carousel .item').length > 0){
                cateSlide.owlCarousel({
                    items:4,
                    nav:false,
                    loop:true,
                    margin:30,
                    rewind: true,
                    autoplay:true,
                    autoplayTimeout:3000,
                    autoplayHoverPause:true
                });
            }
        }
    }
});



/* 2020-03-04 */
/*window.onresize = function() {
	document.location.reload();
};
$(function() {
	if($(window).width() < 721){
		
	}
	else($(window).width() > 700){
		
	}
});*/



/* 2020-03-09 */
$(document).ready(function() {
$(".btn-later").hover(function(){
	$(this).toggleClass('on');
});
});