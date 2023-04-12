<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='shortcut icon' type='image/x-icon' href='../images/panda.png' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(function(){
	$("#mem-button").on('click',function(){
		$("#member-form").css("display", "block");
		$("#rest-form").css("display", "none");
// 	  pwForm.style.display = "none";
		
	})
	$("#rst-button").on('click',function(){
		$("#member-form").css("display", "none");
		$("#rest-form").css("display", "block");
		
	})
	
	// 회원 로그인 버튼 클릭시
	$('#login').on('click',function(){
		memidval = $('#uid').val().trim();
		mempassval = $('#upass').val().trim();

		if($('#chkid').prop('checked')) {
			memidchkid = $('#chkid').val();
		} else {
			memidchkid = null;
		}
		
		$.ajax({
			url: '<%=request.getContextPath()%>/memLogin.do',
			type: 'post',
			data: {"uid": memidval, "upass": mempassval, "chkid": memidchkid},
			success: function(res){
				if(res.flag == "OK") {
					window.location.href = '<%=request.getContextPath()%>/mainPage.jsp';
				} else {
// 					alert(res.flag);
					$('#resspan').text(res.flag).css({'color': 'red', 'font-size': '1.5em'});
					$('#upass').val("");
				}
			},
			error: function(xhr){
				alert("상태: " + xhr.status + "\ncode : " + xhr.statusText);
			},
			dataType: 'json'
		})
	})
	
	// 사업자 로그인 버튼 클릭시
	$('#rlogin').on('click',function(){
		memidval2 = $('#rid').val().trim();
		mempassval2 = $('#rpass').val().trim();

		if($('#chkid2').prop('checked')) {
			memidchkid2 = $('#chkid2').val();
		} else {
			memidchkid2 = null;
		}
		
		$.ajax({
			url: '<%=request.getContextPath()%>/rstLogin.do',
			type: 'post',
			data: {"rid": memidval2, "rpass": mempassval2, "rchkid": memidchkid2},
			success: function(res){
// 				alert(res.flag);
				if(res.flag == "OK") {
					window.location.href = '<%=request.getContextPath()%>/restaurant/rstmain.jsp';
				} else {
// 					alert(res.flag);
					$('#resspan2').text(res.flag).css({'color': 'red', 'font-size': '1.5em'});
				}
			},
			error: function(xhr){
				alert("상태: " + xhr.status + "\ncode : " + xhr.statusText);
			},
			dataType: 'json'
		})
	})
	
})
</script>

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
#member-form,#rest-form{
	background-color: lightgray;
	width: 70%;
	margin: 0px auto;
	padding: 50px;
}
#login{
	margin: 0px auto;
}
label{
	background-color: white; 
}
/* .head{ */
/* text-align: center; */
/* } */

.social{
display: flex;
justify-content: center;
}

#clickLogin{
width: 200px;
height: 50px;
border-radius: 15px;
border: 1px solid;
}

#join{
  display: block; /* 블록 요소로 변경 */
  text-align: center; /* 가운데 정렬 */
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
	<h1> 로그인 페이지 </h1>
	<header>
		<div class="d-flex justify-content-center">
		  	<button class="btn btn-outline-info mx-2" id="mem-button">개인회원</button>
		  	<button class="btn btn-outline-info mx-2" id="rst-button">사업자</button>
		</div>
	</header>
	<br>
	<div id="member-form">
	<div class="container">
	
<%
	// 회원 로그인한 id를 쿠키에서 읽어온다.
	String cookieUserId = ""; // 로그인한 ID가 저장될 변수
	String chk =""; // CheckBox의 체크 여부를 지정할 변수
	
	Cookie[] cookieArr = request.getCookies();
	if(cookieArr != null){
		for(Cookie cookie : cookieArr) {
			if("USERID".equals(cookie.getName())){
				cookieUserId = cookie.getValue();
				chk = "checked";
			}
		}
	}
%>
	
	  <form class="needs-validation" novalidate>
	    <div class="form-group">
	      <label for="uid">개인회원 ID</label>
	      <input type="text" class="form-control" id="uid" value="<%=cookieUserId%>" placeholder="Enter userid" name="uid" required>
	      <div class="valid-feedback">Valid.</div>
	      <div class="invalid-feedback">Please fill out this field.</div>
	    </div>
	    <div class="form-group">
	      <label for="upass">PASSWORD</label>
	      <input type="password" class="form-control" id="upass" placeholder="Enter password" name="upass" required>
	      <div class="valid-feedback">Valid.</div>
	      <div class="invalid-feedback">Please fill out this field.</div>
	    </div>
	    <input type="checkbox" id="chkid" name="chkid" value="check" <%=chk %>>
	    
		<a>아이디 기억하기</a>
		<br>
		<a href="<%=request.getContextPath()%>/member/idpassSearch.jsp">계정 정보가 기억나지 않으시나요?</a>
		<br>
	    <button type="button" class="btn btn-primary" id="login">로그인</button><br>
	    <span id="resspan"></span>
	  </form>
	</div>
	</div>
	
	
	<div id="rest-form" style="display: none;">
	<div class="container">
	
<%
	// 로그인한 id를 쿠키에서 읽어온다.
	String cookieRstId = ""; // 로그인한 ID가 저장될 변수
	String chkRst =""; // CheckBox의 체크 여부를 지정할 변수
	
	Cookie[] cookieArrRst = request.getCookies();
	if(cookieArrRst != null){
		for(Cookie cookie : cookieArrRst) {
			if("RSTID".equals(cookie.getName())){
				cookieRstId = cookie.getValue();
				chkRst = "checked";
			}
		}
	}
%>	
	
	  <form action="" method="post" class="needs-validation" novalidate>
	    <div class="form-group">
	      <label for="uid2">사업자 ID</label>
	      <input type="text" class="form-control" id="rid" placeholder="Enter RstId" name="rid" required>
	      <div class="valid-feedback">Valid.</div>
	      <div class="invalid-feedback">Please fill out this field.</div>
	    </div>
	    <div class="form-group">
	      <label for="upass2">PASSWORD</label>
	      <input type="password" class="form-control" id="rpass" placeholder="Enter RstPassword" name="rpass" required>
	      <div class="valid-feedback">Valid.</div>
	      <div class="invalid-feedback">Please fill out this field.</div>
	    </div>
	    <input type="checkbox" id="chkid2" name="chkid2" value="check" <%=chkRst %>>
		<a>아이디 기억하기</a>
		<br>
		<a href="<%=request.getContextPath()%>/member/idpassSearch.jsp">계정 정보가 기억나지 않으시나요?</a>
		<br>
	    <button type="button" class="btn btn-primary" id="rlogin">로그인</button><br>
	    <span id="resspan2">결과</span>
	  </form>
	</div>
	</div>
	
	<br><hr><br>
	
	<div class="social" style="border: 1px solid red;display: flex;">
		<div style="border: 1px solid blue; width: 50px; height: 50px;"></div>
		<div style="border: 1px solid red; width: 50px; height: 50px; margin: 0px 10px;"></div>
		<div style="border: 1px solid green; width: 50px; height: 50px;"></div>
	</div>
	<br>
	
	<a id="join" href="<%=request.getContextPath()%>/member/view/memberJoin1.jsp">아직 회원이 아니신가요?</a>
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