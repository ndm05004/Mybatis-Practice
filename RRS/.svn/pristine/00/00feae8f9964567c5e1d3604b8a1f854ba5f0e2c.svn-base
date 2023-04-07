<%@page import="com.google.gson.Gson"%>
<%@page import="rrs.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%

List<MemberVO> meminfolist= (List<MemberVO>)request.getAttribute("memDetailList"); 

Gson gson = new Gson();
String mList = gson.toJson(meminfolist);

out.print(mList);
out.flush();

%>