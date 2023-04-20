<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>TableMate 관리자 페이지</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        
        <script type="text/javascript" src="../js/jquery-3.6.4.min.js"></script>
        <script src="../js/jquery.serializejson.min.js" type="text/javascript"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400&display=swap" rel="stylesheet">
        <script src="js/admin.js"></script>

<script type="text/javascript">
mypath = '<%=request.getContextPath()%>';

$(function(){
		// 승인대기 리스트 출력
		
		let cpage = 1;
		
		$('#awaitAproval').on('click', function() {
			getRetaurantAwait(cpage);
		});
		
		
		// 식당리스트 출력
		$('#restaurantInfo').on('click', function() {
			getRestaurantInfo(cpage);
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
		    	approveRestaurant(rst_id, $tr);
		 	 }
			});
	
		// 식당반려버튼
		$(document).on('click', 'button[name="deletebtn"]', function() {
			  var rst_id = $(this).attr('id');
			  var $tr = $(this).closest('tr');
			  if (confirm("반려하시겠습니까??")) {		  
				  deleteRestaurant(rst_id, $tr);
			  }
			});
		
		// 회원 리스트 출력
		$('#memberInfo').on('click', function() {
			getMemberInfo(cpage);
		});
		      
		// 회원 상세페이지
		$(document).on('click', 'a[name="member-link"]', function() {
			
			$('#wModal').modal('show');
			
			var mem_id = $(this).attr('id').trim();
			$('#modal-result').load('component/memberdetail.jsp', {mem_id: mem_id});
		   });   
	
		
		// 공지 게시판 전체 출력
		$('#noticeBoardInfo').on('click', function() {
			getNoticeBoardInfo(cpage);
		})
		
		
		// 공지사항 입력
		$(document).on('click', '#noticeboardInsert', function(){
		  $('#result').load('component/noticeBoardForm.jsp');
		});
				
		
		 // 게시판 상세페이지
        $(document).on('click', 'a[name="noticedetail-link"]', function(){
             nb_id = $(this).attr('id').trim();    
             
             getNoticedetail(nb_id);
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
        	 getBlackListInfo(cpage);
        	 
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
       

       
       
       //---------- 승인대기 메뉴 페이징 처리
		$(document).on('click', '#pagelist1 .rstPageno1', function(){	
			currentPagerst= $(this).text().trim();
			getRetaurantAwait(currentPagerst)
		})
			
			
		//다음클릭
		$(document).on('click', '#next1', function(){
			currentPagerst = parseInt($('.rstPageno1').last().text())+1
			getRetaurantAwait(currentPagerst)
		})
			
		//이전클릭
		$(document).on('click', '#prev1', function(){
			currentPagerst = parseInt($('.rstPageno1').first().text())-1
			getRetaurantAwait(currentPagerst)	
		}) 
		
		
 
		//------------- 사업자 메뉴 페이징처리
		$(document).on('click', '#pagelist2 .rstPageno2', function(){	
			currentPage= $(this).text().trim();
			getRestaurantInfo(currentPage)
		})
			
			
		//다음클릭
		$(document).on('click', '#next2', function(){
			currentPage = parseInt($('.rstPageno2').last().text())+1
			getRestaurantInfo(currentPage)
		})
			
		//이전클릭
		$(document).on('click', '#prev2', function(){
			currentPage = parseInt($('.rstPageno2').first().text())-1
			getRestaurantInfo(currentPage)	
		}) 
		
		
		//------------- 회원 메뉴 페이징 처리
		$(document).on('click', '#pagelist3 .rstPageno3', function(){	
			currentPage2= $(this).text().trim();
			getMemberInfo(currentPage2)
		})
			
			
		//다음클릭
		$(document).on('click', '#next3', function(){
			currentPage2 = parseInt($('.rstPageno3').last().text())+1
			getMemberInfo(currentPage2)
		})
			
		//이전클릭
		$(document).on('click', '#prev3', function(){
			currentPage2 = parseInt($('.rstPageno3').first().text())-1
			getMemberInfo(currentPage2)	
		}) 
		
		
		
		//------------- 블랙리스트 메뉴 페이징 처리
		$(document).on('click', '#pagelist4 .rstPageno4', function(){	
			currentPage3 = $(this).text().trim();
			getBlackListInfo(currentPage3)
		})
			
			
		//다음클릭
		$(document).on('click', '#next4', function(){
			currentPage3 = parseInt($('.rstPageno4').last().text())+1
			getBlackListInfo(currentPage3)
		})
			
		//이전클릭
		$(document).on('click', '#prev4', function(){
			currentPage3 = parseInt($('.rstPageno4').first().text())-1
			getBlackListInfo(currentPage3)	
		}) 
		
		
		//------------- 공지사항관리 메뉴 페이징 처리
		$(document).on('click', '#pagelist5 .rstPageno5', function(){	
			currentPage4= $(this).text().trim();
			getNoticeBoardInfo(currentPage4)
		})
			
			
		//다음클릭
		$(document).on('click', '#next5', function(){
			currentPage4 = parseInt($('.rstPageno5').last().text())+1;
			getNoticeBoardInfo(currentPage4);

		}) 


		//이전클릭
		$(document).on('click', '#prev5', function() {
			currentPage4 = parseInt($('.rstPageno5').first().text()) - 1
			getNoticeBoardInfo(currentPage4)
		})

	})
</script>
<style>
body {
   font-family: 'IBM Plex Sans KR', sans-serif;
}
a {
	text-decoration: none;
}

#result {
	margin-top: 10px;
}

