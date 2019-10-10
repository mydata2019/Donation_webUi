$(document).ready(function () {

  console.log("present ip is "+ip);

  $("#data-form").submit(function (event) {
	    // 폼 기본 제출 막기
	    event.preventDefault();

      var $form = $(this),
        id = $form.find("input[name='id']").val(),
        pw = $form.find("input[name='pw']").val(),
        user_id = $form.find("input[name='user_id']").val(),
        org_id = $form.find("input[name='org_id']").val();

      // API 에 맞게 데이터를 조합하기
      var data = {id: id, pw: pw, user_id: user_id, org_id: org_id};

	    var url = 'http://'+ip+':8081/Interface/Auth';
	    // POST 로 데이터 보내기
	    $.ajax({
	      url: url,
	      type: 'POST',
	      data: JSON.stringify(data),
	      contentType: "application/json; charset=utf-8",
	      dataType: "text",
	      async: false,
	      success: function (result) {
            document.getElementById('id01').style.display='block';
	      },
        error: function (request, status, error) {
            alert('실패 : '+error+', reqcode:' +request.status+', mesg:' + request.responseText);
        }
	    });
	  });


    $("#getDon").click(function (event) {
  	    // 폼 기본 제출 막기
  	    event.preventDefault();

  	    var $form = $("#data-form"),
  	      id = $form.find("input[name='id']").val(),
  	      user_id = $form.find("input[name='user_id']").val(),
  	      org_id = $form.find("input[name='org_id']").val();

  	    // API 에 맞게 데이터를 조합하기
  	    var data = {id: id, user_id: user_id, org_id: org_id};

  	    var url = 'http://'+ip+':8081/Interface/GetDonation';

  	    // POST 로 데이터 보내기
  	    $.ajax({
  	      url: url,
  	      type: 'POST',
  	      data: JSON.stringify(data),
  	      contentType: "application/json; charset=utf-8",
  	      dataType: "text",
  	      async: false,
  	      success: function (result) {
            document.getElementById('id01').style.display='none';
            document.getElementById('id02').style.display='block';
  	      }
  	    });

  	  });

});
