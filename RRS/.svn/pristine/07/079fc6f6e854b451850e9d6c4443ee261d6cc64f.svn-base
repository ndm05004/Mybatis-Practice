<%@page import="com.google.gson.Gson"%>
<%@page import="rrs.vo.CmtReportVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

List<CmtReportVO> baordinfolist= (List<CmtReportVO>)request.getAttribute("volist"); 

Gson gson = new Gson();
String mList = gson.toJson(baordinfolist);

out.print(mList);
out.flush();

%>