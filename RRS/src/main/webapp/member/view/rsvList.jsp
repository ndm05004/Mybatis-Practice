<%@page import="com.google.gson.Gson"%>
<%@page import="rrs.vo.ReservationVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ReservationVO> rsvList = (List<ReservationVO>) request.getAttribute("rsvList");
	
	Gson gson = new Gson();
	String result = gson.toJson(rsvList);
	
	out.print(result);
	out.flush();
%>