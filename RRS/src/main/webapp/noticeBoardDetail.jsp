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

<script src="<%=request.getContextPath()%>/admin/js/admin.js"></script>

<script type="text/javascript">
mypath = '<%=request.getContextPath()%>';

$(function(){
	
        nb_id = '<%=request.getParameter("id")%>';
        
        getNoticedetail2(nb_id);
        
        
        $(document).on('click', 'button[name="back"]', function(){
    		window.location.href = "<%=request.getContextPath()%>/noticeboard.jsp";
    	});
        
        
        
        
})
</script>


<style type="text/css">

#backDiv{
  text-align: right; /* div 안의 모든 요소를 오른쪽으로 정렬 */

}

#back {
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

body {
   font-family: 'IBM Plex Sans KR', sans-serif;
   height: 1000px;
}
table {
	border: 1px solid #dee2e6;
}

.dropdown-menu {
  width: 200px;
  text-align: center;
}
#logo{
width : 180px;
height : 60px;

}
hr{
    border-top: 1px solid rgba(0,0,0,.1);
    width: 80%;
}
.btitlenum {
	width: 200px;
}
.topline {
	display: flex;
	flex-direction: column;
}

.topline2 {
	display: flex;
}

.form-label {
	width: 285px;
}

.btopbox {
	height: 40px;
}

.bdate {
	text-align: right;
	margin-right: 10px;
}

.bcontent {
	height: 500px;
	overflow-y: auto;
	display: block;
	text-align: left;
}

.btn-sm {
	border-radius: 20px;
	margin-left: 2px;
}
.page-link {
    position: relative;
    display: block;
    padding: 0.5rem 0.75rem;
    margin-left: -1px;
    line-height: 1.25;
    color: #000;
    background-color: #fff;
    border: 1px solid #dee2e6;
}
.pagination {
	justify-content: center;
	--bs-pagination-color: #141619;
	--bs-pagination-hover-color: #141619;
	--bs-pagination-active-bg: #141619;
}
.page-item.active .page-link {
    z-index: 1;
    color: #fff;
    background-color: #141619;
    border-color: #141619;
}
#result {
    width: 80%;
    margin: 0 auto;
    margint-top:7%;

}
.footer {
    padding-top: 35px;
    position: absolute;
    width: 100%;
    bottom: 0;
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

<p style="text-align:center; margin-top:30px; font-size:2.5em; font-weight:bold;">공지사항</p>



<a href="" id="noticeBoardInfo"></a>

<hr style="margin-bottom:20px;">
<div id="result">
</div>

</body>

</html>   