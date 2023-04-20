<%@page import="rrs.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!--   <script type="text/javascript" src="http://localhost/RRS/js/jquery-3.6.4.min.js"></script>
 -->  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400&display=swap" rel="stylesheet">
  
<script type="text/javascript">
<%
	MemberVO memVo= (MemberVO)session.getAttribute("loginMember");
%>
var mypath = '<%=request.getContextPath()%>';

$(function(){
	<%String rstid = request.getParameter("rst_id");%>
	rst_id = '<%=rstid%>'; 
		

	 
	
	$.ajax({
        url :"<%=request.getContextPath()%>/rstHome.do",
        type: 'get',
        data: { 
        	rst_id: rst_id,
        },
        success: function(res){
        	code = '';
        	
        	code += '<div id="rst-photo" style="height: 400px;">';
        	code += '<img id="rst-img" src="' + mypath + '/ImageView.do?Photo=' + res.rst_photo + '" width="100%" height="100%">';
        	code += '</div><br>';
        	code += '<div id="rst-info">';
        	
        	var starNum = Math.floor(res.starcountavg);
        	star ='';
        	for (let i = 0; i < starNum; i++) {
        		star += "<span id='star' style='color:#ff3d00;'>★</span>";

        	}
        	
        	code +=`<h4>${res.rst_name}&nbsp;&nbsp;&nbsp;&nbsp;${star}</h4>`;

			
        	code += '<h5>' + res.rst_info + '</h5>';
        	
        	$.ajax({
        			url : '<%=request.getContextPath()%>/member/didIDoMyFavorites.do',
       	 		type : 'post',
       	 		async: false,
       	 		data : {"rstid" : rst_id ,
        					"memid" : '<%=memVo.getMem_id()%>'},
       	 		success : function(res) {
       	 				console.log(res);
        				if(res.flag==1){// 찜 되어 있는거
        					code += `<div class="right_area">
        		        		<a class="icon heart active">
        		           				<img src="https://cdn-icons-png.flaticon.com/512/803/803087.png" alt="찜하기 완료">
        		        			</a>
        		      			</div>`;
        				}else { // 안되어 있는거
        					code +=` <div class="right_area">
        		        		<a class="icon heart">
        		           				<img src="https://cdn-icons-png.flaticon.com/512/812/812327.png" alt="찜하기">
        		        			</a>
        		      			</div>`;
       	 			}	
       	 		},
       	 		error : function(xhr) {
       	 			alert("Error : "+xhr.status)
       	 		},
       	 		dataType : 'json'
       	 	})
        	
//         	code +=` <div class="right_area">
// 	        		<a class="icon heart">
// 	           				<img src="https://cdn-icons-png.flaticon.com/512/812/812327.png" alt="찜하기">
// 	        			</a>
// 	      			</div>`;
        	
        	        	
        	code += `<div id="subMain">
        		
        		<input type="button" class="addiqr" id="addiqr" value="문의하기">
        		<a class="addiqr" href="#mapp"><input type="button" id="addiqr2" value="위치보기"></a>
        	
    
        	</div>`
        	code += '</div>';
        	
        	$('#mainhome').html(code);
        },
        error: function(xhr){
        	alert("상태: " + xhr.status);
        },
        dataType: 'json'
	})
	

	
})
</script>

<style type="text/css">



</style>
</head>
<body>
<div></div>
</body>
</html>