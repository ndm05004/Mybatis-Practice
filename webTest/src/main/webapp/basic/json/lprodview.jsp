<%@page import="com.google.gson.Gson"%>
<%@page import="lprod.vo.LprodVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
List<LprodVO> varlist = (List<LprodVO>)request.getAttribute("lprodVoList");

Gson gson = new Gson();

String result = gson.toJson(varlist);

out.print(result);
out.flush();

%>