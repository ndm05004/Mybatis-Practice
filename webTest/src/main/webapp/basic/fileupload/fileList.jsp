<%@page import="kr.or.ddit.vo.FileinfoVO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	// 컨트롤러에서 보낸 데이터 받아오기
	List<FileinfoVO> list = (List<FileinfoVO>)request.getAttribute("fileList");
%>

<h3>전체 파일 목록</h3>
<br><hr><br>
<a href="<%=request.getContextPath()%>/fileUpload.do">파일 업로드</a>

<table border ="1">
<thead>
	<tr><th>번호</th><th>작성자</th><th>저장 파일명</th><th>원래의 파일명</th>
	<th>파일 크기</th><th>날짜</th><th>비 고</th>
</thead>
<tbody>
<%

	if(list == null || list.size()==0){
	%>	
	<tr><td colspan="7">저장된 파일 목록이 하나도 없습니다.</td></tr>
	<%
	}else{
		for(FileinfoVO fvo : list){
			%>
			<tr>
			
				<td><%=fvo.getFile_no()%></td>
				<td><%=fvo.getFile_writer()%></td>
				<td><%=fvo.getSave_file_name()%></td>
				<td><%=fvo.getOrigin_file_name()%></td>
				<td><%=fvo.getFile_size()%></td>
				<td><%=fvo.getFile_date()%></td>
				<td> DownLoad</td>
			</tr>
			<%			
		}
	}

%>

</tbody>


</table>

</body>
</html>