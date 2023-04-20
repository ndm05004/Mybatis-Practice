<%@page import="com.google.gson.Gson"%>
<%@page import="rrs.vo.RestautantVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

RestautantVO rstinfo= (RestautantVO)request.getAttribute("rstinfo"); 

Gson gson = new Gson();

String json = gson.toJson(rstinfo);

out.print(json);
out.flush();

%>