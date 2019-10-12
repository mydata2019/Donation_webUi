
var userId=1;
var pntbamt;
var userNm;
var totalAmt = 0;
var subtotalAmt = 0;
var array = [];

$(document).ready(function(){

  console.log("present ip is "+ip);

  //userId =  document.getElementById("userId").value;

  if(userId != null){

    //Main정보 조회
    selectMainInfo(userId);

    //사용자명 맵핑
    document.getElementById("userNm").innerHTML="테스트";
    document.getElementById("userNmSide").innerHTML="테스트";
  }

});

//페이지 이동
function layerOpen(id) {
    console.log("id is "+id);
    location.href="./"+id+".jsp?userId="+userId;
};


//기부내역 & 포인트 잔액 조회
function selectMainInfo(userId){
	console.log("userId > "+JSON.stringify(userId));
  //기부포인트
  pntBamt = "5,770"; //data.pntBamt;
  document.getElementById("pntBamt").innerHTML=pntBamt;

  //총 기부금액
  viewTotalAmt(577000);

  /*
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

        console.log("pnt bamt > "+data.pntBamt);

        //기부포인트
        pntBamt = "5,700"; //data.pntBamt;
        document.getElementById("pntBamt").innerHTML=pntBamt;

        //기부내역 명세

        data["hstResultSpc"].forEach(function (rowSpc, i) {

          var orgId = rowSpc['org_id'];
          var orgNm = rowSpc['org_nm'];

          subtotalAmt = rowSpc['sub_don_amt'];    //기부단체별 기부금액 합계
          userNm = rowSpc['user_nm'];             //사용자명

          var cnt = 0;
          var donDtDtl = [];
          var donAmtDtl = [];
          var donCttDtl = [];
          var regNmDtl = [];

          data["hstResult"].forEach(function (row, i) {

            if(orgId == row['org_id']){

              totalAmt = totalAmt+Number(row['don_amt'].replace(",", ""));
              donDtDtl.push( row['don_dt']);
              donAmtDtl.push( row['don_amt'].replace(",", ""));
              donCttDtl.push( row['don_ctt']);
              regNmDtl.push( row['regu_nm']);

              cnt = cnt+1;

            }else{
                return false;
            }

          });

          var liStr = "";
          for (var k=0; k<cnt; k++ ){
            //화면
            liStr = liStr+'<li><span>'+donDtDtl[k].substr(0,4)+'-'+donDtDtl[k].substr(4,2)+'-'+donDtDtl[k].substr(6,2)+'</span></li><li><span>'+regNmDtl[k]+' ( '+donCttDtl[k]+' )</span></li><li style="border-bottom:1px solid #d9d9d9"><span>'+donAmtDtl[k]+'원</span></li>';
            //다운로드
            array.push({Donation_Organization:orgNm, Donation_TotalAmt:subtotalAmt.replace(",", ""),
                        Donation_Date:donDtDtl[k].substr(0,4)+'-'+donDtDtl[k].substr(4,2)+'-'+donDtDtl[k].substr(6,2),
                        Donation_Regular:regNmDtl[k], Donation_Reason:donCttDtl[k],
                        Donation_Amt:donAmtDtl[k]});
          }

          $('#container .chargeList ').append('\
              <li>\
                <a href="javascript:;" style="text-decoration:none">'+orgNm+'\
                <span class="w3-right" style="color:#646464; padding-right:30px;">'+subtotalAmt+'원</span>\
                </a>\
                <ul class="dataList">'+liStr+'</ul>\
              </li>');

        }); //end of spc

        //총 기부금액
        viewTotalAmt(577000);

			},
			error: function (data){
				console.log("통신Error OR 없는 고객");

			}
	});

		return false;
*/
};

//총 기부금액
function viewTotalAmt(totalAmt){

  var comma_separator_number_step = $.animateNumber.numberStepFactories.separator(',');

  $('#totalAamt').animateNumber(
    {
      number: totalAmt,
      numberStep: comma_separator_number_step
    },  1000
  );

};

//기부내역 다운로드
function downloadHst() {

		var a = "기부단체, 총 기부금액, 기부일자, 정기후원여부, 상세사유, 기부금액\r\n"+
    "굿네이버스, 570000원, 2019년 05월 01일, 정기후원, 결식아동, 39600\r\n"+
    "굿네이버스, 570000원, 2019년 06월 01일, 정기후원, 결식아동, 39600\r\n"+
    "굿네이버스, 570000원, 2019년 07월 01일, 정기후원, 결식아동, 39600\r\n"+
    "월드비전, 7000원, 2019년 05월 01일, 일시후원, 해외난민, 7000";

		$.each(array, function(i, item){
			a += item.Donation_Organization + "," + item.Donation_TotalAmt + "," +
           item.Donation_Date + "," + item.Donation_Regular +","+
           item.Donation_Reason + "," + item.Donation_Amt+"\r\n";
		});

		// jquery 사용하지 않는 경우
		/* for(var i=0; i<array.length; i++){
			a += array[i].name + "," + array[i].age + "," + array[i].test + "\r\n";
		} */
    console.log('before making link a >>>'+a);
		var downloadLink = document.createElement("a");
		var blob = new Blob(["\ufeff"+a], { type: "text/csv;charset=utf-8" });
		var url = URL.createObjectURL(blob);
		downloadLink.href = url;
		downloadLink.download = "data.csv";

		document.body.appendChild(downloadLink);
		downloadLink.click();
		document.body.removeChild(downloadLink);
};
