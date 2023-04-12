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
	
	$('#cmtReportDetail').on('click', function() {
 
		$.ajax({	
			url : "<%=request.getContextPath()%>/admin/cmtReportDetail.do",
	    	type: 'get',
	    	data: { mem_id: mem_id },
	    	success: function(res) { 
	    		code = "<br>"
	    		code += "<h4>"+'<%=request.getParameter("mem_id")%>'+"님의 신고목록</h4>"
	    		code += "<br>"
	    		code +="<table border='1' table class='table table-bordered'>";
	    		 $.each(res, function(i, v){
		    		code += "<tr class='special-row' id="+v.cmtr_id+"><td>신고번호</td><td>"+v.cmtr_id+"</td></tr>"             
		    	    code += "<tr><td>신고자ID</td><td>"+v.reporter+"</td></tr>"             
		    	    code += "<tr><td>신고사유</td><td>"+v.cmtr_reason+"</td></tr>"             
		    	    code += "<tr><td>댓글내용</td><td>"+v.cmt_content+"</td></tr>"             
	    		 }),
	    	    code += "</table>";
	    	     $('#black-result').html(code);
	    	    },
	    	    error: function(xhr) {
	    	      alert("상태: " + xhr.status);
	    	    },
	    	    dataType: 'json'
	    	  });
	})

		$('#rvreportDetail').on('click', function() {
 
		$.ajax({	
			url : "<%=request.getContextPath()%>/admin/rvreportDetail.do",
	    	type: 'get',
	    	data: { mem_id: mem_id },
	    	success: function(res) { 
	    		code = "<br>"
	    		code += "<h4>"+'<%=request.getParameter("mem_id")%>'+"님의 신고목록</h4>"
	    		code += "<br>"
	    		code +="<table border='1' table class='table table-bordered'>";
	    		 $.each(res, function(i, v){
	    			code += "<tr class='special-row'><td>신고번호</td><td>"+v.rvr_id+"</td></tr>"             
		    	    code += "<tr><td>신고자ID</td><td>"+v.reporter+"</td></tr>"             
		    	    code += "<tr><td>신고사유</td><td>"+v.rvr_reason+"</td></tr>"             
		    	    code += "<tr><td>댓글내용</td><td>"+v.rv_content+"</td></tr>"             
	    		 }),
	    	    code += "</table>";
	    	     $('#black-result').html(code);
	    	    },
	    	    error: function(xhr) {
	    	      alert("상태: " + xhr.status);
	    	    },
	    	    dataType: 'json'
	    	    });
		})
		
		
		$('#rvreportDetail').on('click', function() {
 
			$.ajax({
				url : "<%=request.getContextPath()%>/admin/rnRelease.do",
		    	type: 'get',
		    	data: { mem_id: mem_id },
		    	success: function(res) { 
		    		alert("상태:")
		    	},
		    	error: function(xhr) {
		    	  alert("상태: " + xhr.status);
		    	},
		    	dataType: 'json'
		    	});
			})
		
		
		
		$('#rvreportDetail').click();

	});

</script>

<style>

.special-row {
  background-color: #e9e9e9;
  font-weight: bold;
}

</style>


</head>
<body>
<div class="container mt-3">
  <h2>리뷰/댓글 신고목록</h2>
  <br>
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
      <a class="nav-link active" data-bs-toggle="tab" href="#home" id="rvreportDetail">리뷰 신고</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="tab" href="#menu1" id="cmtReportDetail">댓글신고</a>
    </li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content" id="black-result">
    <div id="home" class="container tab-pane active"><br>
      
    </div>
</div>

</div>

</body>
</html>