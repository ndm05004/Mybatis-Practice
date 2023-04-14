<%@page import="com.google.gson.JsonArray"%>
<%@page import="rrs.vo.RestautantVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel='shortcut icon' type='image/x-icon' href='../images/panda.png' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="../js/Rst.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script>
<%
	RestautantVO resVo = (RestautantVO) session.getAttribute("loginRst");
%>
reply={};//동적객체
mypath = '<%=request.getContextPath()%>'
resId = "<%=resVo.getRst_id()%>";
rvid = "";
$(function(){
	home = $('#home').text();
		$.selectRst(resId); // 회원정보 출력 
	
	// 수정버튼 클릭시 
	$('#modify').on('click',function(){
	//최초화면에 보이는 p태그 디스플레이 none처리
	$('.p1').css('display','none');
	//input type="hidden" text로 변경
	hiddenInputs = document.querySelectorAll('input[type="hidden"]');
		for (var i = 0; i < hiddenInputs.length; i++) {
	 		 hiddenInputs[i].setAttribute('type', 'text');
			}
		
	//수정버튼 숨김처리
	$('#modify').hide();
	//완료버튼 출력
	done = `<input type="submit" value="완료" id="wan" class="btn btn-outline-primary" >`
	//사진 변경 버튼 
	file =`<input type="file" value="사진선택"name="rstphoto">`
	$('#form').append(done);
	$('#fileimg').html(file);
})//수정끝
//비밀번호 정규식
$(document).on('keyup','#pwd',function(){
		pwdval = $(this).val().trim();
		passreg = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*?]).{5,30}$/;
		regCheck(passreg,pwdval,this);
	})
//정규식 체크
	function regCheck(reg,value,ele) {
		if(!(reg.test(value))){
			$(ele).css('border','2px solid red')
		}else {
			$(ele).css('border','2px solid green')
		}
	}
		
	//내정보보기 클릭시
	$('#home').on('click',function(){
		$.selectRst(resId);	
	
	})
	//리뷰관리메뉴 클릭 - 리뷰전체 출력
	$('#review').on('click',function(){
		$.reviewAll(resId);	
	
	})
	//리뷰 - 댓글모달에서 등록버튼 클릭이벤트
	$('#set').on('click',function(){
		cmtta = $('#cmtta').val();
		cmtta = cmtta.replace(/\n/g,"<br>").trim()
		$.setReply(resId);	
	
	})
	//리뷰 - 신고모달에서 신고버튼 클릭이벤트
	$('#report').on('click',function(){
		rss = $('#reportRss').val();
		rs = $('#reportRs').val();
		$.reportReview(resId);	
	
	})
	
	//리뷰 - 사장님 댓글 삭제 클릭이벤트
	$(document).on('click','.delCmt',function(){
		rvid=$(this).parents('.review').find('input').val()
		rstcmtNo = $(this).parent().next('.pcont').attr('id');
		if (confirm("댓글을 정말 삭제하시겠습니까?")) {
			$.deleteCmt(resId,rvid);
		} else {
			$.reviewAll(resId);
		}
	})
	//리뷰 - 사장님 댓글 수정 클릭이벤트
	$(document).on('click','.modCmt',function(){
		rstcmtNo = $(this).parent().next('.pcont').attr('id');
		
		modcont = $(this).parents('.review').find('.pcont').html()
		modcont = modcont.replace(/<br>/g,"\n")
		$('#modcont').val(modcont);
	})
	
	$(document).on('click','#modrepl',function(){
		newcont = $('#modcont').val();		
		$.modifyCmt(resId);
			
	})
	
	
	//rv_id
	$(document).on('click','.rvreply',function(){
		rvid=$(this).parents('.review').find('input').val();
	})
	
// 	rv_id
	$(document).on('click','.rvreport',function(){
		rvid2 = $(this).parents('.review').find('input').val();
	})



})

</script>
<style>

#owncmt{
border : 1px solid #F0F0F0;
border-radius: 10px;
background: #F0F0F0;
margin-top : 5px;
}
#rpconten{
border : 1px solid #F0F0F0;
border-radius: 10px;
background: #F0F0F0;
}
.reviewList{
	display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}
.review a,span{
font-size : x-small;
}
.review #bttn{
width : 100px;
}
.review #replybd{
width : 430px;

}
.review{
display : flex;
flex-flow : row;
background : #f7f7f7;
	width : 500px;
	height : auto;
	padding : 5px;
	border-radius: 10px;
}
#bigtitle{

