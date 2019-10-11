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
  <script type="text/javascript" src="../js/ip_config.js"></script>
  <script type="text/javascript" src="../js/linkByAPI.js"></script>

  <style>

  html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}

  .md-background2 {
    background-color : #E0E0E0;
    color : #424242;
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
  .agimg {
    width: 20px;
    margin-right: 10px;
  }
  .detail p {
    font-size: small;<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
  <script type="text/javascript" src="../js/ip_config.js"></script>
  <script type="text/javascript" src="../js/linkByAPI.js"></script>

  <style>

  html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}

  .md-background2 {
    background-color : #E0E0E0;
    color : #424242;
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
  .agimg {
    width: 20px;
    margin-right: 10px;
  }
  .detail p {
    font-size: small;
  }
  #id03 p {
    margin-top: 5px;
    margin-bottom: 5px;
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
            onclick="location.href='./linkMain.jsp'">
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
  <div class="w3-modal-content w3-animate-opacity">

    <header class="w3-container w3-grey">
      <span onclick="document.getElementById('id01').style.display='none'"
      class="w3-button w3-display-topright w3-text-white">X</span>
      <h3 class="w3-text-white">인증 성공</h3>
    </header>

    <div class="w3-container">
      <p><b>단체 로그인에 성공했습니다.</b></p>
      <p>- 기부단체 : 유니세프</p>
      <p>- ID : cyh602</p>
      <p> </p>
      <p><b>기부이력을 가져오시겠습니까?</b></p>
    </div>

    <footer class="w3-container w3-grey">

        <span class="w3-button w3-grey pull-right w3-text-white" onclick="document.getElementById('id03').style.display='none'">가져오기</span>
        <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-grey pull-right w3-text-white">취소</span>

    </footer>

  </div>
</div>
<div id="id03" class="w3-modal">
  <div class="w3-modal-content w3-animate-opacity">

    <header class="w3-container w3-grey">
      <span onclick="document.getElementById('id03').style.display='none'"
      class="w3-button w3-display-topright w3-text-white">X</span>
      <h5 class="w3-text-white">정보 제공 동의</h5>
    </header>

    <div class="w3-container">
      <p style="font-size:10pt;"><b>기부정보 제공 동의</b></p>
      <p style="font-size:9pt;"><u>'유니세프'의 상세 기부 내역</u>을 '기부니조아'에 제공하는 것을 동의하십니까?</p>
      <%-- <p style="text-align:right;height:20px;"><input type="button" class="pull-right w3-light-grey w3-btn w3-small w3-round-large" value="제공상세"></p> --%>
      <p class="pull-right">
        <span><input type="radio" class="w3-radio" name="agree" value="1" checked style="width:20px;"/><label style="font-size:10pt;"> 동의</label></span>
        <span><input type="radio" class="w3-radio" name="agree" value="0" style="width:20px;"/><label style="font-size:10pt;"> 동의 안함</label></span>
      </p>

    </div>
    <div class="w3-container w3-pale-yellow w3-border-top w3-border-grey detail">
      <%-- <p>
        <span style="font-size:10pt;"> <b> 제공 정보 상세 </b></span>
      </p> --%>
      <p style="font-size:9pt;">
        <img src="../images/shipping.png"/ class="agimg">
        <b>상세 기부내역 3종(일자, 금액, 기부종류)</b>이 <b>'기부니조아'</b>에 제공됩니다.</p>
      <p style="font-size:9pt;">
        <img src="../images/good.png"/ class="agimg">
          <b>기부포인트를 적립</b> 받아서 사용할 수 있어요.
      </p>
      <%-- <p>
        <img src="../images/bad.png"/ class="agimg">
        타기부단체로부터 상담전화를 받을 수 있어요.
      </p> --%>
    </div>
    <div class="w3-container w3-topbar w3-border-grey">
      <p style="font-size:10pt;"><b>금융정보 제공 동의</b></p>
      <p style="font-size:9pt;"><u>'유니세프'의 개인결제내역</u>을 '기부니조아'에 제공하는 것을 동의하십니까?</p>
      <%-- <p style="text-align:right;height:20px;"><input type="button" class="pull-right w3-light-grey w3-btn w3-small w3-round-large" value="제공상세"></p> --%>
      <p class="pull-right">
        <span><input type="radio" class="w3-radio" name="agree2" value="1" checked style="width:20px;"/><label style="font-size:10pt;"> 동의</label></span>
        <span><input type="radio" class="w3-radio" name="agree2" value="0" style="width:20px;"/><label style="font-size:10pt;"> 동의 안함</label></span>
      </p>

    </div>
    <div class="w3-container w3-pale-yellow w3-border-top w3-border-grey detail">
      <%-- <p>
        <span style="font-size:10pt;"> <b> 제공 정보 상세 </b></span>
      </p> --%>
      <p style="font-size:9pt;">
        <img src="../images/shipping.png"/ class="agimg">
        <b>상세 결제내역 3종(결제수단, 결제금액, 결제일자)</b>이 <b>'기부니조아'</b>에 제공됩니다.</p>
      <p style="font-size:9pt;">
        <img src="../images/good.png"/ class="agimg">
          <b>보다 정확한 통계분석</b>을 제공받을 수 있어요.
      </p>
      <%-- <p>
        <img src="../images/bad.png"/ class="agimg">
        타기부단체로부터 상담전화를 받을 수 있어요.
      </p> --%>
    </div>

    <footer class="w3-container w3-grey" id="foot">

        <span class="w3-button w3-grey pull-right w3-text-white" id="getDon">결과 제출</span>

    </footer>

  </div>
</div>
<%-- Modal End --%>
<%-- Modal --%>
<div id="id02" class="w3-modal">
  <div class="w3-modal-content w3-animate-opacity">

    <header class="w3-container w3-grey">
      <h3 class="w3-text-white" style="float:left;">연동 성공</h3>
      <span onclick="location.href='./linkMain.jsp'"
      class="w3-button pull-right w3-text-white">X</span>
    </header>

    <div class="w3-container">
      <p><b>단체로부터 기부이력을 가져왔습니다. </b></p>
      <p><b>기부포인트가 적립되었습니다.</b></p>
    </div>
    <footer class="w3-container w3-grey" id="foot">
        <span onclick="location.href='./linkMain.jsp'" class="w3-button w3-grey pull-right w3-text-white">메인으로</span>
    </footer>

  </div>
</div>
<%-- Modal End --%>

</body>
</html>

  }
  #id03 p {
    margin-top: 5px;
    margin-bottom: 5px;
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
            onclick="location.href='./linkMain.jsp'">
          <input type="submit" class="w3-btn w3-bar-item w3-text-white"
            style="float:right;width:50%;padding-top:15px;padding-bottom:15px;margin-top:0px;background-color: #008fff; font-weight:bold;"
             value="로그인"/>
        </div>
      </div>
    </div>
  </form>
  <span onclick="document.getElementById('id03').style.display='block'" class="w3-button w3-grey pull-right w3-text-white">취소</span>
  <!-- End page content -->
</div>

<%-- Modal --%>
<div id="id01" class="w3-modal">
  <div class="w3-modal-content w3-animate-opacity">

    <header class="w3-container w3-grey">
      <span onclick="document.getElementById('id01').style.display='none'"
      class="w3-button w3-display-topright w3-text-white">X</span>
      <h3 class="w3-text-white">인증 성공</h3>
    </header>

    <div class="w3-container">
      <p><b>단체 로그인에 성공했습니다.</b></p>
      <p>- 기부단체 : 유니세프</p>
      <p>- ID : cyh602</p>
      <p> </p>
      <p><b>기부이력을 가져오시겠습니까?</b></p>
    </div>

    <footer class="w3-container w3-grey">

        <span class="w3-button w3-grey pull-right w3-text-white" onclick="document.getElementById('id03').style.display='none'">가져오기</span>
        <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-grey pull-right w3-text-white">취소</span>

    </footer>

  </div>
</div>
<div id="id03" class="w3-modal">
  <div class="w3-modal-content w3-animate-opacity">

    <header class="w3-container w3-grey">
      <span onclick="document.getElementById('id03').style.display='none'"
      class="w3-button w3-display-topright w3-text-white">X</span>
      <h5 class="w3-text-white">정보 제공 동의</h5>
    </header>

    <div class="w3-container">
      <p style="font-size:10pt;"><b>기부정보 제공 동의</b></p>
      <p style="font-size:9pt;"><u>'유니세프'의 상세 기부 내역</u>을 '기부니조아'에 제공하는 것을 동의하십니까?</p>
      <%-- <p style="text-align:right;height:20px;"><input type="button" class="pull-right w3-light-grey w3-btn w3-small w3-round-large" value="제공상세"></p> --%>
      <p class="pull-right">
        <span><input type="radio" class="w3-radio" name="agree" value="1" checked style="width:20px;"/><label style="font-size:10pt;"> 동의</label></span>
        <span><input type="radio" class="w3-radio" name="agree" value="0" style="width:20px;"/><label style="font-size:10pt;"> 동의 안함</label></span>
      </p>

    </div>
    <div class="w3-container w3-pale-yellow w3-border-top w3-border-grey detail">
      <%-- <p>
        <span style="font-size:10pt;"> <b> 제공 정보 상세 </b></span>
      </p> --%>
      <p style="font-size:9pt;">
        <img src="../images/shipping.png"/ class="agimg">
        <b>상세 기부내역 3종(일자, 금액, 기부종류)</b>이 <b>'기부니조아'</b>에 제공됩니다.</p>
      <p style="font-size:9pt;">
        <img src="../images/good.png"/ class="agimg">
          <b>기부포인트를 적립</b> 받아서 사용할 수 있어요.
      </p>
      <%-- <p>
        <img src="../images/bad.png"/ class="agimg">
        타기부단체로부터 상담전화를 받을 수 있어요.
      </p> --%>
    </div>
    <div class="w3-container w3-topbar w3-border-grey">
      <p style="font-size:10pt;"><b>금융정보 제공 동의</b></p>
      <p style="font-size:9pt;"><u>'유니세프'의 개인결제내역</u>을 '기부니조아'에 제공하는 것을 동의하십니까?</p>
      <%-- <p style="text-align:right;height:20px;"><input type="button" class="pull-right w3-light-grey w3-btn w3-small w3-round-large" value="제공상세"></p> --%>
      <p class="pull-right">
        <span><input type="radio" class="w3-radio" name="agree2" value="1" checked style="width:20px;"/><label style="font-size:10pt;"> 동의</label></span>
        <span><input type="radio" class="w3-radio" name="agree2" value="0" style="width:20px;"/><label style="font-size:10pt;"> 동의 안함</label></span>
      </p>

    </div>
    <div class="w3-container w3-pale-yellow w3-border-top w3-border-grey detail">
      <%-- <p>
        <span style="font-size:10pt;"> <b> 제공 정보 상세 </b></span>
      </p> --%>
      <p style="font-size:9pt;">
        <img src="../images/shipping.png"/ class="agimg">
        <b>상세 결제내역 3종(결제수단, 결제금액, 결제일자)</b>이 <b>'기부니조아'</b>에 제공됩니다.</p>
      <p style="font-size:9pt;">
        <img src="../images/good.png"/ class="agimg">
          <b>보다 정확한 통계분석</b>을 제공받을 수 있어요.
      </p>
      <%-- <p>
        <img src="../images/bad.png"/ class="agimg">
        타기부단체로부터 상담전화를 받을 수 있어요.
      </p> --%>
    </div>

    <footer class="w3-container w3-grey" id="foot">

        <span class="w3-button w3-grey pull-right w3-text-white" id="getDon">결과 제출</span>

    </footer>

  </div>
</div>
<%-- Modal End --%>
<%-- Modal --%>
<div id="id02" class="w3-modal">
  <div class="w3-modal-content w3-animate-opacity">

    <header class="w3-container w3-grey">
      <h3 class="w3-text-white" style="float:left;">연동 성공</h3>
      <span onclick="location.href='./linkMain.jsp'"
      class="w3-button pull-right w3-text-white">X</span>
    </header>

    <div class="w3-container">
      <p><b>단체로부터 기부이력을 가져왔습니다. </b></p>
      <p><b>기부포인트가 적립되었습니다.</b></p>
    </div>
    <footer class="w3-container w3-grey" id="foot">
        <span onclick="location.href='./linkMain.jsp'" class="w3-button w3-grey pull-right w3-text-white">메인으로</span>
    </footer>

  </div>
</div>
<%-- Modal End --%>

</body>
</html>

