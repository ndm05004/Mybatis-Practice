<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String) request.getAttribute("memid");
	if(id == null) {
%>
		{
			"flag" : "존재하는 id가 없습니다."
		}
<%
	} else {
%>
		{
			"flag" : "ID : <%=id%>"
		}

<%
	}
%>