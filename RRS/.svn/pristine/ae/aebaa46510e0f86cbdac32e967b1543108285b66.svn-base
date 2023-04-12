<%@page import="rrs.vo.RestautantVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="../js/jquery.serializejson.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
label {
	font-weight: bold;
}
table tr:first-child {
	text-align: center;
	background: rgba(1,1,1,0.6);
	color: white;
	font-weight: bold;
}
table tr:not(:first-child):hover {
	background: rgba(0,0,0,0.1);
}
.borderstyle{
	border: 2px solid red;
}
</style>
<script type="text/javascript">
$(function() {
	chk = 0;
	//데이타 유효성 체크 
	
	// 카테고리 끌고오기
	$.ajax({
		url : '<%=request.getContextPath()%>/getCategory.do',
		type : 'get',
		success : function(res) {
			code ="";
			$.each(res, function () {
                // 옵션작성
                code +=`<option value='${this.ctg_id}'>${this.ctg_name}</option>`
            })
            $('#ctg').html(code);
			$('#ctg').trigger('change');
		},
		error : function(xhr) {
			alert("Error : "+xhr.status)
		},
		dataType : 'json'
	})
	
	// 카테고리 클릭시 인풋 폼에 들어감 
	$('#ctg').on('change',function(){
		ctgval=$(this).val();
		$('#ctgval').val(ctgval);
	})
//=============================================================== †(구현 완료)†

	// 비밀번호 정규식
	$('#pwd').on('keyup',function(){
		pwdval = $(this).val().trim();
		passreg = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*?]).{5,30}$/;
		regCheck(passreg,pwdval,this);
	})
	
	//이메일 정규식
	$('#mail').on('keyup',function(){
		mailvalue = $(this).val().trim();
		mailreg = /^([a-zA-Z0-9._%+-]+)@([a-zA-Z0-9.-]+)\.([a-zA-Z]{2,})$/;
		regCheck(mailreg,mailvalue,this);
	})
	
	// 번호정규식
	$('#tel').on('keyup',function(){
		hpval = $(this).val().trim();
		hpreg = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
		regCheck(hpreg,hpval,this);
	})
		
	
	function regCheck(reg,value,ele) {
		if(!(reg.test(value))){
			$(ele).css('border','2px solid red')
		}else {
			$(ele).css('border','2px solid green')
		}
	}
	
	function check() {
		return true;
	}
})
</script>
<%
	RestautantVO vo = (RestautantVO) request.getAttribute("rstvo");
%>
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
        <a class="nav-link" href="#">로그인</a>
      </li>
    </ul>
  </div>
</nav>
<hr>

<!-- 
	사업자 받아야할 정보
	
	RST_ID, 	아이디		
	RST_NAME, 	이름
	RST_PASS,	비밀번호
	BS_NUM,		사업자 번호 입력
	RST_TEL,	전화번호
	RST_MAIL, 	이메일
	RST_REQ		sysdate
	CTG_ID,		카테고리 아이디
	RST_ADDR 	주소 API쓸수 있나?
	
 -->
<div class="container">
  <h2>내 가게정보 수정하기</h2>
  <br>
  
  <form action="<%=request.getContextPath() %>/modifyRst.do"  onsubmit="return check()" class="needs-validation" 
  method="post" enctype="multipart/form-data">
  
    <div class="form-group">
      <label for="uid">아이디</label>
      <span id="idspan"><%=vo.getRst_id()%></span>
      <input type="text" class="form-control" id="id" placeholder="아이디" name="id" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
      <label for="pwd">비밀번호</label>
      <input type="password" class="form-control" id="pwd" placeholder="비밀번호" name="pwd" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
      <label for="uname">사업자 번호</label>
      <input type="text" class="form-control" id="bsnum" placeholder="사업자번호" name="bsnum" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
	    <label for="ctg" class="form-label">카테 고리 선택</label><br>
		<select class="form-select" id="ctg" name="ctglist"></select>
	    <input type="hidden" class="form-control" id="ctgval" name="ctgval" required>
	</div>
    
    
    <div class="form-group">
      <label for="uname">식당 이름</label>
      <input type="text" class="form-control" id="name" placeholder="가게 이름" name="name" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    
    <div class="form-group">
      <label for="uhp">식당 전화 번호</label>
      <input type="text" class="form-control" id="tel" placeholder="가게 번호" name="tel" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
      <label for="umail">이메일</label>
      <input type="text" class="form-control" id="mail" placeholder="이메일" name="mail" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    
    
    <div class="form-group">
      <label for="uadd1">주소</label>
      <input type="text" class="form-control" id="add1" placeholder="Enter userAdd" name="add1" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
      <label for="uadd2">상세주소</label>
      <input type="text" class="form-control" id="add2" placeholder="Enter userAdd2" name="add2" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
    <label for="bootstrap-file">가게 사진</label>
    <input type="file" class="form-control-file" id="bootstrap-file" name="bootstrap-file">
  </div>
    
    
    <button type="submit" class="btn btn-success" id="send">회원가입</button>
    
  </form>
</div>
</body>
</html>