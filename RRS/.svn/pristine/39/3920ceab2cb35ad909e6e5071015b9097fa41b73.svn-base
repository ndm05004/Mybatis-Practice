<%@page import="com.google.gson.JsonArray"%>
<%@page import="rrs.vo.RestautantVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<title>Table Mate</title>
<link rel='shortcut icon' type='image/x-icon' href='../images/로고.png' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@6.1.5/index.global.min.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="../js/Rst.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script>
<%
   RestautantVO resVo = (RestautantVO) session.getAttribute("loginRst");
%>
reply={};//동적객체
mypath = '<%=request.getContextPath()%>'
resId = "<%=resVo.getRst_id()%>";
rvid = "";
mcon = {};// 메뉴객체
more = 0;
calendar = null;
document.addEventListener('DOMContentLoaded', function() {
   var calendarEl = document.getElementById('calendar');
      calendar = new FullCalendar.Calendar(calendarEl, {
      contentHeight: 600,
      headerToolbar : {
         left : 'prevYear,prev,next,nextYear today',
         center : 'title',
         right : 'dayGridMonth,dayGridWeek,dayGridDay'
      },
      selectable : true,
      selectMirror : true,
      initialView : 'dayGridMonth',
      events : []
   });
   calendar.render();
});


$(function(){
   $.selectRst(resId); // 사업자정보 출력 
   
   // 수정버튼 클릭시 
   $(document).on('click','#modify',function(){
      window.open("updateRst.jsp","가게 정보 변경","width=800 height=700");
   })//수정끝
//비밀번호 정규식
$(document).on('keyup','#pwd',function(){
      pwdval = $(this).val().trim();
      passreg = /^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*?]).{5,30}$/;
      regCheck(passreg,pwdval,this);
   })
//정규식 체크
   function regCheck(reg,value,ele) {
      if(!(reg.test(value))){
         $(ele).css('border','2px solid red')
      }else {
         $(ele).css('border','2px solid green')
      }
   }
      
   //내정보보기 클릭시
   $('#home').on('click',function(){
      hideReservation();
      hideMenuList();
      hideReview();
      $.selectRst(resId);   
   })
   //리뷰관리메뉴 클릭 - 리뷰전체 출력
   $('#review').on('click',function(){
      $('#reviewShow').css('display','block');
      $('#addSee').css('display','block');
      $('#form').html('');
      hideReservation();
      hideMenuList();
      $.reviewAll(0);   
   
   })
   //리뷰 - 댓글모달에서 등록버튼 클릭이벤트
   $('#set').on('click',function(){
      cmtta = $('#cmtta').val();
      cmtta = cmtta.replace(/\n/g,"<br>").trim()
      $.setReply(resId);   
   
   })
   //리뷰 - 신고모달에서 신고버튼 클릭이벤트
   $('#report').on('click',function(){
      rss = $('#reportRss').val();
      rs = $('#reportRs').val();
      $.reportReview(resId);   
   
   })
   
   //리뷰 - 사장님 댓글 삭제 클릭이벤트
   $(document).on('click','.delCmt',function(){
      rvid=$(this).parents('.review').find('input').val();
      rstcmtNo = $(this).parent().next('.pcont').attr('id');
      if (confirm("댓글을 정말 삭제하시겠습니까?")) {
         $.deleteCmt(resId,rvid);
      } else {
         $.reviewAll(0);
      }
   })
   //리뷰 - 사장님 댓글 수정 클릭이벤트
   $(document).on('click','.modCmt',function(){
      rvid=$(this).parents('.review').find('input').val();
      rstcmtNo = $(this).parent().next('.pcont').attr('id');
      
      modcont = $(this).parent().next('.pcont').html()
      modcont = modcont.replace(/<br>/g,"\n")
      $('#modcont').val(modcont);
   })
   
      //리뷰 - 사장님 댓글 수정 모달에서 글 수정 후 수정버튼 클릭이벤트
   $(document).on('click','#modrepl',function(){
      newcont = $('#modcont').val();      
      newcont = newcont.replace(/\n/g,"<br>").trim();
      $.modifyCmt(resId);
         
   })
   
   
   
   //rv_id
   $(document).on('click','.rvreply',function(){
      rvid=$(this).parents('.review').find('input').val();
   })
   
