<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
 <!--  <script type="text/javascript" src="http://localhost/RRS/js/jquery-3.6.4.min.js"></script> -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">

<%String rstid = request.getParameter("rst_id");%>
rst_id = '<%=rstid%>'; 

var mypath = '<%=request.getContextPath()%>';

$.ajax({
    url: "<%=request.getContextPath()%>/member/review.do",
    type: 'get',
    data: {
        rst_id: rst_id
    },
    success: function(res) {
    	code = "";
        code += "<table border='1'>";
        var imgCount = 0;
        $.each(res.rv, function(i, v) {
            if (i >= 6) {
                // If we've already added 6 items, break out of the loop
                return false;
            }
            if (imgCount % 3 == 0) {
                code += "<tr>";
            }
            if (v.rv_photo != null) {
                code += '<td class="imgtd"><img class="reviewImg" src="' + mypath + '/ImageView.do?Photo=' + v.rv_photo + '"></td>';
             	}            imgCount++;
            if (imgCount % 3 == 0) {
                code += "</tr>";
            }
        })
        // If the loop didn't end on a new row, close the last one
        if (imgCount % 3 != 0) {
            code += "</tr>";
        }
        code += "</table>";
        $('#photo2').html(code);
    },
    error: function(xhr) {
        alert("상태: " + xhr.status);
    },
    dataType: 'json'
})


	
</script>

<style type="text/css">

.reviewImg{
	width: 200px;
	height: 200px;
}

.imgtd{
    width: 150px;
    height: 150px;
}

.button-wrapper {
  display: flex;
  justify-content: center;
}

</style>

</head>
<body>

</body>
</html>