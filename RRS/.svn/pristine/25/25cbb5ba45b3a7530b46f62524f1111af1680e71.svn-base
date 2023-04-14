<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="../../js/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
mypath = '<%=request.getContextPath()%>';

$(function(){
	rst_id='asd123';
	rst_page='1';
	
	$.ajax({
        url : "<%=request.getContextPath()%>/RstView.do",
        type: 'get',
        data: { 
        	rst_id: rst_id,
        	rst_page : rst_page
        },
        success: function(res){
        	
        	code= `
        		<div id="rst-photo" class="container p-3 my-3 border">
        		<img src='${request.getContextPath()}/ImageView.do?Photo=${v.rst_photo}' width='200' height='140'>
        		</div>
        		<div id="rst-info" class="container p-3 my-3 border">
	        		<h4>${res.rst_name}</h4>
	        		<h5>${res.rst_info}</h5>
        		
        		<div>
	        		<button type="button" class="btn btn-outline-secondary">전화하기</button>
	        		<button type="button" class="btn btn-outline-secondary">위치보기</button>
        		</div>`
        	
        	$('#body').html(code);
        },
        error: function(xhr){
        	alert("상태: " + xhr.status);
        },
        dataType: 'json'
	})
	
})

</script>

</head>
<body>

</body>
</html>