font-size : 30px;
font-weight : bold;
}
#logo{
width : 180px;
height : 60px;

}
body {font-family: "Lato", sans-serif;}
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
.sidebar {
  height: 100%;
  width: 200px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #dcdcdc;
  overflow-x: hidden;
  padding-top: 16px;
}

.sidebar span {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 20px;
  color: black;
  display: block;
}

.sidebar span:hover {
  color: #828282;
}

.main {
  margin-left: 200px; /* Same as the width of the sidenav */
  padding: 0px 10px;
  height : 1000px;
}
#title{
	font-weight: bold;
	font-size: 30px;
	margin-left: 15px;
	height : 50px;

}
#selectRst{
margin-top : 30px;
margin-left : 200px;

}

hr{
color : black;
}
#navi{

margin-left: 200px;
}
#modify,#wan{

float: right;
margin-right : 500px;
width : 100px;
height: 50px;
}
label{
font-weight: bold;
}
#rstphoto{
width : 300px;
height : 300px;
}

@media screen and (max-height: 450px) {
  .sidebar {padding-top: 15px;}
  .sidebar a {font-size: 18px;}
}

.dropdown-menu {
  width: 200px;
  text-align: center;
}
#form p,label{
margin-bottom : 0px;
}
#form br{
height
}
</style>

</head>
<body>
<nav id="navi" class="navbar navbar-expand-md navbar-light bg-light">
  <img src="../images/로고.png"alt="tablemate.png" id="logo"><a class="navbar-brand" href="#" id="bigtitle"></a>
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
	if(session.getAttribute("loginRst") == null) {
%>
      <li class="nav-item">
        <a class="nav-link" href="#">로그인</a>
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
	      <span class="dropdown-item-text"><%=resVo.getRst_name()%>님 환영합니다!</span>
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
<div class="sidebar">
  <span href="rstmain.jsp" id="title"></span>
 <hr>
  <span id="home"><i class="fa fa-fw fa-home"></i> 내 가게 정보</span>
  <span id="service"><i class="fa fa-fw fa-wrench"></i> 메뉴관리</span>
  <span id="reserv"><i class="fa fa-fw fa-user"></i> 예약관리</span>
  <span id="review"><i class="fa fa-fw fa-envelope"></i> 리뷰관리</span>
</div>

<!-- 메인 페이지 노출 영역 -->
<div class="main" >
	<div id="selectRst">
	<form id="form" action="<%=request.getContextPath()%>/modifyRst.do" method="post" enctype="multipart/form-data">
	</form>
	<input type="button" value="수정" id="modify"  class="btn btn-outline-primary" >
	</div>
	<div id="reviewList"></div>
	
	
	
</div>
<!-- 사업자페이지 리뷰관리의 댓글달기 모달-->

  <!-- The Modal -->
  <div class="modal fade" id="replyModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">댓글달기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
         <textarea rows="3" cols="50" name="rvcmt" id="cmtta"></textarea>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <input id="set"  type="button" class="btn btn-danger" value="등록">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div> 
        
      </div>
    </div>
  </div>
  <!-- 사업자페이지 리뷰관리의 신고하기 모달-->

  <!-- The Modal -->
  <div class="modal fade" id="reportModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">신고하기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
         <form action="<%=request.getContextPath()%>/reviewReport.do" method="get" >
         	<select id="reportRss">
         		<option>신고 사유를 선택해주세요.</option>
         		<option>무분별한 욕설</option>
         		<option>근거없는 비방</option>
         		<option>예약자 귀책사유로 인한 컴플레인</option>
         		<option>기타</option>
         	</select>
         	<br>
         <textarea id="reportRs" rows="3" cols="50" placeholder="자세한 내용을 입력해주세요."></textarea>
         
         </form>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <input type="button" class="btn btn-danger" id="report" value="신고">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  <!-- 사업자페이지 리뷰관리의 댓글 수정 모달-->

  <!-- The Modal -->
  <div class="modal fade" id="mreplyModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">댓글수정하기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
         <textarea rows="3" cols="50" name="modcont" id="modcont"></textarea>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <input id="modrepl"  type="button" class="btn btn-danger" value="수정">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div> 
        
      </div>
    </div>
  </div>
</body>
</html> 