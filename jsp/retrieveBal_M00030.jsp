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

      var delay = 2000; //2sec
      var statement = false;


      $(document).ready(function(){

        buttonEvent();
        firstsetData();
        setTimeout(function(){rtrvData()},delay);
        $("#goCharging").click(function(){
           $("#target").submit();
        });


      });

      function drawingChart( addVoiceOfrQty,  addVoiceRemQty,  dataOfrQty,  dataRemQty){

        var ctx1 = document.getElementById("chart1").getContext('2d');
        var ctx2 = document.getElementById("chart2").getContext('2d');
        var ctx3 = document.getElementById("chart3").getContext('2d');

        var myChart1 = new Chart(ctx1, {
            type: 'doughnut',
            data: {
                datasets: [{
                    data: [addVoiceOfrQty-addVoiceRemQty, addVoiceRemQty],
                    borderColor: ['#e4e4e4', '#6ad2d0'],
                    backgroundColor: ['#e4e4e4', '#6ad2d0'],
                    borderWidth: 1
                }]},
            options: {
                cutoutPercentage: 80,
                responsive: true,
                maintainAspectRatio: false,
            }
        });
        var myChart2 = new Chart(ctx2, {
            type: 'doughnut',
            data: {
                datasets: [{
                    data: [dataOfrQty-dataRemQty, dataRemQty],
                    borderColor: ['#e4e4e4', '#24aeac'],
                    backgroundColor: ['#e4e4e4', '#24aeac'],
                    borderWidth: 1
                }]},
            options: {
                cutoutPercentage: 80,
                responsive: true,
                maintainAspectRatio: false,
            }
        });
        var myChart3 = new Chart(ctx3, {
            type: 'doughnut',
            data: {
                datasets: [{
                    data: [0, 100],

                    borderColor: ['#e4e4e4', '#087977'],
                    backgroundColor: ['#e4e4e4', '#087977'],
                    borderWidth: 1
                }]},
            options: {
                cutoutPercentage: 80,
                responsive: true,
                maintainAspectRatio: false,
            }
        });
      }


      function buttonEvent(){
        if(!statement){ // interface에서 동기화 전
          $("#goCharging").attr('disabled', true);
          $("#goCharging").text('잔액조회중..'); // 이벤트 올 때까지 disable 처리.
        }else{
          $("#goCharging").attr('disabled', false);
          $("#goCharging").text('충전하러 가기');
        }
      }

      function initData(){
          //console.log("init Data..");
          $("#dDay").empty().append('<em id="fixAmtPrcplnEffEndDt"></em>');
          $("#custNm").empty();
          $("#svcNum").empty();
          $("#svAcntStCdText").empty();
          $("#prodNm").empty();
          $("#cardNum").empty();
          $("#fixAmtPrcplnEffStaDt").empty();
          $("#fixAmtPrcplnEffEndDt").empty();
          $("#addVoiceRemQty").empty();
          $("#addVoiceOfrQty").empty();
          $("#dataRemQty").empty();
          $("#dataOfrQty").empty();


      }
      function firstsetData(){
        //console.log("set Data..");
        var fixAmtPrcplnEffStaDt = "${param.FIX_AMT_PRCPLN_EFF_STA_DT}";
        var fixAmtPrcplnEffEndDt ="${param.FIX_AMT_PRCPLN_EFF_END_DT}";
          fixAmtPrcplnEffStaDt = fixAmtPrcplnEffStaDt.substr(0,4)+"-"+fixAmtPrcplnEffStaDt.substr(4,2)+"-"+fixAmtPrcplnEffStaDt.substr(6,2);
          fixAmtPrcplnEffEndDt = fixAmtPrcplnEffEndDt.substr(0,4)+"-"+fixAmtPrcplnEffEndDt.substr(4,2)+"-"+fixAmtPrcplnEffEndDt.substr(6,2);
        var today = new Date();
        var endDate = new Date(fixAmtPrcplnEffEndDt);
        var svcNum = "${param.SVC_NUM}";
        svcNum=svcNum.substr(0,3)+"-"+svcNum.substr(3,4)+"-"+svcNum.substr(7,4);
        $("#dDay").append("D-").append(Math.floor((endDate.getTime() - today.getTime())/(1000*60*60*24)));
        $("#custNm").append("${param.CUST_NM}");
        $("#svcNum").append(svcNum);
        $("#svAcntNum").val("${param.SV_ACNT_NUM}");
        $("#chgCnt").val(${param.CHG_CNT});
        $("#svAcntStCdText").append("${param.SV_ACNT_ST_CD_TEXT}");
        $("#prodNm").append("${param.PROD_NM}");
        $("#cardNum").append("${param.CARD_NUM}");
        $("#fixAmtPrcplnEffStaDt").append(fixAmtPrcplnEffStaDt);
        $("#fixAmtPrcplnEffEndDt").append(fixAmtPrcplnEffEndDt);
        $("#addVoiceRemQty").append(${param.ADD_VOICE_REM_QTY}).append("분");
        $("#addVoiceOfrQty").append("/").append(${param.ADD_VOICE_OFR_QTY}).append("분");
        $("#dataRemQty").append(${param.DATA_REM_QTY}).append("MB");
        $("#dataOfrQty").append("/").append(${param.DATA_OFR_QTY}).append("MB");
        drawingChart(${param.ADD_VOICE_OFR_QTY},${param.ADD_VOICE_REM_QTY},${param.DATA_OFR_QTY},${param.DATA_REM_QTY});


      }

      function setData(arg){
      //  console.log("set Data by arg..");
        var fixAmtPrcplnEffStaDt = arg.FIX_AMT_PRCPLN_EFF_STA_DT;
        var fixAmtPrcplnEffEndDt =arg.FIX_AMT_PRCPLN_EFF_END_DT;
          fixAmtPrcplnEffStaDt = fixAmtPrcplnEffStaDt.substr(0,4)+"-"+fixAmtPrcplnEffStaDt.substr(4,2)+"-"+fixAmtPrcplnEffStaDt.substr(6,2);
          fixAmtPrcplnEffEndDt = fixAmtPrcplnEffEndDt.substr(0,4)+"-"+fixAmtPrcplnEffEndDt.substr(4,2)+"-"+fixAmtPrcplnEffEndDt.substr(6,2);
        var today = new Date();
        var endDate = new Date(fixAmtPrcplnEffEndDt);
        var svcNum = arg.SVC_NUM;
        svcNum=svcNum.substr(0,3)+"-"+svcNum.substr(3,4)+"-"+svcNum.substr(7,4);
        $("#dDay").append("D-").append(Math.floor((endDate.getTime() - today.getTime())/(1000*60*60*24)));
        $("#custNm").append(arg.CUST_NM);
        $("#svcNum").append(svcNum);
        $("#svAcntNum").val(arg.SV_ACNT_NUM);
        $("#chgCnt").val(arg.CHG_CNT);
        $("#svAcntStCdText").append(arg.SV_ACNT_ST_CD_TEXT);
        $("#prodNm").append(arg.PROD_NM);
        $("#cardNum").append(arg.CARD_NUM);
        $("#fixAmtPrcplnEffStaDt").append(fixAmtPrcplnEffStaDt);
        $("#fixAmtPrcplnEffEndDt").append(fixAmtPrcplnEffEndDt);
        $("#addVoiceRemQty").append(arg.ADD_VOICE_REM_QTY).append("분");
        $("#addVoiceOfrQty").append("/").append(arg.ADD_VOICE_OFR_QTY).append("분");
        $("#dataRemQty").append(arg.DATA_REM_QTY).append("MB");
        $("#dataOfrQty").append("/").append(arg.DATA_OFR_QTY).append("MB");
        drawingChart(arg.ADD_VOICE_OFR_QTY,arg.ADD_VOICE_REM_QTY,arg.DATA_OFR_QTY,arg.DATA_REM_QTY);

      }

      function rtrvData(){

          setTimeout(function(){
              $.ajax({
              url: 'http://a819dbefea6d111e9a5260241e1ca044-2045704601.ap-northeast-2.elb.amazonaws.com:8000/balance/balance/result'
              //url: 'http://localhost:8000/balance/balance/result' //local
              //url: 'http://localhost:8081/balance/result'
              ,type: 'POST'
              ,data : $("#svAcntNum").val()
              ,contentType: "application/json; charset=utf-8"
  		        ,dataType: "json"
              ,success: function(arg){
              //  console.log(arg.CHG_CNT);
              //  console.log(arg);
                initData();
                setData(arg);
                console.log("count : "+arg.CHG_CNT+", paramCount:"+${param.CHG_CNT});
                statement = true;
                buttonEvent();
                // if( ${param.CHG_CNT} == arg.CHG_CNT){ //변경없을경우 해당 함수 재시행함
                //
                //   rtrvData();
                // }else{
                //     statement = true;
                //   buttonEvent();
                // }
              }
              ,error: function(err){
                console.log(err);
              }
            })
          }, delay); //delay 후 재호출
      }
    </script>
