<%@page import="rrs.vo.MemberVO"%>
<%@page import="rrs.vo.RestautantVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Table Mate</title>
<link rel='shortcut icon' type='image/x-icon' href='<%=request.getContextPath()%>/images/로고.png' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400&display=swap" rel="stylesheet">
<script src="../js/memMyPage.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/jquery.serializejson.min.js" type="text/javascript"></script>

<script>
<%
   MemberVO memVo = (MemberVO) session.getAttribute("loginMember");
%>
info = {id: '<%=memVo.getMem_id()%>', pass: '<%=memVo.getMem_pass()%>', name: '<%=memVo.getMem_name()%>', nick: '<%=memVo.getMem_nick()%>',
      bir: '<%=memVo.getMem_bir()%>', tel: '<%=memVo.getMem_tel()%>', mail: '<%=memVo.getMem_mail()%>'};
review = { };
m = 0;
mypath = '<%=request.getContextPath()%>';

$(function(){
   cont = 5;
//    home = $('#home').text();
<%--    resId = "<%=memVo.getMem_id()%>"; --%>
   
   $('#title').html('마이 페이지');

   // 기본 페이지는 내 정보 창으로 되게 설정
   $.memInfo(info);
   
//       },
//       error : function(xhr){
//          alert("상태 : "+xhr.status)
//       },
//       dataType: 'json'
//    })// 회원정보 출력 끝
   
   // 수정버튼 클릭시 완료버튼 출력 및 히든>text로 변경
   $(document).on('click','#modify',function(){
      $('.cm').css('display','none');
      hiddenInputs = document.querySelectorAll('input[class="canmod"]');
         for (var i = 0; i < hiddenInputs.length; i++) {
              hiddenInputs[i].setAttribute('type', 'text');
            }
      
//       $('#modify').hide();
      $('#modify').css('display','none');
      done = `<input type="submit" value="완료" id="wan" class="btnTM" >`
      $('#btnbtn2').append(done);
   })//수정끝
   
   // 내정보 버튼 누르면
   $('#info').on('click',function(){
      $('#addSee').css('display','none');
      $.memInfo(info);
   })
   
   // 회원탈퇴 확인버튼 누를시
   $('#memDelete').on('click',function(){
      // 약관동의 했는지 확인
      if(!($('#touCheck').prop('checked'))) {
         alert("약관에 동의해주세요.")
      } else {
         // 계정삭제 함수
         $.memDelete(info);
      }
   })
   
   // 내가 찜한 가게 버튼 누르면
   $('#like').on('click',function(){
      $('#addSee').css('display','none');
//       alert('내가 찜한 가게~')
      $.bookmarkList();
   })
   // 내 리뷰 버튼 누르면
   $('#review').on('click',function(){
//       alert('내가 쓴 리뷰~');
      m=0;
      $.reviewList(m);
      $('#addSee').css('display','block');
   })
   
   $('#addSee').on('click',function(){
      m = m + 1;
      $.reviewList(m);
   })
   
   $('#iqr').on('click',function(){
//       alert('내가 쓴 문의');
      $('#addSee').css('display','none');
      $.memIprList(info, cont);
   })
   
   $(document).on('click', '#more', function(){
      cont += 5;
      $.memIprList(info, cont);
   
   })
   
   $(document).on('click', '.action', function(){
      vaction = $(this).attr('name');
      vidx = $(this).attr('idx');
      
      
      if(vaction == "r_modify") {
//          alert(vidx + "번 리뷰를 수정");
         modifycont = $(this).parents('.replyContent').find('.rcontent').html();
//          alert(modifycont);
         
         mcont = modifycont.replace(/<br>/g, "\n");
         $('#modifyForm textarea').val(mcont)
         
         $(this).parents('.replyContent').find('.rcontent').empty().append($('#modifyForm'));      
         
         // 수정폼을 보이기
         $('#modifyForm').css('display', 'block');
         
      } else if(vaction == "r_delete") {
//          alert(vidx + "번 리뷰를 삭제");
         $.memReviewDelete(this);
         
      } else if(vaction == "rsvDel") {
//          alert(vidx + "  예약취소버튼");

         // 예약취소 함수 호출
         $.reservationDelete();
      } else if(vaction == "rsvUpdate") {
         alert(vidx + "  예약수정버튼");
      }
   })
   
   // 리뷰 수정창에서 확인 버튼
   $('.btnok').on('click',function(){
      // 입력한 내용을 가져온다.
      modicont = $('#modifyForm textarea').val();
//       alert(modicont);
      
      // \n을 <br>로 바꿔준다.
      modiout = modicont.replace(/\n/g,"<br>");
      
      // p3을 찾는다.
//       vp3 = $(this).parents($('.p3')); 위에 .p3이 여러개라 안됨
      vp3 = $('#modifyForm').parents('.rcontent');
      
      // modifyForm을 body로 이동 - 안보이게 설정
      $('body').append($('#modifyForm'));
      $('#modifyForm').css('display', 'none');
      
      review.renum = vidx;
      review.cont = modicont;
      
//       alert(review.renum);
      
      rimgsrd = "<%=request.getContextPath()%>/images/rphotoPrint.do?reviewId=" + vidx;
      $.replyUpdateServer(this);
   })
   
   // 리뷰 수정창에서 취소 버튼
   $('#btnreset').on('click',function(){
      replyReset();
   })
   
   replyReset = function(){
      // p3을 찾는다.
      vp3 = $('#modifyForm').parent();
      
      // 수정폼을 body로 이동시킴(append), 안보이게 설정
      $('body').append($('#modifyForm'));
      
//       $('#modifyForm').hide();
      $('#modifyForm').css('display', 'none');
      
      // 원래 내용을 p3에 다시 출력
      $(vp3).html(modifycont);
   }
   
   // 내예약 버튼 누르면
   $('#rsv').on('click',function(){
      $('#addSee').css('display','none');
//       alert('내가 한 예약~');
      $.memRsvList(info);
      
   })
   
//    // 리뷰 입력 버튼 누르면
//    $('#reviewinsert').on('click',function(){
//       $.reviewInsert();
//    })
   
   //비밀번호 정규식
//    $(document).on('keyup','#pwd',function(){
//       pwdval = $(this).val().trim();
//       passreg = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*?]).{5,30}$/;
//       regCheck(passreg,pwdval,this);
//    })
   
//    //정규식 체크
//    function regCheck(reg,value,ele) {
//       if(!(reg.test(value))){
//          $(ele).css('border','2px solid red')
//       }else {
//          $(ele).css('border','2px solid green')
//       }
//    }
   
   $(document).on('click','.rsreview',function(){
      rsid = $('.rsreview').attr('rsid');
      console.log(rsid);
      
      $('#rsid').val(rsid);
   })
})


