<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

	String flag = (String)session.getAttribute("FLAG");
	
	if(flag=="false"){
%>

<form action="<%=request.getContextPath()%>/sessionLogin.do" method="post">
<table border='1' style="margin:0 auto;">
<tr>
   <td>Id : </td>
   <td><input type = "text" name = "userid"  placeholder="ID를 입력하세요"></td>
</tr>
<tr>
   <td>PASS : </td>
   <td><input type="password" name = "userpass" placeholder="PassWord를 입력하세요"></td>
</tr>   
<tr>
   <td colspan="2" style="text-align:center;"><input type="submit" value="Login"></td>
</tr>
</table>
</form>

<% }else{ %>

<h3>admin님 반갑습니다</h3>
<a href="<%=request.getContextPath() %>/sessionLogout.do">로그아웃</a><br><br>

<%} %>

</body>
</html>