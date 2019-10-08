$(document).ready(function () {

  $("#data-form").submit(function (event) {
		alert("기부이력 가져오기 실행");
	    // 폼 기본 제출 막기
	    event.preventDefault();

	    var $form = $(this),
	      user_id = $form.find("input[name='user_id']").val(),
	      org_id = $form.find("select[name='org_id']").val(),
	      regu_yn = $form.find("select[name='regu_yn']").val(),
	      user_nm = $form.find("input[name='user_nm']").val(),
	      don_dt = $form.find("input[name='don_dt']").val(),
        don_amt = $form.find("input[name='don_amt']").val(),
	      don_ctt = $form.find("input[name='don_ctt']").val();

	    // API 에 맞게 데이터를 조합하기
	    var data = {USER_ID: user_id, ORG_ID: org_id, REGU_YN: regu_yn,
      USER_NM: user_nm, DON_DT: don_dt, DON_AMT: don_amt, DON_CTT: don_ctt};

	    var url = 'http://localhost:8089/history/insertHistoryText';

	    // POST 로 데이터 보내기
	    $.ajax({
	      url: url,
	      type: 'POST',
	      data: JSON.stringify(data),
	      contentType: "application/json; charset=utf-8",
	      dataType: "json",
	      async: false,
	      success: function (result) {
	          alert('성공여부 : ' + result.result);
	      }
	    });

	  });

});