img {
	width: 200px;
	height: 60px;
}

td.bInfoNum {
	width: 200px;
}
.btitlenum {
	width: 200px;
}
.topline {
	display: flex;
	flex-direction: column;
}

.topline2 {
	display: flex;
}

.form-label {
	width: 285px;
}

.btopbox {
	height: 40px;
}

.bdate {
	text-align: center;
	margin-right: 10px;
}

.bcontent {
	height: 500px;
	overflow-y: auto;
	display: block;
	text-align: left;

}

.btn-sm {
	border-radius: 20px;
	margin-left: 2px;
}

#msend {
	margin-top: 10px;
	right: 0;
	width: 100%;
	border-radius: inherit;
	border: none;
}

#mform {
	margin: 0 auto;
	display: flex;
	flex-direction: column;
}

.pagination {
	justify-content: center;
	--bs-pagination-color: #141619;
	--bs-pagination-hover-color: #141619;
	--bs-pagination-active-bg: #141619;
}

#noticeboardInsert {
	float: right;
	margin-bottom: 10px;
	background: black;
	border: none;
}

#noticeboardInsert:hover {
	background: #41464b;
	border: none;
}

.btn-primary {
	float: right;
	margin-bottom: 10px;
	margin-left: 2px;
	background: black;
	border: none;
}
.btn-primary:hover {
	background: #41464b;
	border: none;
}

.menubarsvg {
	float: left;
	margin-left: -30px;
}

a{
	color:#737f8b;
}
a:hover{
	color:#000000;
}
.active>.page-link, .page-link.active {
  z-index: 3;
  color: var(--bs-pagination-active-color);
  background-color: #000000;
  border-color: #000000;
}
</style>  
       
</head>
   
   
   <body>
       <div class="d-flex" id="wrapper">
           <!-- Sidebar-->
           
           <div class="border-end bg-white" id="sidebar-wrapper">
               <div class="sidebar-heading border-bottom bg-light"><img src="../images/로고c.png" id="main"></div>
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
                      <!--  <button class="btn btn-secondary" id="sidebarToggle">메뉴접기 </button> -->
                      <button class="btn menubarsvg" id="sidebarToggle"><svg fill="none" height="64" viewBox="0 0 64 64" width="64" xmlns="http://www.w3.org/2000/svg"><path d="M22.5 24C22.5 23.1716 23.1716 22.5 24 22.5H40C40.8284 22.5 41.5 23.1716 41.5 24C41.5 24.8284 40.8284 25.5 40 25.5H24C23.1716 25.5 22.5 24.8284 22.5 24Z" fill="black"/><path d="M22.5 32C22.5 31.1716 23.1716 30.5 24 30.5H40C40.8284 30.5 41.5 31.1716 41.5 32C41.5 32.8284 40.8284 33.5 40 33.5H24C23.1716 33.5 22.5 32.8284 22.5 32Z" fill="black"/><path d="M24 38.5C23.1716 38.5 22.5 39.1716 22.5 40C22.5 40.8284 23.1716 41.5 24 41.5H40C40.8284 41.5 41.5 40.8284 41.5 40C41.5 39.1716 40.8284 38.5 40 38.5H24Z" fill="black"/></svg>
 　</button> 
                      
                      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                       <div class="collapse navbar-collapse" id="navbarSupportedContent">
                           <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                               <li class="nav-item active"><a class="nav-link" href="#!">공지사항</a></li>
                            
                               <li class="nav-item active"><a class="nav-link" href="#!">관리자 페이지</a></li>

                               <li class="nav-item dropdown">
                                   <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                   

<svg xmlns="http://www.w3.org/2000/svg" height="28" viewBox="0 96 960 960" width="28"><path d="M222 801q63-44 125-67.5T480 710q71 0 133.5 23.5T739 801q44-54 62.5-109T820 576q0-145-97.5-242.5T480 236q-145 0-242.5 97.5T140 576q0 61 19 116t63 109Zm257.814-195Q422 606 382.5 566.314q-39.5-39.686-39.5-97.5t39.686-97.314q39.686-39.5 97.5-39.5t97.314 39.686q39.5 39.686 39.5 97.5T577.314 566.5q-39.686 39.5-97.5 39.5Zm.654 370Q398 976 325 944.5q-73-31.5-127.5-86t-86-127.266Q80 658.468 80 575.734T111.5 420.5q31.5-72.5 86-127t127.266-86q72.766-31.5 155.5-31.5T635.5 207.5q72.5 31.5 127 86t86 127.032q31.5 72.532 31.5 155T848.5 731q-31.5 73-86 127.5t-127.032 86q-72.532 31.5-155 31.5ZM480 916q55 0 107.5-16T691 844q-51-36-104-55t-107-19q-54 0-107 19t-104 55q51 40 103.5 56T480 916Zm0-370q34 0 55.5-21.5T557 469q0-34-21.5-55.5T480 392q-34 0-55.5 21.5T403 469q0 34 21.5 55.5T480 546Zm0-77Zm0 374Z"/></svg>                                   </a>
                                   <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                   
        							<a class="dropdown-item" href="<%=request.getContextPath()%>/mainPage.jsp">로그아웃</a>
          
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
                  <input type="text" class="txt" id="title" name="title">
                  
                  <label>내용</label>
               
                  <textarea rows="5" cols="40"  class="txt" id="content" name="content"></textarea>

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