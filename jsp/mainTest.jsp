<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <title>Donation Main</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <script type="text/javascript" src="../js/mainTest.js"></script>


  <style>

  html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}

  .md-background {
    background-color : #5BB4F0;
    color : white;
  }
  </style>

</head>

<body class="w3-light-grey">

<!-- Top container -->
<div class="w3-bar w3-top w3-large md-background" style="z-index:4">
  <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" onclick="w3_open();"><i class="fa fa-bars"></i></button>
  <span class="w3-bar-item w3-left">My 기부</span>
</div>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:5;width:300px;" id="mySidebar"><br>
  <div class="w3-container w3-row">
    <div class="w3-col s8">
      <a href="#" class="w3-bar-item w3-button"><i class="fa fa-user"></i> <span><strong>　박보검</strong></span> 님</a>
    </div>
  </div>
  <hr>
  <div class="w3-container">
    <%-- 작성 --%>
  </div>
  <div class="w3-bar-block">
    <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-users fa-fw"></i>  연동관리</a>
    <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-dashboard fa-fw"></i>  My 기부내역 통계</a><hr>
    <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-cog fa-fw"></i>  설정</a>
    <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bank fa-fw"></i>  고객센터</a>
  </div>
</nav>


<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">

  <!-- Header -->
  <header class="w3-container" style="padding-top:22px">
    <%-- <h5><b><i class="fa fa-dashboard"></i> My Dashboard</b></h5> --%>
  </header>
  <div class="w3-container w3-padding-32 md-background">
    <br><br><br>
  </div>
  <div class="w3-container w3-light-grey w3-padding-32">
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
  </div>

  <!-- Footer -->
  <div class="w3-bar w3-bottom w3-large md-background">
  <footer class="w3-container w3-padding-16">
    <h4>BOTTOM NAV</h4>
    <%-- 하단 네비게이션 작성 --%>
  </footer>
</div>

  <!-- End page content -->
</div>



</body>
</html>
