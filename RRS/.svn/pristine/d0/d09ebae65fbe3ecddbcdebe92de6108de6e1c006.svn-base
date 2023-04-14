<%@page import="com.google.gson.Gson"%>
<%@page import="rrs.vo.ReviewVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ReviewVO> rList = (List<ReviewVO>) request.getAttribute("review");
	Gson gson = new Gson();
	String result = gson.toJson(rList);
	
	out.print(result);
	out.flush();
%>