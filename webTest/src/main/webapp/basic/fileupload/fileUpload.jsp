<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>File Upload 연습</h2>
<form action="">
	작성자 이름 : <input type="text" name="username"><br><br>
	한 개의 파일 선택 : <input type="file" name="upFile1"><br><br>
	여러 개의 파일 선택 : <input type="file" name="upFile2"><br><br>
	
	<input type = "submit" value="전 송 ">
	
</form>
<br><hr><br>

<a href="<%=request.getContextPath() %>/fileList.do">전체 파일 목록 보기</a>

</body>
</html>