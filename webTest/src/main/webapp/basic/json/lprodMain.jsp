<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 
	아래의 'Lprod자료 가져오기'버튼을 클릭하면 DB의 LPROD테이블의 전체 데이터를 가져와
	id가 'result'인 <div>태그에 표로 출력하시오.
	( Ajax이용, Dao 사용, 서블릿의 URL패턴 :/lprodList.do)
 -->
 
<script type="text/javascript" src="../js/jquery-3.6.4.min.js"></script>
 
 <script type="text/javascript">
 
 $(function(){
     $('#lprodBtn').on('click',function(){
         $.ajax({
             type: 'post',
             url:'<%= request.getContextPath() %>/lprodList.do',      
             success : function(res){
 				
 				code = "<table border='1'>";
 				code += "<tr><td>lprod_id</td><td>lprod_gu</td>";
 				code += "<td>lprod_nm</td></tr>";
 				
 				$.each(res, function(i, v){
 					code += "<tr><td>" + v.lprod_id + "</td><td>" +v.lprod_gu+"</td>";
 					code += "<td>"+v.lprod_nm+"</td></tr>";
 				})
 				code += "</table>";
 				
 				$('#result').html(code);
 				
 			},
             error: function(xhr){
                 alert("failed" + xhr.status);
             },
 			datatype:'json'
         }); // added closing parentheses and curly brace here
     });
     
     
     $('#lprodBtn2').on("click", function(){
    	location.href = "<%=request.getContextPath()%>/lprodList2.do"; 
     });
});
 </script>
 
 
 

<form>
	
	<input type="button" id="lprodBtn" value="Lprod자료 가져오기(Ajax)">
	<input type="button" id="lprodBtn2" value="Lprod자료 가져오기(Non Ajax)">

</form>

<h3>Lprod자료목록</h3>
<div id ="result"></div>


</body>
</html>