//    rv_id
   $(document).on('click','.rvreport',function(){
      rvid2 = $(this).parents('.review').find('input').val();
   })
   
   
   //리뷰 관리 눌렀을떄 실행되는버튼 ===============================================================================
   $('#reserv').on('click',function(){
      hideReview();
      $('#form').html("");
      $('.container').css('display','none');
      $('#modify').css('display','none');
        // 캘린더 표시
      $('#calendar').css('visibility','visible');
      $('.reservList').css('display','block');
   })
   
   $(document).on('click','.rid',function(){
      rid = $(this).text().trim();
      $('#rdModal').modal('show');
      $.showReservationDetailServer();
   })
   
   $('#rdModal').on('hidden.bs.modal', function () {
         $('.modal-body p').text(" "); // input 요소의 값을 공백으로 초기화
    })
    $('#rsCancel').on('click',function(){
       whowantCancel = $('.modal-body #rp1').text();
       if(confirm("해당 예약을 취소 하시겠습니까?\n확인버튼 클릭시 예약이 즉시 취소됩니다.\n충분한 안내 후 취소부탁드립니다.")){
          $.deleteReservationServer();
       }
    })
   //리뷰 관리 눌렀을떄 실행되는버튼 ===============================================================================
   
      
   // 매뉴 버튼들=========================================================================================================
   // 매뉴 추가 모달
      $('#addMenu').on('click',function(){
         $('#addModal').modal('show');
      })
      
      //매뉴 모달 안보일때 초기화 해주는방법
      $('#addModal').on('hide.bs.modal', function () {
         $(this).find('form')[0].reset();
         $(this).find('#image_container').text('');
      });
      
      // 매뉴 정보 보는 모달 수정 삭제 가능함
      $(document).on('click','.minfo',function(){
         menuId = $(this).val();
         mcon.mid = menuId;
         mcon.rid = resId;
         $.mebuDetailInfo();
      })
      
      // 매뉴 관리 버튼 눌럿을떄
      $('#service').on('click',function(){
         hideReview();
         hideReservation();
         $('#form').html("");
         $('#modify').css('display','none');
         $('.container').css('display','grid');
         
         $.showMenus();
      })
      
      // 메뉴 수정 버튼 눌렀을때
      $('#updateMenu').on('click',function(){
         
         aa = $(this).attr('id');
         if(aa == 'saveMenu'){
            $('#modifyContent').click();
            
         }else if(aa == 'updateMenu'){
            $(this).text('저장');
            $(this).attr('id', 'saveMenu');
            $(this).removeClass('btn-danger').addClass('btn-primary');
            $("#menuInfoModal").find('form input,textarea').removeAttr("disabled");
         }
      })
      
      
      $('#menuInfoModal').on('hide.bs.modal', function () {
         $(this).find('form input,textarea').attr('disabled',true);
         $(this).find('#saveMenu').text('수정');
         $(this).find('#saveMenu').removeClass('btn-primary').addClass('btn-danger');
         $(this).find('#saveMenu').attr('id', 'updateMenu');
      });
      
      $('#deleteMenu').on('click',function(){
         if(confirm("해당 메뉴를 삭제 하시겠습니까?")){
            $.deleteMenu();
         }
      })
      // 누나꺼
      $('#question').on('click', function() {
         hideReview();
            hideReservation();
            hideMenuList();
                 $.ajax({
                   url: "<%=request.getContextPath()%>/rstQuestion.do",
                   type: 'get',
                   data: { "id": resId},
                   success: function(res) {
                     ques = "<h1>문의확인</h1><br><table>";
                     console.log(res);
                     $.each(res,function(i,v){
                       if(i%2==0) ques +=`<tr style='vertical-align:top'>`
                        ques += `<td>`
                        ques += `<div class='qboard' style="margin-right:20px;"><input type='hidden' class="iqrno" value="${v.iqr_id}">`
                        ques += `<div id="qboardbd"><p id="${v.mem_id}" class="wrt">작성자 : ${v.mem_id}</p>`;
                        ques += `<p>작성일 : ${v.iqr_date}</p>`;
                        ques += `<p id="qcontent">${v.iqr_content}</p>`;
                        ques += `</div>`
                        ques += `<div id='bttnq' style="padding-left:20px; cursor:pointer; font-weight:bold;"><a id="bttnq">답하기</a>`
                        ques += `</div>`
                        ques += `</div>`;
                        ques += `<br>`
                        ques += `</td>`;
                        if(i%2==1) ques+="</tr>";
                  })
                      ques+= `</table>`;
                  
                  
//                     console.log(code2);
                     $('#form').html(ques);
                     
                     
                   },
                   error: function(xhr) {
                   },
                   dataType: 'json'
                 });
               });
      
      // 답하기 클릭시
      $(document).on('click','#bttnq',function(){
         $('#answerModal').modal('show');
         writerId = $(this).parents('.qboard').find('#qboardbd').find('.wrt').prop('id');
         console.log(writerId);
         qcontent = $(this).parents('.qboard').find('#qboardbd').find('#qcontent').text();
         qno = $(this).parents('.qboard').find('.iqrno').prop('value');
         $('#writerq').text(writerId);
           $('#contentq').text(qcontent);
      })
      
