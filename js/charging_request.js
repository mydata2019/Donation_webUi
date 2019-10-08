

//이전 화면에서 넘어온 input values
var sv_acnt_num;
var corp_nm;
//현재 화면에서 사용하는 input values
var mvnoCoCd;
var payMthd;
var opDt;
var userId;
var orgId;
var payAmt;
var cardNum = "";
var payMthd;
var bankCardCoCd;
var pwd = "";


$(document).ready(function () {

	var date = new Date();
	var year = date.getFullYear();
	var month = new String(date.getMonth()+1);
	var day = new String(date.getDate());

	if(month.length == 1){
		  month = "0" + month;
	}
	if(day.length == 1){
		  day = "0" + day;
	}
	opDt = year + "" + month + "" + day;
	userId = 'j1';
	orgId = 'test';
	sv_acnt_num =  document.getElementById("SV_ACNT_NUM").value;

	if(sv_acnt_num != null){
		mvnoCoCd =  document.getElementById("MVNO_CO_CD").value;
		select_card_type(mvnoCoCd);
	}


});

//서비스 기본정보 조회(현재 사용 안 함)
/*function find_svc_info(){

	console.log("svAcntNum > "+sv_acnt_num);

	$.ajax({
		url : 'http://localhost:8080/CustomerInfo',
		type : 'POST',
		data : JSON.stringify(sv_acnt_num),
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		async : false,
		success : function(data) {
			console.log('result >> '+JSON.stringify(data));

			sv_acnt_num = data.sv_ACNT_NUM;
			corp_nm= data.mvno_CO_CD;

			var SVC_NUM_FST = data.svc_NUM.substr(0,3);
			var SVC_NUM_MID = data.svc_NUM.substr(3,4);//.replace(/(?<=.{2})./gi, "*");
			var SVC_NUM_LST = data.svc_NUM.substr(7,4);//.replace(/(?<=.{2})./gi, "*");
			var SVC_NUM = SVC_NUM_FST + '-' + SVC_NUM_MID + '-' + SVC_NUM_LST;

			document.getElementById("custNm").innerHTML = data.cust_NM;
			document.getElementById("svcNum").innerHTML = SVC_NUM;
		},
		error : function(data) {
			alert("통신Error OR 없는 고객");
			return false;
		}
	});

 	return true;

};*/

//사업자별 충전 권종 조회
function select_card_type(mvnoCoCd){
	console.log("mvnoCoCd > "+JSON.stringify(mvnoCoCd));

	$.ajax({
			//url: 'http://localhost:8087/pay/select',
			//url: 'http://localhost:8000/means_real/pay/select',	//local
			//url: 'http://a75b30f27972711e9a5260241e1ca044-1071553545.ap-northeast-2.elb.amazonaws.com:8000/means_real/pay/select',
			url: 'http://a819dbefea6d111e9a5260241e1ca044-2045704601.ap-northeast-2.elb.amazonaws.com:8000/means_real/pay/select',
			type: 'POST',
			data: JSON.stringify(mvnoCoCd),
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			async: false,
			success: function (data) {

				data = JSON.stringify(data);
				data = JSON.parse(data);

				data.list.forEach(function (row) {
						$('#billSel .billList').append('<li><a href="javascript:;">\
	                <span>\
	                    <i class="name">'+row['VCR_CARD_MDL_NM']+'</i>\
	                    음성/MMS 무제한<br>\
	                    부가음성/영상 '+row['ADD_VOICE_OFR_QTY']+'분<br>\
	                    데이터 '+(row['DATA_OFR_QTY'].length >= 5?row['DATA_OFR_QTY']+'MB':row['DATA_OFR_QTY']+'GB')+'\
	                </span>\
	                <span>월 <i class="price">'+row['VCR_CARD_BAS_AMT']+'</i>원</span>\
	            </a></li>');

				});
			},
			error: function (data){
				console.log("통신Error OR 없는 고객");
			}
		});
		console.log('span  '+$('#billSel .billList li a').text());
		return false;

};


