<%@page import="com.google.gson.Gson"%>
<%@page import="rrs.vo.NoticeBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

List<NoticeBoardVO> baordinfolist= (List<NoticeBoardVO>)request.getAttribute("noticeVo"); 

Gson gson = new Gson();
String mList = gson.toJson(baordinfolist);

out.print(mList);
out.flush();

%>