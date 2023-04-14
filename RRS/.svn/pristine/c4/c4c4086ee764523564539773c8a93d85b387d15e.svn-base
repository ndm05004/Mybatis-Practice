<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="rrs.vo.RstcmtVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<RstcmtVO> list = (List<RstcmtVO>)request.getAttribute("list");
JsonObject obj = new JsonObject();
Gson gson = new Gson();

obj.add("list",gson.toJsonTree(list));

out.print(obj);
out.flush();
 
%>
