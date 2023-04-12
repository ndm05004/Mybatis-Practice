<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link href="css/styles.css" rel="stylesheet" />

<script type="text/javascript" src="../../js/jquery-3.6.4.min.js"></script>

<script>
$(function(){	
	
	$('#rvReportBtn').on('click', function() {
		$.ajax({
			url : "<%=request.getContextPath()%>/admin/rvreportList.do",
			type : 'get',
			dataType : 'json',
			error : function(xhr) {
				alert("상태 : " + xhr.status);
			},
			success : function(res) {
				code = "<table border='1' class='table table-striped'>"
				code += "<tr><td>신고번호</td><td>신고사유</td><td>신고자</td><td>신고일</td><td>리뷰제목</td>"
				$.each(res, function(i, v){
					code+= "<tr><td>"+v.rvr_id+"</td>"
					code+= "<td>"+v.rvr_reason+"</td>"
					code+= "<td>"+v.mem_id+"</td>"
					code+= "<td>"+v.rvr_date+"</td>"
					code+= "<td>"+v.rv_title+"</td></tr>"
				})
				code += "</table>"
				$('#result').html(code);
			}
		})
	}) 
	
	
	$('#cmtReportBtn').on('click', function() {
		$.ajax({
			url : "<%=request.getContextPath()%>/admin/cmtReportList.do",
			type : 'get',
			dataType : 'json',
			error : function(xhr) {
				alert("상태 : " + xhr.status);

			},
			success : function(res) {
				code = "<table border='1' class='table table-striped'>"
				code += "<tr><td>신고번호</td><td>신고사유</td><td>신고자</td><td>신고일</td>"
				$.each(res, function(i, v){
					code+= "<tr><td>"+v.cmtr_id+"</td>"
					code+= "<td>"+v.cmtr_reason+"</td>"
					code+= "<td>"+v.mem_id+"</td>"
					code+= "<td>"+v.cmtr_date+"</td>"
				})
				code += "</table>"
				$('#result').html(code);
			}
		})
	}) 

	
})


</script>

<title>Insert title here</title>
</head>

<body>


<button class='btn btn-primary' id='rvReportBtn' name='rvReportBtn'>리뷰신고목록</button>
<button class='btn btn-primary' id='cmtReportBtn' name='cmtReportBtn'>댓글신고목록</button>

<div class='result' id='result'>

</div>


</body>
</html>