<%@page import="rrs.vo.MemberVO"%>
<%@page import="rrs.vo.SearchVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cont = request.getParameter("cont");
%>  
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
function searchfu(cont){
    code = "";
  	
	$.ajax({
		url : '<%=request.getContextPath()%>/SearchContent.do',
		data : {"content" : cont},
		dataType : 'json',
		success : function(res){
			if(res == 0){
				code += "<h3>검색 결과 : "+cont+"</h3><br>"
				code += "<h3>검색 결과가 없습니다.</h3>"
			}else{
				code += "<h3>검색 결과 : "+cont+"</h3><br>"
				code +="<table border='1'>";
				code +="<tr><td>ID</td><td>이름</td><td>별점</td><td>주소</td><td>사진</td></tr>"
				$.each(res, function(i, v){
					code +="<tr><td><a href='<%=request.getContextPath()%>/RstView.do?rst_id="+ v.rst_id +"'>" + v.rst_id +"</a></td>"
					code +="<td>"+ v.rst_name +"</td>"
					code +="<td>"+ v.starcountavg +"</td>"
					code +="<td>"+ v.rst_addr +"</td>"
					code +="<td><img src='<%=request.getContextPath()%>/ImageView.do?Photo="+ v.rst_photo + "' width='200' height='140'></td></tr>"
			})
			code +="</table>"
			}
			$('#searchResult').html(code);
		},
		error : function(xhr){
			alert("status :" + xhr.status);
		}
	})
}

$(function(){
<%
	if(cont!=null){
%>
	searchfu('<%=cont%>');
<%		
	}
%>	
	
	$('#searchContent').on('input', function(event){
        var cont =  event.target.value;
        if (cont.length == 0) {
        	$('#searchResult').html(''); // 검색어가 없을 때 검색 결과 지우기
        	return;
        }
        searchfu(cont)
    })
})
</script>

<style type="text/css">
.searchHead{
display: flex;
justify-content: center;
align-items: center;
}

#searchResult{
display: flex;
justify-content: center;
align-items: center;
flex-direction: column;
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
<%
    MemberVO memVo = (MemberVO) session.getAttribute("loginMember");
	if(session.getAttribute("loginMember") == null) {
%>
      <li class="nav-item">
        <a class="nav-link" href="<%=request.getContextPath()%>/member/view/login.jsp">로그인</a>
      </li>
<%
	} else {
%>
      <li class="nav-item dropdown">
	    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	      <svg xmlns="http://www.w3.org/2000/svg" height="28" viewBox="0 96 960 960" width="28">
	        <path d="M222 801q63-44 125-67.5T480 710q71 0 133.5 23.5T739 801q44-54 62.5-109T820 576q0-145-97.5-242.5T480 236q-145 0-242.5 97.5T140 576q0 61 19 116t63 109Zm257.814-195Q422 606 382.5 566.314q-39.5-39.686-39.5-97.5t39.686-97.314q39.686-39.5 97.5-39.5t97.314 39.686q39.5 39.686 39.5 97.5T577.314 566.5q-39.686 39.5-97.5 39.5Zm.654 370Q398 976 325 944.5q-73-31.5-127.5-86t-86-127.266Q80 658.468 80 575.734T111.5 420.5q31.5-72.5 86-127t127.266-86q72.766-31.5 155.5-31.5T635.5 207.5q72.5 31.5 127 86t86 127.032q31.5 72.532 31.5 155T848.5 731q-31.5 73-86 127.5t-127.032 86q-72.532 31.5-155 31.5ZM480 916q55 0 107.5-16T691 844q-51-36-104-55t-107-19q-54 0-107 19t-104 55q51 40 103.5 56T480 916Zm0-370q34 0 55.5-21.5T557 469q0-34-21.5-55.5T480 392q-34 0-55.5 21.5T403 469q0 34 21.5 55.5T480 546Zm0-77Zm0 374Z"/>
	      </svg>
	    </a>
	    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
	      <span class="dropdown-item-text"><%=memVo.getMem_name()%>님 환영합니다!</span>
	      <a class="dropdown-item" href="#!">마이페이지</a>
	      <a class="dropdown-item" href="<%=request.getContextPath()%>/memlogout.do">로그아웃</a>
	    </div>
	  </li>
<%
	}
%> 
    </ul>
  </div>
</nav>


<div class="searchHead">
	<h4>검색</h4><input type="text" id="searchContent" 
				 placeholder="검색어를 입력하세요" name="searchContent" style="width: 250px;">
</div>
<br>

<div id="searchResult">
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