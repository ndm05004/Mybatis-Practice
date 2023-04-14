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
        <script src="../js/jquery.serializejson.min.js" type="text/javascript"></script>
        

<script type="text/javascript">
mypath = '<%=request.getContextPath()%>';

$(function(){
		// 승인대기 리스트 출력
	let cpage = 1;
		
	function createPagination(sp, ep, tp) {
		  let pager = "<ul class='pagination'>";
		  if (sp > 1) {
		    pager += "<li class='page-item'><a id='prev' class='page-link' href='#'>Previous</a></li>";
		  }
		  for (let i = sp; i <= ep; i++) {
		    if (i == cpage) { 
		      pager += "<li class='active page-item'><a class='page-link pageno' href='#'>" + i + "</a></li>";
		    } else {
		      pager += "<li class='page-item'><a class='page-link page' href='#'>" + i + "</a></li>";
		    }
		  }
		  if (ep < tp) {
		    pager += "<li class='page-item'><a id='next' class='page-link' href='#'>Next</a></li>";
		  }
		  pager += "</ul>";
		  return pager;
		}

		
		$('#awaitAproval').on('click', function() {
		  $.ajax({
		    url: "<%=request.getContextPath()%>/BoardList.do",
		    type: 'post',
		    data: {
		      "page": cpage
		    },
		    success: function(res) {
		      let code = "<table border='1' class='table table-striped'>"
		      code += "<tr><td>식당ID</td><td>식당이름</td><td>사업자번호</td><td>승인요청일</td><td>결제관리</td>"
		      $.each(res.datas, function(i, v) {
		        code += "<tr><td>"+v.rst_id+"</td><td>"+v.rst_name+"</td><td>"+v.bs_num+"</td><td>"+v.rst_req+"</td>";
		        code += "<td><button class='btn btn-primary' id='"+v.rst_id+"' name='approvalbtn'>승인</button>";
		        code += "<button class='btn btn-primary' id='"+v.rst_id+"' name='deletebtn'>반려</button></td></tr>";
		      });
		      code += "</table>";
		      $('#result').html(code);

		      let pager = createPagination(res.sp, res.ep, res.tp);
		      $('#pagelist').html(pager); 
		    },
		    error: function(xhr) {
		      alert("Status: " + xhr.status); 
		    },
		    dataType: 'json'
		  }); 
		});
		
		
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
			 var rst_id = $(this).attr('id').trim();
			
			$('#wModal').modal('show');
			$('#modal-result').load('component/restaurantdetail.jsp', {rst_id: rst_id});

		})
		
		
		
		
		// 식당승인버튼
		$(document).on('click', 'button[name="approvalbtn"]', function() {
		  var rst_id = $(this).attr('id');
		  var $tr = $(this).closest('tr');
		  if (confirm("승인하시겠습니까??")) {
			  $.ajax({
			    url: "<%=request.getContextPath()%>/admin/approveRestaurant.do",
			    type: 'get',
			    data: {rst_id: rst_id},
			    success: function(res) {
			    	if(res.flag == "okay"){
						alert("승인되었습니다.");
						 $tr.remove();
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
			  var $tr = $(this).closest('tr');
			  if (confirm("반려하시겠습니까??")) {
			  $.ajax({
			    url: "<%=request.getContextPath()%>/admin/deleteRestaurant.do",
			    type: 'get',
			    data: {rst_id: rst_id},
			    success: function(res) {
					if(res.flag=="okay"){
						alert("반려되었습니다.");
						 $tr.remove();
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
			
			$('#wModal').modal('show');
			
			var mem_id = $(this).attr('id').trim();

			$('#modal-result').load('component/memberdetail.jsp', {mem_id: mem_id});

		   });   
		
		
		// 게시판 전체 출력
		$('#noticeBoardInfo').on('click', function() {
			
			$.ajax({
				
				url : "<%=request.getContextPath()%>/admin/noticeBoardInfo.do",
				type: 'get',
				success: function(res){
					code="<button class='btn btn-primary' id='noticeboardInsert' name='noticeboardInsert'>공지사항작성</button>";
					code+="<table border='1' class='table table-striped'>";
					code+="<tr><td>공지사항번호</td>";
					code+="<td>제목</td>";
					code+="<td>작성일</td></tr>";

					$.each (res, function(i , v) {
						code+="<tr><td>"+v.nb_id+"</td>"
						code+="<td><a href='#' name='noticedetail-link' class='noticedetail-link' id='" + v.nb_id + "'>" + v.nb_title + "</a></td>"
						code+="<td>"+v.nb_date+"</td><tr>"
					})
					code += "</table>";
					$('#result').html(code);
				},
				error: function(xhr){
					alert("상태: " + xhr.status);
				},
				dataType: 'json'
			})
		})
		
		
		// 공지사항 입력
		$(document).on('click', '#noticeboardInsert', function(){
		  $('#result').load('component/noticeBoardForm.jsp');
		 

		});
				
		
		 // 게시판 상세페이지
        $(document).on('click', 'a[name="noticedetail-link"]', function(){
             nb_id = $(this).attr('id').trim();           
             $.ajax({
                  url: "<%=request.getContextPath()%>/admin/noticeBoardDetail.do",
                  type: 'get',
                  data: {nb_id: nb_id},
                  success: function(res) {
               	   
                     code = "<div class='container mt-3'>";
                     code += "<div class='d-flex justify-content-end'>";
                     code += "<button class='btn btn-primary' id='noticeboardUpdate"+res.nb_id+"' name='noticeboardUpdate' style='margin-right:10px;'>공지사항수정</button>"; 
                     code += "<button class='btn btn-primary' id='noticeboardDelete"+res.nb_id+"' name='noticeboardDelete'>공지사항삭제</button>";
                     code += "</div>";
                     code += "<div class='mb-3 mt-3 topline'>";
                     code += "<div class='topline2'>";  
                     code += "<label for='exampleFormControlInput1' class='form-label'>공지사항번호</label>";
                     code += "<input class='form-control btopbox' type='text' value='"+res.nb_id+"' aria-label='readonly input example' readonly>";
                     code += "<label for='exampleFormControlInput1' class='form-label bdate'>작성일</label>";
                     code += "<input class='form-control' type='text' value='"+res.nb_date +"' aria-label='readonly input example' readonly>";
                     code += "</div>";
                     code += "<label for='exampleFormControlInput1' class='form-label titleBox'>제목</label>";
                     code += "<input class='form-control' type='text' value='"+res.nb_title +"' aria-label='readonly input example' readonly>";
                     code += "</div>";
                     code += "<label for='title'>내용</label>";
                     //code += "<input class='form-control bcontent' type='text' value='"+res.nb_content.replace(/\n/g, '<br>')+"' aria-label='readonly input example' readonly>";
                     //code += "<textarea class='form-control bcontent' aria-label='readonly input example' readonly>" + res.nb_content.replace(/\n/g, '<br>') + "</textarea>";
                     
                     //이거써code += "<textarea class='form-control bcontent contetnBox' aria-label='readonly input example' readonly>" + res.nb_content.replace(/\n/g, '\r\n') + "</textarea>";
                     code += "<textarea class='form-control bcontent contetnBox' aria-label='readonly input example' readonly>" + res.nb_content.replace(/<br>/g, '\n') + "</textarea>";

                     code += "</div>";
                      $('#result').html(code);
                  },
                  error: function(xhr) {
                       alert("상태: " + xhr.status);
                  },
                  dataType: 'json'
             });
        });
	
		
		$(document).on('click', 'button[name="noticeboardDelete"]', function(){
			var board_id = $(this).attr('id').substring(17);
			 if (confirm("삭제하시겠습니까??")) {
				 $.ajax({
					 url: "<%=request.getContextPath()%>/admin/noticeboardDelete.do",
					 type: 'get',
					 data: {board_id:board_id},
					 success: function(res){
						alert("삭제되었습니다.") 
						
						$('#noticeBoardInfo').click();
						
					 },
			         error: function(xhr) {
			               alert("상태: " + xhr.status);
			          } 
				 })
			 }
			 })
			 
			 
 		//블랙리스트 페이지
         $('#blackListInfo').on('click', function() {
            $.ajax({
               url : "<%=request.getContextPath()%>/admin/blackListInfo.do",
                   type : 'get',
                 dataType : 'json',
                 error : function(xhr) {
                     alert("상태 : " + xhr.status);
                 },  
                 success : function(res) {
                     code = "<table border='1' class='table table-striped'>"
                     code += "<tr><td>사용자ID</td><td>이름</td><td>신고받은횟수</td><td>제재횟수</td><td>활성화여부</td><td>결재관리</td></tr>"
                     $.each(res, function(i, v){
                        code+="<td><a href='#' name='blacklist-link' class='blacklist-link' id='" + v.mem_id + "'>" +v.mem_id + "</a></td>"
                        code +="<td>"+v.mem_name+"</td><td>"+v.mem_rn+"</td><td>"+v.mem_lc+"</td><td>"+v.mem_st+"</td>"                    
                        code += "<td><button class='btn btn-primary' id='"+v.mem_id+"' name='blackListCancel'>해제</button></td></tr>";
                      });
                       code += "</table>"
                        $('#result').html(code);
                     }
                  });
               });
      
		
		
      // 블랙리스트 상세 페이지 조회
		$(document).on('click', 'a[name="blacklist-link"]', function(){
			
			var mem_id = $(this).attr('id').trim();
			
			$('#wModal').modal('show');			

			$('#modal-result').load('component/blacklistdetail.jsp', {mem_id: mem_id});
			
			
		});
      
		
      //블랙리스트 해제 버튼
      $(document).on('click', 'button[name="blackListCancel"]', function() {
        var mem_id = $(this).attr('id');
        var $tr = $(this).closest('tr');
        if (confirm("해제 하시겠습니까??")) {
           $.ajax({
             url: "<%=request.getContextPath()%>/admin/deleteBlackList.do",
             type: 'get',
             data: {mem_id: mem_id},
             success: function(res) {
                if(res.flag == "okay"){
                  alert("해제되었습니다.");
                  $tr.remove();
               }
             },
             error: function(xhr) {
               alert("상태: " + xhr.status);
             },
             dataType: 'json'
             
           });
           }
         });
		
		
		
      // 공지사항 입력
      $('#reportManage').on('click', function() {
        $('#result').load('component/reportManage.jsp');
      });
      
      
      $('#main').on('click', function() {
           $('#result').load('body.jsp');
      });
      
      $(document).ready(function() {
           $('#result').load('body.jsp');
      });
            
            

      /* 공지사항 수정하기 */
      
      //공지사항 수정 
      $(document).on('click','button[name="noticeboardUpdate"]', function(){
         
      
            vid = $(this).attr('id').substring(17);
         
      
            
            //수정할 본문의 내용을 가져온다
            vparents = $(this).parents('#result');
            vtitle = $(vparents).find('#title').text().trim();
            vcontent = $(vparents).find('#content').text().trim();
            vdate = new Date().toISOString().slice(0,10);
            
            vt = $(vparents).find('.titleBox').html().trim();
            vc = $(vparents).find('.contetnBox').html().trim();
            
            cont = vc.replace(/<br>/g, "\n");
            
            //modal창에 출력한다
            $('#mform #title').val(vt);
            $('#mform #content').val(cont);
            $('#mform #date').val(vdate);
            
            $('#mform #num').val(vid);            
            
            $('#mModal').modal('show');
            
            $('#mform #date').prop('disabled',true);
            
      
      }) //이벤트 끝
      
      //글 수정 modal창에서 전송버튼 클릭
         $('#msend').on('click', function(){
            fdata = $('#mform').serializeJSON();
            console.log(fdata);

            //vmodify = this;
      
            //서버로 보내기
            $.boardUpdate();
            
           $('#mModal').modal('hide');

         })
   

 //공지사항 수정완료
         $.boardUpdate = function(){
         $.ajax({
            url : "<%=request.getContextPath()%>/admin/noticeboardUpdate.do",
            type : 'post',
            data : fdata, //자체가 json이라 이렇게 적음
            success : function(res) {
               
         	   console.log(res);
               alert("수정이 완료되었습니다.");
            //화면(본문의 내용) 바꾸기
               $.updateView(res);

            },
            error : function(xhr) {
               alert("상태 : " + xhr.status) 
            },
            dataType : 'json'
         })
} 
      
       $.updateView = function(res) {
         //수정된 게시물의 데이터를 화면에 업데이트 
			console.log(res);
         console.log("ttt=" + res.nb_title);
         console.log("ccc=" + res.nb_content);
         
         console.log("idd=" + res.nb_id);
         
        $('#noticeboardUpdate'+res.nb_id).parents('#result').find('.titleBox').html(res.nb_title);
       // $('#noticeboardUpdate'+res.nb_id).parents('#result').find('.contetnBox').html(res.nb_content);
       

     // 내용에 대해 줄바꿈 처리 추가
        var content = res.nb_content.replace(/<br>/g, "\n");
        $('#noticeboardUpdate'+res.nb_id).parents('#result').find('.contetnBox').html(content);
      } 
       

})   
</script>
<style>

a{
   text-decoration: none;
}

#result{
   
   margin-top: 10px;
   
}

img{
width:200px;
height: 60px;
}

td.bInfoNum{
	width:200px;
}
.topline{
display: flex;
flex-direction: column;
}
.topline2{
display: flex;
}
.form-label{
width: 285px;

}

.btopbox {
height: 40px;
}
.bdate {
text-align: right;
margin-right: 10px;
}
.bcontent{
height: 500px;
overflow-y: auto; 
display: block;
text-align: left;
}
</style>  
       
</head>
   
   
   <body>
       <div class="d-flex" id="wrapper">
           <!-- Sidebar-->
           
           <div class="border-end bg-white" id="sidebar-wrapper">
               <div class="sidebar-heading border-bottom bg-light"><img src="../images/로고.png" id="main"></div>
               <div class="list-group list-group-flush">
                   <a class="list-group-item list-group-item-action list-group-item-light p-3" id="awaitAproval" href="#!">
                   <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file align-text-bottom" aria-hidden="true"><path d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path><polyline points="13 2 13 9 20 9"></polyline></svg>
                   승인대기</a>
                   <a class="list-group-item list-group-item-action list-group-item-light p-3" id="restaurantInfo" href="#!">
                   <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users align-text-bottom" aria-hidden="true"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                   사업자</a>
                   <a class="list-group-item list-group-item-action list-group-item-light p-3" id="memberInfo" href="#!">
                   <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users align-text-bottom" aria-hidden="true"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                   회원</a>
                   <a class="list-group-item list-group-item-action list-group-item-light p-3" id="blackListInfo" href="#!">
                   <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text align-text-bottom" aria-hidden="true"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
                   블랙리스트</a>
                   <a class="list-group-item list-group-item-action list-group-item-light p-3" id="reportManage" href="#!">
                   <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text align-text-bottom" aria-hidden="true"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
                   신고관리</a>
                   <a class="list-group-item list-group-item-action list-group-item-light p-3" id="noticeBoardInfo" href="#!">
                   <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text align-text-bottom" aria-hidden="true"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
                   공지사항관리</a>
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

               </div>
               	<br><br>
				<div id ="pagelist"></div>

               <div class="modal" id="wModal">
              <div class="modal-dialog">
                <div class="modal-content">
            
                  <!-- Modal Header -->
                  <div class="modal-header">
                    <h4 class="modal-title">회원상세 정보</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                  </div>
            
                  <!-- Modal body -->
                  <div class="modal-body" id="modal-result">

                  </div>
            
                  <!-- Modal footer -->
                  <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                  </div>

                </div>
              </div>
            </div>

           </div>
       </div>
       <!-- Bootstrap core JS-->
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
       <!-- Core theme JS-->
       <script src="js/scripts.js"></script>
       
                <!-- 글 수정 The Modal -->
         <div class="modal" id="mModal">
            <div class="modal-dialog">
               <div class="modal-content">

                  <!-- Modal Header -->
                  <div class="modal-header">
                     <h4 class="modal-title">공지사항 수정하기</h4>
                     <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                  </div>

                  <!-- Modal body -->
                  <div class="modal-body">
                     <form name="mform" id="mform">

                  <input type="hidden" id="num" name="num">
                  <!-- 수정을 하려면 기준이 되는 글번호가 있어야함 -->
                  <label>제목</label>
                  <input type="text" class="txt" id="title" name="title"><br>
                  
                  <label>내용</label>
                  <br>
                  <textarea rows="5" cols="40"  class="txt" id="content" name="content"></textarea>
                  <br>
                  <br>
                  
                  <label>작성일</label>
                  <input type="text"  class="txt" id="date" name="date"><br>
                  
                  <input type="button" value="수정하기" id="msend" name="msend">
               </form>
                  </div>

                  <!-- Modal footer -->
                  <div class="modal-footer">
                     <button type="button" class="btn btn-danger"
                        data-bs-dismiss="modal">Close</button>
                  </div>

               </div>
            </div>
         </div>
       
       
   </body>
</html>