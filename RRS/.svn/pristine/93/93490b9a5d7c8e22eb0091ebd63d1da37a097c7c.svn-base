<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Table Mate</title>
<link rel='shortcut icon' type='image/x-icon' href='../../images/로고.png' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400&display=swap" rel="stylesheet">

<script type="text/javascript">

$(function(){
	memId = '<%=request.getParameter("memId")%>';
	console.log(memId);
	
	$('#newPassSet').on('click',function(){
		passval = $('#newPass').val().trim();
		passval2 = $('#newPass2').val().trim();
		
		if(passval != passval2) {
			$('#newpassSpan').text("비밀번호가 일치하지 않습니다.").css({'color': 'red', 'font-size': '1.5em'});
		} else {
			
			$.ajax({
				url: "<%=request.getContextPath()%>/newPassSet.do?memid=" + memId,
				type: 'get',
				data: {"newPass": passval},
				success: function(res){
	 				// 성공, 실패
	 				alert(res.flag);
	 				// 로그인 페이지로 이동
					window.location.href = '<%=request.getContextPath()%>/member/view/login.jsp';
				},
				error: function(xhr){
					alert("상태: " + xhr.status + "\ncode : " + xhr.statusText);
				},
				dataType: 'json'
			})
			
		}
	})
	
})
	
</script>

<title>Password 재설정</title>
<style type="text/css">
body {
   font-family: 'IBM Plex Sans KR', sans-serif;
}
#logo{
width : 180px;
height : 60px;
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
#id-form,#pw-form{
	background-color: lightgray;
	width: 70%;
	margin: 0px auto;
	padding: 50px;
}
#search{
	margin: 0px auto;
}
label{
	background-color: white; 
}
#newPassSet{
	margin: 0px auto;
	display: flex;
	justify-content: center;
	border: none;
	line-height: 30px;
    padding: 10px 20px;
    font-size: 16px;
    font-weight: bold;
    text-align: center;
    text-decoration: none;
    background-color: white;
    color: #ff3d00;
    border: 2px solid #ff3d00;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
    transition: background-color 0.3s ease;
    cursor : pointer;
    margin-top:30px;
}
.footer{
    padding-top: 35px;
    position: absolute;
    width: 100%;
    bottom: 0;
}
</style>
</head>
<body>

<nav class="navbar navbar-expand-md navbar-light bg-light">
  <a class="navbar-brand" href="<%=request.getContextPath()%>/mainPage.jsp" id="bigtitle"><img src="<%=request.getContextPath()%>/images/로고c.png"alt="tablemate.png" id="logo"></a>
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
      <li class="nav-item">
        <a class="nav-link" href="login.jsp">로그인</a>
      </li>
    </ul>
  </div>
</nav>
<br><br>
<header>
	<div class="d-flex justify-content-center">
  	<h2>비밀번호 재설정</h2>
</div>
</header>
<br><br>

<div id="newPass-form">
<div class="container">

  <form action="" class="needs-validation" method="get" novalidate>
    <div class="form-group">
      <label for="newPass">새 비밀번호</label>
      <input type="password" class="form-control" id="newPass" placeholder="Enter newpass" name="newPass" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label for="newPass2">새 비밀번호 확인</label>
      <input type="password" class="form-control" id="newPass2" placeholder="Enter newpass" name="newPass2" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <button type="button" class="btn btn-primary" id="newPassSet">확인</button><br>
    <span id="newpassSpan"></span>
  </form>
</div>
</div>

<%@include file="../../footer.jsp"%>   
</body>
</html>