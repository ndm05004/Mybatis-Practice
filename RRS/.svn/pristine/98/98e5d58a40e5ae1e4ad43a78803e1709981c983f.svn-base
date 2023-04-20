<%@page import="rrs.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page isELIgnored="true" %>
<%
   String clickcont = request.getParameter("cont");
   MemberVO memVo = (MemberVO) session.getAttribute("loginMember");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Table Mate</title>
<link rel='shortcut icon' type='image/x-icon' href='../../images/로고.png' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400&display=swap" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.4.min.js"></script>


<script type="text/javascript">
num = 4;

function searchfu(cont, num){
    code = "";
     
   $.ajax({
      
      url : '<%=request.getContextPath()%>/SearchContent.do',
      data : {"content" : cont},
      dataType : 'json',
      async: false,
      success : function(res){
         if(res == 0){
            code += "<h3>검색 결과가 없습니다.</h3>";
         }else{
            code +="<div id='contain'>";
            code +="<ul>";
            $.each(res.list, function(i, v){
               console.log(res.mList);
            if(i < num){
               rstid = v.rst_id;
               memid = "<%=memVo.getMem_id()%>";
               var starNum = Math.floor(v.starcountavg);
               
               star = "";
               for(let j=0;j<starNum; j++){
                  star += "<span id='star'>★</span>"
               }
               
               if(i%2 == 0)code +="<li>";
               code +="<div id='contain2' onclick='rstdetail(\""+ rstid +"\")'>";
               code +="<img src='<%=request.getContextPath()%>/ImageView.do?Photo="+ v.rst_photo + "'>";
               code +="<div id='contain3'>";
                  code +="<div id='contain4'><p><label>가게 이름 :</label>"+ v.rst_name +"</p>";
                  
                  var bookMarkFlag = false;
                  $.each(res.mList, function(ii,vv){
                     if(v.rst_id == vv.rst_id){
                        bookMarkFlag = true;
                     }
                  });
                  
                  if(bookMarkFlag==true){
                   code += "<a id='bookmarkbtn' href='#' onclick='delbookmark(event, \""+ rstid +"\", \""+ memid +"\")'><img src='<%=request.getContextPath()%>/images/hart1.png'></a></div>";
                  }else{
                   code += "<a id='bookmarkbtn' href='#' onclick='bookmark(event, \""+ rstid +"\", \""+ memid +"\")'><img src='<%=request.getContextPath()%>/images/hart2.png'></a></div>";
                  }
                  
                  
                  code +="<div><p><label>가게 별점 :</label>"+ star +"</p></div>";
                  code +="<div><p><label>가게 주소</label><br><b>"+ v.rst_addr +"</b></p></div>";
               code +="</div>";
               code +="</div>";
               if(i%2 == 1)code +="</li>";
            }
         })
         code +="</ul><button id='morebtn'><b>+더보기</b></button></div>";
         }
         $('#searchResult').html(code);
         
         searchHeight = $('#searchResult').css('height');
         containHeight = $('#contain').css('height');
         
         if(searchHeight < containHeight){
            $('#searchResult').css('height', 'auto');
         }
      },
      error : function(xhr){
         alert("status :" + xhr.status);
      }
   })
}
function delbookmark(event, rstid, memid){
      event.stopPropagation();
      
      $.ajax({
         url : '<%=request.getContextPath()%>/Deletebook.do',
         type : 'get',
         data : {"rstid" : rstid, "memid" : memid},
         dataType : 'json',
         success : function(res){
            searchfu(cont, num);
         },
         error : function(xhr){
            alert("status :" + xhr.status);
         }
      })
}

function bookmark(event, rstid, memid){
   event.stopPropagation();
   
   $.ajax({
      url : '<%=request.getContextPath()%>/Insertbook.do',
      type : 'get',
      data : {"rstid" : rstid, "memid" : memid},
      dataType : 'json',
      success : function(res){
         searchfu(cont, num);
      },
      error : function(xhr){
         alert("status :" + xhr.status);
      }
   })
}


