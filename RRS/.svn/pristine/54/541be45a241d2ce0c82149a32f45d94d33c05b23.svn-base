<%@page import="com.google.gson.Gson"%>
<%@page import="rrs.vo.MenuVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MenuVO vo = (MenuVO)request.getAttribute("menuDetail");
	
	String result = new Gson().toJson(vo);
	out.print(result);
	out.flush();
%>