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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.4.min.js"></script>

<script type="text/javascript">
$(function(){
	$('#idCheck').on("click", function(){
		memId = $('#uid').val();
		if(memId==""){
			alert("ID를 입력하세요");
			return;
		}
		
		$.ajax({
			url : '<%=request.getContextPath()%>/MemberIdCheck.do',
			data : {"uid" : memId},
			dataType : 'json',
			success : function(res){
				if(res == "OK"){
					$('#idCheckResult').html("사용가능");
				}else{
					$('#idCheckResult').html("중복된 ID입니다.");
				}
			},
			error : function(xhr){
				alert("status :" + xhr.status);
			}
		})
	})
	
	$('#memberInsertForm').on('submit', function(){
		idCheck = $('#idCheckResult').html();
		
		if(idCheck!="사용가능"){
			alert("ID가 중복되거나 중복체크를 하지 않았습니다.;")
			return false;
		}
		
		if($('#pw').val()=="" || $('#pw').val()!=$('#pw2').val()){
			alert("비밀번호와 비밀번호 확인이 다릅니다. 다시 입력해주세요.");
			return false;
		}
		
		if($('.ess').val() == ""){
			alert("정보를 입력해주세요");
			return false;
		}
		
		return true;
	})
})
</script>

<style type="text/css">
.main{
display: flex;
justify-content: center;
align-items: center;
}

label{
width: 150px;
text-align: right;
}

tr td:nth-child(2) {
text-align: left;
}

#join{
text-align: right;
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

<h1>회원 회원가입 페이지</h1>
<div class="main">
<form id="memberInsertForm" method="post" 
	action="<%=request.getContextPath()%>/MemberInsert.do">
<table>
	<tr>
		<td><label>ID:</label></td>
		<td>
			<input type="text" name="uid" id="uid" class="ess">
			<input type="button" value="중복확인" id="idCheck"><br>
			<span id="idCheckResult"></span>
		</td>
	</tr>
	
	<tr>
		<td><label>Password:</label></td>
		<td><input type="password" name="pw" id="pw" class="ess"></td>
	</tr>
	
	<tr>
		<td><label>Password확인:</label></td>
		<td><input type="password" name="pw2" id="pw2"></td>
	</tr>
	
	<tr>
		<td><label>이름:</label></td>
		<td><input type="text" name="uname" class="ess"></td>
	</tr>
	
	<tr>
		<td><label>생년월일:</label></td>
		<td><input type="date" name="ubir" class="ess"></td>
	</tr>
	
	<tr>
		<td><label>닉네임:</label></td>
		<td><input type="text" name="unick" class="ess"></td>
	</tr>
	
	<tr>
		<td><label>연락처:</label></td>
		<td><input type="tel" name="utel" class="ess"></td>
	</tr>
	
	<tr>
		<td><label>E-MAIL:</label></td>
		<td><input type="email" name="umail" class="ess"></td>
	</tr>
	
	<tr>
		<td><label>자동가입방지:</label></td>
		<td><input type="#" name="#"></td>
	</tr>
	
	<tr>
		<td colspan="2" id="join"><input type="submit" value="회원가입"></td>
	</tr>
	
</table>	
</form>
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