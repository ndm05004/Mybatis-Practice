<%@page import="rrs.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberVO vo = (MemberVO) request.getAttribute("memcheck");
	if(vo == null) {
%>
		{
			"flag" : "아이디(로그인 전용 아이디) 또는 비밀번호를 잘못 입력했습니다. 입력하신 내용을 다시 확인해주세요."
		}
<%
	}else {
%>
		{
			"flag" : "OK"
		}

<%
	}
%>