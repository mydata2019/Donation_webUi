<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <title>Donation My Statistics</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <!-- Resources -->
  <script src="https://www.amcharts.com/lib/4/core.js"></script>
  <script src="https://www.amcharts.com/lib/4/charts.js"></script>
  <script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

  <style>

  html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}

  .md-background2 {
    background-color : #E0E0E0;
    color : #424242;
  }
  .logo {
    height: 50px;
    width: 50px;
    margin-right:15px;
  }
  .plusminus {
    width: 15px;
  }
  #chartdiv {
    width: 100%;
    height: 500px;
  }

  #org div {
    height: 50px;
  }
  .row-left {
    padding-right: 15px;
  }
  .row-right {
    padding-top:5px;
  }

  .pull-right img {
    margin-right:5px;
  }

  .top-row {
    margin-top: 10px;
    margin-bottom: 10px;
  }
  </style>
</head>

<body class="w3-white">

<!-- Top container -->
<div class="w3-bar w3-top w3-large md-background2" style="z-index:4">
  <button class="w3-bar-item w3-button w3-hide-large w3-hover-none" onclick="w3_open();"><i class="fa fa-arrow-left"></i></button>
  <span class="w3-bar-item w3-left">연동 관리</span>
</div>


<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">
  <div class="w3-container w3-border w3-large w3-light-grey">
    <div class="w3-left-align"><p>기관별 기부내역(상세) 연동</p></div>
  </div>
  <div class="w3-container w3-white" id="org" style="padding-top:10px;padding-bottom:20px;">
    <div class="w3-left-align top-row">
      <span class="row-left pull-left">
        <img src="../images/org1.png" class="logo"/>국경없는 의사회
      </span>
      <span class="row-right pull-right">
        <button class="w3-btn w3-round pull-right" id="callAPI">
          <img src="../images/remove.png" class="plusminus"/>연동끊기</button>
      </span>
    </div>
    <div class="w3-left-align top-row">
      <span class="row-left pull-left">
        <img src="../images/org2.png" class="logo"/>유니세프
      </span>
      <span class="row-right pull-right">
        <button class="w3-btn w3-round pull-right" id="callAPI" onclick="location.href='./linkByAPI.jsp?user_id=1&org_id=1'">
          <img src="../images/add.png" class="plusminus"/>연동하기</button>
      </span>
    </div>
    <div class="w3-left-align top-row">
      <span class="row-left pull-left">
        <img src="../images/org3.png"/ class="logo"/>세이브더칠드런
      </span>
      <span class="row-right pull-right">
        <button class="w3-btn w3-round pull-right" id="callAPI">
          <img src="../images/remove.png" class="plusminus"/>연동끊기</button>
      </span>
    </div>
    <div class="w3-left-align top-row">
      <span class="row-left pull-left">
        <img src="../images/org4.jpg" class="logo"/>그린피스
      </span>
      <span class="row-right pull-right">
        <button class="w3-btn w3-round pull-right" id="callAPI">
          <img src="../images/remove.png" class="plusminus"/>연동끊기</button>
      </span>
    </div>
  </div>
  <div class="w3-container w3-border w3-large w3-light-grey">
    <div class="w3-left-align"><p>기부이력 직접 등록</p></div>
  </div>
  <div class="w3-container w3-white top-row" style="padding-top:10px;">
    <div class="w3-left-align pull-left" style="padding-top:10px;">
      <span class="w3-padding-large">직접 등록하기</span>
    </div>
    <div class="pull-right">
      <button class="w3-btn w3-white w3-round w3-right-align" id="callText" onclick="location.href='./linkByText.jsp'">
        <img src="../images/add.png" class="plusminus"/>입력하기
      </button>
    </div>
  </div>
  <!-- End page content -->
</div>

</body>
</html>