</head>
<body>
<div id="wrap" class="brand1">
    <header>
        <h1>잔액조회</h1>
    </header>
    <div id="container">
        <p class="brandLogo"></p>
        <div class="contBox userInfo">
            <span id="custNm"></span><span id="svcNum"></span>
        </div>

        <div class="contBox">
            <ul class="setviceInfo">
                <li>
                    <span>서비스 상태</span>
                    <span id="svAcntStCdText"></span>
                </li>
                <li>
                    <span>사용중인 요금제</span>
                    <span id="prodNm"></span>
                </li>
            </ul>
        </div>

        <div class="contBox" style="padding:0 20px;">
            <ul class="setviceInfo type2">
                <li>
                    <span>BAND 카드번호</span>
                    <span id="cardNum"></span>
                </li>
                <li class="date">
                    <span>BAND 유효시작일</span>
                    <span><em id="fixAmtPrcplnEffStaDt"></em></span>
                </li>
                <li class="date">
                    <span>BAND 유효종료일</span>
                    <span id="dDay"><em id="fixAmtPrcplnEffEndDt"></em></span>
                </li>
            </ul>
        </div>

        <div class="contBox">
            <ul class="chartList">
                <li>
                    <div><canvas id="chart1" width="100%" height="100%"></canvas></div>
                    <div class="info">
                        <p>영상, 부가전화</p>
                        <strong id="addVoiceRemQty"></strong><p id="addVoiceOfrQty"></p>
                    </div>
                </li>
                <li>
                    <div><canvas id="chart2" width="100%" height="100%"></canvas></div>
                    <div class="info">
                        <p>데이터</p>
                        <strong id="dataRemQty"></strong><p id="dataOfrQty"></p>
                    </div>
                </li>
                <li>
                    <div><canvas id="chart3" width="100%" height="100%"></canvas></div>
                    <div class="info">
                        <p>음성/SMS/MMS</p>
                        <strong>무제한</strong>/매월
                    </div>
                </li>
            </ul>
            <script type="text/javascript">

            </script>
        </div>

        <div class="btnArea">
          <!--<form id="target" name="target" action="http://localhost:8083/charging/load">-->
          <!--<form id="target" name="target" action="http://localhost:8000/core/charging/load">-->
          <form id="target" name="target" action="http://a819dbefea6d111e9a5260241e1ca044-2045704601.ap-northeast-2.elb.amazonaws.com:8000/core/charging/load">
            <input type="hidden" name="svAcntNum" id="svAcntNum"/>
            <button id="goCharging" type="button" class="btnL">충전하러 가기</button>
          </form>
        </div>
    </div>
</div>
</body>
</html>
