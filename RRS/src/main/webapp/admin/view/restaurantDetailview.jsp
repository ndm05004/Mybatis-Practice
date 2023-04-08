<%@page import="com.google.gson.Gson"%>
<%@page import="rrs.vo.RstDetailVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

RstDetailVO vo  = (RstDetailVO)request.getAttribute("rstDetailVo");

Gson gson = new Gson();
String detail = gson.toJson(vo);

out.print(detail);
out.flush();

%>