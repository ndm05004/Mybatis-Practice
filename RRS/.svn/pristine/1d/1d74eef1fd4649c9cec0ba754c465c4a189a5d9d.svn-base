<%@page import="rrs.vo.MemberVO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

List<MemberVO> blackList = (List<MemberVO>)request.getAttribute("blackList");

Gson gson = new Gson();
String bList = gson.toJson(blackList);

out.print(bList);
out.flush();

%>