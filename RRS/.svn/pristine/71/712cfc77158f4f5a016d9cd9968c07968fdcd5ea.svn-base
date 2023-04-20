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

        <!-- <script type="text/javascript" src="../js/jquery-3.6.4.min.js"></script> -->


<script type="text/javascript">
mypath = '<%=request.getContextPath()%>';

$(document).ready(function() {
   
   $.ajax({
      type : 'get',
      url : "<%=request.getContextPath()%>/admin/signCount.do",
      success : function(res) {
    	  $('#countBox1').html(res + "<span style='font-size:0.7em;'>건</span>");
      }      
   });
   
   
   $.ajax({
	      type : 'get',
	      url : "<%=request.getContextPath()%>/admin/MemberTotalCount.do",
	      success : function(res) {
	         $('#countBox2').html(res + "<span style='font-size:0.7em;'>명</span>");
	      }      
	   });
   
  
  $.ajax({
	      type : 'get',
	      url : "<%=request.getContextPath()%>/admin/rstTotalCount.do",
	      success : function(res) {
	         $('#countBox3').html(res + "<span style='font-size:0.7em;'>명");
	      }      
	   });	  

  $.ajax({
      type : 'get',
      url : "<%=request.getContextPath()%>/admin/BlacklistTotalCount.do",
      success : function(res) {
         $('#countBox4').html(res + "<span style='font-size:0.7em;'>명");
      }      
   });	
  
  
  
  $.ajax({
      url : "<%=request.getContextPath()%>/admin/restaurantInfo2.do",
      type : 'get',
      dataType : 'json',
      error: function(xhr) {
          alert("상태 : " + xhr.status);
      },  
      success: function(res) {

          // 데이터를 문자열로 변환한 후, 다시 객체로 변환
          var data = JSON.parse(JSON.stringify(res));

          code = "<table border='1' class='table table-hover'>"
          code += "<thead class='table-secondary'><tr><th id='rst'>식당ID</th><th>식당이름</th><th id='addr'>주소</th><th>전화번호</th><th id='category'>카테고리</th></tr></thead>"
          $.each(data, function(i, v){
              code += "<tr><td><a href='#' name='restaurant-link' class='restaurant-link' id='" + v.rst_id + "'>" + v.rst_id + "</a></td>";
              code += "<td>"+v.rst_name+"</td><td>"+v.rst_addr+"</td><td>"+v.rst_tel+"</td><td>"+v.rst_menu+"</td></tr>";
          //<td>"+v.rst_menu+"</td>
          });
          code += "</table>";

          $('#listBox1').html(code);
      }
  });
 
})



</script>



<style type="text/css">
.mt-4 { 
   text-align: center;
}

hr {
   width:64%;
   display: block;
   margin-top: 0.5em;
   margin-bottom: 1.0em;
   margin-left: auto;
   margin-right: auto;
   border-style: inset;
   border-width: 1px;
}
.signWrap {
   width: 100%;
   height: 300px;
   display: flex;
   justify-content: center;
}

ul {
   list-style: none;
   display: flex;
}

.signWrap {
   font-size: 1.5em;
   text-align: center;
}

.signWrap .signBox {
   width: 250PX;
   height: 150px;
   font-size: 16px;
   font-weight: bold;
   text-align: center;
   text-decoration: none;
   background-color: white;
   color: #666666;
   border:2px solid #f8f9fa;
   border-radius: 5px;
   box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
   transition: background-color 0.3s ease;
   margin-left:10px;
}

.signWrap .signTitle {
   width: 100%;
   height: 50px;
   background: #ffffff; 
   font-size: 1.2em;
   text-align: center;
   line-height: 50px;
   border-bottom: 2px solid #f8f9fa;
}

.signWrap .signContent {
   line-height: 100px;
   font-size: 1.5em;
   font-weight: bold;
}

.secondWrap {
   width: 100%;
   display: flex;
   justify-content: center;
   
}

.secondWrap .listBox {
   width: 100%;
   height: 650px;
   background: white;
   border: 1px solid black;

}
th {
	width: 200px;
}
#rst, #category{
	width:150px;
}
#addr {
	width:300px;
}
</style>
</head>
<body>

  <!-- Page content-->
   <div class="firstWrap">
      <!-- <h3 class="mt-4">결재대기</h1> -->
 	  <br><br><br>
      <div class="signWrap">
         <ul>
            <li class="signBox">
               <div class="signTitle">사업자 승인 대기</div>
               <div class="signContent" name="countBox1" id="countBox1">COUNT</div>
            </li>
            <li class="signBox">
               <div class="signTitle">현 회원 수</div>
               <div class="signContent" name="countBox2" id="countBox2">COUNT</div>
            </li>
            <li class="signBox">
               <div class="signTitle">현 사업자 수</div>
               <div class="signContent" name="countBox3" id="countBox3">COUNT</div>
            </li>
            <li class="signBox">
               <div class="signTitle">현 블랙리스트 수</div>
               <div class="signContent" name="countBox4" id="countBox4">COUNT</div>
            </li>
         </ul>
      </div>
   </div>
   
   <h3 class="mt-4" style="color: #666666;">사업자 리스트</h1>
   <hr>
   <div class="secondWrap">

      <ul>
         <li id="listBox1"></li>
      </ul>


   </div>

</body>
</html>