//       //문의메뉴에서 답하기 클릭시
//       $('#answerModal').on('shown.bs.modal',function(){
//        //메일전송코드
          
//       })
     /*0418 변경  */ 
      $('#answer').on('click',function(){
         if (confirm("문의에 대한 답변을 전송하시겠습니까?\n확인 클릭시 문의자의 메일로 답변이 전송되며 취소할 수 없습니다.")) {
            acontent = $('#acontent').val();
            acontent = acontent.replace(/<br>/g,"\n")
             $.sendAnswer();
             $('#acontent').val('');
             $('#answerModal').modal('hide');
            
             } else {
               
             }
         
      })
      $('#more_btn').on('click',function(){
         more++;
         $.reviewAll(more);
      })

})
   function hideReview() {
      more=0;
      $('#reviewShow').hide();
      $('#reviewShow').html('');
      $('#addSee').hide();
   }
   $.calendarEvent();
</script>
<style>
.btnTM,.btn-primary{
display: inline-block;
  padding: 10px 20px;
  font-size: 16px;
  font-weight: bold;
  text-align: center;
  text-decoration: none;
  background-color: white;
  color: #ff3d00;
  border: 1px solid #ff3d00;
  border-radius: 5px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
  transition: background-color 0.3s ease;
  cursor : pointer;
}

.btnTM:hover,.btn-primary:hover{
display: inline-block;
  padding: 10px 20px;
  font-size: 16px;
  font-weight: bold;
  text-align: center;
  text-decoration: none;
  background-color: #ff3d00;
  color: white;
  border: 1px solid white;
  border-radius: 5px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
  transition: background-color 0.3s ease;
  cursor : pointer;
}
#addMenutable {
/*    border: 3px solid gray; */
   text-align: center;
   margin: auto;
}
.reservList table tr:first-child {
   background-color: rgba(255,61,0,0.5);
   font-weight: bold;
}
#calendar {
        max-width: 700px;
        margin: 40px auto;
}
.reservList table tr:not(:first-child ) td:first-child:hover{
   background-color: rgba(10,10,10,0.2);
   font-weight: bold;
}
#rdModal label {
   text-align: right;
    width: 120px;
}
.reservp{
    display: inline;
    margin-left: 3px;
}
#calendar{
   visibility: hidden;
}
.reservList{
   display: none;
   margin-left: 33%;
   text-align: center;
}
.rpt{
   display: inline-block;
   margin-left: 3px;
}


.container{
   display: none;
}
.button-wrapper {
  max-width: 300px;
  margin: 0 auto;
}

.justify-content-flex-end {
  display: flex;
  justify-content: flex-end;
}
.card{
   margin: 10px;
}
.card-wrapper{
   border-top: 1px solid rgba(10,10,10,0.2);
}
.modal-body table td:first-child{
   font-weight: bold;
   text-align: right;
}
img:not(#logo){
   border: 2px solid rgba(10,10,10,0.2);
}
#modForm label{
   font-weight: bold;
}
#mig{
   width: 212px;
   height: 212px;
}

  input[name=reply]{
     height : 54px;
     vertical-align: top;
  }

