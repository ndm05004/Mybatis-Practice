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
	// Session 정보를 가져온다. --> JSP문서에서 HttpSession객체는 'session'이라는 이름으로 저장되어 있다.
	String loginID = (String)session.getAttribute("USERID");
	
	if(loginID==null){
%>

<form action="<%=request.getContextPath()%>/sessionLoginSolution.do" method="post">
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

<h3><%=loginID%>님 반갑습니다</h3>
<a href="<%=request.getContextPath() %>/sessionLogoutSolution.do">로그아웃</a><br><br>

<%} %>

</body>
</html>