<%@page import="com.google.gson.Gson"%>
<%@page import="rrs.vo.ReservationDetailVO"%>
<%@page import="rrs.admin.controller.RestaurantDetail"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ReservationDetailVO> list =(List<ReservationDetailVO>) request.getAttribute("reservDetail");

	String result = new Gson().toJson(list);
	
	out.print(result);
	out.flush();
%>
