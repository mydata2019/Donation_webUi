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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script type="text/javascript" src="../js/ip_config.js"></script>
  <script type="text/javascript" src="../js/linkByText.js"></script>
  <script type="text/javascript" src="../js/linkMain.js"></script>

  <style>

  html,body,h1,h2,h3,h4,h5 {font-family: "", sans-serif}

  .md-background2 {
    background-color : #E0E0E0;
    color : #424242;
  }

  #chartdiv {
    width: 100%;
    height: 500px;
  }

  .top select, input {
    margin-top: 5px;
  }
  </style>
</head>

<body class="w3-light-grey">

<!-- Top container -->
<div class="w3-bar w3-top w3-large md-background2" style="z-index:4">
  <button class="w3-bar-item w3-button w3-hide-large w3-hover-none" onclick="layerOpen('linkMain');"><i class="fa fa-arrow-left"></i></button>
  <span class="w3-bar-item w3-left" style="margin-left:-10px"><b>기부내역 등록하기</b></span>
</div>


<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">

  <form id="data-form">
    <div class="w3-container top">
      <div style="padding-top: 20px;">
        <label class="w3-text-grey"><b>기부기관</b></label>
        <select class="w3-select w3-border w3-white" name="org_id">
          <option value="" disabled selected>(선택)</option>
          <option value="1">국경없는 이사회</option>
          <option value="2">유니세프</option>
          <option value="3">세이브더칠드런</option>
          <option value="4">그린피스</option>
        </select>
      </div>
      <div style="padding-top: 20px;">
        <label class="w3-text-grey"><b>기부종류</b></label>
        <select class="w3-select w3-border w3-white" name="regu_yn">
          <option value="" disabled selected>(선택)</option>
          <option value="1">정기후원</option>
          <option value="2">비정기후원</option>
        </select>
      </div>
      <div style="padding-top: 15px;">
        <label class="w3-text-grey"><b>기부자명</b></label>
        <input class="w3-input w3-border" type="text" name="user_nm">
      </div>
      <div style="padding-top: 15px;">
        <label class="w3-text-grey"><b>기부일자</b></label>
        <input class="w3-input w3-border" type="text" name="don_dt" placeholder="ex. 20191011">
      </div>
      <div style="padding-top: 15px;">
        <label class="w3-text-grey"><b>기부금액(원)</b></label>
        <input class="w3-input w3-border" type="text" name="don_amt" placeholder="ex. 40000">
      </div>
      <div style="padding-top: 15px; padding-bottom: 20px;">
        <label class="w3-text-grey"><b>상세 활동 내역</b></label>
        <input class="w3-input w3-border" type="text" name="don_ctt" placeholder="ex. 국내 어린이 후원 캠페인">
      </div>

      <input type="hidden" name="user_id" value="1">

    </div>
    <div class="w3-bar w3-border-top w3-display-bottommiddle">
      <input type="button" class="w3-btn w3-bar-item w3-border-right w3-text-white"
        style="width:50%;padding-top:15px;padding-bottom:15px;margin-top:0px;background-color: #C0C0C0; font-weight:bold;"
         value="취소하기"
        onclick="location.href='./linkMain.jsp'">
      <input type="submit" class="w3-btn w3-bar-item w3-text-white"
        style="float:right;width:50%;padding-top:15px;padding-bottom:15px;margin-top:0px;background-color: #5BB4F0; font-weight:bold;"
         value="등록 요청"/>

    </div>
  </form>
  <!-- End page content -->
</div>

</body>
</html>
