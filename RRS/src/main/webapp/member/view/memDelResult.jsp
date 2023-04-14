<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int cnt = (int) request.getAttribute("cnt");
	if(cnt > 0) {
%>
		{
			"flag" : "OK"
		}
<%
	} else {
%>
		{
			"flag" : "회원탈퇴에 실패하였습니다."
		}

<%
	}
%>