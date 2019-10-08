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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script type="text/javascript" src="../js/linkByAPI.js"></script>

  <style>

  html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}

  .md-background2 {
    background-color : #E0E0E0;
    color : #424242;
  }

  #foot {
    padding-top: 10px;
    padding-bottom: 10px;
  }

  .login {
    padding-top: 20px;
    display:inline-block;
    width:80%;
  }
  .login-out {
     width:100%;
     text-align:center;
  }
  .login b {
    float: left;
    padding-bottom: 5px;
  }

  </style>
</head>

<body class="w3-light-grey">

<!-- Top container -->
<div class="w3-bar w3-top w3-large md-background2" style="z-index:4">
  <button class="w3-bar-item w3-button w3-hide-large w3-hover-none" onclick="w3_open();"><i class="fa fa-arrow-left"></i></button>
  <span class="w3-bar-item w3-left">기부단체 연동 로그인</span>
</div>


<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">

  <form id="data-form">
    <div class="w3-container">
      <div class="w3-panel">
        <p> <img src="../images/unicef_logo.png" style="width:150px;margin-top:15px;margin-bottom:30px;margin-left:20px;"> </p>
        <p>연동을 위해 최초 로그인이 필요합니다.</p>
        <p>"유니세프"에 가입된 아이디/비밀번호를 입력하세요.</p>
      </div>

      <div class="login-out">
        <div class="login">
          <label class="w3-text-grey"><b>아이디</b></label>
          <input class="w3-input w3-border" type="text" placeholder="아이디를 입력하세요" name="id">
        </div>
        <div class="login">
          <label class="w3-text-grey"><b>비밀번호</b></label>
          <input class="w3-input w3-border" type="password" placeholder="비밀번호를 입력하세요" name="pw">
        </div>
        <div class="w3-bar w3-display-bottommiddle w3-border-top">
          <input type="hidden" name="user_id" value="1">
          <input type="hidden" name="org_id" value="2">
          <input type="button" class="w3-btn w3-bar-item w3-border-right w3-text-white"
            style="width:50%;padding-top:15px;padding-bottom:15px;margin-top:0px;background-color: #6bbcfd; font-weight:bold;"
            value="취소하기"
            onclick="location.href='http://localhost:9090/Donation_webUi/jsp/linkMain.jsp'">
          <input type="submit" class="w3-btn w3-bar-item w3-text-white"
            style="float:right;width:50%;padding-top:15px;padding-bottom:15px;margin-top:0px;background-color: #008fff; font-weight:bold;"
             value="로그인"/>

        </div>
      </div>
    </div>
  </form>
  <!-- End page content -->
</div>

<%-- Modal --%>
<div id="id01" class="w3-modal">
  <div class="w3-modal-content">

    <header class="w3-container w3-grey">
      <span onclick="document.getElementById('id01').style.display='none'"
      class="w3-button w3-display-topright w3-text-white">X</span>
      <h3 class="w3-text-white">인증 성공</h3>
    </header>

    <div class="w3-container">
      <p><b>인증이 완료되었습니다.</b></p>
      <p>- 기부단체 : 유니세프</p>
      <p>- ID : cyh602</p>
      <p> </p>
      <p><b>기부이력을 가져오시겠습니까?</b></p>
    </div>

    <footer class="w3-container w3-grey" id="foot">

        <span class="w3-button w3-grey pull-right w3-text-white" id="getDon">가져오기</span>
        <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-grey pull-right w3-text-white">취소</span>

    </footer>

  </div>
</div>
<%-- Modal End --%>
<%-- Modal --%>
<div id="id02" class="w3-modal">
  <div class="w3-modal-content">

    <header class="w3-container w3-grey">
      <h3 class="w3-text-white" style="float:left;">연동 성공</h3>
      <span onclick="location.href='http://localhost:9090/Donation_webUi/jsp/linkMain.jsp'"
      class="w3-button pull-right w3-text-white">X</span>
    </header>

    <div class="w3-container">
      <p><b>단체로부터 기부이력을 가져왔습니다. </b></p>
      <p><b>기부포인트가 적립되었습니다.</b></p>
    </div>
    <footer class="w3-container w3-grey" id="foot">
        <span onclick="location.href='http://localhost:9090/Donation_webUi/jsp/linkMain.jsp'" class="w3-button w3-grey pull-right w3-text-white">메인으로</span>
    </footer>

  </div>
</div>
<%-- Modal End --%>

</body>
</html>
