
var payMthdUi = '0';
var billPrice;
var creditCardNum;
var vrBankNum;
var bankCardCoCd;

jQuery(function() {
    //selectbox 이벤트
    $('.uiSelect').each(function(){
        $(this).children('select').on('change',function(){
            var selIdx = $(this).children('option:selected').index();
            if(selIdx === 0){
                $(this).css('color','#888');
            }else{
                $(this).css('color','#222');
            };
        });
    });

    //결제방식 선택
    var selMethod = $('.chargeArea .selPay .selMethod');
    selMethod.children('li').on('click',function(){
        var idx = $(this).index();
        payMthdUi = idx;
        selMethod.children('li').removeClass('on');
        $(this).addClass('on');
        selMethod.siblings('.methodDetail').hide().eq(idx).show();
    });

    //권종 선택 레이어 스크롤 영역 높이값
    var wHeight = $(window).height();
    $('.layerPopfull .popCont').height(wHeight-80);

    //권종 선택 이벤트
    $('#billSel .popCont .billList li a').on('click',function(){
        var billName = $(this).find('.name').html();
        billPrice = $(this).find('.price').html();
        console.log("billName  "+billName+"  billPrice   "+billPrice);
        layerClose();
        $('#billName').addClass('on').html(billName);
        $('#billPrice').addClass('on');
        $('#billPrice em').html(billPrice);
        console.log("billName2  "+billName+"  billPrice2   "+billPrice);
    });

    //카드 선택 이벤트
    $('#cardSel').find('button').on('click',function(){
        var selTxt = $(this).text();
        bankCardCoCd = selTxt;
        layerClose();
        $('#cardName').addClass('on').html(selTxt);
        //신용카드번호 난수 생성
        creditCardNum = getRealCardNum(1111111111111111, 9999999999999999);
    		document.getElementById('creditCardNum').value = creditCardNum;
    });

    //은행 선택 이벤트
    $('#bankSel').find('button').on('click',function(){
        var selTxt = $(this).text();
        layerClose();
        $('#bankName').addClass('on').html(selTxt);
        $('#bankName').siblings('.dataList').show();
        //입금전용계좌번호 난수 생성
        vrBankNum = getRealCardNum(1111111111111111, 9999999999999999);
        console.log("vrBankNum  "+vrBankNum);
    		document.getElementById('vrBankNum').value = vrBankNum;
    });

    //충전내역 collapse
    $('.chargeList li a').on('click',function(){
        if($(this).siblings('.dataList').css('display') == 'none'){
            $('.chargeList li').removeClass('on');
            $('.chargeList li .dataList').slideUp();
            $(this).parent('li').addClass('on');
            $(this).siblings('.dataList').slideDown();
            console.log("ui   ");
            $('html,body').animate({
              scrollTop: $('.chargeList li .dataList li').offset().top
            }, 500);
        }else{
            $(this).parent('li').removeClass('on');
            $(this).siblings('.dataList').slideUp();
        }
    });
});

var $popup;
var $scrollPos = 0;
function layerOpne($id) {
    $scrollPos = $(document).scrollTop();
    $('html, body').css({'height':$(window).height(),'overflow':'hidden'});
    $('body').append('<div class="dimm"></div>');
    $popup = $('#' + $id);
    $popup.show().focus();
}

function layerClose() {
    console.log("close");
    $('html, body').removeAttr('style');
    $(".dimm").remove();
    $(document).scrollTop($scrollPos);
    $('.layerPop:visible').add('.layerPopfull:visible').hide();
}
