<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
 <!--  <script type="text/javascript" src="http://localhost/RRS/js/jquery-3.6.4.min.js"></script> -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400&display=swap" rel="stylesheet">


<script type="text/javascript">
var mypath = '<%=request.getContextPath()%>';

$(function(){

	rst_id = '<%=request.getParameter("rst_id")%>'
	
	$('#menu').on('click', function() {
	    window.location.href = '<%=request.getContextPath()%>/member/rst-select/navMenu.jsp?rst_id=' + rst_id;
	});

	
	$('#home').on('click', function() {
		window.location.href = "<%=request.getContextPath()%>/RstView.do?rst_id=" + rst_id;
	});
	  
	  
	$('#review').on('click', function() {
		    window.location.href = '<%=request.getContextPath()%>/member/rst-select/navReview.jsp?rst_id=' + rst_id;
	 });
	

	 $('#photo').on('click', function() {
		    window.location.href = '<%=request.getContextPath()%>/member/rst-select/navphoto.jsp?rst_id=' + rst_id;
	});	
	 
})

</script>

<style>
body {
   font-family: 'IBM Plex Sans KR', sans-serif;
}
.nav {
	display: flex;
	justify-content: space-around;
}

.nav-item {
	text-align: center;

}

.button-wrapper {
	margin-top: 20px;
}
}

.nav-item a {
	font-weight: bold;

}

.nav-link:focus, .nav-link:active {
	text-decoration: underline;
}

#owncmt {
    border: 1px solid #F0F0F0;
    border-radius: 10px;
    background: #F0F0F0;
    margin-top: 5px;
}

#owncmt pre {
    font-family: 'IBM Plex Sans KR', sans-serif;
}
</style>

</head>

<body>
	<ul class="nav nav-tabs">
	  <li class="nav-item">
	    <a class="nav-link active" data-toggle="tab" href="#" id="home" style="color:#666;">홈</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" data-toggle="tab" href="#" id="menu" style="color:#666;">메뉴</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" data-toggle="tab" href="#" id="photo" style="color:#666;">사진</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" data-toggle="tab" href="#" id="review" >리뷰</a>
	  </li>
	</ul>
	
	<!-- Tab panes -->
	<div class="tab-content">
	  <div class="tab-pane container active" id="bottom">
	  		<div>
		<h3>레스토랑 공지</h3>
		<div id="owncmt">
		<pre>
		
  - 시간대별로 주문 가능하신 단품/코스메뉴의 차이가 있습니다.
  원하시는 메뉴가 없을 때는 다른 시간을 선택 해 보세요^^</pre>
	</div>
	</div>
	  </div>

	</div>
</body>
</html>