<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="rrs.vo.ReviewVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

List<ReviewVO> list = (List<ReviewVO>)request.getAttribute("review");

JsonObject obj = new JsonObject();
obj.add("rv", new Gson().toJsonTree(list));
out.print(obj);
out.flush();
%>