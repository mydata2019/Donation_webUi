<%@ page language="java" contentType="text/html; charset=UTF-8"     pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=0">
<meta name="format-detection" content="telephone=no">
<title>SK C&C MVNO</title>
<link rel="stylesheet" href="../css/common.css">
    <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="../js/ui.js"></script>
<%--  <% HashMap<String, String> data = (HashMap<String, String>) request.getAttribute("result.CSR_SV_ACNT"); %>--%>
 <script type="text/javascript">
  $(document).ready(function(){

     var svc_NUM_fst = "${param.SVC_NUM}".substr(0,3);
     var svc_NUM_mid = "${param.SVC_NUM}".substr(3,4).replace(/(?<=.{2})./gi, "*");;
     var svc_NUM_lst = "${param.SVC_NUM}".substr(7,4).replace(/(?<=.{2})./gi, "*");;
     var svc_num = svc_NUM_fst + '-' + svc_NUM_mid + '-' + svc_NUM_lst;
     $("#svc_num").append(svc_num);
  });
 </script>

</head>
<body>
<div id="wrap" class="brand2">
  <!--<form id="frm" method = "POST" action = "http://localhost:8081/balance/request">-->
  <!--<form id="frm" method = "POST" action = "http://localhost:8000/balance/balance/request">-->
  <form id="frm" method = "POST" action = "http://a819dbefea6d111e9a5260241e1ca044-2045704601.ap-northeast-2.elb.amazonaws.com:8000/balance/balance/request">
    <header>
        <h1>서비스 조회 결과</h1>
        <input id="sv_acnt_num" name = "svAcntNum" type="hidden" value = "${param.SV_ACNT_NUM}"></input>
    </header>
    <div id="container">
        <p class="brandLogo"></p>
        <div class="contBox userInfo">
            <span>${param.CUST_NM}님</span><span id="svc_num"></span>
        </div>
        <div class="contBox">
            <ul class="setviceInfo">
                <li>
                    <span>기준</span>
                    <span>${param.SYSDATE}</span>
                </li>
                <li>
                    <span>서비스 상태</span>
                    <span>${param.SV_ACNT_ST_CD}</span>
                </li>
                <li class="vTop">
                    <span>사용중인 요금제</span>
                    <span>
                          ${param.PROD_NM}
                        <%-- <em>음성/MMS 무제한<br>부가 음성 50분<br>데이터 1.2GB</em> --%>
                    </span>
                </li>
            </ul>
        </div>
        <div class="btnArea">
            <%-- <button type="button" class="btnL">잔액 조회</button> --%>
            <input  type = "submit" value ="잔액 조회" class="btnL">
        </div>
    </div>
      </form>
</div>
</body>
</html>
