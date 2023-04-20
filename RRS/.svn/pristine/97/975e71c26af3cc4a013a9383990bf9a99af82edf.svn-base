<%@page import="rrs.vo.RestautantVO"%>
<%@page import="rrs.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Table Mate</title>
<link rel='shortcut icon' type='image/x-icon' href='images/로고.png' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400&display=swap" rel="stylesheet">

<style type="text/css">
body {
   font-family: 'IBM Plex Sans KR', sans-serif;
}
.nav-item a svg {
    width: 28px;
    height: 28px;
}
.carousel-caption {
    position: absolute;
    width: 500px;
    top: 59%;
    left: 50%;
    transform: translate(-50%, -50%);
    animation-duration : infinite;
}
.carousel-caption h1{
	margin: 0 auto;
	font-weight: bold;
}
.card-img-top{
	width: 30%;
	margin: 0 auto;
    margin-top: 10px;
    margin-bottom: 10px
}
.card-body {
	text-align: center;
    margin: 0 auto;
    width: 200px;
    height: 20px;
    margin-bottom: 10px;
}
.card-title{
	margin: 0 auto;
    padding-bottom: 10px;
    font-weight: bold;
    font-size: 0.8em;
    color: black;
}
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
.dropdown-menu {
  width: 200px;
  text-align: center;
}
#logo{
width : 180px;
height : 60px;

}

.btn-outline-info {
    color: #ff3d00;
    background-color: #ff3d00;
    background-image: none;
    font-weight: bold;
    border: none;
    font-size: 16px;
    text-align: center;
    text-decoration: none;
    background: white;
    border: 2px solid #ff3d00;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.2);
    transition: background-color 0.3sease;
    cursor: pointer;
}
.btn-outline-info:hover {
	background: #ff3d00;
	border:none;
}
.footer {
	background-color: #f8f9fa;
}
</style>
</head>
<body>
<%
	String gcp = request.getContextPath();
%>
<nav class="navbar navbar-expand-md navbar-light bg-light">
<!--   <a class="navbar-brand" href="#">네비게이션 로고</a> -->
  <a class="navbar-brand" href="<%=request.getContextPath()%>/mainPage.jsp" id="bigtitle"><img src="images/로고c.png"alt="tablemate.png" id="logo"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item active">
        <a class="nav-link" href="<%=request.getContextPath()%>/noticeboard.jsp">공지사항</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">예약하기</a>
      </li>
<%
    MemberVO memVo = (MemberVO) session.getAttribute("loginMember");
	RestautantVO rstVo = (RestautantVO) session.getAttribute("loginRst");
	if(session.getAttribute("loginMember") != null) {
%>
      <li class="nav-item dropdown">
	    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	      <svg xmlns="http://www.w3.org/2000/svg" height="28" viewBox="0 96 960 960" width="28">
	        <path d="M222 801q63-44 125-67.5T480 710q71 0 133.5 23.5T739 801q44-54 62.5-109T820 576q0-145-97.5-242.5T480 236q-145 0-242.5 97.5T140 576q0 61 19 116t63 109Zm257.814-195Q422 606 382.5 566.314q-39.5-39.686-39.5-97.5t39.686-97.314q39.686-39.5 97.5-39.5t97.314 39.686q39.5 39.686 39.5 97.5T577.314 566.5q-39.686 39.5-97.5 39.5Zm.654 370Q398 976 325 944.5q-73-31.5-127.5-86t-86-127.266Q80 658.468 80 575.734T111.5 420.5q31.5-72.5 86-127t127.266-86q72.766-31.5 155.5-31.5T635.5 207.5q72.5 31.5 127 86t86 127.032q31.5 72.532 31.5 155T848.5 731q-31.5 73-86 127.5t-127.032 86q-72.532 31.5-155 31.5ZM480 916q55 0 107.5-16T691 844q-51-36-104-55t-107-19q-54 0-107 19t-104 55q51 40 103.5 56T480 916Zm0-370q34 0 55.5-21.5T557 469q0-34-21.5-55.5T480 392q-34 0-55.5 21.5T403 469q0 34 21.5 55.5T480 546Zm0-77Zm0 374Z"/>
	      </svg>
	    </a>
	    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
	      <span class="dropdown-item-text"><%=memVo.getMem_name()%>님 환영합니다!</span>
	      <a class="dropdown-item" href="<%=request.getContextPath()%>/member/memMyPage.jsp">마이페이지</a>
	      <a class="dropdown-item" href="<%=request.getContextPath()%>/memlogout.do">로그아웃</a>
	    </div>
	  </li>
<%
	} else if(session.getAttribute("loginRst") != null){
%>
	<li class="nav-item dropdown">
	    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	      <svg xmlns="http://www.w3.org/2000/svg" height="28" viewBox="0 96 960 960" width="28">
	        <path d="M222 801q63-44 125-67.5T480 710q71 0 133.5 23.5T739 801q44-54 62.5-109T820 576q0-145-97.5-242.5T480 236q-145 0-242.5 97.5T140 576q0 61 19 116t63 109Zm257.814-195Q422 606 382.5 566.314q-39.5-39.686-39.5-97.5t39.686-97.314q39.686-39.5 97.5-39.5t97.314 39.686q39.5 39.686 39.5 97.5T577.314 566.5q-39.686 39.5-97.5 39.5Zm.654 370Q398 976 325 944.5q-73-31.5-127.5-86t-86-127.266Q80 658.468 80 575.734T111.5 420.5q31.5-72.5 86-127t127.266-86q72.766-31.5 155.5-31.5T635.5 207.5q72.5 31.5 127 86t86 127.032q31.5 72.532 31.5 155T848.5 731q-31.5 73-86 127.5t-127.032 86q-72.532 31.5-155 31.5ZM480 916q55 0 107.5-16T691 844q-51-36-104-55t-107-19q-54 0-107 19t-104 55q51 40 103.5 56T480 916Zm0-370q34 0 55.5-21.5T557 469q0-34-21.5-55.5T480 392q-34 0-55.5 21.5T403 469q0 34 21.5 55.5T480 546Zm0-77Zm0 374Z"/>
	      </svg>
	    </a>
	    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
	      <span class="dropdown-item-text"><%=rstVo.getRst_name()%>님 환영합니다!</span>
	      <a class="dropdown-item" href="<%=request.getContextPath()%>/restaurant/rstmain.jsp">마이페이지</a>
	      <a class="dropdown-item" href="<%=request.getContextPath()%>/memlogout.do">로그아웃</a>
	    </div>
	 </li>

<%
	} else {
%>  
	<li class="nav-item">
        <a class="nav-link" href="<%=request.getContextPath()%>/member/view/login.jsp">로그인</a>
    </li>
<%
	}
