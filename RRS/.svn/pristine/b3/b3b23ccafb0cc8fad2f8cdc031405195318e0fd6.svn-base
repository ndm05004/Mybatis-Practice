<%@page import="rrs.vo.MemberVO"%>
<%@page import="rrs.vo.RestautantVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.4.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.serializejson.min.js" type="text/javascript"></script>


<script type="text/javascript">

<%
	RestautantVO rvo = (RestautantVO) request.getAttribute("rstinfo");
%>
$(function(){
	$('#addiqr').on('click', function(){
		$('#wModal').modal('show');
	})
	
	$('#send').on('click', function(){
		fdata = $('#wform').serializeJSON();
		
		$.ajax({
			url : '<%=request.getContextPath()%>/iqrBoardInsert.do',
			type : 'post',
			data : fdata,
			success : function(res){
				if(res > 0){
					$('#wModal').modal('hide');
					alert("등록이 완료되었습니다.");
				}else{
					alert("등록을 실패했습니다.");
				}
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
	})
})
</script>

<style type="text/css">
#rstMain, #subMain{
display: flex;
justify-content: center;
align-items: center;
}
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

<div class="rstMain" id="rstMain">
	<ul style="list-style-type: none;">
		<li><img src="<%=request.getContextPath()%>/ImageView.do?Photo=<%=rvo.getRst_photo()%>" width="200" height="140"><br></li>
		<li><p>가게 이름 : <%=rvo.getRst_name() %></p></li>
		<li><p>가게 정보 : <%=rvo.getRst_info() %></p></li>
		<li><p>가게 주소 : <%=rvo.getRst_addr() %></p></li>
		<li><p>가게 전화번호 : <%=rvo.getRst_tel() %></p></li>
		<li><p>별점 평균 : <%=rvo.getStarcountavg() %></p></li>
		<li><p>점장 이메일 : <%=rvo.getRst_mail() %></p></li>
		<li><p>식당 휴일 : <%=rvo.getClosedday() %></p></li>
		<li><p>영업 시작 시간 : <%=rvo.getOpnetme() %></p></li>
		<li><p>영업 종료 시간 : <%=rvo.getClosetime() %></p></li>
	</ul>
</div>
<div id="subMain">
	<br><br>
	<input type="button" id="addiqr" value="문의하기">
</div>

<!-- 글쓰기 The Modal -->
<div class="modal" id="wModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form name="wform" id="wform">
        	<label>작성자</label>
        	<input type="text" class="txt" name="writer" value="<%=memVo.getMem_id()%>"><br>
        	
        	<label>문의할 식당</label>
        	<input type="text" class="txt" name="rstname" value="<%=rvo.getRst_id()%>"><br>
        	
        	<label>제목</label>
        	<input type="text"  class="txt" name="subject"><br>
        	
        	<label>내용</label><br>
        	<textarea rows="5" cols="40" class="txt"  name="content"></textarea>
        	<br>
        	<br>
        	<input type="button" value="전송" id="send">
        </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
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
          <li><a href="<%=request.getContextPath()%>/member/view/IqrBoard.jsp">문의하기</a></li>
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