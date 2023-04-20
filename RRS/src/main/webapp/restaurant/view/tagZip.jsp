<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="rrs.vo.TagVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<TagVO> tagList = (List<TagVO>)request.getAttribute("tagList");
	List<TagVO> selectTag =(List<TagVO>)request.getAttribute("selectTag");
	
	JsonObject obj = new JsonObject();
	
	obj.add("tagList", new Gson().toJsonTree(tagList));
	obj.add("selectTag", new Gson().toJsonTree(selectTag));
	
	out.print(obj);
	out.flush();
%>