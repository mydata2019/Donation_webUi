<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <title>Donation My Statistics</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Jua">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <!-- Resources -->
  <script src="https://www.amcharts.com/lib/4/core.js"></script>
  <script src="https://www.amcharts.com/lib/4/charts.js"></script>
  <script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
  <input type="hidden" id="userId" name="userId" value=${param.userId} />
  <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
  <script type="text/javascript" src="../js/ip_config.js"></script>
  <script type="text/javascript" src="../js/myStatistics.js"></script>


  <style>
  html,body,h1,h2,h3,h4,h5,h6 {font-family: "Jua", sans-serif}
  .md-background {
    background-color : #5BB4F0;
    color : white;
  }
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

  /* blind */
  .blind{overflow:hidden;position:absolute;top:-9999em;left:-9999em;width:0;height:0;font-size:0;text-indent:-9999em}

  .navi{position:fixed;height:50px; width:100%; z-index:100;bottom:0px; background-color:#5BB4F0;display:table;}
  .navi a.myDomain{position:relative;top:0;left:0;width:33%;height:49px;background:url(../images/don_mydon.png) no-repeat;background-size:40px 38px; background-position:center; padding:0px 10px; display:table-cell; }
  .navi a.social{position:relative;top:0;left:0;width:33%;height:49px;background:url(../images/don_social.png) no-repeat;background-size:45px 42px; background-position:center; padding:0px 10px; display:table-cell; }
  .navi a.donation{position:relative;top:0;left:0;width:33%;height:49px;background:url(../images/don_donation.png) no-repeat;background-size:40px 40px; background-position:center; padding:0px 10px; display:table-cell; }


  </style>
</head>

<body class="w3-white">

  <!-- Top container -->
  <%-- <div class="w3-bar w3-top w3-large md-background2" style="z-index:4"> --%>
    <%-- <button class="w3-bar-item w3-button w3-hide-large w3-hover-none" onclick="to_back();"><i class="fa fa-arrow-left"></i></button> --%>
  <div class="w3-bar w3-top w3-large md-background" style="z-index:4">
    <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" style="background-color:#5BB4F0;" onclick="w3_open();"><i class="fa fa-bars" style="color:#ffffff"></i></button>
    <span class="w3-bar-item w3-left" style="margin-left:-10px"><b>MY 기부통계 내역</b></span>
    <input type="image" src="../images/don_alert.png" alt="Submit" width="42" height="42" align="right">
  </div>

  <!-- Sidebar/menu -->
  <nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:5;width:300px;" id="mySidebar"><br>
    <div class="w3-container w3-row">
      <div class="w3-col s8">
        <a href="#" class="w3-bar-item w3-button"><i class="fa fa-user"></i> <span id="userNmSide"></span> 님</a>
      </div>
    </div>
    <hr>
    <div class="w3-container">
    <%-- 작성 --%>
    </div>
    <div class="w3-bar-block">
      <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-refresh"></i>  연동관리</a>
      <%-- <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-dashboard fa-fw"></i>  My 기부내역 통계</a> --%>
      <hr>
      <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-cog fa-fw"></i>  설정</a>
      <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bank fa-fw"></i>  고객센터</a>
    </div>
  </nav>

  <!-- Overlay effect when opening sidebar on small screens -->
  <div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>


  <!-- !PAGE CONTENT! -->
  <div class="w3-main" style="margin-left:300px; margin-top:43px; margin-bottom:100px">

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


    <!-- Footer -->
    <div class="navi">
      <a href="./demo1.jsp" class="myDomain"><span class="blind">MY기부</span></a>
      <a href="./demo2_1.jsp" class="social"><span class="blind">소셜벤처</span></a>
      <a href="./demo4_M00030.jsp" class="donation"><span class="blind">기부단체</span></a>
    </div>

</div>

<script>

  // Get the Sidebar
  var mySidebar = document.getElementById("mySidebar");

  // Get the DIV with overlay effect
  var overlayBg = document.getElementById("myOverlay");
  var myBottomNav = document.getElementById("myBottomNav");

  // Toggle between showing and hiding the sidebar, and add overlay effect
  function w3_open() {
    if (mySidebar.style.display == 'block') {
      mySidebar.style.display = 'none';
      overlayBg.style.display = "none";
    } else {
      mySidebar.style.display = 'block';
      overlayBg.style.display = "block";
    }
  }

  // Close the sidebar with the close button
  function w3_close() {
    mySidebar.style.display = "none";
    overlayBg.style.display = "none";
  }

</script>

</body>
</html>
