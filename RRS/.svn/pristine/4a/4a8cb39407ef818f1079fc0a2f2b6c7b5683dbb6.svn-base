<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel='shortcut icon' type='image/x-icon' href='../images/panda.png' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script>
$(function(){
	$.ajax({
		url : '<%=request.getContextPath()%>/selectRst.do',
		type : 'get',
		data : {"id":"123"},
		success :function(res){
			code = "";
			code += "<h1>"+res.rst_id+"<h1>""
			
			
		},
		error : function(xhr){
			alert("상태 : "+xhr.status)
		},
		dataType: 'json'
	})
})


</script>
<style>
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
  height : 700px;
}
#title{
	font-weight: bold;
	font-size: 30px;
	margin-left: 15px;
	height : 50px;

}

hr{
color : black;
}
#navi{

margin-left: 200px;
}
@media screen and (max-height: 450px) {
  .sidebar {padding-top: 15px;}
  .sidebar a {font-size: 18px;}
}
</style>
</head>
<body>
<nav id="navi" class="navbar navbar-expand-md navbar-light bg-light">
  <a class="navbar-brand" href="#">네비게이션 로고</a>
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
      <li class="nav-item">
        <a class="nav-link" href="#">로그인</a>
      </li>
    </ul>
  </div>
</nav>
<div class="sidebar">
  <a href="rstmain.jsp" id="title">대덕식당</a>
 <hr>
  <a href="#home"><i class="fa fa-fw fa-home"></i> 내 가게 정보</a>
  <a href="#services"><i class="fa fa-fw fa-wrench"></i> 메뉴관리</a>
  <a href="#clients"><i class="fa fa-fw fa-user"></i> 예약관리</a>
  <a href="#contact"><i class="fa fa-fw fa-envelope"></i> 리뷰관리</a>
</div>

<div class="main" >
  <h2>대메뉴이름</h2>
	<div id="selectRst">
	
	</div>
</div>
 <footer class="footer bg-light mt-5">
  <div class="container">
    <div class="row">
      <div class="col-lg-6 col-md-6 col-sm-12">
        <h5>회사 정보</h5>
        <p>회사명 주소 등</p>
      </div>
      <div class="col-lg-3 col-md-3 col-sm-12">
        <h5>고객 지원</h5>
        <ul class="list-unstyled">
          <li><a href="#">FAQ</a></li>
          <li><a href="#">문의하기</a></li>
          <li><a href="#">이용약관</a></li>
        </ul>
      </div>
      <div class="col-lg-3 col-md-3 col-sm-12">
        <h5>팔로우</h5>
        <ul class="list-unstyled">
          <li><a href="#">Instagram</a></li>
          <li><a href="#">Facebook</a></li>
          <li><a href="#">Twitter</a></li>
        </ul>
      </div>
    </div>
    <hr>
    <div class="row">
      <div class="col-lg-12">
        <p class="text-center">© 2023 Company Name.</p>
      </div>
    </div>
  </div>
</footer>    
</body>
</html> 