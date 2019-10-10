<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <title>MY기부</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Jua">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <input type="hidden" id="userId" name="userId" value=${param.userId} />

  <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
  <script type="text/javascript" src="../js/jquery.animateNumber.min.js"></script>
  <script type="text/javascript" src="../js/ip_config.js"></script>
  <script type="text/javascript" src="../js/main.js"></script>
  <script type="text/javascript" src="../js/ui.js"></script>
  <script type="text/javascript" src="../js/Chart.min.js"></script>

  <style>

    html,body,h1,h2,h3,h4,h5 {font-family: "", sans-serif}

    .md-background {
      background-color : #5BB4F0;
      color : white;
    }

    /* blind */
    .blind{overflow:hidden;position:absolute;top:-9999em;left:-9999em;width:0;height:0;font-size:0;text-indent:-9999em}

    header{height:50px; width:100%; z-index:100; background-color:#5BB4F0}
    header h1{font-size:16px;color:#646464;font-weight:normal; margin-left: 20px; line-height:50px;}
    header.gnb button{position:absolute;top:0;left:0;width:49px;height:49px;background:url(../images/left_menu.png) no-repeat 50% 50%;background-size:30px 30px}

    .chargeList{margin:0 -20px; list-style:none;}
    .chargeList > li{border-bottom:1px solid #d9d9d9; margin-right: 30px}
    .chargeList > li.on{border-bottom:0}
    .chargeList > li > a{position:relative;display:block;padding:0 20px;color:#646464;font-size:15px;font-weight:normal;line-height:55px}
    .chargeList > li > a:after{content:'';position:absolute;top:50%;right:20px;width:9px;height:9px;margin-top:-9px;border-left:2px solid #222;border-bottom:2px solid #222;transform: rotate( -45deg )}
    .chargeList > li.on > a:after{margin-top:-5px;transform: rotate( 135deg )}
    .chargeList .dataList{list-style:none; display:none;padding:20px;background:#ffffff; color:#646464; padding-left:30px; border-radius:10px; margin-left: 20px; margin-right:40px}

    #pntInfo{width:100%; height:auto; font-size: 18px; text-align: center; margin: -30px 0px 0px 0px}
    #totalAamt{width:100%; height:auto;font-size: 45px; text-align: center; margin: 0px 0px 8px 0px}

    .navi{position:fixed;height:50px; width:100%; z-index:100;bottom:0px; background-color:#5BB4F0;display:table;}
    .navi a.myDomain{position:relative;top:0;left:0;width:33%;height:49px;background:url(../images/don_mydon.png) no-repeat;background-size:40px 38px; background-position:center; padding:0px 10px; display:table-cell; }
    .navi a.myStatistics{position:relative;top:0;left:0;width:33%;height:49px;background:url(../images/don_mystatistics2.png) no-repeat;background-size:40px 40px; background-position:center; padding:0px 10px; display:table-cell; }
    .navi a.social{position:relative;top:0;left:0;width:33%;height:49px;background:url(../images/don_social2.png) no-repeat;background-size:45px 42px; background-position:center; padding:0px 10px; display:table-cell; }


    .downbtn {
      background-color: transparent;
      border: none;
      color: #646464;
      padding: 12px 30px;
      padding-left: 10px;
      margin-left: 0px;
      cursor: pointer;
      font-size: 15px;
    }

    /* Darker background on mouse-over */
    .downbtn:hover {
      color: #222222;
      font-weight:200px;
    }

  </style>
</head>

<body class="w3-white">
  <!-- Top container -->
  <div class="w3-bar w3-top w3-large md-background" style="z-index:4">
    <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" style="background-color:#5BB4F0;" onclick="w3_open();"><i class="fa fa-bars" style="color:#ffffff"></i></button>
    <%-- <span class="w3-bar-item w3-left" style="margin-left:-10px"><b>MY 기부</b></span> --%>
    <span class="w3-bar-item w3-button w3-left w3-hover-none w3-hover-text-white" style="margin-left:-10px" onclick="layerOpen('mainMyDon')"><b>MY 기부</b></span>
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
      <a href="javascript:;" class="w3-bar-item w3-button w3-padding" onclick="layerOpen('linkMain')"><i class="fa fa-refresh"></i>  연동관리</a>
      <%-- <a href="javascript:;" class="w3-bar-item w3-button w3-padding" onclick="layerOpen('myStatistics')"><i class="fa fa-dashboard fa-fw"></i>  My 기부내역 통계</a><hr> --%>
      <%-- <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-dashboard fa-fw"></i>  My 기부내역 통계</a> --%>
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

  <div class="w3-container w3-padding-16 md-background" style="height:100px">
    <p id="pntInfo"><span id="userNm"></span>님의 총 기부금 </p>
    <p id="totalAamt">0</p>
  </div>

  <div class="w3-container w3-white w3-padding-16" style="padding-bottom:0px; margin-bottom:0px; border-bottom:2px solid #d9d9d9;">
    <div class="w3-bar">
      <a class="w3-bar-item" style="color:#646464; font-size:16px; margin-left: 0px; padding-left: 0px"><b>기부레벨</b></a>
      <a href="#" class="w3-bar-item w3-button w3-right" style="color:blue; font-size:16px; margin-right:-10px;">Level 1　<b><span style="color:#646464">></span></b></a>
    </div>
    <div class="w3-bar">
      <a class="w3-bar-item" style="color:#646464; font-size:16px; margin-left: 0px; padding-left: 0px"><b>기부포인트</b></a>
      <a href="#" class="w3-bar-item w3-button w3-right" style="color:red; font-size:16px; margin-right:-10px;"><span id="pntBamt"></span> P　<b><span style="color:#646464">></span></b></a>
    </div>
  </div>

  <div class="w3-container w3-white w3-padding-16" style="overflow:auto; overflow-x:hidden; scroll-behavior: smooth; margin-bottom:100px">

    <!-- header -->
    <a class="w3-bar-item" style="color:#646464; font-size:16px; margin-left: 0px; padding-left: 0px"><b>기부내역</b><button class="downbtn" onclick="downloadHst();"><i class="fa fa-download"></i> Down</button></a>
    <!-- container -->
    <div id="container" style="padding-top:0px; margin-top: 0px; margin-left: -30px; margin-right: -15px">
        <ul class="chargeList">
<!--            <li>
                <a href="javascript:;">
                    2019년 05월 01일 충전결과
                </a>
                <ul class="dataList">
                    <li>
                        <span>충전일자</span>
                        <span>2019년 05월 01일</span>
                    </li>
                    <li>
                        <span>충전금액</span>
                        <span class="point">39,600원</span>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    2019년 05월 01일 충전결과
                </a>
                <ul class="dataList">
                    <li>
                        <span>충전일자</span>
                        <span>2019년 05월 01일</span>
                    </li>
                    <li>
                        <span>충전금액</span>
                        <span class="point">39,600원</span>
                    </li>
                </ul>
            </li>-->
        </ul>
    </div>
  </div>


  <!-- Footer -->
  <div class="navi">
    <a href="#" class="myDomain w3-button w3-hover-blue"><span class="blind">MY기부</span></a>
    <a href="javascript:;" class="myStatistics w3-button w3-hover-blue" onclick="layerOpen('myStatistics')"><span class="blind">MY기부내역통계</span></a>
    <a href="javascript:;" class="social w3-button w3-hover-blue" onclick="layerOpen('socialValue')"><span class="blind">사회적가치 PLUS+</span></a>
    <%-- <a href="javascript:;" class="donation" onclick="layerOpen('donation')"><span class="blind">기부단체 정보</span></a> --%>
  </div>

  <!-- End page content -->
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
