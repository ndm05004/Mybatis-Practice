<%@page import="com.google.gson.Gson"%>
<%@page import="rrs.vo.CategoryVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<CategoryVO> list = (List<CategoryVO>)request.getAttribute("ctglist");

	String ctgList = new Gson().toJson(list);
	
	out.print(ctgList);
	out.flush();
%>