<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Table Mate</title>
<link rel='shortcut icon' type='image/x-icon' href='<%=request.getContextPath()%>/images/로고.png' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400&display=swap" rel="stylesheet">

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../js/jquery.serializejson.min.js"></script>


<script type="text/javascript" src="<%=request.getContextPath()%>/js/Rst.js"></script>
<title>Insert title here</title>
<style type="text/css">
body {
   font-family: 'IBM Plex Sans KR', sans-serif;
}
.container {
	display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    margin-top: 10px;
    background-color: #ffffff;
}
.joinRstmain {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin-top: 10px;
	width: 700px;
	background-color: #ffffff;
}
#idcheck {
	margin-left: 10px;
	background-color: #ff3d00;
	width: 20%;
}
#inidcheck{
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
}
#conta {
	width: 450px;
}

.intputarea{
	width: 100%;
 }
.form-control {
    height: calc(1.5em + 0.75rem + -3px);
}
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
#send {
	margin: 30px 0 20px;
	width: 100%;
	height: 50px;
	background-color: #ff3d00;
	border: none;
	color: white;
	font-weight: bold;
}
required {
 border: 2px solid red;
}
</style>
<script type="text/javascript">
mypath = "<%=request.getContextPath()%>";
$(function() {
	chk = 0;
	//데이타 유효성 체크 
	
	
	//아이디 중복 검사
	$('#idcheck').on('click',function(){
		// 입력한 값 가져오기
		idval = $('#id').val().trim();
		if(idval.length<1){
			alert("아이디를 입력해주세요.");
			return false;
		}
		$.ajax({
			url : '<%=request.getContextPath()%>/IdCheck.do',
			type : 'get',
			data : {"id" : idval},
			success : function(res) {
				rct=res.flag;
				if(rct==1){
					$('#idspan').html("중복되는 아이디입니다.").css('color','red');
				}else {
					$('#idspan').html("사용가능한 아이디 입니다.").css('color','#6a6a6a');
					chk++;
				}
			},
			error : function(xhr) {
				alert("상태 : "+xhr.status)
			},
			dataType : 'json'
		})
	})
	
	// 카테고리 끌고오기
	$.getCategorys();
	
	// 카테고리 클릭시 인풋 폼에 들어감 
	$('#ctg').on('change',function(){
		ctgval=$(this).val();
		$('#ctgval').val(ctgval);
	})
//=============================================================== †(구현 완료)†
	// 아이디 전규식
	$('#id').on('keyup',function(){
		idval = $(this).val().trim();
		
		idreg=/^[a-zA-Z][a-zA-Z0-9]{3,14}$/;
		if(!(idreg.test(idval))){
			$(this).css('border','2px solid red')
			$('#idcheck').prop('disabled',true);
		}else {
			$(this).css('border','2px solid green')
			$('#idcheck').prop('disabled',false);
		}
	})
	// 비밀번호 정규식
	$('#pwd').on('keyup',function(){
		pwdval = $(this).val().trim();
		passreg = /^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*?]).{5,30}$/;
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
	
	// 사업자 번호 정규식
	$('#bsnum').on('keyup',function(){
		bsn = $(this).val().trim();
		bsnreg = /^\d{3}-\d{2}-\d{5}$/;
		regCheck(bsnreg,bsn,this);		
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
</head>
<body>
<nav class="navbar navbar-expand-md navbar-light bg-light">
  <a class="navbar-brand" href="<%=request.getContextPath() %>/mainPage.jsp" id="bigtitle">
  	<img src="../images/로고c.png"alt="tablemate.png" id="logo" style="width : 180px;
	height : 60px;">
  </a>
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
        <a class="nav-link" href="<%=request.getContextPath()%>/member/view/login.jsp">로그인</a>
      </li>
    </ul>
  </div>
</nav>


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
  <h2>사업자 회원가입</h2>
  <br>
  <div class="joinRstmain" id="joinRstmain">
  <form action="<%=request.getContextPath() %>/joinRst.do" id="joinrst" onsubmit="return check()" class="needs-validation" 
  method="post" enctype="multipart/form-data">
  	<div id="conta">
    <div class="form-group">
       <label for="uid">아이디</label>
      <div id="inidcheck">
 		<input type="text" class="form-control" id="id" placeholder="4자리 이상 영대소문자 숫자 이용" name="id" required>
		<button type="button" id="idcheck" class="btn btn-danger btn-sm">중복검사</button>
	  </div>
      <span id="idspan"></span>
      
    
<!--       <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div> -->
    </div>
    
    <div class="form-group">
      <label for="pwd">비밀번호</label>
      <input type="password" class="form-control" id="pwd" placeholder="5자이상 30자 이하 영대소문자, 특수기호, 숫자 포함" name="pwd" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
      <label for="uname">사업자 번호</label>
      <input type="text" class="form-control" id="bsnum" placeholder="123-12-12345" name="bsnum" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
	    <label for="ctg" class="form-label">카테 고리 선택</label><br>
		<select class="form-select" id="ctg" name="ctglist"></select>
	    <input type="hidden" class="form-control" id="ctgval" name="ctgval" required>
	</div>
    
    
    <div class="form-group">
      <label for="uname">상호명</label>
      <input type="text" class="form-control" id="name" placeholder="상호명" name="name" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    
    <div class="form-group">
      <label for="uhp">식당 전화 번호</label>
      <input type="text" class="form-control" id="tel" placeholder="'-' 포함" name="tel" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
      <label for="umail">이메일</label>
      <input type="text" class="form-control" id="mail" placeholder="abc123@naver.com" name="mail" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    
    
    <div class="form-group">
      <label for="uadd1">주소</label>
      <button type="button" onclick="inputAddress()" class="btn btn-outline-info btn-sm">주소 검색</button>
      <input type="text" class="form-control" id="add1" placeholder="주소 검색 버튼을 이용해주세요." name="add1" required readonly>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
      <label for="uadd2">상세주소</label>
      <input type="text" class="form-control" id="add2" placeholder="상세 주소를 입력해주세요." name="add2">
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
    <label for="bootstrap-file">가게 사진</label>
    <input type="file" class="form-control-file" id="bootstrap-file" name="bootstrap-file">
  </div>
    
    
    <button type="submit" class="btn btn-success" id="send">회원가입</button>
    </div>
  </form>
  </div>
</div>
</body>
</html>