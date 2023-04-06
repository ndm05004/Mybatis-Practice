<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String res = (String)request.getAttribute("idvalue");
	
	if(res!= null){
%>
{
	
	"flag" : "사용불가능 id입니다."
	
}
<%}else{%>
{
	"flag" : "사용가능 id입니다."
}

<% 
}
%>
