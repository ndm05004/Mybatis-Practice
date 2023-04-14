<%@page import="com.google.gson.JsonObject"%>
<%@page import="rrs.vo.TagVO"%>
<%@page import="java.util.List"%>
<%@page import="rrs.vo.RsttagVO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="rrs.vo.RestautantVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	RestautantVO vo = (RestautantVO) request.getAttribute("rstvo");
	 List<TagVO> tag = (List<TagVO>) request.getAttribute("rsttag");
	 List<TagVO> taglist = (List<TagVO>) request.getAttribute("taglist");
	JsonObject obj = new JsonObject();
	
	obj.add("rst",new Gson().toJsonTree(vo));
	obj.add("tag",new Gson().toJsonTree(tag));
	obj.add("taglist",new Gson().toJsonTree(taglist));
	
	out.print(obj);
	out.flush();
	
		 
	
%>
<%-- {		

			"rst_id"   : "<%=vo.getRst_id()%>",	
			"rst_name" : "<%=vo.getRst_name()%>",		
			"rst_addr" : "<%=vo.getRst_addr()%>",	
			"rst_tel"  : "<%=vo.getRst_tel()%>",
			"rst_info" : "<%=vo.getRst_info()%>",	
			"rst_pass" : "<%=vo.getRst_pass()%>",	
			"rst_mail" : "<%=vo.getRst_mail()%>",
			"closedday": "<%=vo.getClosedday()%>",
			"bs_num"   : "<%=vo.getBs_num()%>",
			"opentime"  : "<%=vo.getOpnetme()%>",
			"closetime": "<%=vo.getClosetime()%>",
			"accept"   : "<%=vo.getAccept()%>",
			"ctg_id"   : "<%=vo.getCtg_id()%>",	
			"rst_req"  : "<%=vo.getRst_req()%>",
			"rst_photo": "<%=vo.getRst_photo()%>"		

}	
<%
	 }
%> --%>