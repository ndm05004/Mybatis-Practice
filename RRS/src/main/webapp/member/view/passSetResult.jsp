<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int cnt = (int) request.getAttribute("result");
	if(cnt > 0) {
%>
		{
			"flag" : "비밀번호가 변경되었습니다."
		}
<%
	} else {
%>
		{
			"flag" : "비밀번호 변경에 실패했습니다."
		}

<%
	}
%>