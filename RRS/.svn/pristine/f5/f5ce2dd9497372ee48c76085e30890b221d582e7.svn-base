<%@page import="com.google.gson.Gson"%>
<%@page import="rrs.vo.MenuVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<MenuVO> menulist = (List<MenuVO>) request.getAttribute("menulist");
	
	Gson gson = new Gson();
	String result = gson.toJson(menulist);
	
	out.print(result);
	out.flush();
%>