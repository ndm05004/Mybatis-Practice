<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="../../js/jquery-3.6.4.min.js"></script>

<script type="text/javascript">

$(function(){
	
	mem_id = '<%=request.getParameter("mem_id")%>'
	

		$.ajax({	
			url : "<%=request.getContextPath()%>/admin/memberDetail.do",
	    	type: 'get',
	    	data: { mem_id: mem_id },
	    	success: function(res) { 
	    		code = "<br>"
	    		code += "<h4>"+res.mem_id+"님의 회원정보</h4>"
	    		code += "<br>"
	    		code +="<table border='1' table class='table table-bordered'>";
	    	    code += "<tr><td>회원ID</td><td>"+res.mem_id+"</td></tr>"       
	    	    code += "<tr><td>회원명</td><td>"+res.mem_name+"</td></tr>"       
	    	    code += "<tr><td>이메일</td><td>"+res.mem_mail+"</td></tr>"       
	    	    code += "<tr><td>전화번호</td><td>"+res.mem_tel+"</td></tr>"       
	    	    code += "<tr><td>닉네임</td><td>"+res.mem_nick+"</td></tr>"       
	    	    code += "<tr><td>생년월일</td><td>"+res.mem_bir+"</td></tr>"       
	    	    code += "<tr><td>신고받은횟수</td><td>"+res.mem_rn+"</td></tr>"      
	    	    code += "<tr><td>제재횟수</td><td>"+res.mem_st+"</td></tr>"        
	    	    code += "<tr><td>활성화여부</td><td>"+res.mem_lc+"</td></tr>"       
	    	    code += "</table>";
	    	     $('#mem-result').html(code);
	    	    },
	    	    error: function(xhr) {
	    	      alert("상태: " + xhr.status);
	    	    },
	    	    dataType: 'json'
	    	  });

	
})

</script>

</head>
<body>
<div id="mem-result">

</div>

</body>
</html>