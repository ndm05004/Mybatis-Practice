<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	// 아이디
	$('#uid').on('keyup',function(){
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
	$('#uname').on('keyup',function(){
		nameval = $(this).val().trim();
		namereg= /^[가-힣]{2,10}$/;
		regCheck(namereg,nameval,this);
	})
	
	$('#upwd').on('keyup',function(){
		pwdval = $(this).val().trim();
		passreg = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*?]).{5,30}$/;
		
		//전방탐색
// 		str = ["1000원","2000원","원","5000원"];
// 		reg = /.+(?=원)/;
// 		reg = /(?=.*원)/;
		
// 		for(i=0;i<str.length;i++){
// 			bb = reg.test(str[i]);
// 			alert(bb);
// 		}
		
		
		regCheck(passreg,pwdval,this);
	})
	$('#umail').on('keyup',function(){
		mailvalue = $(this).val().trim();
		mailreg = /^([a-zA-Z0-9._%+-]+)@([a-zA-Z0-9.-]+)\.([a-zA-Z]{2,})$/;
		regCheck(mailreg,mailvalue,this);
	})
	
	
	$('#uhp').on('keyup',function(){
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
	
	//아이디 중복 검사
	$('#idcheck').on('click',function(){
		// 입력한 값 가져오기
		idval = $('#uid').val().trim();
		if(idval.length<1){
			alert("아이디를 입력해주세요.");
			return false;
		}
		$.ajax({
			url : '<%=request.getContextPath()%>/IdCheck.do',
			type : 'get',
			data : {"id" : idval},
			success : function(res) {
				chk++;
				rct=res.flag;
				if(rct.length>14){
					$('#idspan').html(res.flag).css('color','red');
				}else {
					$('#idspan').html(res.flag).css('color','green');
				}
			},
			error : function(xhr) {
				alert("상태 : "+xhr.status)
			},
			dataType : 'json'
		})
	})
	
	$('#zipsearch').on('click',function(){
		window.open("zipsearch.jsp","우편번호찾기","width=650 height=500");
	})
	
	$('#zip').on('click',function(){
		dong = $('#dong').val();
		if(dong.length<1){
			alert("찾을 동을 입력해주세요.")
			return false;
		}
		$.ajax({
			url : '<%=request.getContextPath()%>/zipSearch.do',
			data : {"dong" : dong},
			type : 'post',
			success : function(res) {
				code ="<table class='table'>";
				code += "<tr><td>우편번호</td><td>주소</td><td>번지</td></tr>"
				$.each(res,function(){
					bunji = this.bunji;
					if(typeof bunji=="undefined")bunji="";
					code +=`<tr><td>\${this.zipcode}</td>`;
					code +=`<td>\${this.sido} \${this.gugun} \${this.dong}</td>`;   
					code +=`<td>\${bunji}</td></tr>`;  
				})
				code+="</table>"
				$('#result1').html(code);
			},
			error : function(xhr) {
				alert("Error : "+xhr.status)
			},
			dataType : 'json'
		})
	})
	
	$(document).on('click','#result1 tr',function(){
		zip = $('td:eq(0)',this).text();
		addr = $('td:eq(1)',this).text();
		
		$('#uzip').val(zip);
		$('#uadd1').val(addr);
		$('#dong').val("");
		$('#result1').empty();
		$('#zipModal').modal('hide');
	})
	
	$('#send').on('click',function(){
		if(chk != 1){
			alert("아이디 중복체크를 해주세요.")
			return false;
		}
		
		//입력한 모든값을 가져온다 val()
		/*idval = $('#uid').val().trim();
		nameval = $('#uname').val().trim();
		birval = $('#ubir').val().trim();
		pwdval = $('#upwd').val().trim();
		hpval = $('#uhp').val().trim();
		mailval = $('#umail').val().trim();
		zipval = $('#uzip').val().trim();
		add1val = $('#uadd1').val().trim();
		add2val = $('#uadd2').val().trim();
		*/
// 		fdata1 = $('form').serialize();
// 		fdata2 = $('form').serializeArray();
		fdata = $('form').serializeJSON();
// 		console.log(fdata1);
// 		console.log(fdata2);
		$.ajax({
			url : '<%=request.getContextPath()%>/Insert.do',
			data : fdata,
			type : 'post',
			success : function(res) {
				$('#joinspan').html(res.flag).css('color',"green");
			},
			error : function(xhr) {
				alert("error : "+xhr.status);
			},
			dataType : 'json'
		})
	})
})
</script>
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
  <h2>사업자 회원가입</h2>
  <br>
  
  <form action=""  class="needs-validation" novalidate>
  
    <div class="form-group">
      <label for="uid">아이디</label>
      <button type="button" id="idcheck" class="btn btn-danger btn-sm">중복검사</button>
      <span id="idspan"></span>
      <input type="text" class="form-control" id="id" placeholder="아이디" name="mem_id" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
      <label for="pwd">비밀번호</label>
      <input type="password" class="form-control" id="upwd" placeholder="비밀번호" name="mem_pass" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
      <label for="uname">사업자 번호</label>
      <input type="text" class="form-control" id="uname" placeholder="사업자번호" name="mem_name" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
      <label for="uname">식당 이름</label>
      <input type="text" class="form-control" id="uname" placeholder="가게 이름" name="mem_name" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    
    <div class="form-group">
      <label for="uhp">식당 전화 번호</label>
      <input type="text" class="form-control" id="uhp" placeholder="가게 번호" name="mem_hp" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
      <label for="umail">이메일</label>
      <input type="text" class="form-control" id="umail" placeholder="이메일" name="mem_mail" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    
    
    <div class="form-group">
      <label for="uadd1">주소</label>
      <input type="text" class="form-control" id="uadd1" placeholder="Enter userAdd" name="mem_add1" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
      <label for="uadd2">상세주소</label>
      <input type="text" class="form-control" id="uadd2" placeholder="Enter userAdd2" name="mem_add2" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <button type="button" class="btn btn-success" id="send">Submit</button>
    <span id="joinspan"></span>
    
    
    
    
    
    
    
    
    
    <!-- The Modal -->
<div class="modal fade" id="zipModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        우편번호찾기
        <div class='box'>
		<input type="text" id="dong">            
        <input type='button' class="btn btn-primary" id="zip" value="검색">
        <br>
        <div class='result' id='result1'></div>
    </div>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
<!--     <button class="btn btn-primary"> -->
<!--   	<span class="spinner-border spinner-border-sm"></span> -->
<!--   	Submit.. -->
<!-- 	</button> -->
  </form>
</div>
</body>
</html>