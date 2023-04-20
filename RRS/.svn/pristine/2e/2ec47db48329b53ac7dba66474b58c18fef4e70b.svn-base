<%@page import="rrs.vo.RestautantVO"%>
<%@page import="rrs.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Table Mate</title>
<link rel='shortcut icon' type='image/x-icon' href='<%=request.getContextPath()%>/images/로고.png' />
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script type="text/javascript"
   src="http://localhost/RRS/js/jquery-3.6.4.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400&display=swap" rel="stylesheet">

<script type="text/javascript">
$(document).ready(function() {
     var mypath = '<%=request.getContextPath()%>';

     rst_id = '<%=request.getParameter("rst_id")%>'
     rvid2 ='';
     depender = '';
     $('#review').on('click', function() {
          $.ajax({
              url: "<%=request.getContextPath()%>/member/review.do",
              type: 'get',
              data: {
                  rst_id: rst_id
              },
              success: function(res) {
                  var code = ''; // 변수 초기화 추가
                  var code2 = '';
                  $.each(res.rv, function(i, v) {
                     code += '<div class="container p-3 my-3 border outer">';
                     code += '<div>';
                      code += '<div id="rvphoto">';
                      
                     var starNum = Math.floor(v.rv_sc);
                     star ='';
                     for (let i = 0; i < starNum; i++) {
                        star += "<span id='star' style='color:#ff3d00;'>★</span>";

                     }
                     
                     code += '<div style="display: flex; justify-content: space-between; align-items: center;">';
                     code += '<h4 style="margin: 0;">' + v.mem_nick + '</h4>';
                     code += '<span style="font-size: 80%;">' + v.rv_date + '</span>';
                     code += '</div>';
                      code += '<div style="display: flex; justify-content: space-between;">';
                      code += '<div style="display: flex; align-items: center;">';
                      code += star;
                      code += '</div>';
                      code += '<div>';
                      code += '<br>';
                      code += ` <a href="" class="rvreport" data-toggle="modal" id="${v.mem_id}" data-target="#reportModal">신고</a>`;
                      code += '</div>';
                      code += '</div>';
                     
                                            
                      rvid2 = v.rv_id;
                      depender = v.mem_id;
                     if (v.rv_photo != null) {
                          code += '<img src="' + mypath + '/ImageView.do?Photo=' + v.rv_photo + '" width="200" height="140">';
                        }
                      
                      code += '</div>'
                     code += '<br>';
                      code += '<p>' + v.rv_content + '</p>'
                      
                      if(v.rstcmtlist.length > 0){
                         code += '<div class="container p-3 my-3 border" id="owncmt">'
                        $.each(v.rstcmtlist, function(ii, vv){
                        code += "<p class='owncmt' style='font-weight:bold; font-size:0.8em;'>사장님 한마디</p>";
                        code += '<p class="pcont" id='+vv.rcmt_id+'>'+vv.rcmt_content+'</p>';
                        console.log()
                        })
                        code += '</div>'
                      }  
                      code += '</div>'
                         code += '</div>'
                  })
   
                  $('#tab-result').html(code);
              },
              error: function(xhr) {
                  alert("상태: " + xhr.status);
              },
              dataType: 'json'
          })
      });
     
     <%MemberVO memVo = (MemberVO) session.getAttribute("loginMember");%>
     
     
     $('#review').click();
     
     $('#home').on('click', function() {
        window.location.href = "<%=request.getContextPath()%>/RstView.do?rst_id=" + rst_id;
        });
     
     
     $('#menu').on('click', function() {
          window.location.href = '<%=request.getContextPath()%>/member/rst-select/navMenu.jsp?rst_id=' + rst_id;
        });

     $('#photo').on('click', function() {
          window.location.href = '<%=request.getContextPath()%>/member/rst-select/navphoto.jsp?rst_id=' + rst_id;
        });   
    
     

   
   var reporter = '<%=memVo.getMem_id()%>'
      
   //리뷰 - 신고모달에서 신고버튼 클릭이벤트
   $('#report').on('click',function(){
      rss = $('#reportRss').val();
      rs = $('#reportRs').val();
      $.reportReview(rst_id);   

   })


   $.reportReview = function(resId){
      $.ajax({
          url: "<%=request.getContextPath()%>/member/memberStUpdate.do",
          type : 'get',
         data : {
         "depender" : depender,
         "reporter" : reporter,
         "id" : resId,
         "rvid" : rvid2,
         "rss" : rss,
         "rs" : rs
         },
         success : function(res) {
         if (res.flag == 1 || res.flag == 2 || res.flag== 3) {
            alert("접수되었습니다.\n신고는 관리자 검토 후 처리됩니다.")
            $('#reportRs').val("");
            $('#reportModal').modal('hide');
            $('#reviewShow').html('');
         } else {
            alert("실패");
         }
         },
         error : function(xhr) {
            alert("상태: " + xhr.status);
         },
         dataType : 'json'
         })
         }
   });
</script>


<style>

body {
   font-family: 'IBM Plex Sans KR', sans-serif;
}

.outer{
box-shadow: 0 2px 5px rgba(0,0,0,0.2);
}