#owncmt{
border : 1px solid #F0F0F0;
border-radius: 10px;
background: #F0F0F0;
margin-top : 5px;
}
#rpconten, #qcontent{
border : 1px solid #F0F0F0;
border-radius: 10px;
background: #F0F0F0;
}
.reviewList{
   display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}
.review a,.qboard a,.review span {
font-size : x-small;
}
.review #bttn, .qboard #bttn{
width : 100px;
}
.review #replybd, .qboard #qboardbd{
width : 430px;

}
/*0418 변경  */
.review, .qboard{
display : flex;
flex-flow : row;
background : #f7f7f7;
   width : 500px;
   height : auto;
   padding : 10px;
  border-radius: 10px;
  box-shadow: 2px 2px 4px rgba(255, 61, 0, 0.3);
}



#bigtitle{
   font-size : 30px;
   font-weight : bold;
}
#logo{
   width : 180px;
   height : 60px;
}
body {font-family: "Lato", sans-serif;}
.jumbotron h1 {
  color: white;
  font-weight: bold;
}
.jumbotron p {
  color: white;
}
.btn-group img {
  width: 100px;
  height: 100px;
  margin-right: 10px;
}
.jumbotron {
  overflow-x: auto;
  white-space: nowrap;
}
@media (max-width: 768px) {
  .btn {
    width: 100%;
    height: 50px;
  }
}
.sidebar {
  height: 100%;
  width: 200px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #f7f7f7;
  overflow-x: hidden;
  padding-top: 16px;
}
/*0418 변경  */
.sidebar span{
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 20px;
  font-weight : bold;
  color: #575656;
  display: block;
  cursor : pointer;
  height : 50px;
}
/*0418 변경  */
.sidebar span:hover {
  color: rgb(255, 61, 0);
  cursor : pointer;
  font-weight: bold;
}

.main {
  margin-left: 200px; /* Same as the width of the sidenav */
  padding: 0px 10px;
  height : 1000px;
}
#title{
   font-weight: bold;
   font-size: 30px;
   margin-left: 15px;
   height : 50px;

}
#selectRst{
margin-top : 30px;
margin-left : 100px; 

}

#navi{
   margin-left: 200px;
}
#modify,#wan{
   float: right;
   margin-right : 500px;
   width : 100px;
   height: 50px;
}
label{
   font-weight: bold;
}
#rstphoto{
   width : 300px;
   height : 300px;
}

@media screen and (max-height: 450px) {
  .sidebar {padding-top: 15px;}
  .sidebar a {font-size: 18px;}
}

.dropdown-menu {
  width: 200px;
  text-align: center;
}
#form p,label{
margin-bottom : 0px;
}

.star{
color : #ffc107;
font-size : 2.0em;
}
#more_btn{
   display: block; /* 버튼을 블록 레벨 요소로 설정합니다. */
  margin: 0 auto; /* 가운데 정렬합니다. */
  width : 300px;
  height : 50px;
} 
#addSee{
   display: none;
}
#reviewShow{
	margin-left : 100px;
   display: none;
}
</style>

</head>
<body>
<nav id="navi" class="navbar navbar-expand-md navbar-light bg-light">
  <a class="navbar-brand" href="<%=request.getContextPath() %>/mainPage.jsp" id="bigtitle">
    <img src="../images/로고c.png"alt="tablemate.png" id="logo">
  </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav ml-auto">
