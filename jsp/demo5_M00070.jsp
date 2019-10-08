<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=0">
    <meta name="format-detection" content="telephone=no">
    <title>SK C&C MVNO</title>
    <link rel="stylesheet" href="../css/common.css">
    <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="../js/ui.js"></script>
    <script type="text/javascript" src="../js/Chart.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function () {
      // 파라미터 받기
      function getParameterByName(name) {
          name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
          var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
              results = regex.exec(location.search);
          return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
      }
      var svAcntNum = getParameterByName('SV_ACNT_NUM');
      if(svAcntNum == null || svAcntNum == '') {
        alert('SV_ACNT_NUM 파라미터 입력필요');
        return;
      }
      console.log(svAcntNum + "-1");

      var rows;
      var length;
      // 충전결과 가져오기
      $.ajax({
        url: "http://a819dbefea6d111e9a5260241e1ca044-2045704601.ap-northeast-2.elb.amazonaws.com:8000/core/charging/selectLast",
        //url: "http://localhost:8000/core/charging/selectLast",  //local
        //url: "http://localhost:8083/charging/selectLast",
        // url: "http://localhost:8083/charging/select?svAcntNum="+'123456789',
        type: 'POST',
        data: svAcntNum,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        success: function (data) {
            // 폼 비우기
            if(data.list.length < 1 || data == null){
              alert('해당 서비스번호가 없음 : ' + data);
            }

            console.log(data.list.length);
            rows = data.list[0];
            // $.each(rows, function(idx,row){
            //   console.log(rows[idx].OP_DT);
            // })
        }
      });
      console.log(rows.SV_ACNT_NUM + "-3");

      $("#SV_ACNT_NUM").html(rows.SV_ACNT_NUM);
      $("#OP_DT").html(rows.OP_DT.substr(0, 10));
      var op_yn = '성공';
      if (rows.NORM_OP_YN != '1') { op_yn = '실패(' + rows.OP_RSLT_ERR_CD + ')' ;}
      $("#NORM_OP_YN").html(op_yn);
      console.log(op_yn);
      $("#CARD_NUM").html(rows.CARD_NUM);
      $("#VCR_BOOK_TYP_CD").html(rows.VCR_BOOK_TYP_CD);
      $("#VCR_BOOK_TYP_NM").html(rows.VCR_BOOK_TYP_NM);
      $("#CHRG_AMT").html(rows.CHRG_AMT + "원");
      $("#SETTL_WAY_CD").html(rows.SETTL_WAY_CD);
      $("#SETTL_WAY_NM").html(rows.SETTL_WAY_NM);
      $("#BANK_CARD_CO_CD").html(rows.BANK_CARD_CO_CD);
      $("#BANK_CARD_CO_NM").html(rows.BANK_CARD_CO_NM);
      $("#EFF_STA_DT").html(rows.EFF_STA_DT);
      $("#EFF_END_DT").html(rows.EFF_END_DT);
      $("#OP_RSLT_ERR_CD").html(rows.OP_RSLT_ERR_CD);
    });
    </script>
</head>

<body>
<!-- wrap -->
<div id="wrap" class="brand2 brandBgN">

    <!-- header -->
    <header class="fixed">
        <h1>충전결과</h1>
    </header>

    <!-- container -->
    <div id="container">
        <div class="complArea">
            <p class="complete">충전이 완료되었습니다.</p>
        </div>
        <ul class="dataList">
            <li>
                <span>서비스계정번호</span>
                <span id="SV_ACNT_NUM"></span>
            </li>
            <li>
                <span>충전일자</span>
                <span id="OP_DT"></span>
            </li>
            <li>
                <span>처리결과</span>
                <span id="NORM_OP_YN"></span>
            </li>
            <li>
                <span>카드번호</span>
                <span id="CARD_NUM"></span>
            </li>
            <li>
                <span>충전구분</span>
                <span id="chrg_cd">BAND</span>
            </li>
            <li>
                <span>카드종류</span>
                <span id="VCR_BOOK_TYP_NM" class="point"></span>
            </li>
            <li>
                <span>충전금액</span>
                <span id="CHRG_AMT" class="point"></span>
            </li>
            <li>
                <span>결제수단</span>
                <span id="SETTL_WAY_NM"></span>
            </li>
            <li>
                <span>카드사</span>
                <span id="BANK_CARD_CO_NM"></span>
            </li>
            <li>
                <span>유효시작일</span>
                <span id="EFF_STA_DT"></span>
            </li>
            <li>
                <span>유효종료일</span>
                <span id="EFF_END_DT"></span>
            </li>
        </ul>

        <!-- btnArea -->
        <div class="btnArea">
            <!-- <button type="button" id="btnResultAll" class="btnL" onclick="function sbm(){alert('zz');document.sub1.submit();}">충전내역 보기</button> -->
            <!--<form method="POST" action="http://localhost:8083/charging/select">-->
            <!--<form method="POST" action="http://localhost:8000/core/charging/select">-->
            <form method="POST" action="http://a819dbefea6d111e9a5260241e1ca044-2045704601.ap-northeast-2.elb.amazonaws.com:8000/core/charging/select">
                <input type="hidden" name="svAcntNum" value="${param.SV_ACNT_NUM}" />
                <button class="btnL" type="submit">충전내역 보기</button>
            </form>
        </div>



    </div>
</div>
</body>
</html>
