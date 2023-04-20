<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String rsid = (String)request.getAttribute("rsid");
	out.print(rsid);
	out.flush();
%>