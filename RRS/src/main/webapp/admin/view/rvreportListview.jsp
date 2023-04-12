<%@page import="rrs.vo.RvrepotVO"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

List<RvrepotVO> baordinfolist= (List<RvrepotVO>)request.getAttribute("volist"); 

Gson gson = new Gson();
String mList = gson.toJson(baordinfolist);

out.print(mList);
out.flush();

%>