<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>TableMate입니다</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        
        
        <script type="text/javascript" src="../js/jquery-3.6.4.min.js"></script>

<script type="text/javascript">
mypath = '<%=request.getContextPath()%>';

$(function(){
	
	// 승인대기 리스트 출력
	$('#awaitAproval').on('click', function() {
			$.ajax({
				url : "<%=request.getContextPath()%>/admin/awaitAproval.do",
				type : 'get',
				dataType : 'json',
				error : function(xhr) {
					alert("상태 : " + xhr.status);

				},
				success : function(res) {
					code = "<table border='1' class='table table-striped'>"
					code += "<tr><td>식당ID</td><td>식당이름</td><td>사업자번호</td><td>승인요청일</td><td>결제관리</td>"
						$.each(res, function(i, v){
						    code += "<tr><td>"+v.rst_id+"</td><td>"+v.rst_name+"</td><td>"+v.bs_num+"</td><td>"+v.rst_req+"</td>";
						    code += "<td><button class='btn btn-primary' id='"+v.rst_id+"' name='approvalbtn'>승인</button>";
						    code += "<button class='btn btn-primary' id='"+v.rst_id+"' name='deletebtn'>반려</button></td></tr>";
						});
					code += "</table>"
					$('#result').html(code);
				}
			})
		}) 
		
		// 식당리스트 출력
		$('#restaurantInfo').on('click', function() {
			
	
			$.ajax({
				url : "<%=request.getContextPath()%>/admin/restaurantInfo.do",
				type : 'get',
				dataType : 'json',
				error : function(xhr) {
					alert("상태 : " + xhr.status);
				},  
				success : function(res) {
					code = "<table border='1' class='table table-striped'>"
					code += "<tr><td>식당ID</td><td>식당이름</td><td>주소</td><td>전화번호</td><td>카테고리</td></tr>"
					$.each(res, function(i, v){
						code += "<tr><td><a href='#' name='restaurant-link' class='restaurant-link' id='" + v.rst_id + "'>" + v.rst_id + "</a></td>";
						code += "<td>"+v.rst_name+"</td><td>"+v.rst_addr+"</td><td>"+v.rst_tel+"</td><td>"+v.rst_menu+"</td><tr>";
					});
					code += "</table>"
					$('#result').html(code);
				}
			})
		})
		
		// 식당 상세페이지
		$(document).on('click', 'a[name="restaurant-link"]', function(){
			 var rst_id = $(this).attr('id');
			
			 $.ajax({
				    url: "<%=request.getContextPath()%>/admin/restaurantDetail.do",
				    type: 'get',
				    data: {rst_id: rst_id},
 					success: function(res) {
 						code = "<table border='1' class='table table-striped'>";
 						code += "<tr><td>식당ID</td><td>식당이름</td><td>주소</td><td>전화번호</td><td>카테고리</td>";
 						code += "<td>식당정보</td> <td>별점평균</td> <td>식당메일</td> <td>휴무일</td> <td>사업자번호</td> <td>승인일</td> <td>카테고리</td></tr>";
 							code += "<tr><td>" + res.rst_id + "</td>";
 							code += "<td>" +res.rst_name + "</td>";
 							code += "<td>" + res.rst_addr + "</td>";
 							code += "<td>" + res.rst_tel + "</td>";
 							code += "<td>" + res.rst_info + "</td>";
 							code += "<td>" + res.starcountavg +"</td>";
 							code += "<td>" + res.rst_pass + "</td>";
 							code += "<td>" + res.rst_mail + "</td>";
 							code += "<td>" + res.closedday + "</td>";
 							code += "<td>" + res.bs_num + "</td>";
 							code += "<td>" + res.accept + "</td>";
 							code += "<td>" + res.rst_menu + "</td></tr>";

 						code += "</table>"
 						$('#result').html(code);
				    },
				    error: function(xhr) {
				        alert("상태: " + xhr.status);
				    },
				    dataType: 'json'
				  
				});
		})
		
		
		
		
		// 식당승인버튼
		$(document).on('click', 'button[name="approvalbtn"]', function() {
		  var rst_id = $(this).attr('id');
		  if (confirm("승인하시겠습니까??")) {
			  $.ajax({
			    url: "<%=request.getContextPath()%>/admin/approveRestaurant.do",
			    type: 'get',
			    data: {rst_id: rst_id},
			    success: function(res) {
			    	if(res.flag == "okay"){
						alert("승인되었습니다.");
					}
			    },
			    error: function(xhr) {
			      alert("상태: " + xhr.status);
			    },
			    dataType: 'json'
			    
			  });
		 	 }
			});

	
		// 식당반려버튼
		$(document).on('click', 'button[name="deletebtn"]', function() {
			  var rst_id = $(this).attr('id');
			  if (confirm("반려하시겠습니까??")) {
			  $.ajax({
			    url: "<%=request.getContextPath()%>/admin/deleteRestaurant.do",
			    type: 'get',
			    data: {rst_id: rst_id},
			    success: function(res) {
					if(res.flag=="okay"){
						alert("반려되었습니다.");
					}
			    },
			    error: function(xhr) {
			      alert("상태: " + xhr.status);
			    },
			    dataType: 'json'
			  });
			  }
			});

		
		// 회원 리스트 출력
		$('#memberInfo').on('click', function() {
			  $.ajax({
			    url : "<%=request.getContextPath()%>/admin/memberInfo.do",
			    type : 'get',
			    dataType : 'json',
			    error : function(xhr) {
			      alert("상태 : " + xhr.status);
			    },
			    success : function ( res ) {
			      code = "<table border='1' class='table table-striped'>";
			      code += "<tr><td>사용자ID</td><td>이메일</td><td>닉네임</td><td>신고받은횟수</td><td>제재횟수</td><td>활성화여부</td></tr>"
			      $.each ( res , function ( i , v ) {
			        code += "<tr><td><a href='#' name='member-link' class='member-link' id='" + v.mem_id + "'>" + v.mem_id + "</a></td ><td>"+v.mem_mail+"</td><td>"+v.mem_nick+"</td><td>"+v.mem_rn+"</td><td>"+v.mem_lc+"</td><td>"+v.mem_st+"</td></tr>";
			      });
			      code += "</table>";
			      $('#result').html(code);
			    }
			  });
			});
		      
		
		// 회원 상세페이지
		$(document).on('click', 'a[name="member-link"]', function() {
			var mem_id = $(this).attr('id').trim();

			$.ajax({
				url : "<%=request.getContextPath()%>/admin/memberDetail.do",
		    	type: 'get',
		    	data: { mem_id: mem_id },
		    	success: function(res) {
		    		code = "<table border='1' class='table table-striped'>";
		    	    code += "<tr> <td>회원 ID</td> <td>회원명</td> <td>이메일</td> <td>전화번호</td> <td>닉네임</td> <td>생년월일</td>";
		    	    code += "<td>신고받은횟수</td> <td>제재횟수</td> <td>활성화여부</td> </tr>"
		    	    code += "<tr><td>"+res.mem_id+"</td>"
		    	    code += "<td>" +res.mem_name + "</td>";
		    	    code += "<td>" +res.mem_mail + "</td>";
		    	    code += "<td>" +res.mem_tel + "</td>";
		    	    code += "<td>" +res.mem_nick + "</td>";
		    	    code += "<td>" +res.mem_bir + "</td>";
		    	    code += "<td>" +res.mem_rn + "</td>";
		    	    code += "<td>" +res.mem_st + "</td>";
		    	    code += "<td>" +res.mem_lc + "</td></tr>"
		    	    
		    	    code += "</table>";
		    	     $('#result').html(code);
		    	    },
		    	    error: function(xhr) {
		    	      alert("상태: " + xhr.status);
		    	    },
		    	    dataType: 'json'
		    	  });
		    	});   
		
		
		
		$('#noticeBoardInfo').on('click', function() {
			
			$.ajax({
				
				url : "<%=request.getContextPath()%>/admin/noticeBoardInfo.do",
				type: 'get',
				success: function(res){
					code="<button class='btn btn-primary' id='noticeboardInert' name='noticeboardInert'>공지사항작성</button>";
					code+="<table border='1' class='table table-striped'>";
					code+="<tr><td>공지사항번호</td>"
					code+="<td>제목</td>"
					code+="<td>작성일</td></tr>"

						
					$.each (res, function(i , v) {
						code+="<tr><td></td>"
						code+="<td>공지사항번호</td>"
						code+="<td>제목</td>"
						code+="<td>작성일</td>"
						code+="<td></td><tr>"
						
					}
					code += "</table>";
					
				},
				error: function(xhr){
					alert("상태: " + xhr.status);
				},
				dataType: 'json'
			})
			
		})
		
		
	})	
</script>
<style>
	
	a{
		text-decoration: none;
	}

</style>     
        
</head>
    
    
    <body>
        <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light">Hi!TableMate</div>
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" id="awaitAproval" href="#!">승인대기</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" id="restaurantInfo" href="#!">사업자</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" id="memberInfo" href="#!">회원</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" id="awaitAproval" href="#!">블랙리스트</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" id="awaitAproval" href="#!">리뷰신고</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" id="noticeBoardInfo" href="#!">공지사항관리</a>

                </div>
            </div>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Top navigation-->
                <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                    <div class="container-fluid">
                        <button class="btn btn-primary" id="sidebarToggle">메뉴 접기</button>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                                <li class="nav-item active"><a class="nav-link" href="#!">카테고리</a></li>
                                <li class="nav-item"><a class="nav-link" href="#!">예약하기</a></li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    

<svg xmlns="http://www.w3.org/2000/svg" height="28" viewBox="0 96 960 960" width="28"><path d="M222 801q63-44 125-67.5T480 710q71 0 133.5 23.5T739 801q44-54 62.5-109T820 576q0-145-97.5-242.5T480 236q-145 0-242.5 97.5T140 576q0 61 19 116t63 109Zm257.814-195Q422 606 382.5 566.314q-39.5-39.686-39.5-97.5t39.686-97.314q39.686-39.5 97.5-39.5t97.314 39.686q39.5 39.686 39.5 97.5T577.314 566.5q-39.686 39.5-97.5 39.5Zm.654 370Q398 976 325 944.5q-73-31.5-127.5-86t-86-127.266Q80 658.468 80 575.734T111.5 420.5q31.5-72.5 86-127t127.266-86q72.766-31.5 155.5-31.5T635.5 207.5q72.5 31.5 127 86t86 127.032q31.5 72.532 31.5 155T848.5 731q-31.5 73-86 127.5t-127.032 86q-72.532 31.5-155 31.5ZM480 916q55 0 107.5-16T691 844q-51-36-104-55t-107-19q-54 0-107 19t-104 55q51 40 103.5 56T480 916Zm0-370q34 0 55.5-21.5T557 469q0-34-21.5-55.5T480 392q-34 0-55.5 21.5T403 469q0 34 21.5 55.5T480 546Zm0-77Zm0 374Z"/></svg>                                   </a>
                                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="#!">마이페이지</a>
                                        <a class="dropdown-item" href="#!">로그아웃</a>
           
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <!-- Page content-->
                <div class="container-fluid" id="result">
                    <h1 class="mt-4">메뉴 상세화면</h1>
                    <p>The starting state of the menu will appear collapsed on smaller screens, and will appear non-collapsed on larger screens. When toggled using the button below, the menu will change.</p>
                    <p>
                        Make sure to keep all page content within the
                        <code>#page-content-wrapper</code>
                        . The top navbar is optional, and just for demonstration. Just create an element with the
                        <code>#sidebarToggle</code>
                        ID which will toggle the menu when clicked.
                    </p>
                </div>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>