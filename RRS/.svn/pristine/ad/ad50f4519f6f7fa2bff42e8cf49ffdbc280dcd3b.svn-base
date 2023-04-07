<%@page import="com.google.gson.Gson"%>
<%@page import="rrs.vo.RstDetailVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

List<RstDetailVO> rstDetailList = (List<RstDetailVO>)request.getAttribute("rstDetailList");

Gson gson = new Gson();
String aList = gson.toJson(rstDetailList);

out.print(aList);
out.flush();

%>