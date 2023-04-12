<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="rrs.vo.ReservationVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ReservationVO> list=(List<ReservationVO>)request.getAttribute("reservList");
	
	
	if (list.size() > 0 && list != null) {		
%>
	{
		"flag" : "ok",
		"datas" : 
		[
			<%
				for(int i=0;i<list.size();i++){
					ReservationVO vo = list.get(i);		
					if(i>0)out.print(",");
			%>
					{
						"title" : "<%=vo.getRs_id() %>",
						"start" : "<%=vo.getRs_datetime() %>",
						"member" : "<%=vo.getMem_id() %>",
						"numofpeople" : "<%=vo.getRs_people() %>"
					}
			<%
				}// for end..			
			%>
		]
	}
<%
	} else {
%>
		{
			"flag" : "no"
		}
<%
	}
%>