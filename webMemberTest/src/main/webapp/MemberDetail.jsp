<%@page import="member.vo.MemberVo"%>
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

<% 
MemberVo vo = (MemberVo)request.getAttribute("res");
%>

<table border="1">
	<tr><td colspan="2" ><img src="<%=request.getContextPath()%>/images/imageSrcView.do?id=<%=vo.getMem_id()%>"></td></tr>
	
	<tr>
		<td>회원ID</td>
		<td><%=vo.getMem_id()%></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><%=vo.getMem_pass()%></td>
	</tr>
	<tr>
		<td>회원이름</td>
		<td><%=vo.getMem_name()%></td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td><%=vo.getMem_tel()%></td>
	</tr>
	<tr>
		<td>회원주소</td>
		<td><%=vo.getMem_addr()%></td>
	</tr>
	<tr>
		<td colspan="2"> <input type ="button" value="수정" id="storage"> <input type="button" id="delete" value="삭제" /><input type ="button" value="회원목록" id="back"> </td>
	</tr>




</table>

</body>
</html>