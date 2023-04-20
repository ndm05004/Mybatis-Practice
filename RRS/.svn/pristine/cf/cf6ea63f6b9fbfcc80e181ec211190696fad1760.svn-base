<%@page import="com.google.gson.Gson"%>
<%@page import="rrs.vo.IqrVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	List<IqrVO> list = (List<IqrVO>)request.getAttribute("list");

Gson gson = new Gson();
 String iqrlist = gson.toJson(list);
 
 out.print(iqrlist);
 out.flush();
	
%>