</script>
<style>
body {
   font-family: 'IBM Plex Sans KR', sans-serif;
}
.nav-item a svg {
    width: 28px;
    height: 28px;
}
#bigtitle{
   font-size : 30px;
   font-weight : bold;
}
#logo{
   width : 180px;
   height : 60px;
}
/* body {font-family: "Lato", sans-serif;} */
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
.carousel-item {
  height: 600px; /* 높이 값은 원하는 값으로 변경해주세요 */
}
.carousel-item img {
  height: 100%;
  object-fit: cover;
  width: 100%;
}
.btn {
    width: 400px; /* 버튼 가로 길이 */
    height: 50px; /* 버튼 높이 */
  }
  
  @media (max-width: 768px) {
  .btn {
    width: 100%;
    height: 50px;
  }
}
.sidebar {
  height: 100%;
  width: 220px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #dcdcdc;
  overflow-x: hidden;
  padding-top: 16px;
}

.sidebar span {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 20px;
  color: black;
  display: block;
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
.sidebar span {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 20px;
  font-weight : bold;
  color: rgb(255, 61, 0);
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
/*   height : 520px; */
}
#title{
  font-weight: bold;
  font-size: 30px;
  margin-left: 15px;
  height : 50px;
}


#selectMem{
  margin-top : 30px;
  margin-left : 50px;
  min-height: 520px;
}

hr{
  color : black;
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
.replyBody{
   box-sizing:border-box;
/*    border: 1px solid lime; */
   padding: 10px;

}
/* #replyPic{ */
/*    border: 1px solid blue; */
/*    width: 100px; */
/*    height: 100px; */
/*    margin-right: 20px; */
/*    display: inline-block; */
/* } */
#reviewPic{
   width: 100px;
   height: 100px;
   float: left;
   border-radius: 10px;
   margin-left: 10px;
}
#rvcont{
   width: 600px;
}
/* #replyContent{ */
/*    border: 1px solid red; */
/*    width: 900px; */
/*    height: 150px; */
   
/* } */
#pbutton, .replyContent{
   text-align: right;
}
.rcontent{
/*    margin-right: 50px; */
   display: inline-block;
   width: 400px;
   margin-right: 10px;
   text-align: left;
}
.rtable tr:nth-child(odd) {
  background-color: #F2F2F2;
}
#star{
   color: gold;
   font-size: 1.2em;
}
#modifyForm{
   display: none;
}
.rsvtitle{
   float: right;
}

.rsvbtn{
   float: right;
   margin-right: 20px;
   margin-bottom: 20px;
   width: 120px;
}

#more{
width: 30%; 
left: 35%
}

