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
  <input type="hidden" id="userId" name="userId" value=${param.userId} />
  <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
  <script type="text/javascript" src="../js/myStatistics.js"></script>


  <style>
  html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
  .md-background2 {
    background-color : #E0E0E0;
    color : #424242;
  }
  #columnChartdiv {
    width: 100%;
    height: 450px;
  }
  #pieChartdiv {
    width: 100%;
    height: 450px;
  }
  </style>
</head>

<body class="w3-white">

<!-- Top container -->
<div class="w3-bar w3-top w3-large md-background2" style="z-index:4">
  <button class="w3-bar-item w3-button w3-hide-large w3-hover-none" onclick="to_back();"><i class="fa fa-arrow-left"></i></button>
  <b><span class="w3-bar-item w3-left">My 기부통계 내역</span></b>
</div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">

  <!-- Header -->
  <header class="w3-container" style="padding-top:10px">
    <h6><b> 2019년 총 기부내역 </b> <span class="w3-right"> <span id="totalAmtdiv" style="color:blue"> </span> 원</span> </h6>
    <%-- <hr> --%>
  </header>

  <hr>
  <!-- Header -->
  <header class="w3-container" style="padding-top:10px">
    <h6><b> 월별 기부내역</b></h6>
    <%-- <hr> --%>
  </header>
  <div id="columnChartdiv"></div>
  <hr>
  <!-- Header -->
  <header class="w3-container">
    <h6><b> 분야별 기부내역 (원)</b></h6>
    <%-- <hr> --%>
  </header>
  <div id="pieChartdiv"></div>
  <hr>
</div>

</body>
</html>
