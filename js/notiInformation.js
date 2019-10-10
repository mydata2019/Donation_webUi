var userNm;
var userId;
var slideIndex = 1;

$(document).ready(function () {
	// var url = document.URL;
	//	parseURL(url);
	userId = document.getElementById("userId").value;
	selectMainInfo(userId);

	showDivs(slideIndex);

	//사용자명 맵핑
	document.getElementById("userNmSide").innerHTML=userNm;
});

// 사용자 정보
function selectMainInfo(userId){
	console.log("userId > "+JSON.stringify(userId));

	$.ajax({
			url: 'http://'+ip+':8089/history/selectMain',
			type: 'POST',
			data: userId,
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			async: false,
			success: function (data) {

				data = JSON.stringify(data);
				data = JSON.parse(data);

        //기부내역 명세
        data["hstResultSpc"].forEach(function (rowSpc, i) {
          userNm = rowSpc['user_nm'];             //사용자명
					document.getElementById("userNmSide").innerHTML=userNm;

        }); //end of spc

			},
			error: function (data){
				console.log("통신Error OR 없는 고객");
			}
		});

		return false;

}

//페이지 이동
function layerOpen(id) {
    console.log("id is "+id);
    location.href="./"+id+".jsp?userId="+userId;
}

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  x[slideIndex-1].style.display = "block";
}



// Toggle between showing and hiding the sidebar, and add overlay effect
function w3_open() {

  // Get the Sidebar
  var mySidebar = document.getElementById("mySidebar");
  // Get the DIV with overlay effect
  var overlayBg = document.getElementById("myOverlay");

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
  // Get the Sidebar
  var mySidebar = document.getElementById("mySidebar");
  // Get the DIV with overlay effect
  var overlayBg = document.getElementById("myOverlay");

  mySidebar.style.display = "none";
  overlayBg.style.display = "none";
}
