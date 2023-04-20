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
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400&display=swap" rel="stylesheet">
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

body {
   font-family: 'IBM Plex Sans KR', sans-serif;
}
#logo{
	width : 180px;
	height : 60px;
}
#nave{
	background: #ff3d00;
}
#head{
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
	padding: 15px;
}


#subcon{
padding-left: 50px;
}

.main{
	margin: 5px;
	height: 500px;
	display: flex;
	justify-content: center;
}

#busi{
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	width: 400px;
}

#busitext{
margin: 10px 0 10px;
}

#mem{
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin-left: 50px;
	width: 400px;
}

.main button {
	border: 1px solid black;
	width: 70%;
	height: auto;
}

.img{
	width: 150xp;
	height: 200px;
}

.botm {
	text-align: right;
	margin-right: 50px;
}

#business, #member {
	background-color: #ff3d00;
	border: none;
	color: white;
	font-weight: bold;
}
#next {
	margin-top: 20px;
	margin-right: 10px;
    background: #e0e0e0;
    border: 1px solid black;
}


</style>

</head>
<body>
<div id="nave">
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
					href="login.jsp">로그인</a></li>
			</ul>
		</div>
	</nav>
</div>

	<div>
		<div class="head" id="head">
			<div id="mainhead">
				<h4>회원가입</h4>
			</div>
			<div id="subcon">
				<p>회원 종류에 따라 회원가입 절차가 다릅니다. 고객님께서 해당하는 유형을 선택하여 회원가입을 진행해 주시기 바랍니다.</p>
			</div>
		</div>

		<div class="main">
			<div id="busi">
				<img src="<%=request.getContextPath()%>/images/pngegg.png" class="img">
				<div id="busitext">
					<h3>사업자회원</h3>
					<p>사업자 및 기타 단체</p>
				</div>
				<button class="btn" id="business">사업자</button>
			</div>
			<div id="mem">
				<img src="<%=request.getContextPath()%>/images/person.png" class="img">
				<div id="busitext">
					<h3>일반회원</h3>
					<p>14세 이상 개인</p>
				</div>
				<button class="btn" id="member">회원</button>
			</div>
		</div>

		<div class="botm">
			<a href="#" id="choice">
				<button id="next" disabled>다음</button>
			</a>
		</div>
	</div>

<%@include file="../../footer.jsp"%>   
</body>
</html>