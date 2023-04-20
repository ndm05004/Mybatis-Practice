<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memcheck = (String)request.getAttribute("memcheck");
	if(memcheck.equals("blackList")) {
%>
		{
			"flag" : "이용이 정지된 계정입니다."
		}
<%
	}else {
%>
		{
			"flag" : "OK"
		}

<%
	}
%>