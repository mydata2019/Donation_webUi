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

  <input type="hidden" id="userId" name="userId" value=${param.userId} />

  <!-- Resources -->
  <script src="https://www.amcharts.com/lib/4/core.js"></script>
  <script src="https://www.amcharts.com/lib/4/charts.js"></script>
  <script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
  <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
  <script type="text/javascript" src="../js/ip_config.js"></script>
  <script type="text/javascript" src="../js/linkMain.js"></script>

  <style>

  html,body,h1,h2,h3,h4,h5 {font-family: "", sans-serif}

  .md-background2 {
    background-color : #E0E0E0;
    color : #424242;
  }
  </style>
</head>

<body class="w3-white">

<!-- Top container -->
<div class="w3-bar w3-top w3-large md-background2" style="z-index:4">
  <button class="w3-bar-item w3-button w3-hide-large w3-hover-none" onclick="layerOpen('linkMain');"><i class="fa fa-arrow-left"></i></button>
  <span class="w3-bar-item w3-left" style="margin-left:-10px"><b>연동 관리</b></span>
</div>


<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">
  <div class="w3-container w3-large w3-light-grey">
    <div class="w3-left-align" style="font-size:16px;">
      <p><b>개인별 연동이력 상세</b>
      </p>
    </div>
  </div>
  <div class="w3-container w3-white" id="org" style="padding-top:20px;padding-bottom:0px;">
    <table class="w3-table w3-bordered w3-striped w3-border test w3-hoverable w3-table-all w3-small">
    <tbody><tr class="w3-grey w3-text-white">
      <th>연동기업</th>
      <th>연동방법</th>
      <th>연동일자</th>
    </tr>
    </tbody><tbody>
    <tr>
      <td>유니세프</td>
      <td>API 연동</td>
      <td>2019-10-12 03:04:03</td>
    </tr>
    <tr>
      <td>유니세프</td>
      <td>직접입력</td>
      <td>2019-10-11 21:24:49</td>
    </tr>
    <tr>
      <td>국경없는의사회</td>
      <td>API 연동</td>
      <td>2019-10-11 20:13:43</td>
    </tr>
    <tr>
      <td>월드비전</td>
      <td>API 연동</td>
      <td>2019-10-08 10:59:22</td>
    </tr>
    <tr>
      <td>그린피스</td>
      <td>직접입력</td>
      <td>2019-10-07 14:04:02</td>
    </tr>
    <tr>
      <td>세이브더칠드런</td>
      <td>직접입력</td>
      <td>2019-10-06 16:50:52</td>
    </tr>
    <tr>
      <td>유니세프</td>
      <td>API 연동</td>
      <td>2019-10-05 10:24:49</td>
    </tr>
    <tr>
      <td>국경없는의사회</td>
      <td>API 연동</td>
      <td>2019-10-04 18:13:43</td>
    </tr>
    <tr>
      <td>월드비전</td>
      <td>API 연동</td>
      <td>2019-10-01 10:59:22</td>
    </tr>
    <tr>
      <td>그린피스</td>
      <td>직접입력</td>
      <td>2019-10-05 14:04:02</td>
    </tr>
    <tr>
      <td>세이브더칠드런</td>
      <td>직접입력</td>
      <td>2019-10-07 16:50:52</td>
    </tr>
    <tr>
      <td>국경없는의사회</td>
      <td>API 연동</td>
      <td>2019-10-05 18:13:43</td>
    </tr>
    <tr>
      <td>월드비전</td>
      <td>API 연동</td>
      <td>2019-10-01 10:59:22</td>
    </tr>
    <tr>
      <td>그린피스</td>
      <td>직접입력</td>
      <td>2019-10-05 14:04:02</td>
    </tr>
    <tr>
      <td>세이브더칠드런</td>
      <td>직접입력</td>
      <td>2019-10-07 16:50:52</td>
    </tr>
    </tbody>
    </table>

  </div>
  <!-- End page content -->
</div>

</body>
</html>
