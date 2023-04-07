<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel='shortcut icon' type='image/x-icon' href='../images/panda.png'/>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/jquery.serializejson.min.js"></script>
<style type="text/css">
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
#container{
display : flex;
height : 500px;
width : auto;

}

#rstmain{
height : 900px;

}
.offcanvas-body{
text-align: left;
padding : 0px;
}
.offcanvas-body h2{
margin : 15px;

/* border : 1px solid black; */
}
.offcanvas-body h2 a{
text-decoration: none;
font-weight: bold;

}
.offcanvas-body h2 a:visited{
	color : darkgray;
}

#title{
margin-left : 40px;

}
</style>
<title>Insert title here</title>

</head>
<body>

<header>
<nav class="navbar navbar-expand-md navbar-light bg-light">
  <a class="navbar-brand" href="#">네비게이션 로고</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#demo">
    메뉴
  </button>
    <ul class="navbar-nav ml-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">카테고리</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">예약관리</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">로그아웃</a>
      </li>
    </ul>
  </div>
</nav>
</header>
<div class="offcanvas offcanvas-start" id="demo" style="width:300px;">
  <div class="offcanvas-header">
    <h1 class="offcanvas-title" id="title">대덕식당</h1>
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
  </div>
  <div class="offcanvas-body">
    <h2><a href="" >내 가게 정보</a></h2>
    <h2><a href="" >메뉴 정보</a></h2>
    <h2><a href="" >예약 관리</a></h2>
    <h2><a href="" >리뷰 관리</a></h2>
  </div>
</div>

<div class="container-fluid mt-3" id="rstmain">
  <h3>대메뉴</h3>
  <p>여기를 늘리고싶어요</p>

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