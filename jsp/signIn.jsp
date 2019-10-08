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
  		padding: 10px;
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

			document.getElementById("try").action = "http://"+ip+":8087/user/confirm";
			document.getElementById("try").submit();

		return false;
		}

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
    	<input type ="submit" value ="로그인" class="btn" onclick="signIn()" >
  	</div>
  </form>

  <form style="max-width:500px; margin:auto">
  	<div class="input-container" style="margin-top: 0px;">
			<input type = "submit" value ="회원가입" class="btn" style="max-width:50%; background:transparent; font-weight:normal; font-size:12px; padding-top:0px">
	 		<input type = "submit" value ="ID/PW 찾기" class="btn" style="background:transparent; font-weight:normal; font-size:12px; max-width: 50%; padding-top:0px">
  	</div>
	</form>

</body>

</html>
