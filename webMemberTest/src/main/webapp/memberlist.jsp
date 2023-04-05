<%@page import="member.vo.MemberVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="js/jquery-3.6.4.min.js" type="text/javascript"></script>

<script type="text/javascript">
    $(document).ready(function() {
        $('#memAdd').click(function() {
            window.location.href = 'meminsert.jsp';
        });
    });
</script>

<script type="text/javascript">
	

	
</script>

<style>
	#memAdd{
		float: right;
	}
</style>


<body>

<% 
List<MemberVo> memList = (List<MemberVo>)request.getAttribute("memlist"); 
%>
<h3>회원 목록 보기</h3>
<table border="1">

<tr>
   <th colspan='5'>
   <input type ="button" value="회원추가" id="memAdd">
   </th>   
</tr>
	<tr>
		<th>ID</th>
		<th>비밀번호</th>
		<th>이름</th>
		<th>전화</th>
		<th>주소</th>
	</tr>
	
<%
	for(MemberVo mvo : memList){
%>
	<tr><td><%= mvo.getMem_id() %></td>
	<td><%= mvo.getMem_pass() %></td>
	<td><%= mvo.getMem_name() %></td>
	<td><%= mvo.getMem_tel() %></td>
	<td><%= mvo.getMem_addr() %></td></tr>
<%
	}
%>
</table>


</body>
</html>