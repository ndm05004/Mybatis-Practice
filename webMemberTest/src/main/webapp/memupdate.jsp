<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="js/jquery-3.6.4.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {
        $('#back').click(function() {
            window.location.href = '<%= request.getContextPath() %>/memberList.do';
        });
});

</script>   



</head>
<body>

<%String id = request.getParameter("id");%> 

<h3>회원 정보 수정 폼</h3>
<form action = '<%=request.getContextPath()%>/updatemember.do?mem_id=<%=id%>' enctype="multipart/form-data" method="post">
<table border="1">
<tr><td colspan="2" ><img src="<%=request.getContextPath()%>/images/imageSrcView.do?id=<%=id%>"></td></tr>
<tr> 
	<td>회원ID</td>
	<td><%=id%> </td>
		
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
	<td><input type="file" name="mem_photo" id="mem_photo">
</tr>
<tr>
	<td colspan="2"> 
	<input type ="submit" value="저장" id="storage"> 
	<input type="reset" value="취소" />
	<input type ="button" value="회원목록" id="back"> </td>
</tr>

</table>
</form>

</body>
</html>