var userId;

$(document).ready(function(){

  console.log("present ip is "+ip);
  userId =  document.getElementById("userId").value;

});

function to_back(){
  console.log("back");
  // location.href="./mainMyDon.jsp?userId="+userId;
  location.href="./mainMyDon.jsp?userId=1";
}

//페이지 이동
function layerOpen(id) {
    console.log("id is "+id);
    // location.href="./"+id+".jsp?userId="+userId;
    location.href="./"+id+".jsp?userId=1";

//    location.href='./linkByAPI.jsp?user_id=1&org_id=1'
};
