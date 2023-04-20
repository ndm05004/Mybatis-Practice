<%@page import="com.google.gson.Gson"%>
<%@page import="rrs.vo.RestautantVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<RestautantVO> bookmarkList = (List<RestautantVO>) request.getAttribute("bList");
	
	Gson gson = new Gson();
	String result = gson.toJson(bookmarkList);
	
	out.print(result);
	out.flush();
%>