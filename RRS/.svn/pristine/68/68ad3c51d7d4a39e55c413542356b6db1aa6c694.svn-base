<%@page import="rrs.vo.RestautantVO"%>
<%@page import="rrs.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
  <title>Table Mate</title>
  <link rel='shortcut icon' type='image/x-icon' href='<%=request.getContextPath()%>/images/로고.png' />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.4.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=657d2b9a3dc2dbd9af64eee4de0290ad&libraries=services"></script>
  <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400&display=swap" rel="stylesheet">
  <script type="text/javascript" src="<%=request.getContextPath()%>/js/memMyPage.js"></script>
  
<script src="<%=request.getContextPath()%>/js/jquery.serializejson.min.js" type="text/javascript"></script>

<script type="text/javascript">
mypath = '<%=request.getContextPath()%>';  

<%
RestautantVO vo = (RestautantVO)request.getAttribute("vo");

String rstid = vo.getRst_id();

%>
rst_id = '<%=rstid%>'; 

$(document).ready(function() {
    $('#mainhome').load('member/rst-select/home.jsp', {"rst_id": rst_id});
});

$(document).ready(function() {
    $('#menu-etc').load('member/rst-select/home-menu-etc.jsp', {"rst_id": rst_id});
});

$(document).ready(function() {
    $('#menu').load('member/rst-select/menu.jsp', {"rst_id": rst_id});
});

$(document).ready(function() {
    $('#photo2').load('member/rst-select/mainphoto.jsp', {"rst_id": rst_id});
});



$(function(){

   
   $('#mainhome').on('click', '#addiqr', function(){
    $('#wModal').modal('show');
   });
   
   $('#wModal').on('click', '#send', function(){
      fdata = $('#wform').serialize();
      console.log(fdata);
      
      $.ajax({
         url : '<%=request.getContextPath()%>/iqrBoardInsert.do',
         type : 'post',
         data : fdata,
         success : function(res){
            if(res > 0){
               $('#wModal').modal('hide');
               alert("등록이 완료되었습니다.");
            }else{
               alert("등록을 실패했습니다.");
            }
         },
         error : function(xhr){
            alert("상태 : " + xhr.status);
         },
         dataType : 'json'
      })
   })
})

</script>

<style>
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
.dropdown-menu {
  width: 200px;
  text-align: center;
}
.icon.heart{
   text-decoration:none; color:inherit; cursor: pointer;
   margin-left: 90%;
}
.right_area .icon{
   display: flex;
   align-items: center;
   justify-content: center;
   width: calc(90vw * (45 / 1920));
   height: calc(90vw * (45 / 1920));
   
   border-radius: 50%;
   border: solid 2px #eaeaea;
   background-color: #fff;
}

.icon.heart img{
   width: calc(90vw * (24 / 1920));
   height: calc(90vw * (24 / 1920));
}

.icon.heart.fas{
   color:red
}
.heart{
   transform-origin: center;
}
.heart.active img{
   animation: animateHeart .3s linear forwards;
}

@keyframes animateHeart{
   0%{transform:scale(.2);}
   40%{transform:scale(1.2);}
   100%{transform:scale(1);}
}
</style>
</head>
<body>

<%
   String rstName = vo.getRst_name();

%>

<nav class="navbar navbar-expand-md navbar-light bg-light">
<!--   <a class="navbar-brand" href="#">네비게이션 로고</a> -->
  <a class="navbar-brand" href="<%=request.getContextPath()%>/mainPage.jsp" id="bigtitle"><img src="images/로고c.png"alt="tablemate.png" id="logo"></a>
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
    MemberVO memVo = (MemberVO) session.getAttribute("loginMember");
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



<div id="main">

   <div id="mainhome" class="container p-3 my-3 border" style="width: 700px; height: 650px;">
   </div>

   <div id="menu-etc" class="container p-3 my-3 border" style="width: 700px;">
   </div>

   <div id="menu" class="container p-3 my-3 border" style="width: 700px;">
   </div>

   <div id="photo2" class="container p-3 my-3 border" style="width: 700px;">
   </div>
   
