<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0, user-scalable=no" />
	<title>기부니조아</title>
	<meta HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
	<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
	<meta HTTP-EQUIV="Expires" CONTENT="-1">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="../js/ip_config.js"></script>

  <style>
		body {font-family: Arial, Helvetica, sans-serif; background-color:#5BB4F0;}
		* {box-sizing: border-box;}

		.input-container {
  		display: -ms-flexbox; /* IE10 */
  		display: flex;
  		width: 100%;
  		margin-bottom: 15px;
  		width: 80%;
  		margin-left: auto;
  		margin-right: auto;
			margin-top: 20px;
		}

		.icon {
  		padding: 15px;
  		background: #d9d9d9;
  		color: #5BB4F0;
  		min-width: 50px;
  		text-align: center;
		}

		.input-field {
  		width: 100%;
  		padding: 10px;
  		outline: none;
  		border: 1px solid #d9d9d9
		}

		.input-field:focus {
  		border: 2px solid #787878;
		}

		/* Set a style for the submit button */
		.btn {
  		background-color: #2980B9;
  		color: white;
  		padding: 15px 20px;
  		border: none;
  		cursor: pointer;
  		width: 100%;
  		opacity: 0.9;
		}

		.btn:hover {
  		opacity: 1;
		}

		.agimg {
			width: 20px;
			margin-right: 10px;
		}
		.pull-right {
			margin-top: 0px;
		}
  </style>

  <script type="text/javascript">

		$(document).ready(function(){
			console.log("present ip is "+ip);
		});

		function signIn(){

			var userLoginId = document.getElementById('id').value;
			var userPassword = document.getElementById('password').value;

			$("#userLoginId").val(userLoginId);
			$("#userPassword").val(userPassword);

//			document.getElementById("try").action = "http://"+ip+":8087/user/confirm";
//			document.getElementById("try").submit();
				console.log("sign");
				location.href="./mainMyDon.jsp?userId=1";

	};

  </script>
</head>

<body>

  <form style="max-width:500px; margin:auto">
  	<div style="padding:60px 40px 30px; margin-top:50px">
    	<center>
      	<img id="loginTotal" src="../images/don_login_total.png" style="max-width: 80%; height: auto;">
    	</center>
  	</div>

  	<div class="input-container">
    	<i class="fa fa-user icon"></i>
    	<input class="input-field" type="text" placeholder="아이디를 입력하세요" id="id">
  	</div>

  	<div class="input-container" style="margin-top: 0px;">
    	<i class="fa fa-key icon"></i>
    	<input class="input-field" type="password" placeholder="비밀번호를 입력하세요" id="password">
  	</div>
  </form>

  <form id="try" style="max-width:500px; margin:auto">
  	<div class="input-container">
    	<input type="hidden" id="userLoginId" name="userLoginId" value="" >
    	<input type="hidden" id="userPassword" name="userPassword" value="" >
    	<input type ="button" value ="로그인" class="btn" onclick="signIn()" >
  	</div>
  </form>

  <form style="max-width:500px; margin:auto">
  	<div class="input-container" style="margin-top: 0px;">
			<input type = "button" value ="회원가입" class="btn" style="max-width:50%; background:transparent; font-weight:normal; font-size:12px; padding-top:0px"
				onclick="document.getElementById('id03').style.display='block'">
	 		<input type = "submit" value ="ID/PW 찾기" class="btn" style="background:transparent; font-weight:normal; font-size:12px; max-width: 50%; padding-top:0px">
  	</div>
	</form>

	<div id="id03" class="w3-modal">
	  <div class="w3-modal-content w3-animate-opacity">

	    <header class="w3-container w3-grey">
	      <span onclick="document.getElementById('id03').style.display='none'"
	      class="w3-button w3-display-topright w3-text-white">X</span>
	      <h5 class="w3-text-white">개인정보 제공 동의</h5>
	    </header>

	    <div class="w3-container">
	      <p style="font-size:10pt;"><b>[가입정보 제공 동의]</b></p>
	      <p style="font-size:9pt;">고객님의 <u>개인정보</u>를 '기부니조아'에 제공하는 것을 동의하십니까?</p>
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
	        <b>개인정보 3종(이름, 전화번호, 거주지역)</b>이 <b>'기부니조아'</b>에 제공됩니다.</p>
	      <p style="font-size:9pt;">
	        <img src="../images/good.png"/ class="agimg">
	          <b>통합된 기부정보</b>를 제공받을 수 있어요.
	      </p>
	      <%-- <p>
	        <img src="../images/bad.png"/ class="agimg">
	        타기부단체로부터 상담전화를 받을 수 있어요.
	      </p> --%>
	    </div>
	    <div class="w3-container w3-topbar w3-border-grey">
	      <p style="font-size:10pt;"><b>[PUSH 알림 서비스 동의]</b></p>
	      <p style="font-size:9pt;">'기부니조아'로부터<u>PUSH 알림 서비스</u>를 제공받으시겠습니까?</p>
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
	        <b>알림 필요 정보(전화번호, 기기정보)</b>가 <b>'기부니조아'</b>에 제공됩니다.</p>
	      <p style="font-size:9pt;">
	        <img src="../images/good.png"/ class="agimg">
	          <b>후원 정보(신규 후원, 기부업체 보고서 등)</b>를 실시간으로 제공받을 수 있어요.
	      </p>
	      <%-- <p>
	        <img src="../images/bad.png"/ class="agimg">
	        타기부단체로부터 상담전화를 받을 수 있어요.
	      </p> --%>
	    </div>

	    <footer class="w3-container w3-grey" id="foot">

	        <span class="w3-button w3-grey pull-right w3-text-white" id="getDon" onclick="document.getElementById('id04').style.display='block'; document.getElementById('id03').style.display='none';">NEXT</span>

	    </footer>

	  </div>
	</div>

	<div id="id04" class="w3-modal">
		<div class="w3-modal-content w3-animate-opacity">

			<header class="w3-container w3-grey">
				<span onclick="document.getElementById('id04').style.display='none'"
				class="w3-button w3-display-topright w3-text-white">X</span>
				<h5 class="w3-text-white">개인정보 제공 동의</h5>
			</header>

			<div class="w3-container">
				<p style="font-size:10pt;"><b>[개인정보 제 3자 제공 동의]</b></p>
				<p style="font-size:9pt;">고객님의 <u>기부내역을 '제 3자 기업(기부단체, 사회적기업)'에 제공</u>하는 것을 동의하십니까?</p>
				<%-- <p style="text-align:right;height:20px;"><input type="button" class="pull-right w3-light-grey w3-btn w3-small w3-round-large" value="제공상세"></p> --%>
				<p class="pull-right">
					<span><input type="radio" class="w3-radio" name="agree3" value="1" checked style="width:20px;"/><label style="font-size:10pt;"> 동의</label></span>
					<span><input type="radio" class="w3-radio" name="agree3" value="0" style="width:20px;"/><label style="font-size:10pt;"> 동의 안함</label></span>
				</p>

			</div>
			<div class="w3-container w3-pale-yellow w3-border-top w3-border-grey detail">
				<%-- <p>
					<span style="font-size:10pt;"> <b> 제공 정보 상세 </b></span>
				</p> --%>
				<p style="font-size:9pt;">
					<img src="../images/shipping.png"/ class="agimg">
					<b>기부내역 3종(일자, 금액, 기부종류)</b>이 <b>'기부단체, 사회적 기업'</b>에 제공됩니다. <br> 필요시 [마이페이지]에서 연동 해제가 가능합니다.</p>
				<p style="font-size:9pt;">
					<img src="../images/good.png"/ class="agimg">
						<b>통합된 기부정보</b>를 제공받을 수 있어요.
				</p>
				<p style="font-size:9pt;">
					<img src="../images/bad.png"/ class="agimg">
					타기부단체로부터 <b>후원 상담전화</b>를 받을 수 있어요.
				</p>
			</div>

			<footer class="w3-container w3-grey" id="foot">

					<span class="w3-button w3-grey pull-right w3-text-white" id="getDon" onclick="document.getElementById('id04').style.display='none'">결과 제출</span>

			</footer>

		</div>
	</div>


</body>

</html>
