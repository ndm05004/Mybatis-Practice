<%@page import="rrs.vo.RestautantVO"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

List<RestautantVO> rstList = (List<RestautantVO>)request.getAttribute("awaitList");

Gson gson = new Gson();
String aList = gson.toJson(rstList);

out.print(aList);
out.flush();

%>