<div class="button-wrapper">
     <a name="mapp"></a>
      <div id="mymap" style="width:700px;height:350px;"></div>   
   </div>
   
   <div style="width:100%;height:50px;"></div>



   <div class="button-wrapper">
   <button type="button" class="btn_area" id="reservationBtn" name="reservation" >예약하기</button>
   </div>

</div>
<%
String contextPath = request.getContextPath();
String rst_addr = ""; 
String rst_name = ""; 

%>



<!-- Client-side code -->
<script type="text/javascript">

   $(function(){
      rst_addr = '<%=rst_addr%>'; 
      rst_name = '<%=rst_name%>'; 

     $.ajax({
       url: '<%=contextPath%>/rstHome.do',
       type: 'get',
       data: {
         rst_id: rst_id,
       },
       success: function(res){
         rst_addr=res.rst_addr;
         rst_name=res.rst_name;
         geocodeAddress(rst_addr);
         globalRstName = rst_name;
       },
       error: function(xhr){
         alert("Status: " + xhr.status);
       },
       dataType: 'json'
     });
     

     function geocodeAddress(address) {
       var mapContainer = document.getElementById('mymap'),
           mapOption = {
             center: new kakao.maps.LatLng(33.450701, 126.570667),
             level: 3
           };
       var map = new kakao.maps.Map(mapContainer, mapOption);
       var geocoder = new kakao.maps.services.Geocoder();

       geocoder.addressSearch(address, function(result, status) {
         if (status === kakao.maps.services.Status.OK) {
           var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
           var marker = new kakao.maps.Marker({
             map: map,
             position: coords
           });
           var infowindow = new kakao.maps.InfoWindow({
             content: '<div style="width:150px;text-align:center;padding:6px 0;">'+globalRstName+'</div>'
           });
           infowindow.open(map, marker);
           map.setCenter(coords);
         }
       });
     }
   });


</script>




<style>
/* 스타일 추가 */
body {
   font-family: 'IBM Plex Sans KR', sans-serif;
}

.radio-button {
   display: none;
   flex-wrap: wrap;
}

.radio-button+label {
   display: inline-block;
   padding: 0.5em 1em;
   border: 1px solid #ccc;
   background-color: #f1f1f1;
   border-radius: 20px; /* 버튼 모서리를 둥글게 만듭니다. */
   margin-right: 10px; /* 버튼 간격을 좀 더 벌립니다. */
   margin-bottom: 10px; /* 아래로 내려가는 간격 설정 */
   cursor: pointer;
}

.radio-button:checked+label {
   background-color: #4CAF50;
   color: white;
}

input[type="date"] {
   -webkit-appearance: none;
   -moz-appearance: none;
   appearance: none;
   border: none;
   background-color: transparent;
   font-family: inherit;
   font-size: inherit;
   color: inherit;
   cursor: pointer;
}

/* 커스텀 스타일 적용 */
input[type="date"]::-webkit-calendar-picker-indicator {
   background-color: #ffffff;
   background-image:
      url('https://cdn3.iconfinder.com/data/icons/fatcow/32x32/date.png');
   background-size: 16px 16px;
   background-repeat: no-repeat;
   background-position: center;
   width: 24px;
   height: 24px;
   border-radius: 50%;
   cursor: pointer;
}

.reservLabel {
   font-weight: bold;
   font-size: 1.1em;
}

input[type="number"] {
   -moz-appearance: textfield; /* Firefox에서 기본 스타일 적용 방지 */
   appearance: none; /* 기본 스타일 적용 방지 */
   border: 1px solid #ccc; /* 테두리 설정 */
   padding: 5px 10px; /* 내부 여백 설정 */
   border-radius: 5px; /* 둥근 모서리 설정 */
   font-size: 16px; /* 폰트 크기 설정 */
   outline: none; /* 포커스 시 생기는 외곽선 제거 */
   width: 150px; /* 너비 설정 */
   text-align: center;
}

#menuSelectBody {
   display: none;
   overflow: auto;
}

