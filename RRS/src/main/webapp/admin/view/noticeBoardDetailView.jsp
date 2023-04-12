<%@page import="com.google.gson.Gson"%>
<%@page import="rrs.vo.NoticeBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

NoticeBoardVO nvo = (NoticeBoardVO)request.getAttribute("nvo");

Gson gson = new Gson();

String nboarDetail = gson.toJson(nvo);

out.print(nboarDetail);
out.flush();

%>