#atitle{
margin-left : 30px;
text-decoration: none;
color: #3333FF;
}

.bookbtn{
   float: right;
   margin-right: 20px;
   width: 120px;
/*    height: 50px; */
}
#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform fieldset legend{
    text-align: right;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 3em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#reviewContents {
    width: 100%;
    height: 150px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
}
.bookcard{
/*    float: left; */
   display: inline-block;
}
.bookimg{
   width: 300px;
   height: 300px;
}
.outmodal2{
   color: #FF6000;
}
#outmodal1{
   color: #339900;
   font-weight: bold;
}
.pbold{
   font-weight: bold;
}
#fmodal{
   text-align: center;
}
#outagree{
   text-align: center;
}
.om{
   width: 200px;
}
#outtable{
   text-align: center;
}
tr{
   height: 40px;
}
#td1{
   width: 100px;
}
#td2{
   width: 300px;
}
.p1, .canmod{
   margin-left: 40px;
}
.infospan{
   font-weight: bold;
}
.infospan, .p1{
   font-size: 1.3em;
}
#btnbtn2{
 padding-left: 150px;
}
#addSee{
   display: none;
}
#more_btn{
    display: block; /* 버튼을 블록 레벨 요소로 설정합니다. */
    margin-left: 270px; /* 가운데 정렬합니다. */
    margin-top: 30px;
    width : 300px;
    height : 50px;
} 
.btnTM{
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
.btnTM2{
  width: 130px;
}
.btnTM3{
  display: inline-block;
  font-size: 16px;
  font-weight: bold;
  text-decoration: none;
  background-color: white;
  color: #ff3d00;
  border: 1px solid #ff3d00;
  border-radius: 5px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
  transition: background-color 0.3s ease;
  cursor : pointer;
  width: 44.55px;
  height: 30px;
  display: inline-flex;
  flex-direction: column;
  align-items: center; /* 가로 - 중앙으로 */
  justify-content: center;
}
</style>

</head>
<body>
<nav id="navi" class="navbar navbar-expand-md navbar-light bg-light">
  <a class="navbar-brand" href="<%=request.getContextPath()%>/mainPage.jsp" id="bigtitle"><img src="../images/로고c.png"alt="tablemate.png" id="logo"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item active">
        <a class="nav-link" href="<%=request.getContextPath()%>/noticeboard.jsp">공지사항</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">예약하기</a>
      </li>
      <li class="nav-item dropdown">
       <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <svg xmlns="http://www.w3.org/2000/svg" height="28" viewBox="0 96 960 960" width="28">
           <path d="M222 801q63-44 125-67.5T480 710q71 0 133.5 23.5T739 801q44-54 62.5-109T820 576q0-145-97.5-242.5T480 236q-145 0-242.5 97.5T140 576q0 61 19 116t63 109Zm257.814-195Q422 606 382.5 566.314q-39.5-39.686-39.5-97.5t39.686-97.314q39.686-39.5 97.5-39.5t97.314 39.686q39.5 39.686 39.5 97.5T577.314 566.5q-39.686 39.5-97.5 39.5Zm.654 370Q398 976 325 944.5q-73-31.5-127.5-86t-86-127.266Q80 658.468 80 575.734T111.5 420.5q31.5-72.5 86-127t127.266-86q72.766-31.5 155.5-31.5T635.5 207.5q72.5 31.5 127 86t86 127.032q31.5 72.532 31.5 155T848.5 731q-31.5 73-86 127.5t-127.032 86q-72.532 31.5-155 31.5ZM480 916q55 0 107.5-16T691 844q-51-36-104-55t-107-19q-54 0-107 19t-104 55q51 40 103.5 56T480 916Zm0-370q34 0 55.5-21.5T557 469q0-34-21.5-55.5T480 392q-34 0-55.5 21.5T403 469q0 34 21.5 55.5T480 546Zm0-77Zm0 374Z"/>
         </svg>
       </a>
       <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
         <span class="dropdown-item-text"><%=memVo.getMem_name()%>님 환영합니다!</span>
         <a class="dropdown-item" href="<%=request.getContextPath()%>/member/memMyPage.jsp">마이페이지</a>
         <a class="dropdown-item" href="<%=request.getContextPath()%>/memlogout.do">로그아웃</a>
       </div>
     </li>
    </ul>
  </div>
</nav>

<div class="sidebar">
  <span href="<%=request.getContextPath()%>/member/memMyPage.jsp" id="title"></span>
 <hr>
  <span id="info"><i class="fa fa-fw fa-home"></i> 내 정보</span>
  <span id="like"><i class="fa fa-fw fa-wrench"></i> 내가 찜한 가게</span>
  <span id="review"><i class="fa fa-fw fa-user"></i> 내가 등록한 리뷰</span>
  <span id="rsv"><i class="fa fa-fw fa-envelope"></i> 내 예약 확인하기</span>
  <span id="iqr"><i class="fa fa-fw fa-envelope"></i> 내 문의 확인하기</span>
</div>

<!-- 메인 페이지 노출 영역 -->
<div class="main">
   <div id="selectMem">
   </div>
   <div id="addSee"><input class="btn btn-outline-primary btnTM" id="more_btn" type="button" value="more"></div>
</div>

<!-- The Modal -->
  <div class="modal fade" id="outModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <div>
          <h4 class="modal-title pbold">탈퇴 안내</h4>
          <span>회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</span>
          </div>
          <button type="button" class="close" data-dismiss="modal">×</button><br>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body" style="max-height: 500px; overflow-y: auto;">
          <p class="pbold">사용하고 계신 아이디(<span id="outmodal1"><%=memVo.getMem_id()%></span>)는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</p>
          <p><span class="outmodal2">탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가</span>하오니 신중하게 선택하시기 바랍니다.</p><br>
          <p class="pbold">탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</p>
          <p>회원정보 및 예약, 리뷰, 문의 등 개인형 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.<br>
          삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.</p><br>
        <table border="1" id="outtable">
           <tr>
             <td id="td1">예약</td><td id="td2">예약계정 및 보관 중인 예약내역 삭제</td>
           </tr>
           <tr>
             <td>리뷰</td><td>리뷰계정 및 보관 중인 리뷰내역 삭제</td>
           </tr>
           <tr>
             <td>문의</td><td>문의계정 및 보관 중인 문의내역 삭제</td>
           </tr>
        </table><br><br>
        <p class="pbold">탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</p>
        <p>게시판, 리뷰 등에 올린 게시글 및 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다.<br>
          삭제를 원하는 게시글이 있다면 <span class="outmodal2">반드시 탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다.</span><br>
          탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.</p><br>
      
        <p class="pbold">TABLEMATAE 아이디를 사용해 다른 서비스에 로그인 할 수 없게 됩니다.</p>
        <p><span class="outmodal2">탈퇴 후에는 아이디 <span id="outmodal1"><%=memVo.getMem_id()%></span> 로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다.<br>
          게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다.<br>
          또한, TABLEMATAE 아이디를 사용해 다른 서비스에 로그인 할 수 없게 됩니다.</span></p>
        </div>
        
        <div id="outagree"><hr>
             <input type="checkbox" id="touCheck"><span class="pbold">&nbsp;&nbsp;안내 사항을 모두 확인하였으며, 이에 동의합니다.</span>
        </div><br>
        
        <!-- Modal footer -->
        <div class="modal-footer" id="fmodal">
          <button type="button" id="memDelete" class="btn btn-secondary om" >확인</button>
          <button type="button" class="btn btn-secondary om" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
  <!-- The Modal -->
  <div class="modal fade" id="reviewModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">리뷰 달기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          
          <form action="<%= request.getContextPath()%>/reviewInsert.do" method="post" class="mb-3" name="myform" id="myform" enctype="multipart/form-data">
         <fieldset>
            <span class="text-bold">별점을 선택해주세요</span>
            <input type="radio" name="reviewStar" value="5" id="rate1"><label
               for="rate1">★</label>
            <input type="radio" name="reviewStar" value="4" id="rate2"><label
               for="rate2">★</label>
            <input type="radio" name="reviewStar" value="3" id="rate3"><label
               for="rate3">★</label>
            <input type="radio" name="reviewStar" value="2" id="rate4"><label
               for="rate4">★</label>
            <input type="radio" name="reviewStar" value="1" id="rate5"><label
               for="rate5">★</label>
            <input type="hidden" name="id" value="<%=memVo.getMem_id()%>">
            <input type="hidden" id="rsid" name="rsid">
         </fieldset>
         <div>
            <textarea class="col-auto form-control" type="text" id="reviewContents" name="reviewContents"
                    placeholder="좋은 리뷰를 남겨주시면 TableMate에 큰 힘이 됩니다!!"></textarea><br>
         </div>
           <input type="file" name="photo"><br><br>
        <div class="modal-footer">
          <button type="submit" id="reviewinsert" class="btn btn-outline-primary" >확인</button>
          <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
        </div>
      </form>
        </div>
        
        
      </div>
    </div>
  </div>

<div id="modifyForm">
   <textarea rows="2" cols="50"></textarea>
   <input type="button" value="확인" class="btnok btnTM btnTM3">
   <input type="button" value="취소" id="btnreset" class="btnTM btnTM3">
</div>
<%@include file="../footer.jsp"%>
</body>

</html> 