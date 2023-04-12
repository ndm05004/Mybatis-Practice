<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='shortcut icon' type='image/x-icon' href='../images/panda.png' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(function(){
	$('.btn').click(function() {
		$('#next').prop('disabled', false); // 다음 버튼 활성화
	});
	
	$('#business').click(function() {
		$('#choice').attr('href', '<%=request.getContextPath()%>/restaurant/JoinRst.jsp');
		$('#member').removeClass('active'); // 버튼2 비활성화
		$(this).addClass('active'); // 버튼1 활성화
		
	})
	
	$('#member').click(function() {
		$('#choice').attr('href', '<%=request.getContextPath()%>/MemberInsert.do');
		$('#business').removeClass('active'); // 버튼1 비활성화
		$(this).addClass('active'); // 버튼2 활성화
	})
})
</script>

<style type="text/css">
.head{
text-align: center;
}

.main{
margin: 5px;
border: 1px solid red;
height: 500px;
display: flex;
justify-content: center;
}

.main button{
border: 1px solid black;
width: 400px;
height: auto;
}

#business{
margin-right: 10px;
}

.botm{
text-align: right;
}
#next{
margin-right: 10px;
}
</style>

</head>
<body>

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
        <a class="nav-link" href="<%=request.getContextPath()%>/login.jsp">로그인</a>
      </li>
    </ul>
  </div>
</nav>

<div class="head">
	<div id="content">회원가입 종류 페이지</div>
</div> 

<div class="main">
	<button class="btn" id="business">사업자</button>
	<button class="btn" id="member">회원</button>
</div>

<div class="botm">
	<a href="#" id="choice">
		<button id="next" disabled>다음</button>
	</a>
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