%>  
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
    <h1 class="animate__animated animate__fadeIn delay-1s">맛있는 음식과 좋은 시간을</h1>
    <h1 class="animate__animated animate__fadeIn delay-1s">보낼 수 있는 코스식 오마카세</h1><br>
    <p class="animate__animated animate__fadeIn delay-1s">스시 오마카세 전문점</p>
  </div>
    </div>
    <div class="carousel-item">
      <img src="<%=gcp %>/images/dmatlr3.jpg" alt="Chicago">
      <div class="carousel-caption">
    <h1 class="animate__animated animate__rubberBand delay-1s">4월의 뉴플레이스</h1>
    <h1 class="animate__animated animate__rubberBand delay-1s">지금 방금 오픈했어요</h1><br>
    <p class="animate__animated animate__rubberBand delay-1s">New OPEN</p>
  </div>
    </div>
    <div class="carousel-item">
      <img src="<%=gcp %>/images/paidw.jpg" alt="New York">
      <div class="carousel-caption">
    <h1 style="background: #00008091;width: 250px;font-size:1.2em;">LIMITED EDITION</h1>
    <h1 style="background: #ff00008c;width: 250px;font-size: 1.0em;font-weight: bold;">담백하고 풍성한 맛의 향연</h1>
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
  	<a href="<%=request.getContextPath()%>/member/view/searchPage.jsp">
  		<button class="btn btn-outline-info mx-2" id="search">검색하기</button></a>
</div>


<br>
<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-md-4 mb-3">
      <div class="card text-center">
       <a style="cursor: pointer;" href="<%=request.getContextPath()%>/member/view/searchPage.jsp?cont=한식" >  
       <img class="card-img-top" src="images/비빔밥.png"alt="비빔밥.png">
        <div class="card-body">
          <h5 class="card-title">한식</h5>
        </div>
       </a> 
      </div>
    </div>
    <div class="col-md-4 mb-3">
      <div class="card text-center">
        <a style="cursor: pointer;" href="<%=request.getContextPath()%>/member/view/searchPage.jsp?cont=양식">
        <img class="card-img-top" src="images/스테이크.png"alt="스테이크.png">
        <div class="card-body">
          <h5 class="card-title">양식</h5>
        </div>
        </a>
      </div>
    </div>
    <div class="col-md-4 mb-3">
      <div class="card text-center">
        <a style="cursor: pointer;" href="<%=request.getContextPath()%>/member/view/searchPage.jsp?cont=일식">
        <img class="card-img-top" src="images/초밥.png"alt="초밥.png" >
        <div class="card-body">
          <h5 class="card-title">일식</h5>
        </div>
        </a>
      </div>
    </div>
    <div class="col-md-4 mb-3">
      <div class="card text-center">
        <a style="cursor: pointer;" href="<%=request.getContextPath()%>/member/view/searchPage.jsp?cont=퓨전">
        <img class="card-img-top" src="images/fusion.png"alt="fusion.png" >
        <div class="card-body">
          <h5 class="card-title">퓨전</h5>
        </div>
        </a>
      </div>
    </div>    
 	<div class="col-md-4 mb-3">
      <div class="card text-center">
        <a style="cursor: pointer;" href="<%=request.getContextPath()%>/member/view/searchPage.jsp?cont=중식">
        <img class="card-img-top" src="images/만두.png" alt="만두.png">
        <div class="card-body">
          <h5 class="card-title">중식</h5>
        </div>
        </a>
      </div>
    </div>    
    <div class="col-md-4 mb-3">
      <div class="card text-center">
    	<a style="cursor: pointer;" href="<%=request.getContextPath()%>/member/view/searchPage.jsp?cont=디저트">
        <img class="card-img-top" src="images/디저트2.png"alt="디저트2.png" >
        <div class="card-body">
          <h5 class="card-title">디저트</h5>
        </div>
        </a>
      </div>
    </div>

  </div>
</div>

<%@include file="footer.jsp"%>   

</body>
</html>  