.mpt {
   border: 1px solid gray;
   border-radius: 10px;
   padding: 8px;
   box-shadow: 10px 5px 5px gray;
}

.checkbox-button {
   display: inline-block;
   padding: 0.5em 1em;
   border: 1px solid #ccc;
   border-radius: 4px;
   background-color: #fff;
   font-size: 16px;
   color: #333;
   text-align: center;
   text-decoration: none;
   cursor: pointer;
}

.checkbox-button input[type="checkbox"] {
   display: none;
}

.checkbox-button input[type="checkbox"]:checked+label {
   background-color: #4CAF50;
   color: #fff;
}

#rst-info {
   padding: 20px;
}

#rst-info h4 {
   font-weight: bold;
}

#rst-img {
   width: 100%;
   height: 100%;
   object-fit: cover;
}

#subMain {
   display: flex;
   flex-direction: inherit;
   margin-top: 40px;
}

.addiqr {
   display: flex;
   justify-content: center;
   width: 100%;
   height: 35px;
   border: 1px solid #dee2e6;
   padding: 0;
   border-radius: 8px;
   font-weight: 500;
   color: #333;
   background: white;
   text-align: center;
   margin-right: 10px;
}

#addiqr2 {
   border: none;
   background: none;
}

.addiqr:hover {
   text-decoration: none;
}

button, input, optgroup, select, textarea {
   width: 100%;
}

#send {
   padding: 10px 20px;
   font-size: 16px;
   font-weight: bold;
   text-align: center;
   text-decoration: none;
   background-color: #ffffff;
   color: #ff3d00;
   border: 1px solid #ff3d00;
   border-radius: 5px;
   transition: background-color 0.3s ease;
   cursor: pointer;
   height: 30px;
   line-height: 10px;
}
.btnclose {
   background-color: red;
   font-size: 16px;
   font-weight: bold;
   border: none;
   width: 15%;
}

