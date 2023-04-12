<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pass = (String) request.getAttribute("pass");
	if(pass == null) {
%>
		{
			"flag" : "존재하는 계정이 없습니다."
		}
<%
	} else {
%>
		{
			"flag" : "비밀번호설정"
		}

<%
	}
%>