function rstdetail(rstid){
   window.location.href = "<%=request.getContextPath()%>/RstView.do?rst_id=" + rstid;
}

$(function(){
<%
   if(clickcont!=null){
%>
   cont = '<%=clickcont%>';
   searchfu( cont, num);
<%
   }
%>
   
   $('#searchContent').on('input', function(event){
        cont =  event.target.value;
        num = 4;
        $('#searchResult').html(''); // 검색어가 없을 때 검색 결과 지우기
        if (cont.length == 0) {
           $('#searchResult').css('height', '500px');
           return;
        }
        searchfu(cont, num);

    })
    
    $(document).on('click', '#morebtn', function(){
      num += 4;
      searchfu(cont, num);
   })
})
</script>

<style type="text/css">
body {
   font-family: 'IBM Plex Sans KR', sans-serif;
}
.searchHead{
display: flex;
justify-content: center;
align-items: center;
background-color: #f8f9fa;
}
#searchContent{
border : 0.5px solid gray;
border-radius: 10px;
background: #FAFAFA;
padding-left : 5px;
height: 30px;


}

#searchResult{
display: flex;
justify-content: center;
align-items: center;
flex-direction: column;
height:  500px;
flex-wrap: wrap;
justify-content: space-between;
background-color: #f8f9fa;
}

#contain{
display: flex;
justify-content: center;
flex-direction: column;
padding : 10px;
}

#contain ul{
padding-left: 0px;
}

#contain ul li{
list-style: none;
  display: flex;
  flex-direction: row;
  margin : 5px;
  padding-left : -10px;
}

#contain2{
display: flex;
align-items: center;
width: 500px;
height: 150px;
margin: 10px;
justify-content: flex-start;
border: 1px solid #ff3d00;
border-radius: 15px;

}

img{
width: 150px;
height: 100%;
border-radius: 30px;
}

label{
width: 100px;
}

#contain3{
display: flex;
flex-direction: column;
justify-content: center;
margin-left: 20px;
height: 100%;
width: 100%;
}

#contain4{
display: flex;
justify-content: space-between;
}

#contain4 a{
margin-right: 20px;
display: block;
}

#contain4 a img{
border-radius :0px;
width :30px;
height : 30px;
max-width: 100%;
}

#contain3 p{
margin: 0;
}

#morebtn{
text-align: center; 
margin: auto;
display: block;
width: 150px; 
height : 50px;
background-color: #ff3d00;
color: white;
border: none;
border-radius: 15px;
}
#morebtn:hover{
text-align: center; 
margin: auto;
display: block;
width: 150px; 
height : 50px;
background-color: white;
color:  #ff3d00;
border: 0.5px solid black;
border-radius: 15px;
border : 1px solid #ff3d0;
cursor: pointer;
}
#logo{
width : 180px;
height : 60px;
}

#star{
color: gold;
}
.dropdown-menu {
  width: 200px;
  text-align: center;
}
</style>

</head>
<body style="background: #f8f9fa;">
<nav class="navbar navbar-expand-md navbar-light bg-light">
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
   if(session.getAttribute("loginMember") == null) {
%>
      <li class="nav-item">
        <a class="nav-link" href="<%=request.getContextPath()%>/member/view/login.jsp">로그인</a>
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
         <span class="dropdown-item-text"><%=memVo.getMem_name()%>님 환영합니다!</span>
         <a class="dropdown-item" href="<%=request.getContextPath()%>/member/memMyPage.jsp">마이페이지</a>
         <a class="dropdown-item" href="<%=request.getContextPath()%>/memlogout.do">로그아웃</a>
       </div>
     </li>
<%
   }
%> 
    </ul>
  </div>
</nav>
<hr>

<div class="searchHead">
   <input type="text" id="searchContent" 
             placeholder=" 검색어를 입력하세요" name="searchContent" style="width: 250px;">
</div>


<div id="searchResult">
</div>

<hr>
<%@include file="../../footer.jsp"%>

</body>
</html>