.nav-link, .nav-link a {
   color: #666;
}
.nav-link:hover {
   color: #666;
}
.nav-item li {
    width: 25%;
    text-align: center;
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
  width: 90px;
  height: 30px;
  display: inline-flex;
  flex-direction: column;
  align-items: center; /* 가로 - 중앙으로 */
  justify-content: center;
}
#mclose{
   margin-right: 5px;
}
.dropdown-menu {
  width: 200px;
  text-align: center;
}
</style>
    <script>
    rsCount = 0;
    sendData = {};
    $(document).ready(function(){
        // 오픈시간과 마감시간을 저장
        var openTime = "<%=vo.getOpnetme()%>";
        var closeTime = "<%=vo.getClosetime()%>";
        
        // 시간 데이터 형식으로 변환
        var openHour = parseInt(openTime.split(":")[0]);
        var closeHour = parseInt(closeTime.split(":")[0]);
        
        // 라디오 버튼 그룹 생성
        var radioGroup = $("<div>");
        
        // 현재 시간 구하기
        var now = new Date();
        var currentHour = now.getHours();
        var currentMinute = now.getMinutes();
        var formattedNow = now.toISOString().split("T")[0];
        
        // 데이트 인풋 값 변경 이벤트 핸들러
        $('#rdatetime').change(function() {
            // 선택한 날짜 구하기
            var selectedDate = new Date($(this).val());
            var selectedYear = selectedDate.getFullYear();
            var selectedMonth = selectedDate.getMonth() + 1;
            var selectedDay = selectedDate.getDate();
            
            // 라디오 버튼 그룹 초기화
            radioGroup.empty();
            
            // 시간 옵션 추가
            for (var i = openHour; i <= closeHour; i++) {
                for (var j = 0; j < 60; j += 30) {
                    // 시간과 분 데이터 형식으로 변환
                    var hour = i < 10 ? "0" + i : i;
                    var minute = j === 0 ? "00" : j;
                    if (i === closeHour && minute === 30) {
                        break;
                    }
                    
                    // 선택한 날짜와 시간을 조합하여 Date 객체 생성
                    var selectedDateTime = new Date(selectedYear, selectedMonth - 1, selectedDay, i, j);
                    
                    // 현재 시간 이전의 시간인 경우 비활성화
                    if (selectedDateTime <= now) {
                        continue;
                    }
                    
                    // 시간과 분을 조합하여 문자열로 생성
                    var timeString = hour + ":" + minute;
                    
                    // 라디오 버튼 생성
                    var radio = $("<input>").attr({
                        "type": "radio",
                        "name": "time",
                        "value": timeString,
                        "class": "radio-button",
                        "id": timeString.replace(":", "")
                    });
                    
                    // 라디오 버튼 레이블 생성
                    var label = $("<label>").attr({
                        "for": timeString.replace(":", ""),
                        "class": "radio-label"
                    }).text(timeString);
                    
                    // 라디오 버튼과 레이블을 라디오 그룹에 추가
                    radioGroup.append(radio).append(label);
                }
            }
            
            // 라디오 그룹을 페이지에 추가
            $("div#time-options").append(radioGroup);
        });
        $('div#time-options').find('#rdatetime').attr('min',formattedNow);
        // 오늘 날짜 기본 선택
        $('input#rdatetime').val(formattedNow).trigger('change');
    });

        $(function(){
              $.ajax({
                 url : '<%=request.getContextPath()%>/member/menu.do',
                 type : 'get',
                 data : {"rst_id" : rst_id},
                 success : function(res) {
                    console.log(res);
                    sMenuCode = "";
                    $.each(res,function(){
//                        <input type="checkbox" name="sMenuId"value="${this.menu_id}">
                       sMenuCode += `<p class="mpt">
                       ${this.menu_name}<br>${this.menu_price}
                       <input type="hidden" class="mmm" value="${this.menu_id}">
                       <input type="number" class="qqq" value="0" min="0">
                       </p>`;
                    })
                    $('#menuSelectBody').html(sMenuCode);
                 },
                 error : function(xhr) {
                    alert("Error : "+xhr.status)
                 },
                 dataType : 'json'
              })
           
           
           numCount = parseInt($('#numOfPeople').val());
            $('#reservationBtn').on('click',function(){
                $('#time-modal').modal('show');
            })
            
            $('#minusNum').on('click',function(){
               if(numCount>1){
                  numCount--;
               }
               addNumOfPeople(numCount);
            })
            
            $('#plusNum').on('click',function(){
               numCount++;
               addNumOfPeople(numCount);
            })
            
            
            $('#reservSend').on('click', function() {
               if ($(".radio-button:checked").length === 0) {
                     alert("시간을 선택해 주세요.");
                     return false;
                  }
               if(rsCount==1){
                  adata = $('#reservationForm').serializeJSON();
                  if(confirm(`날짜 : ${adata.rdatetime}일 ${adata.time}분 ${adata.numOfPeople}명 예약을 하시겠습니까?`)== false){
                     return false;
                  }
                  fdata =[];
                  
                  
                  console.log(fdata);
                  $.ajax({
                     url : '<%=request.getContextPath()%>/member/setReservation.do',
                     type : 'post',
                     data : adata,
                     success : function(res) {
                          $.each($('#reservationForm .qqq'), function(){
                             mm = $(this).prev().val();
                             aa   = $(this).val();
                             if(aa > 0) fdata.push({
                                "rm_qty" : aa,
                                "menu_id" :  mm,
                                "rst_id" : rst_id,
                                "rs_id" : res
                             })
                          })                     
                        console.log(fdata);
                          const jsonRs = JSON.stringify(fdata);
                          $.ajax({
                             url : '<%=request.getContextPath()%>/member/setReservMenu.do',
                             type : 'post',
                             data : {"jdata" : jsonRs},
                             success : function(res) {
                                if(res.flag==1){
                                   alert("예약이 완료됬습니다.");
                                }
                                $('#time-modal').modal('hide');
                             },
                             error : function(xhr) {
                                alert("Error : "+xhr.status)
                             },
                             dataType : 'json'
                          })
                     },
                     error : function(xhr) {
                        alert("Error : "+xhr.status)
                     },
                     dataType : 'json'
                  })
               }else {
               
            
               rsCount++;
                 // 1번째 div가 서서히 사라지는 애니메이션 적용
                 $('#time-options').fadeOut(200, function() {
                   // 1번째 div가 사라진 후 2번째 div가 서서히 나타나는 애니메이션 적용
                   $('#menuSelectBody').fadeIn(200);
                   
                   $('#reservSend').text('예약하기');
//                    $('#reservSend').removeClass("btn-secondary").addClass("btn-primary");
                   
                 });
               }
               });
            
            $('#time-modal').on('hidden.bs.modal', function (e) {
                 rsCount = 0;
                 $('#time-options').show();
                 $('#menuSelectBody').hide();
            });
            
            
            
        })
        function addNumOfPeople(data) {
         $('#numOfPeople').val(data);
      }
        
    </script>

