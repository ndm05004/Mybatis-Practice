<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="rrs.vo.NoticeBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

List<NoticeBoardVO> baordinfolist= (List<NoticeBoardVO>)request.getAttribute("noticeVo"); 


int startPage =  (Integer)request.getAttribute("startPage");
int endPage =  (Integer)request.getAttribute("endPage");
int totalPage =  (Integer)request.getAttribute("totalPage");


JsonObject obj = new JsonObject();
obj.addProperty("sp", startPage);
obj.addProperty("ep", endPage);
obj.addProperty("tp", totalPage);

Gson gson = new Gson();

JsonElement bList = gson.toJsonTree(baordinfolist);

obj.add("datas", bList);

out.print(obj);
out.flush();

%>