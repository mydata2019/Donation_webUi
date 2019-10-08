
//이전 화면에서 넘어온 input values
var sv_acnt_num;
var result;

var pageNum = 1;
var lastPage;

$(document).ready(function () {
	var url = document.URL;
//	parseURL(url);
	var sv_acnt_num = document.getElementById("SV_ACNT_NUM").value;
	find_chrg_hst(sv_acnt_num);
});

function parseURL(url) {

    var parser = document.createElement('a'),
        searchObject = {},
        queries, split, i;

    // Let the browser do the work
    parser.href = url;

    // Convert query string to object
    queries = parser.search.replace(/^\?/, '').split('&');
    for( i = 0; i < queries.length; i++ ) {
        split = queries[i].split('=');
        searchObject[split[0]] = split[1];
				console.log("  split   "+  split[0]);

				var decoded = decodeURI(split[1]);
				console.log("decoded  "+decoded);
				if("RESULT" == split[0]){
					var rsltVal1 = decoded.split['['];
					var rsltVal2 = rsltVal1.split['{'];
					console.log("rsltVal2  "+rsltVal2);
				}
    }
}



//충전이력 조회
function find_chrg_hst(sv_acnt_num){

	var svAcntNum = sv_acnt_num;
	console.log("sv_acnt_num "+svAcntNum);

	var data = {
		"svAcntNum" : svAcntNum,
		"pageNum" : pageNum
	}

	$.ajax({
		//url: 'http://localhost:8083/charging/selectHst',
		//url: 'http://localhost:8000/core/charging/selectHst',	//local
		//url: 'http://a75b30f27972711e9a5260241e1ca044-1071553545.ap-northeast-2.elb.amazonaws.com:8000/core/charging/selectHst',
		// url: 'http://a819dbefea6d111e9a5260241e1ca044-2045704601.ap-northeast-2.elb.amazonaws.com:8000/core/charging/selectHst',
		url: 'http://localhost:8090/statistics/selectStatistics',
		type: 'POST',
		data: JSON.stringify(data),
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		async: false,
		success: function (data) {
			data = JSON.stringify(data);
			data = JSON.parse(data);
			console.log("length > "+data.list.length);

			data.list.forEach(function (row) {
				console.log("result > "+row['OP_DT']);
				var yr = row['OP_DT'].substr(0,4);
				var mnth = row['OP_DT'].substr(5,2);
				var dy = row['OP_DT'].substr(8,2);

				pageNum = row['PAGE_NUM'];
				lastPage = row['LAST_PAGE'];

				$('#container .chargeList ').append('\
				<li>\
						<a href="javascript:;">\
								'+yr+'년 '+mnth+'월 '+dy+'일 충전결과\
						</a>\
						<ul class="dataList">\
								<li>\
										<span>충전일시</span>\
										<span>'+row['OP_DT'].substr(0,19)+'</span>\
								</li>\
								<li>\
										<span>처리결과</span>\
										<span>'+(row['NORM_OP_YN'] == '1'?'성공':'9'?'실패':'처리중')+'</span>\
								</li>\
								<li>\
										<span>카드번호</span>\
										<span>'+row['CARD_NUM']+'</span>\
								</li>\
								<li>\
										<span>충전구분</span>\
										<span>BAND 전용카드</span>\
								</li>\
								<li>\
										<span>카드종류</span>\
										<span class="point">'+row['VCR_BOOK_TYP_NM']+'</span>\
								</li>\
								<li>\
										<span>충전금액</span>\
										<span class="point">'+row['CHRG_AMT']+'원</span>\
								</li>\
								<li>\
										<span>결제수단</span>\
										<span>'+row['SETTL_WAY_NM']+'</span>\
								</li>\
								<li>\
										<span>카드사</span>\
										<span>'+(row['BANK_CARD_CO_NM']==null?'없음':row['BANK_CARD_CO_NM'])+'</span>\
								</li>\
								<li>\
										<span>유효시작일</span>\
										<span>'+row['EFF_STA_DT']+'</span>\
								</li>\
								<li>\
										<span>유효종료일</span>\
										<span>'+row['EFF_END_DT']+'</span>\
								</li>\
						</ul>\
				</li>');

			});

			console.log("pageNum "+pageNum);
			console.log("lastPage "+lastPage);

			$('#container .btnArea ').empty();
			if(pageNum<lastPage) {
				$('#container .btnArea ').append('\
					<button type="button" class="btnL" onClick="javascript:find_chrg_hst('+sv_acnt_num+');">더보기 ('+pageNum+'/'+lastPage+')</button>');
				pageNum++;
			} else {
				$('#container .btnArea ').remove();
			}
		},
		error: function (data){
			alert("충전이력 조회 중 오류 발생");
			console.log("통신Error OR 없는 고객");
			return false;
		}
	});

	return true;

}