<!-- 문의사항 모달 -->

<!-- 글쓰기 The Modal -->
<div class="modal" id="wModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">식당 문의</h4>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form name="wform" id="wform" action="">
           <label>작성자</label>
           <input type="text" class="txt" name="writer" value="<%=memVo.getMem_id()%>"><br>
           
           <label>문의할 식당</label>
           <input type="text" class="txt" name="rstname" value="<%=vo.getRst_name()%>" disabled><br>
           <input type="hidden" name="rstname" value="<%=vo.getRst_id()%>">
           
           <label>제목</label>
           <input type="text"  class="txt" name="subject"><br>
           
           <label>내용</label><br>
           <textarea rows="5" cols="40" class="txt"  name="content"></textarea>
           <br>
           <br>
           <input type="button" value="전송" id="send">
        </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
         <button type="button" class="btn btn-secondary btnclose" data-dismiss="modal">닫기</button>
      </div>

    </div>
  </div>
</div>





<div class="modal fade" id="time-modal" tabindex="-1" role="dialog" aria-labelledby="time-modal-label" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="time-modal-label" style="80%">예약 시간 선택</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="width: 30px;" id="mclose">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
               <form action="" id="reservationForm">
                   <div id="time-options">
                      <input type="hidden" name="mid" id="mmid" value="<%=memVo.getMem_id()%>">
                      <input type="hidden" name="rid" id="rrid" value="<%=vo.getRst_id()%>">
                       <label class="reservLabel">예약 인원 선택</label><br>
                       <i>
                          <img id="minusNum" src="<%=request.getContextPath()%>/images/free-icon-minus-2569198.png">
                       </i>
                       <input type="number" id="numOfPeople" name="numOfPeople" min="1" value="2">
                       <i>
                          <img id="plusNum" src="<%=request.getContextPath()%>/images/free-icon-add-189689.png">
                       </i>
                       
                       <br><br>
                       <label class="reservLabel">예약 날짜 선택</label><br>
                       <input type="date" id="rdatetime" name="rdatetime">
                       <br><br>
                       <label class="reservLabel">예약 시간 선택</label><br>
                   </div>
                   
                   <div id="menuSelectBody">
                   </div>
               </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btnTM3" id="reservSend">다음</button>
              <button type="button" class="btnTM3" data-dismiss="modal">닫기</button>
            </div>
          </div>
        </div>
      </div>
      
<!-- 찜하기 -->
 <script>
        //heart 좋아요 클릭시! 하트 뿅
$(function(){
	$(document).on('click','.icon.heart',function(){
		$(this).toggleClass('active');
		if($(this).hasClass('active')){
			$.addBookMark("<%=memVo.getMem_id()%>");
		       $(this).find('img').attr({
		          'src': 'https://cdn-icons-png.flaticon.com/512/803/803087.png',
		           alt:'찜하기 완료'
		            });
		     }else{
		    	 $.cancelBookMark("<%=memVo.getMem_id()%>");
		        $(this).find('i').removeClass('fas').addClass('far')
		       $(this).find('img').attr({
		          'src': 'https://cdn-icons-png.flaticon.com/512/812/812327.png',
		          alt:"찜하기"
		       })
		     }
	})
})
    </script>
</body>
</html>