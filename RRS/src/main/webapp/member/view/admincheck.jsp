<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String adminId = (String)request.getAttribute("adminid");
	String adminPass = (String)request.getAttribute("adminpass");


	if("admin".equals(adminId) && "admin".equals(adminPass)) {
%>
		{
			"flag" : "admin"
		}
<%
	} else {
%>
		{
			"flag" : "admin 로그인 실패"
		}

<%
	}
%>