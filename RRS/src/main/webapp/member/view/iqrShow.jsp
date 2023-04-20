<%@page import="rrs.vo.MemberVO"%>
<%@page import="rrs.vo.IqrVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Table Mate</title>
<link rel='shortcut icon' type='image/x-icon' href='<%=request.getContextPath()%>/images/로고.png' />
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400&display=swap" rel="stylesheet">

<script src="<%=request.getContextPath()%>/js/jquery.serializejson.min.js" type="text/javascript"></script>

<%
	IqrVO ivo = (IqrVO)request.getAttribute("iqrinfo");
%>

<script type="text/javascript">
function delIqr(putid){
	id = putid;
	
	$.ajax({
		url : '<%=request.getContextPath()%>/iqrDelete.do',
		type : 'post',
		data : {'iqr_id' : id},
		success : function(res){
			if(res != null){
				alert("삭제 되었습니다.");
				window.location.href = "member/memMyPage.jsp";
			}
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}

function iqrupdate(){
	$('#mModal').modal('show');
}

function goHome(){
	window.location.href = "member/memMyPage.jsp";
}

$(function(){
	$('#send').on('click', function(){
		fdata = $('#mform').serializeJSON();
		
		$.ajax({
			url : '<%=request.getContextPath()%>/iqrBoardUpdate.do',
			type : 'post',
			data : fdata,
			success : function(res) {
				if (res != null) {
					alert("수정 되었습니다.");
					$('#mModal').modal('hide');
					window.location.href = "member/memMyPage.jsp";
				} else {
					alert("수정을 실패했습니다.");
				}
			},
			error : function(xhr) {
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
	})
})
</script>

<style type="text/css">
#iqrBoard{
display: flex;
justify-content: space-between;
margin: 0 0 20px 0;
padding: 14px 10px 16px;
background: #f8f8f8;
border-bottom: 1px solid #ccc;
}

#iqrtitle{
margin: 0 auto 20px 200px;
height: 150px;
}

#iqrcontent{
margin: 0 auto 20px 200px;
}

#subarea{
position: relative;
width: 100%;
height: 150px;
}

#subarea2{
position: absolute;
bottom: 0;
right: 100px;
color: #787878;
}

#subarea2 a{
text-decoration: none;
color: inherit;
}

.modal-body label{
width: 100px;
}

body {
   font-family: 'IBM Plex Sans KR', sans-serif;
} 
.dropdown-menu {
  width: 200px;
  text-align: center;
}
#logo{
width : 180px;
height : 60px;
}

#Main{
height: auto;
padding-top: 100px;
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
	      <a class="dropdown-item" href="<%=request.getContextPath()%>/member/memMyPage.jsp">마이페이지</a>
	      <a class="dropdown-item" href="<%=request.getContextPath()%>/memlogout.do">로그아웃</a>
	    </div>
	  </li>
<%
	}
%>    
    </ul>
  </div>
</nav>
<%
	String cont = ivo.getIqr_content().replaceAll("\n", "<br>");
%>
<div id="iqrMain">
	<div id="iqrBoard">
		<div style="width: 30%;">글번호 : <%=ivo.getIqr_id() %></div>
		<div style="width: 40%; text-align: center;"><%=ivo.getIqr_date().substring(0, 10) %></div>
		<div style="width: 30%; text-align: right;">작성자 : <%=ivo.getMem_id() %></div>
	</div>
	<div id="Main">
		<div id="iqrtitle">
			<div><h1><%=ivo.getIqr_title() %></h1></div>
		</div>
		<div id="iqrcontent">
			<div><%=cont %></div>
		</div>
		<div id="subarea">
			<div id="subarea2">
			<a href="#" onclick="goHome();">목록으로</a> | 
			<a href="#" onclick="iqrupdate();">수정</a> | 
			<a href="#" onclick="delIqr('<%=ivo.getIqr_id()%>');">삭제</a>
			</div>
		</div>
	</div>
</div>

<!-- 글수정 The Modal -->
<div class="modal fade" id="mModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form name="mform" id="mform">
        	<label>글번호</label>
        	<input type="text" class="txt" name="iqrid" value="<%=ivo.getIqr_id()%>" readonly><br>
        
        	<label>작성자</label>
        	<input type="text" class="txt" name="writer" value="<%=memVo.getMem_id()%>" readonly><br>
        	
        	<label>문의할 식당</label>
        	<input type="text" class="txt" name="rstname" value="<%=ivo.getRst_id()%>" readonly><br>
        	
        	<label>제목</label>
        	<input type="text"  class="txt" name="subject" value="<%=ivo.getIqr_title()%>"><br>
        	
        	<label>내용</label><br>
        	<textarea rows="5" cols="40" class="txt"  name="content"><%=ivo.getIqr_content()%></textarea>
        	<br>
        	<br>
        	<input type="button" value="전송" id="send">
        </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

<%@include file="../../footer.jsp"%>
</body>
</html>