//충전
function go_to_chrg(){

	var payAmt = billPrice;
	var payMthd = payMthdUi;
	var bankCd = "";
	var crdCardNum = "";
	var bankCd = "";

	//신용카드
  if(payMthd == '1'){

			  bankCd = (bankCardCoCd=='삼성'?'A1501':bankCardCoCd=='신한'?'A1502':bankCardCoCd=='우리'?'A1503':bankCardCoCd=='롯데'?'A1504':bankCardCoCd=='현대'?'A1505':
				 						  bankCardCoCd=='비씨'?'A1506':bankCardCoCd=='국민'?'A1507':bankCardCoCd=='외환'?'A1508':bankCardCoCd=='씨티'?'A1510':bankCardCoCd=='NH'?'A15011':
										  bankCardCoCd=='하나'?'A1512':bankCardCoCd=='전북'?'A1513':bankCardCoCd=='카카오뱅크'?'A1514':bankCardCoCd=='케이뱅크'?'A1515':null);
				crdCardNum = document.getElementById('creditCardNum').value;
			  pwd = document.getElementById('passWord').value;

				var check = checkValidation(crdCardNum, pwd);
				console.log("pwd > "+pwd);

				if (check == false) {
					alert("카드정보를 정확히 입력해주세요.");
					return false;
				}
	}

	console.log("test 1 "+sv_acnt_num);
	console.log("test 2 "+mvnoCoCd);

			$("#svAcntNum").val(sv_acnt_num);
			$("#opDt").val(opDt);
			$("#userId").val(userId);
			$("#orgId").val(orgId);
			$("#payAmt").val(payAmt.replace(',', ''));
			$("#cardNum").val(cardNum);
			$("#payMthd").val(payMthd);
			$("#crdCardNum").val(crdCardNum);
			$("#bankCardCoCd").val(bankCd);
			$("#pwd").val(pwd);
			$("#mvnoCoCd").val(mvnoCoCd);

			console.log("test 3 "+document.getElementById('creditCardNum').value);
			console.log("test 4 "+document.getElementById('mvnoCoCd').value);

			//document.getElementById("chrg").action = "http://localhost:8083/charging/chrgProc";
			//document.getElementById("chrg").action = "http://localhost:8000/core/charging/chrgProc";	//local
			//document.getElementById("chrg").action = "http://a75b30f27972711e9a5260241e1ca044-1071553545.ap-northeast-2.elb.amazonaws.com:8000/core/charging/chrgProc";
			document.getElementById("chrg").action = "http://a819dbefea6d111e9a5260241e1ca044-2045704601.ap-northeast-2.elb.amazonaws.com:8000/core/charging/chrgProc";
			document.getElementById("chrg").submit();

		return false;

/*			var obj = new Object();
			obj.svAcntNum = sv_acnt_num;
			obj.opDt = opDt;
			obj.userId = userId;
			obj.orgId = orgId;
			obj.payAmt = payAmt.replace(',', '');
			obj.cardNum = cardNum;
			obj.payMthd = payMthd;
			obj.crdCardNum = crdCardNum;
			obj.bankCardCoCd = bankCd;
			obj.pwd = pwd;
			obj.mvnoCoCd = mvnoCoCd;
			console.log("obj in js > "+JSON.stringify(obj));


			$.ajax({
					url: 'http://localhost:8083/charging/chrgProc',
					type: 'POST',
					data: JSON.stringify(obj),
					contentType: "application/json; charset=utf-8",
					dataType: "json",
					async: false,
					success: function (data) {
					 console.log("restAPI insert success");
					},
					error: function (data){
						console.log("통신Error OR 없는 고객");
					}
				});
*/

};

//난수생성
function generateRandom(min, max){
	var num = Math.floor(Math.random()*(max-min+1))+min;
	return num;
}

function getRealCardNum(min, max){
	var RanCardNum = generateRandom(min, max);
	console.log("RanCardNum  "+RanCardNum);

	return RanCardNum;
}

//BAND 실물카드번호 채번
function getBandCardNum(){
	cardNum = getRealCardNum(11111111111, 99999999999);
	document.getElementById('realCardNum').value = cardNum;
	console.log("cardNum   "+document.getElementById('realCardNum').value);
}


//신용카드정보 유효성 체크
function checkValidation(cardNum, passWord) {
console.log("1  "+cardNum.length+"  2   "+passWord.length);
	if (cardNum.length != 16)
		return false;

	if (passWord.length != 2)
		return false;

	return true;
}
