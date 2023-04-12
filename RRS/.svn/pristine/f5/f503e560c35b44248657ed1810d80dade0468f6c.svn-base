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
	
	rst_id = '<%=request.getParameter("rst_id")%>'
	

		$.ajax({	
		    url: "<%=request.getContextPath()%>/admin/restaurantDetail.do",
	    	type: 'get',
	    	data: { rst_id: rst_id },
	    	success: function(res) { 
	    		code = "<br>"
	    		code += "<h4>"+res.rst_id+"님의 회원정보</h4>"
	    		code += "<br>"
	    		code +="<table border='1' table class='table table-bordered'>";
	    	    code += "<tr><td>식당ID</td><td>"+res.rst_id+"</td></tr>"       
	    	    code += "<tr><td>식당이름</td><td>"+res.rst_name+"</td></tr>"       
	    	    code += "<tr><td>주소</td><td>"+res.rst_addr+"</td></tr>"       
	    	    code += "<tr><td>전화번호</td><td>"+res.rst_tel+"</td></tr>"       
	    	    code += "<tr><td>카테고리</td><td>"+res.rst_menu+"</td></tr>"       
	    	    code += "<tr><td>식당정보</td><td>"+res.rst_info+"</td></tr>"       
	    	    code += "<tr><td>별점평균</td><td>"+res.starcountavg+"</td></tr>"      
	    	    code += "<tr><td>식당메일</td><td>"+res.rst_mail+"</td></tr>"        
	    	    code += "<tr><td>휴무일</td><td>"+res.closedday+"</td></tr>"       
	    	    code += "<tr><td>사업자번호</td><td>"+res.bs_num+"</td></tr>"       
	    	    code += "<tr><td>승인일</td><td>"+res.accept+"</td></tr>"       
	    	    code += "</table>";
	    	     $('#rst-result').html(code);
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

<div id="rst-result">

</div>
</body>
</html>