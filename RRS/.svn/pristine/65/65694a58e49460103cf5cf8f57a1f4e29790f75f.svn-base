<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pass = (String) request.getAttribute("pass");
	int cernum = (int) request.getAttribute("cernum");
	if(pass == null) {
%>
		{
			"flag" : "존재하는 계정이 없습니다.", "cernum": 0
		}
<%
	} else {
%>
		{
			"flag" : "인증번호가 전송되었습니다.", "cernum": <%=cernum %>
		}

<%
	}
%>