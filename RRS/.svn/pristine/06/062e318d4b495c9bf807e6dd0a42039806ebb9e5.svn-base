<%@page import="rrs.vo.RestautantVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	RestautantVO vo = (RestautantVO) request.getAttribute("rstcheck");
	if(vo == null) {
%>
		{
			"flag" : "아이디(로그인 전용 아이디) 또는 비밀번호를 잘못 입력했습니다. 입력하신 내용을 다시 확인해주세요."
		}
<%
	} else if(vo.getAccept() == null){
%>
		{
			"flag" : "승인되지 않은 사업자 계정입니다. 관리자 승인 후 로그인 가능합니다."
		}

<%
	} else {
%>
		{
			"flag" : "OK"
		}
<%
	}
%>