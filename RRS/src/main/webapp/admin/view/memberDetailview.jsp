<%@page import="rrs.vo.MemberVO"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

MemberVO vo  = (MemberVO)request.getAttribute("memDetailVo");

Gson gson = new Gson();
String detail = gson.toJson(vo);

out.print(detail);
out.flush();

%>