<%
   if(session.getAttribute("loginRst") == null) {
%>
      <li class="nav-item">
        <a class="nav-link" href="#">로그인</a>
      </li>
<%
   } else {
%>
      <li class="nav-item dropdown">
       <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <svg xmlns="http://www.w3.org/2000/svg" height="28" viewBox="0 96 960 960" width="28">
           <path d="M222 801q63-44 125-67.5T480 710q71 0 133.5 23.5T739 801q44-54 62.5-109T820 576q0-145-97.5-242.5T480 236q-145 0-242.5 97.5T140 576q0 61 19 116t63 109Zm257.814-195Q422 606 382.5 566.314q-39.5-39.686-39.5-97.5t39.686-97.314q39.686-39.5 97.5-39.5t97.314 39.686q39.5 39.686 39.5 97.5T577.314 566.5q-39.686 39.5-97.5 39.5Zm.654 370Q398 976 325 944.5q-73-31.5-127.5-86t-86-127.266Q80 658.468 80 575.734T111.5 420.5q31.5-72.5 86-127t127.266-86q72.766-31.5 155.5-31.5T635.5 207.5q72.5 31.5 127 86t86 127.032q31.5 72.532 31.5 155T848.5 731q-31.5 73-86 127.5t-127.032 86q-72.532 31.5-155 31.5ZM480 916q55 0 107.5-16T691 844q-51-36-104-55t-107-19q-54 0-107 19t-104 55q51 40 103.5 56T480 916Zm0-370q34 0 55.5-21.5T557 469q0-34-21.5-55.5T480 392q-34 0-55.5 21.5T403 469q0 34 21.5 55.5T480 546Zm0-77Zm0 374Z"/>
         </svg>
       </a>
       <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
         <span class="dropdown-item-text"><%=resVo.getRst_name()%>님 환영합니다!</span>
         <a class="dropdown-item" href="#!">마이페이지</a>
         <a class="dropdown-item" href="<%=request.getContextPath()%>/memlogout.do">로그아웃</a>
       </div>
     </li>
<%
   }
%>       
      
      
      
      
    </ul>
  </div>
</nav>
<div class="sidebar">
  <span href="rstmain.jsp" id="title"></span>
 <hr>
  <span id="home"><i class="fa fa-fw fa-home"></i> 내 가게 정보</span>
  <span id="service"><i class="fa fa-fw fa-wrench"></i> 메뉴관리</span>
  <span id="reserv"><i class="fa fa-fw fa-user"></i> 예약관리</span>
  <span id="review"><i class="fa fa-fw fa-envelope"></i> 리뷰관리</span>
  <span id="question"><i class="fa fa-bell-o"></i> 문의확인</span>
</div>

<!-- 메인 페이지 노출 영역 -->
<div class="main" >
   <div id="selectRst">
   <form id="form" action="<%=request.getContextPath()%>/modifyRst.do" method="post" enctype="multipart/form-data">
   </form>
   </div>
   <div id="reviewShow"></div>
   <div id="addSee"><input class="btnTM" id="more_btn" type="button" value="more"></div>
   
   
   <!-- 매뉴 -->
   <div class="container">
        <h1>내 메뉴 정보</h1>
        <div class="justify-content-flex-end">
          <button class="btn btn-primary" id="addMenu">메뉴 추가</button>
        </div>
        <br>
        <div class="card-wrapper d-flex flex-wrap mx-n2">
        </div>
      </div>
   
   
   <!-- 예약 정보 보여 주는 메인 페이지 -->
   <div id='calendar'></div>
   <div class="reservList"></div>
   
   
   
</div>
<!-- 사업자페이지 리뷰관리의 댓글달기 모달-->

  <!-- The Modal -->
  <div class="modal fade" id="replyModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">댓글달기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
         <textarea rows="3" cols="50" name="rvcmt" id="cmtta"></textarea>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <input id="set"  type="button" class="btnTM" value="등록">
          <button type="button" class="btnTM" data-dismiss="modal">Close</button>
        </div> 
        
      </div>
    </div>
  </div>
  <!-- 사업자페이지 리뷰관리의 신고하기 모달-->

  <!-- The Modal -->
  <div class="modal fade" id="reportModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">신고하기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
         <form action="<%=request.getContextPath()%>/reviewReport.do" method="get" >
            <select id="reportRss">
               <option>신고 사유를 선택해주세요.</option>
               <option>무분별한 욕설</option>
               <option>근거없는 비방</option>
               <option>예약자 귀책사유로 인한 컴플레인</option>
               <option>기타</option>
            </select>
            <br>
         <textarea id="reportRs" rows="3" cols="50" placeholder="자세한 내용을 입력해주세요."></textarea>
         
         </form>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <input type="button" class="btnTM" id="report" value="신고">
          <button type="button" class="btnTM" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  <!-- 사업자페이지 리뷰관리의 댓글 수정 모달-->

  <!-- The Modal -->
  <div class="modal fade" id="mreplyModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">댓글수정하기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
         <textarea rows="3" cols="50" name="modcont" id="modcont"></textarea>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <input id="modrepl"  type="button" class="btnTM" value="수정">
          <button type="button" class="btnTM" data-dismiss="modal">Close</button>
        </div> 
        
      </div>
    </div>
  </div>
  
  
  
  
  
  
  
  
  <!-- 예약 상세 정보 보여주는 모달! -->
