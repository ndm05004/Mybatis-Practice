<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Table Mate</title>
<link rel='shortcut icon' type='image/x-icon' href='<%=request.getContextPath()%>/images/로고.png' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.4.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400&display=swap" rel="stylesheet">


<script type="text/javascript">
$(function(){
	smscer = 0;
	
	$('#idcheck').on("click", function(){
		memId = $('#uid').val().trim();
		if(memId==""){
			alert("ID를 입력하세요");
			return;
		}
		
		$.ajax({
			url : '<%=request.getContextPath()%>/MemberIdCheck.do',
				data : {
					"uid" : memId
				},
				dataType : 'json',
				success : function(res) {
					if (res == "OK") {
						$('#idCheckResult').html("사용가능");
					} else {
						$('#idCheckResult').html("중복된 ID입니다.");
					}
				},
				error : function(xhr) {
					alert("status :" + xhr.status);
				}
			})
		})

		$('#memberInsertForm').on('submit', function() {
			idCheck = $('#idCheckResult').html();

			if (idCheck != "사용가능") {
				alert("ID가 중복되거나 중복체크를 하지 않았습니다.;")
				return false;
			}

			if ($('#pw').val() == "" || $('#pw').val() != $('#pw2').val()) {
				alert("비밀번호와 비밀번호 확인이 다릅니다. 다시 입력해주세요.");
				return false;
			}

			if ($('.ess').val() == "") {
				alert("정보를 입력해주세요");
				return false;
			}
			
			if (smscer == 0) {
				alert("휴대폰 인증을 완료해주세요");
				return false;
			}

			return true;
		})
		
		$('#verifi').on('click',function(){
			tel = $('#jointel').val();
// 			alert(tel);
			$('#verspan').text("인증번호가 전송되었습니다.")
			
			$.ajax({
				url: '<%=request.getContextPath()%>/smsverifi.do',
				type: 'post',
				data: {"tel": tel},
				success: function(res){
// 					alert(res.flag);
					cernum = res.flag;
					
				},
				error: function(xhr){
					alert("상태: " + xhr.status + "\ncode : " + xhr.statusText);
				},
				dataType: 'json'
			})
		})
		
		$('#verifi2').on('click',function(){
			cernum2 = $('#cernum2').val();
			$('#verspan').text("인증번호가 전송되었습니다.")
			
			if(cernum2 == cernum) {
// 				alert("인증번호 확인 완료!");
				$('#verspan2').text("인증번호가 확인되었습니다.").css({'color': 'blue', 'font-size': '1.0em'});
				smscer = 1;
<%-- 				window.location.href = '<%=request.getContextPath()%>/member/view/newPass.jsp?memId='+idval2; --%>
			} else {
				$('#verspan2').text("인증번호를 다시 확인해주세요.").css({'color': 'red', 'font-size': '1.0em'});
			}
		})
	})
</script>

<style type="text/css">
body {
   font-family: 'IBM Plex Sans KR', sans-serif;
}
#logo{
width : 180px;
height : 60px;
}
.main {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin-top: 10px;
	background-color: #ffffff;
}

#insertmain {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin-top: 10px;
	width: 700px;
	background-color: #ffffff;
}

#conta {
	width: 450px;
}
#idcheck, #verifi, #verifi2 {
	margin-left: 10px;
	background-color: #ff3d00;
}

#inidcheck{
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
}

#telverifi{
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
}
#cerverifi{
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
}

#join {
	margin: 30px 0 20px;
	width: 100%;
	height: 50px;
	background-color: #ff3d00;
	border: none;
	color: white;
	font-weight: bold;
	
}

 .intputarea{
	width: 100%;
	border: 1px solid #ced4da;
	border-radius: 0.25rem;
 }
 .inputinfo{
 margin-top: 20px;
 font-weight: bold;
 }
 #verifi2{
/*  	display: none; */
 }
 #verspan{
	color: blue;
 }
</style>

</head>
<body>
	<nav class="navbar navbar-expand-md navbar-light bg-light">
		<a class="navbar-brand" href="<%=request.getContextPath()%>/mainPage.jsp" id="bigtitle"><img src="<%=request.getContextPath()%>/images/로고c.png"alt="tablemate.png" id="logo"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>/noticeboard.jsp">공지사항</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">예약하기</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/member/view/login.jsp">로그인</a></li>
			</ul>
		</div>
	</nav>

	<div id="main" class="main">
		<div id="header">
			<h2>회원가입</h2>
		</div>
		<div class="insertmain" id="insertmain">
			<form id="memberInsertForm" method="post"
				action="<%=request.getContextPath()%>/MemberInsert.do">
				<div id="conta">
					<div id="inputid">
						<label class="inputinfo">아이디</label>
						<div id="inidcheck">
							<input type="text" class="intputarea" name="uid" id="uid" class="ess">
							<button type="button" id="idcheck" class="btn btn-danger btn-sm">중복검사</button>
						</div>
					</div>

					<div>
						<span id="idCheckResult"></span>
					</div>

					<div >
						<label class="inputinfo">Password</label>
						<input type="password" class="intputarea" id="pw" name="pw">
					</div>

					<div>
						<label class="inputinfo">Password확인</label>
						<input type="password" class="intputarea" name="pw2" id="pw2">
					</div>

					<div>
						<label class="inputinfo">이름</label>
						<input type="text" class="intputarea" name="uname" class="ess">
					</div>

					<div>
						<label class="inputinfo">생년월일</label>
						<input type="date" class="intputarea" name="ubir" class="ess">
					</div>

					<div>
						<label class="inputinfo">닉네임</label>
						<input type="text" class="intputarea" name="unick" class="ess">
					</div>

					<div>
						<label class="inputinfo">연락처</label>
						<div id="telverifi">
							<input type="tel" class="intputarea" name="utel" class="ess" id="jointel">
							<button type="button" id="verifi" class="btn btn-danger btn-sm">인증번호 받기</button>
						</div>
							<span id="verspan"></span>	
					</div>

					<div>
						<label class="inputinfo" class="">인증번호</label>
						<div id="cerverifi">
							<input type="#" class="intputarea" name="cernum2" id="cernum2">
							<button type="button" id="verifi2" class="btn btn-danger btn-sm">인증번호 확인</button>
						</div>
							<span id="verspan2"></span>
					</div>
					
					<div>
						<label class="inputinfo">E-MAIL</label>
						<input type="email" class="intputarea" name="umail" class="ess">
					</div>

					<div>
						<input type="submit" id="join" value="회원가입">
					</div>
				</div>
			</form>
		</div>
	</div>

<%@include file="../../footer.jsp"%>   
</body>
</html>