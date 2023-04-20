<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <!-- <script type="text/javascript" src="http://localhost/RRS/js/jquery-3.6.4.min.js"></script> -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


<script type="text/javascript">
$(document).ready(function() {
	  var mypath = '<%=request.getContextPath()%>';

	  <%String rstid = request.getParameter("rst_id");%>
	  rst_id = '<%=rstid%>'; 

	    $.ajax({
	        url :"<%=request.getContextPath()%>/member/menu.do",
	        type: 'get',
	        data: {
	            rst_id: rst_id
	        },
	        success: function(res){
	        	code = "<h3>메뉴</h3>"
	            code += "<table border='1' class='table table-bordered'>";
	            code += "<tr><td>" + res[0].menu_name + "<br>" + res[0].menu_price + "원</td></tr>";
	            code += "<tr><td>" + res[1].menu_name + "<br>" + res[1].menu_price + "원</td></tr>";
	            code += "</table>";
	            
	            code += '<div class="button-wrapper"><button type="button" class="btn btn-outline-secondary" id="allMenu" name="allMenu">메뉴 전체보기 ></button></div>';
	            $('#tab-result').html(code);
	            
	            
	        },
	        error: function(xhr){
	            alert("상태: " + xhr.status);
	        },
	        dataType: 'json'
	    })

	    
        $(document).on('click', 'button[name="allMenu"]', function(){
        	window.location.href = '<%=request.getContextPath()%>/member/rst-select/navMenu.jsp?rst_id=' + rst_id;
       });
	    
});

</script>

<style>

#allMenu{
 width: 80%;
  height: 50px;
}

.button-wrapper {
  display: flex;
  justify-content: center;
}
</style>

</head>
<body>
<div class="tab-content" id="tab-result">
	
</div>
</body>
</html>