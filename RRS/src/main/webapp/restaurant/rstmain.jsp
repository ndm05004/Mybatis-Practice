<%@page import="rrs.vo.RestautantVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel='shortcut icon' type='image/x-icon' href='../images/panda.png' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script>
<%
	RestautantVO resVo = (RestautantVO) session.getAttribute("loginRst");
%>
$(function(){
	home = $('#home').text();
	resId = "<%=resVo.getRst_id()%>";
	$.ajax({
		url : '<%=request.getContextPath()%>/selectRst.do',
		type : 'get',
		data : {"id": resId},
		success :function(res){
			nm = res.rst_name;
			console.log(res);
			code = `<fieldset> <legend style="font-weight:bold"> ${home}</legend><br><p id="fileimg"></p>`
			code += `<img id="rstphoto"src="<%=request.getContextPath()%>/rstimg.do?photo=${res.rst_photo}"> <br>`
			code += `<label> 상호명 </label><p class="p1">${res.rst_name}</p><p><input type="hidden" value="${res.rst_name}"name="rstname" readonly></p><br>`;
			code += `<label> 사업장 주소 </label> <p class="p1"> ${res.rst_addr}</p><p><input type="hidden" value="${res.rst_addr}"name="rstaddr" style="width:500px;"></p><br>`;
			code += `<label> 사업자 ID </label> <p class="p1"> ${res.rst_id}</p><p><input type="hidden" value="${res.rst_id}"name="rstid" readonly></p><br>`;
			code += `<label> 사업자 비밀번호 </label> <p class="p1">******</p><p><input type="hidden" value="${res.rst_pass}"name="rstpass" id="pwd"></p><br>`;
			code += `<label> 사업자번호 </label>  <p class="p1">${res.bs_num}</p><p><input type="hidden" value="${res.bs_num}"name="rstnum" readonly></p><br>`;
			code += `<label> 사업자 연락처 </label>  <p class="p1">${res.rst_tel}</p><p><input type="hidden" value="${res.rst_tel}"name="rsttel" ></p><br>`;
			code += `<label> 사업장 설명 </label> <p class="p1"> ${res.rst_info}</p><p><input type="hidden" value="${res.rst_info}"name="rstinfo" ></p><br>`;
			code += `<label> E - Mail </label> <p class="p1"> ${res.rst_mail}</p><p><input type="hidden" value="${res.rst_mail}"name="rstmail" ></p><br>`;
			code += `<label> 휴무일 설정 </label>  <p class="p1">${res.closedday}</p><p><input type="hidden" value="${res.closedday}"name="rstclose" ></p><br>`;
			code += `<label> OPEN TIME </label> <p class="p1">${res.opentime}</p><p><input type="hidden" value="${res.opentime}"name="restopen" ></p><br>`;
			code += `<label> CLOSE TIME </label> <p class="p1"> ${res.closetime}</p><p><input type="hidden" value="${res.closetime}"name="restcltime" ></p><br>`;
			code += `<label> 카테고리 </label>  <p class="p1">${res.ctg_id}<br> </p><p><input type="hidden" value="${res.ctg_id}"name="rstctg" readonly></p>`;
			code += `</fieldset>`;
			$('#form').html(code);
			$('#title').html(res.rst_name);
		},
		error : function(xhr){
			alert("상태 : "+xhr.status)
		},
		dataType: 'json'
	})
	
	// 수정버튼 클릭시 완료버튼 출력 및 히든>text로 변경
	$('#modify').on('click',function(){
	$('.p1').css('display','none');
	hiddenInputs = document.querySelectorAll('input[type="hidden"]');
		for (var i = 0; i < hiddenInputs.length; i++) {
	 		 hiddenInputs[i].setAttribute('type', 'text');
			}
	
	$('#modify').hide();
	done = `<input type="submit" value="완료" id="wan" class="btn btn-outline-primary" >`
	file =`<input type="file" value="사진선택"name="rstphoto">`
	$('#form').append(done);
	$('#fileimg').html(file);
})
//비밀번호 정규식
// $('#pwd').on('keyup',function(){
// 		pwdval = $('#pwd').val().trim();
// 		passreg = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*?]).{5,30}$/;
// 		regCheck(passreg,pwdval,this);
// 	})
// //정규식 체크
// 	function regCheck(reg,value,ele) {
// 		if(!(reg.test(value))){
// 			$(ele).css('border','2px solid red')
// 		}else {
// 			$(ele).css('border','2px solid green')
// 		}
// 	}
})


</script>
<style>
#bigtitle{

