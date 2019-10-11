<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <title>기부단체 연차보고서</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Jua">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <input type="hidden" id="userId" name="userId" value=${param.userId} />

  <script src="https://www.amcharts.com/lib/4/core.js"></script>
  <script src="https://www.amcharts.com/lib/4/charts.js"></script>
  <script src="https://www.amcharts.com/lib/4/themes/material.js"></script>
  <%-- <script src="https://www.amcharts.com/lib/4/themes/dataviz.js"></script> --%>
  <script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

  <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
  <script type="text/javascript" src="../js/jquery.animateNumber.min.js"></script>
  <script type="text/javascript" src="../js/ip_config.js"></script>
  <script type="text/javascript" src="../js/Chart.min.js"></script>
  <script type="text/javascript" src="../js/notiInformation.js"></script>

  <style>

    html,body,h1,h2,h3,h4,h5 {font-family: "", sans-serif}

    .md-background {
      background-color : #5BB4F0;
      color : white;
    }

    /* blind */
    .blind{overflow:hidden;position:absolute;top:-9999em;left:-9999em;width:0;height:0;font-size:0;text-indent:-9999em}

    header{height:50px; width:100%; z-index:100;}
    header h1{font-size:16px;color:#646464;font-weight:normal; margin-left: 20px; line-height:50px;}
    header.gnb button{position:absolute;top:0;left:0;width:49px;height:49px;background:url(../images/left_menu.png) no-repeat 50% 50%;background-size:30px 30px}

    #pntInfo{width:100%; height:auto; font-size: 15px; text-align: center; margin: 10px 0px 8px 0px}
    #totalAamt{width:100%; height:auto;font-size: 30px; text-align: center; margin: -10px 0px 8px 0px; color:#FF0066}
    #chartdiv{margin: -15px 0px 8px 0px;}
    #pntInfo2{width:100%; height:auto; font-size: 12px; text-align: center; margin: -30px 0px 8px 0px}
    #pntInfo3{width:100%; height:auto; font-size: 12px; text-align: center; margin: -5px 0px 8px 0px}

    .navi{position:fixed;height:50px; width:100%; z-index:100;bottom:0px; background-color:#5BB4F0;display:table;}
    .navi a.myDomain{position:relative;top:0;left:0;width:25%;height:49px;background:url(../images/don_mydon2.png) no-repeat;background-size:47px 45px; background-position:center; padding:0px 10px; display:table-cell; }
    .navi a.myStatistics{position:relative;top:0;left:0;width:25%;height:49px;background:url(../images/don_mystatistics2.png) no-repeat;background-size:50px 43px; background-position:center; padding:0px 10px; display:table-cell; }
    .navi a.notiInfo{position:relative;top:0;left:0;width:25%;height:49px;background:url(../images/don_notiInfo.png) no-repeat;background-size:42px 40px; background-position:center; padding:0px 10px; display:table-cell; }
    .navi a.social{position:relative;top:0;left:0;width:25%;height:49px;background:url(../images/don_social2.png) no-repeat;background-size:45px 40px; background-position:center; padding:0px 10px; display:table-cell; }

    .mySlides {display:none;}

  </style>
</head>

<body class="w3-white">
  <!-- Top container -->
  <div class="w3-bar w3-top w3-large md-background" style="z-index:4">
    <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" style="background-color:#5BB4F0;" onclick="w3_open();"><i class="fa fa-bars" style="color:#ffffff"></i></button>
    <%-- <span class="w3-bar-item w3-left" style="margin-left:-10px"><b>사회적 가치 PLUS+</b></span> --%>
    <span class="w3-bar-item w3-button w3-left w3-hover-none w3-hover-text-white" style="margin-left:-10px" onclick="layerOpen('notiInformation')"><b>기부단체 연차보고서</b></span>
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
      <%-- <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-sync"></i>  연동관리</a> --%>
      <%-- <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-dashboard fa-fw"></i>  My 기부내역 통계</a> --%>

      <a href="javascript:;" class="w3-bar-item w3-button w3-padding" onclick="layerOpen('linkMain')"><i class="fa fa-refresh fa-fw"></i>  연동관리</a>
<%-- <a href="javascript:;" class="w3-bar-item w3-button w3-padding" onclick="layerOpen('myStatistics')"><i class="fa fa-dashboard fa-fw"></i>  My 기부내역 통계</a><hr> --%>
      <hr>
      <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-cog fa-fw"></i>  설정</a>
      <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bank fa-fw"></i>  고객센터</a>
    </div>
  </nav>


  <!-- Overlay effect when opening sidebar on small screens -->
  <div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

  <!-- !PAGE CONTENT! -->
  <div class="w3-main" style="margin-left:300px;margin-top:0px;">

    <!-- Header -->
    <header class="w3-container" style="padding-top:1px; margin-top:44px;">
    </header>

    <%-- <h6 class="w3-center">Manual Slideshow</h6> --%>

    <div class="w3-content w3-display-container" style="margin-top:-34px;">
      <a class="w3-bar-item" style="color:#646464; font-size:16px; margin-left: 17px; padding-left: 0px"><b>MY 기부단체 연차보고서</b></a>
      <div class="w3-content w3-display-container" style ="margin : 0px 0px 0px 0px">
        <img class="mySlides w3-button w3-hover-none" src="../images/don_report1.png" type="application/pdf" style="width:100%; height:280px;" onClick="download('unicef')">
        <img class="mySlides w3-button w3-hover-none" src="../images/don_report3.png" style="width:100%; height:280px;" onClick="download('good')">
        <img class="mySlides w3-button w3-hover-none" src="../images/don_report7.png" style="width:100%; height:280px;" onClick="download('greenpeace')" >

        <button class="w3-button w3-black w3-display-left w3-hover-white" onclick="plusDivs(-1)">&#10094;</button>
        <button class="w3-button w3-black w3-display-right w3-hover-white" onclick="plusDivs(1)">&#10095;</button>
      </div>
    </div>
    <hr>

    <div class="w3-container w3-padding-16" style="overflow:auto; overflow-x:hidden; scroll-behavior: smooth; margin-bottom:100px">
      <!-- header -->
      <header class="fixed" style="margin-top:-30px; ">
          <h1 style="margin: 0 0 0 0px; font-size: 16px;"><b>그 외 기부단체 연차보고서</b></h1>
          <h1 style="margin-top: -53px; margin-right: -25px; font-size: 18px;" align="right"> <i class="fa fa-search w3-button"></i>　</h1>
      </header>
      <!-- container -->
      <div id="container" style="padding-top:45px; margin-top: 0px">
        <div class="w3-row-padding" style="height:50px; margin-top:-50px">
          <div class="w3-col s6 w3-button"><img src="../images/don_report8.png" style="width:100%; height:130px"></div>
          <div class="w3-col s6 w3-button"><img src="../images/don_report9.png" style="width:100%; height:130px"></div>
          <%-- <div class="w3-col s4 "><img src="../images/img_social_3.png" style="width:100%"></div> --%>
        </div><p>

        <div style=" margin-top:90px; font-size: 10px;" align="center">　더보기＋　</div>
      </div>

    </div>




    <!-- Footer -->
    <div class="navi">
      <%-- <a href="./demo1.jsp" class="myDomain"><span class="blind">MY기부</span></a>
      <a href="./demo2_1.jsp" class="social"><span class="blind">소셜벤처</span></a>
      <a href="./demo4_M00030.jsp" class="donation"><span class="blind">기부단체</span></a> --%>
      <a href="javascript:;" class="myDomain w3-button w3-hover-blue" onclick="layerOpen('mainMyDon')"><span class="blind">MY기부</span></a>
      <a href="javascript:;" class="myStatistics w3-button w3-hover-blue" onclick="layerOpen('myStatistics')"><span class="blind">MY기부내역통계</span></a>
      <a href="#" class="notiInfo w3-button w3-hover-blue"><span class="blind">기부단체 연차보고서</span></a>
      <a href="javascript:;" class="social w3-button w3-hover-blue" onclick="layerOpen('socialValue')"><span class="blind">사회적가치 PLUS+</span></a>

      <%-- <a href="javascript:;" class="donation" onclick="layerOpen('donation')"><span class="blind">기부단체 정보</span></a> --%>
    </div>
  <!-- End page content -->
  </div>

</body>

</html>
