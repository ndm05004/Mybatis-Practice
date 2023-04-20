<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Table Mate</title>
<link rel='shortcut icon' type='image/x-icon' href='../images/로고.png' />
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
	
	$("#id-button").on('click',function(){
		$("#id-form").css("display", "block");
		$("#pw-form").css("display", "none");
// 	  pwForm.style.display = "none";
		
	})
	$("#pw-button").on('click',function(){
		$("#id-form").css("display", "none");
		$("#pw-form").css("display", "block");
		
// 		idForm.style.display = "none";
// 		pwForm.style.display = "block";
		
	})
	
	$('#idSearch').on('click',function(){
		nameval = $('#uname').val().trim();
		emailval = $('#email').val().trim();
		
		$.ajax({
			url: '<%=request.getContextPath()%>/idSearch.do',
			type: 'get',
			data: {"name": nameval, "email": emailval},
			success: function(res){
// 				alert(res.flag);
				$('#idspan').text(res.flag).css({'color': 'red', 'font-size': '1.0em'});
			},
			error: function(xhr){
				alert("상태: " + xhr.status + "\ncode : " + xhr.statusText);
			},
			dataType: 'json'
		})
	})
	
	// 존재하는 계정인지 확인 후 인증번호 전송
	$('#verifi').on('click',function(){
		idval2 = $('#uid2').val().trim();
		nameval2 = $('#uname2').val().trim();
		emailval2 = $('#uemail2').val().trim();
		
		$.ajax({
			url: '<%=request.getContextPath()%>/passSearch.do',
			type: 'post',
			data: {"id": idval2, "name": nameval2, "email": emailval2},
			success: function(res){
// 				alert(res.flag);
				
				$('#passSpan').text(res.flag).css({'color': 'red', 'font-size': '1.0em'});
// 				alert(res.cernum);
				cernum = res.cernum;
				
			},
			error: function(xhr){
				alert("상태: " + xhr.status + "\ncode : " + xhr.statusText);
			},
			dataType: 'json'
		})
	})
	
	$('#subverifi').on('click',function(){
		
		cerval2 = $('#verifi2').val().trim();
		if(cerval2 == cernum) {
			alert("인증번호 확인 완료!");
			window.location.href = '<%=request.getContextPath()%>/member/view/newPass.jsp?memId='+idval2;
		} else {
			$('#cerSpan').text("인증번호를 다시 확인해주세요.").css({'color': 'red', 'font-size': '1.0em'});
		}
	})
})
	
</script>

<title>Id,Password 찾기</title>
<style type="text/css">
body {
   font-family: 'IBM Plex Sans KR', sans-serif;
}

#id-button, #pw-button {
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
	width: 70%;
    margin: 0px auto;
    padding: 50px;
    border: lightgray solid 1px;
    border-radius: 30px;
}

#idSearch, #verifi, #subverifi {
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
    margin-top:20px;
}

.loginResult {
   text-align: center;
}
label{
	background-color: white; 
}
#logo{
width : 180px;
height : 60px;
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
        <a class="nav-link" href="<%=request.getContextPath()%>/member/view/login.jsp">로그인</a>
      </li>
    </ul>
  </div>
</nav>
<br><br>
<header>
	<div class="d-flex justify-content-center">
	  	<button class="btn btn-outline-info mx-2" id="id-button">ID 찾기</button>
	  	<button class="btn btn-outline-info mx-2" id="pw-button">PW 찾기</button>
	</div>
</header>
<br><br>

<div id="id-form">
<div class="container">

  <form action="" class="needs-validation" method="get" novalidate>
    <div class="form-group">
      <label for="uname">이름</label>
      <input type="text" class="form-control" id="uname" placeholder="Enter username" name="uname" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label for="pwd">이메일</label>
      <input type="text" class="form-control" id="email" placeholder="Enter password" name="email" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
  	<div class="loginResult"> 
    <button type="button" class="btn btn-primary" id="idSearch">계정찾기</button><br>
    <span id="idspan"></span>
    </div> 
  </form>
</div>
</div>

<div id="pw-form" style="display: none;">
<div class="container">
  
  <form action="" class="needs-validation" novalidate>
    <div class="form-group">
      <label for="uname">아이디</label>
      <input type="text" class="form-control" id="uid2" placeholder="Enter userid" name="uid2" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label for="pwd">이름</label>
      <input type="text" class="form-control" id="uname2" placeholder="Enter username" name="uname2" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label for="pwd">이메일</label>
      <input type="text" class="form-control" id="uemail2" placeholder="Enter email" name="uemail2" required><br>
    <div class="loginResult">
    <span id="passSpan"></span>
    </div>
    <button type="button" class="btn btn-primary" id="verifi">인증번호 받기</button><br>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <input type="text" class="form-control" name="subverifi" id="verifi2" placeholder="인증번호 입력">
    <button type="button" class="btn btn-primary" id="subverifi">인증번호 확인</button><br>
    <div class="loginResult">
    <span id="cerSpan"></span>
    </div>
  </form>
</div>
</div>

<%@include file="../../footer.jsp"%>   

</body>
</html>