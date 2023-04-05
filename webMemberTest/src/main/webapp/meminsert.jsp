<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
    $(document).ready(function() {
        $('#back').click(function() {
            window.location.href = 'memberlist.jsp';
        });
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

<table border="1">
<tr>
	<td>회원ID</td>
	<td><input type="text" name="mem_id"> <input type ="button" value="중복확인" id="idCheck"></td>
</tr>
<tr>
	<td>비밀번호</td>
	<td><input type="text" name="mem_pass">
</tr>
<tr>
	<td>비밀번호 확인</td>
	<td><input type="text" name="mem_pass2">
</tr>
<tr>
	<td>회원이름</td>
	<td><input type="text" name="mem_name">
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
	<td><input type="text" name="mem_profile">
</tr>
<tr>
	<td colspan="2">  <input type ="button" value="저장" id="storage"> <input type ="button" value="회원목록" id="back"> </td>
</tr>


</table>


</body>
</html>