.nav {
  display: flex;
  justify-content: space-around;
}

.nav-item {
  text-align: center;
}

.nav-link:focus,
.nav-link:active {
  text-decoration: underline;
}
 
body {
   font-family: 'IBM Plex Sans KR', sans-serif;
}
#mymap{
   border: 1px solid gray; 
}

  
#photo{
  display: flex;
  justify-content: center;
}


.reviewImg{
   width: 200px;
   height: 200px;
}


.imgtd{
    width: 150px;
    height: 150px;
}

.btn_area{
   position : fixed;
   bottom:0;
}

#reservationBtn{
background: #ff3d00;
color: white;
border: none;
}

.button-wrapper {
  display: flex;
  justify-content: center;
  text-align: center;
}

#photo2{
  display: flex;
  justify-content: center;
  text-align: center;
}

#reservationBtn {
  width: 700PX;
  height: 40px;
  z-index: 999;
}
 
#logo{
width : 180px;
height : 60px;

}


#owncmt {
    border: 1px solid #F0F0F0;
    border-radius: 10px;
    background: #F0F0F0;
    margin-top: 5px;
}

.nav-item li {
    width: 25%;
    text-align: center;
}
</style>

</head>
<body>


<nav class="navbar navbar-expand-md navbar-light bg-light">
<!--   <a class="navbar-brand" href="#">네비게이션 로고</a> -->
   <a class="navbar-brand" href="<%=request.getContextPath()%>/mainPage.jsp" id="bigtitle"><img src="<%=request.getContextPath()%>/images/로고c.png"alt="tablemate.png" id="logo"></a>
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
<%
   RestautantVO rstVo = (RestautantVO) session.getAttribute("loginRst");
   if(session.getAttribute("loginMember") != null) {
%>
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
<%
   } else if(session.getAttribute("loginRst") != null){
%>
   <li class="nav-item dropdown">
       <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <svg xmlns="http://www.w3.org/2000/svg" height="28" viewBox="0 96 960 960" width="28">
           <path d="M222 801q63-44 125-67.5T480 710q71 0 133.5 23.5T739 801q44-54 62.5-109T820 576q0-145-97.5-242.5T480 236q-145 0-242.5 97.5T140 576q0 61 19 116t63 109Zm257.814-195Q422 606 382.5 566.314q-39.5-39.686-39.5-97.5t39.686-97.314q39.686-39.5 97.5-39.5t97.314 39.686q39.5 39.686 39.5 97.5T577.314 566.5q-39.686 39.5-97.5 39.5Zm.654 370Q398 976 325 944.5q-73-31.5-127.5-86t-86-127.266Q80 658.468 80 575.734T111.5 420.5q31.5-72.5 86-127t127.266-86q72.766-31.5 155.5-31.5T635.5 207.5q72.5 31.5 127 86t86 127.032q31.5 72.532 31.5 155T848.5 731q-31.5 73-86 127.5t-127.032 86q-72.532 31.5-155 31.5ZM480 916q55 0 107.5-16T691 844q-51-36-104-55t-107-19q-54 0-107 19t-104 55q51 40 103.5 56T480 916Zm0-370q34 0 55.5-21.5T557 469q0-34-21.5-55.5T480 392q-34 0-55.5 21.5T403 469q0 34 21.5 55.5T480 546Zm0-77Zm0 374Z"/>
         </svg>
       </a>
       <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
         <span class="dropdown-item-text"><%=rstVo.getRst_name()%>님 환영합니다!</span>
         <a class="dropdown-item" href="<%=request.getContextPath()%>/restaurant/rstmain.jsp">마이페이지</a>
         <a class="dropdown-item" href="<%=request.getContextPath()%>/memlogout.do">로그아웃</a>
       </div>
    </li>

<%
   } else {
%>  
   <li class="nav-item">
        <a class="nav-link" href="<%=request.getContextPath()%>/member/view/login.jsp">로그인</a>
    </li>
<%
   }
%>  
    </ul>
  </div>
</nav>
   <div class="container p-3 my-3 border outer" style="width: 700px;">
      <ul class="nav nav-tabs">
         <li class="nav-item"><a class="nav-link" data-toggle="tab"
            href="#" id="home">홈</a></li>
         <li class="nav-item"><a class="nav-link" data-toggle="tab"
            href="#" id="menu">메뉴</a></li>
         <li class="nav-item"><a class="nav-link" data-toggle="tab"
            href="#" id="photo">사진</a></li>
         <li class="nav-item"><a class="nav-link active "
            data-toggle="tab" href="#" id="review">리뷰</a></li>
      </ul>

      <div class="tab-content" id=tab-result></div>
   </div>

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
               <form action="<%=request.getContextPath()%>/reviewReport.do"
                  method="get">
                  <select id="reportRss">
                     <option>신고 사유를 선택해주세요.</option>
                     <option>무분별한 욕설</option>
                     <option>근거없는 비방</option>
                     <option>예약자 귀책사유로 인한 컴플레인</option>
                     <option>기타</option>
                  </select> <br>
                  <textarea id="reportRs" rows="3" cols="50"
                     placeholder="자세한 내용을 입력해주세요."></textarea>

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

</body>
</html>