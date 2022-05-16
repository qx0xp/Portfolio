window.addEventListener("wheel", function(e){
    // 휠을 굴렸을 때, 스크롤이 되지 않게 기본 scroll 이벤트 제거
    e.preventDefault();
    // passive: false
    // 함수가 작동하는지 능동적 감시 수행, 원천 차단
},{passive: false});

$(function(){
    // 뷰포트에 표시되는 페이지 번호
    var page=1;

    // 문서 로드 되면 첫 페이지 시작
    $("html").animate({scrollTop:0},10)

    $(window).on("wheel", function(e){
        // 스크롤이 진행되는 동안 발생하는 wheel 이벤트 무시
        if($("html").is(":animated")) return;
        
        // 휠 굴리면 deltaY>0
        if(e.originalEvent.deltaY>0){
            // 마지막 페이지에서 멈춰
            if(page==$(".section").length) return;
            page++;
        } else if(e.originalEvent.deltaY<0){
            if(page==1) return;
            page--;
        }
        var pageTop=(page-1)*$(window).height();

        $("html").animate({scrollTop: pageTop});
    });

    // 메뉴 버튼 클릭하면 side 보이기
    $(".h_menu").on("click", function(){
        //스크롤 막기
        $('#wrap').on('scroll touchmove mousewheel', function(event){
            event.preventDefault(); event.stopPropagation();
            return false;
        })

        $(".side").animate({
            'right': 0
        })
    })

    // side_close 클릭 시, side 닫기
    $(".side_close").on("click", function(){
        $(".side").animate({
            'right': "-100%"
        })
        // 스크롤 막기 해제
        $('#wrap').off('scroll touchmove mousewheel');
    })
})