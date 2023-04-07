<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Table Mate</title>
<link rel='shortcut icon' type='image/x-icon' href='../images/panda.png' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
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
</style>
</head>
<body>
<%
	String gcp = request.getContextPath();
%>
<nav class="navbar navbar-expand-md navbar-light bg-light">
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
	
	<div id="demo" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>

  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="<%=gcp %>/images/backimg.jpg" alt="Los Angeles">
      <div class="carousel-caption">
    <h1>Table Mate 간단하게 예약</h1>
    <p>Some text about Los Angeles</p>
  </div>
    </div>
    <div class="carousel-item">
      <img src="<%=gcp %>/images/dmatlr3.jpg" alt="Chicago">
      <div class="carousel-caption">
    <h1>Los Angeles</h1>
    <p>Some text about Los Angeles</p>
  </div>
    </div>
    <div class="carousel-item">
      <img src="<%=gcp %>/images/paidw.jpg" alt="New York">
      <div class="carousel-caption">
    <h1>Los Angeles</h1>
    <p>Some text about Los Angeles</p>
  </div>
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>


	<br><br>
<div class="d-flex justify-content-center">
  	<button class="btn btn-outline-info mx-2" id="reserv">예약하기</button>
  	<button class="btn btn-outline-info mx-2" id="search">검색하기</button>
</div>


<br>
<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-md-4 mb-3">
      <div class="card text-center">
        <img src="img1.jpg" class="card-img-top">
        <div class="card-body">
          <h5 class="card-title">1번 이미지 버튼</h5>
        </div>
      </div>
    </div>
    <div class="col-md-4 mb-3">
      <div class="card text-center">
        <img src="img2.jpg" class="card-img-top">
        <div class="card-body">
          <h5 class="card-title">2번 이미지 버튼</h5>
        </div>
      </div>
    </div>
    <div class="col-md-4 mb-3">
      <div class="card text-center">
        <img src="img3.jpg" class="card-img-top">
        <div class="card-body">
          <h5 class="card-title">3번 이미지 버튼</h5>
        </div>
      </div>
    </div>
    <div class="col-md-4 mb-3">
      <div class="card text-center">
        <img src="img4.jpg" class="card-img-top">
        <div class="card-body">
          <h5 class="card-title">4번 이미지 버튼</h5>
        </div>
      </div>
    </div>
    <div class="col-md-4 mb-3">
      <div class="card text-center">
        <img src="img5.jpg" class="card-img-top">
        <div class="card-body">
          <h5 class="card-title">5번 이미지 버튼</h5>
        </div>
      </div>
    </div>
    <div class="col-md-4 mb-3">
      <div class="card text-center">
        <img src="img6.jpg" class="card-img-top">
        <div class="card-body">
          <h5 class="card-title">6번 이미지 버튼</h5>
        </div>
      </div>
    </div>
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