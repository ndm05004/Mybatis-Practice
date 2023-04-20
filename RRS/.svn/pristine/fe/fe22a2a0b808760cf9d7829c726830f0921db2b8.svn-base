<%@page import="com.google.gson.Gson"%>
<%@page import="rrs.vo.RstDetailVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<RstDetailVO> list=(List<RstDetailVO>)request.getAttribute("rstList");

	String result = new Gson().toJson(list);
	
	out.print(result);
	out.flush();
%>
    