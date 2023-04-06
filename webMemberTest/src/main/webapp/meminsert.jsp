<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="js/jquery-3.6.4.min.js" type="text/javascript"></script>
<script src="js/jquery.serializejson.min.js" type="text/javascript"></script>

<script type="text/javascript">
$(document).ready(function() {
        $('#back').click(function() {
            window.location.href = '<%= request.getContextPath() %>/memberList.do';
        });
   
    
    
   $('#idCheck').on('click', function(){
	   
	   idvalue = $('#mem_id').val().trim();
	   
	   if(idvalue.length < 1){
		   alert("아이디를 입력하세요");
		   return false;
	   }
	   
	   $.ajax({
		 
		   url : '<%= request.getContextPath() %>/idCheck.do',
		   type: 'get',
		   data: {"id" : idvalue},
		   success : function(res){
			   alert("사용가능한 ID입니다.");
		   },
		   error : function(xhr){
			   alert("상태 : " + xhr.status);
		   },
		   dataType : 'json'
		   
	   })
   })
   
   
});
    
</script>

<style>
	
	table{
		border: 1px solid blue;
		border-collapse:collapse; 
	}
	
</style>

</head>


<body>
<h3>회원 정보 입력 폼</h3>
<form action = '<%= request.getContextPath()%>/addMember.do' enctype="multipart/form-data" method="post">
<table border="1">
<tr>
	<td>회원ID</td>
	<td><input type="text" id="mem_id" name="mem_id"> <input type ="button" value="중복확인" id="idCheck"></td>
</tr>
<tr>
	<td>비밀번호</td>
	<td><input type="text" name="mem_pass">
</tr>
<tr>
	<td>비밀번호 확인</td>
	<td><input type="password" name="mem_pass2">
</tr>
<tr>
	<td>회원이름</td>
	<td><input type="password" name="mem_name">
</tr>
<tr>
	<td>전화번호</td>
	<td><input type="text" name="mem_tel">
</tr>
<tr>
	<td>회원주소</td>
	<td><input type="text" name="mem_addr">
</tr>
<tr>
	<td>프로필사진</td>
	<td><input type="file" name="mem_profile" id="mem_profile">
</tr>
<tr>
	<td colspan="2"> <input type ="submit" value="저장" id="storage"> <input type="reset" value="취소" /><input type ="button" value="회원목록" id="back"> </td>
</tr>

</table>
</form>

</body>
</html>