font-size : 30px;
font-weight : bold;
}
#logo{
width : 180px;
height : 60px;

}
body {font-family: "Lato", sans-serif;}
.jumbotron h1 {
  color: white;
  font-weight: bold;
}
.jumbotron p {
  color: white;
}
.btn-group img {
  width: 100px;
  height: 100px;
  margin-right: 10px;
}
.jumbotron {
  overflow-x: auto;
  white-space: nowrap;
}
.carousel-item {
  height: 600px; /* 높이 값은 원하는 값으로 변경해주세요 */
}
.carousel-item img {
  height: 100%;
  object-fit: cover;
  width: 100%;
}
.btn {
    width: 400px; /* 버튼 가로 길이 */
    height: 50px; /* 버튼 높이 */
  }
  
  @media (max-width: 768px) {
  .btn {
    width: 100%;
    height: 50px;
  }
}
.sidebar {
  height: 100%;
  width: 200px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #28AEFF;
  overflow-x: hidden;
  padding-top: 16px;
}

.sidebar a {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 20px;
  color: black;
  display: block;
}

.sidebar a:hover {
  color: #f1f1f1;
}

.main {
  margin-left: 200px; /* Same as the width of the sidenav */
  padding: 0px 10px;
  height : 1000px;
}
#title{
	font-weight: bold;
	font-size: 30px;
	margin-left: 15px;
	height : 50px;

}
#selectRst{
margin-top : 30px;
margin-left : 200px;

}

hr{
color : black;
}
#navi{

margin-left: 200px;
}
#modify,#wan{

float: right;
margin-right : 500px;
width : 100px;
height: 50px;
}
label{
font-weight: bold;
}
#rstphoto{
width : 300px;
height : 300px;
}

@media screen and (max-height: 450px) {
  .sidebar {padding-top: 15px;}
  .sidebar a {font-size: 18px;}
}

.dropdown-menu {
  width: 200px;
  text-align: center;
}
</style>

</head>
<body>
<nav id="navi" class="navbar navbar-expand-md navbar-light bg-light">
  <img src="../images/로고.png"alt="tablemate.png" id="logo"><a class="navbar-brand" href="#" id="bigtitle"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">카테고리</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">예약하기</a>
      </li>
<%
	if(session.getAttribute("loginRst") == null) {
%>
      <li class="nav-item">
        <a class="nav-link" href="#">로그인</a>
      </li>
<%
	} else {
%>
      <li class="nav-item dropdown">
	    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	      <svg xmlns="http://www.w3.org/2000/svg" height="28" viewBox="0 96 960 960" width="28">
	        <path d="M222 801q63-44 125-67.5T480 710q71 0 133.5 23.5T739 801q44-54 62.5-109T820 576q0-145-97.5-242.5T480 236q-145 0-242.5 97.5T140 576q0 61 19 116t63 109Zm257.814-195Q422 606 382.5 566.314q-39.5-39.686-39.5-97.5t39.686-97.314q39.686-39.5 97.5-39.5t97.314 39.686q39.5 39.686 39.5 97.5T577.314 566.5q-39.686 39.5-97.5 39.5Zm.654 370Q398 976 325 944.5q-73-31.5-127.5-86t-86-127.266Q80 658.468 80 575.734T111.5 420.5q31.5-72.5 86-127t127.266-86q72.766-31.5 155.5-31.5T635.5 207.5q72.5 31.5 127 86t86 127.032q31.5 72.532 31.5 155T848.5 731q-31.5 73-86 127.5t-127.032 86q-72.532 31.5-155 31.5ZM480 916q55 0 107.5-16T691 844q-51-36-104-55t-107-19q-54 0-107 19t-104 55q51 40 103.5 56T480 916Zm0-370q34 0 55.5-21.5T557 469q0-34-21.5-55.5T480 392q-34 0-55.5 21.5T403 469q0 34 21.5 55.5T480 546Zm0-77Zm0 374Z"/>
	      </svg>
	    </a>
	    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
	      <span class="dropdown-item-text"><%=resVo.getRst_name()%>님 환영합니다!</span>
	      <a class="dropdown-item" href="#!">마이페이지</a>
	      <a class="dropdown-item" href="<%=request.getContextPath()%>/memlogout.do">로그아웃</a>
	    </div>
	  </li>
<%
	}
%>       
      
      
      
      
    </ul>
  </div>
</nav>
<div class="sidebar">
  <a href="rstmain.jsp" id="title"></a>
 <hr>
  <a href="#home" id="home"><i class="fa fa-fw fa-home"></i> 내 가게 정보</a>
  <a href="#services" id="service"><i class="fa fa-fw fa-wrench"></i> 메뉴관리</a>
  <a href="#clients" id="clients"><i class="fa fa-fw fa-user"></i> 예약관리</a>
  <a href="#contact" id="contact"><i class="fa fa-fw fa-envelope"></i> 리뷰관리</a>
</div>

<!-- 메인 페이지 노출 영역 -->
<div class="main" >
	<div id="selectRst">
	<form id="form" action="<%=request.getContextPath()%>/modifyRst.do" method="post" enctype="multipart/form-data">
	
	
	</form>
	</div>
	
	<input type="button" value="수정" id="modify"  class="btn btn-outline-primary" >
	
</div>

</body>
</html> 