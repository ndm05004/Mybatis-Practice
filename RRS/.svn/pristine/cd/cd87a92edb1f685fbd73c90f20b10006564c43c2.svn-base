<%@page import="com.google.gson.Gson"%>
<%@page import="rrs.vo.MenuVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<MenuVO> list=(List<MenuVO>)request.getAttribute("menulist");

	String result = new Gson().toJson(list);
	
	out.print(result);
	out.flush();
%>