<div class="modal fade" id="rdModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">예약 상세 정보</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
       <label>예약 번호 :</label><p class="rpt" id="rp1"></p><hr>
       <label>예약자 성함 :</label><p class="rpt" id="rp2"></p><hr>
       <label>예약자 연락처 :</label><p class="rpt" id="rp3"></p><hr>
       <label>방문 일자 :</label><p class="rpt" id="rp4"></p><hr>
       <label>방문 인원 :</label><p class="rpt" id="rp5"></p><hr>
       <label>예약 메뉴 :</label><p class="rpt" id="rp6"></p>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btnTM" id="rsCancel">예약취소</button>
        <button type="button" class="btnTM" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
  
  
  
   <!-- 메뉴 추가 버튼 눌럿을떄 뜨는 모달-->
<div class="modal fade" id="addModal">
  <div class="modal-dialog modal-lg ">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">메뉴 추가</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form action="<%=request.getContextPath()%>/menuAdd.do" 
            method="post" enctype="multipart/form-data">
           <input type="hidden" value="<%=resVo.getRst_id()%>" name="rid">
           <table border="0" id="addMenutable">
              <tr>
                 <td>메뉴 이름 :</td>
                 <td><input type="text" class="form-control" id="mname" name="mname"></td>
              </tr>
              <tr>
                 <td>메뉴 가격 :</td>
                 <td><input type="text" class="form-control" id="mprice" name="mprice"></td>
              </tr>
              <tr>
                 <td>메뉴 사진 첨부 :</td>
                 <td>
                  <input class="form-control form-control-user" type="file" 
                     name="product_image" id="product_image" onchange="setThumbnail(event);">
               </td>
              </tr>
              <tr>
                 <td></td>
                 <td>
                    <div id="image_container"></div>
                 </td>
              </tr>
              <tr>
                 <td>메뉴 설명 :</td>
                 <td><textarea class="form-control" rows="5" id="comment" name="mds"></textarea></td>
              </tr>
           </table>
<!--            <input type="submit" id=""> -->
           <button type="submit" class="btnTM">저장</button>
        </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btnTM" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

<!-- 메뉴 상세 정보 보는 모달 -->
  <div class="modal fade" id="menuInfoModal">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">메뉴 상세 정보</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <form action="<%=request.getContextPath()%>/menuUpdate.do" 
            method="post" enctype="multipart/form-data" id="modForm">
            <label for="menuFileInput">
               <img id="menuImage" src="" style="width: 100%;">
            </label>
            <input id="menuFileInput" type="file" style="visibility: hidden;" name="mphoto" onchange="changeImage(event)" disabled>
               <br>
             <label>매뉴 이름</label>
             <input type="text" class="form-control" id="modName" name="modName" disabled>
             <label>매뉴 가격</label>
             <input type="text" class="form-control" id="modPrice" name="modPrice" disabled>
             <label>매뉴 설명</label>
             <textarea class="form-control" rows="5" id="modDs" name="modDs" disabled></textarea>
             <input type="hidden" name="menuDetailId" id="menuDetailId">
             <input type="hidden" name="rstId" id="rstId">
             <input type="submit" id="modifyContent" style="display: none;">
          </form>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btnTM" id="updateMenu">수정</button>
          <button type="button" class="btnTM" id="deleteMenu">삭제</button>
          <button type="button" class="btnTM" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
  
  
  <!-- 문의에 답장하는 모달 -->
  <div class="modal fade" id="answerModal">
    <div class="modal-dialog ">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">문의 답변하기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
           <form>
              
              <p> 작성자 : <span id="writerq" style="font-size:16px;"></span> </p>
              <p> 문의내역 : </p>
              <p id="contentq" style="font-size:16px;"></p>
              <textarea id='acontent' rows="10" cols="50"></textarea>
           
           </form>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btnTM" id="answer">전송</button>
          <button type="button" class="btnTM" data-dismiss="modal">닫기</button>
        </div>
        
      </div>
    </div>
  </div>
  
  
  
</body>
</html> 