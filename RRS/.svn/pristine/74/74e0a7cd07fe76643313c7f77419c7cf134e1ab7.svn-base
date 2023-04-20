<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link href="css/styles.css" rel="stylesheet" />


<script>
$(function(){   
   
   $('#rvReportBtn').on('click', function() {
      $.ajax({
         url : "<%=request.getContextPath()%>/admin/rvreportList.do",
         type : 'get',
         dataType : 'json',
         error : function(xhr) {
            alert("상태 : " + xhr.status);
         },
         success : function(res) {
            code = "<table border='1' class='table table-striped'>"
            code += "<tr><td>신고번호</td><td>신고자</td><td>신고사유</td><td>받은사람</td><td>내용</td><td>날짜</td></tr>"
            $.each(res, function(i, v){
               code+= "<tr><td>"+v.rvr_id+"</td>"
               code+= "<td>"+v.reporter+"</td>"
               code+= "<td>"+v.rvr_reason+"</td>"
               code+= "<td>"+v.defendant+"</td>"               
               code+= "<td>"+v.rv_content+"</td>"
               code+= "<td>"+v.rvr_date+"<input type='button'  class='btn btn-primary' id="+v.rvr_id+" idx="+v.defendant+" name='rrBtn' value='삭제'></td></tr>"
            })
            code += "</table>"
            $('#Report-result').html(code);
         }
      })
   }) 
   
   
   
   $('#cmtReportBtn').on('click', function() {
      $.ajax({
         url : "<%=request.getContextPath()%>/admin/cmtReportList.do",
         type : 'get',
         dataType : 'json',
         error : function(xhr) {
            alert("상태 : " + xhr.status);

         },
         success : function(res) {
            code = "<table border='1' class='table table-striped'>"
               code += "<tr><td>신고번호</td><td>신고자</td><td>신고사유</td><td>받은사람</td><td>내용</td><td>날짜</td></tr>"
            $.each(res, function(i, v){
               code+= "<tr><td>"+v.cmtr_id+"</td>"
               code+= "<td>"+v.reporter+"</td>"
               code+= "<td>"+v.cmtr_reason+"</td>"
               code+= "<td>"+v.defendant+"</td>"
               code+= "<td>"+v.cmt_content+"</td>"
               code+= "<td>"+v.cmtr_date+"<input type='button'  class='btn btn-primary' id="+v.cmtr_id+" idx="+v.defendant+" name='crBtn' value='삭제'></td></tr>"
            })
            code += "</table>"
            $('#Report-result').html(code);
         }
      })
   }) 
   
   
   $('#ReportBtn').on('click', function() {
      $.ajax({
          url: "<%=request.getContextPath()%>/admin/reportListView.do",
          type: 'get',
          dataType: 'json',
          error: function(xhr) {
              alert("상태 : " + xhr.status);
          },
          success: function(res) {
              var cmt = res.cmt;
              var rv = res.rv;
              
              var code = "";
              code += "<table border='1' table class='table table-bordered'>";
            code += "<tr><td>신고번호</td><td>신고자</td><td>신고사유</td><td>받은사람</td><td>내용</td><td>날짜</td></tr>"
              $.each(cmt, function(i, v) {
               code+= "<tr><td>"+v.cmtr_id+"</td>"
               code+= "<td>"+v.reporter+"</td>"
               code+= "<td>"+v.cmtr_reason+"</td>"
               code+= "<td>"+v.defendant+"</td>"
               code+= "<td>"+v.cmt_content+"</td>"
               code+= "<td>"+v.cmtr_date+"<input type='button'  class='btn btn-primary' id="+v.cmtr_id+" idx="+v.defendant+" name='crBtn' value='삭제'></td></tr>"
              });
              code += "</table>";
                           
              var code2 = "";
              code2 += "<table border='1' table class='table table-bordered'>";
            code2 += "<tr><td>신고번호</td><td>신고자</td><td>신고사유</td><td>받은사람</td><td>내용</td><td>날짜</td></tr>"
   
              $.each(rv, function(i, v) {
               code2+= "<tr><td>"+v.rvr_id+"</td>"
               code2+= "<td>"+v.reporter+"</td>"
               code2+= "<td>"+v.rvr_reason+"</td>"
               code2+= "<td>"+v.defendant+"</td>"               
               code2+= "<td>"+v.rv_content+"</td>"
               code2+= "<td>"+v.rvr_date+"<input type='button'  class='btn btn-primary' id="+v.rvr_id+" idx="+v.defendant+" name='rrBtn' value='삭제'></td></tr>"
              });
              code2 += "</table>";
              $('#Report-result').html(code+code2);
          }
      });
   });
   
    
     $('#ReportBtn').click();
     
     
     
      $(document).on('click', 'input[name="crBtn"]', function() {
           var cmtr_id = $(this).attr('id');
           var defendant = $(this).attr('idx');
           var $tr = $(this).closest('tr');
           if (confirm("삭제하시겠습니까??")) {
           $.ajax({
             url: "<%=request.getContextPath()%>/admin/rnRelease.do",
             type: 'get',
             data: {
                rvr_id: cmtr_id,
                mem_id: defendant 
             },
             success: function(res) {
               if(res.flag=="okay"){
                  alert("삭제되었습니다.");
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
      

         // 블랙리스트 리뷰신고 반려버튼
      $(document).on('click', 'input[name="rrBtn"]', function() {
           var rvr_id = $(this).attr('id');
           var defendant = $(this).attr('idx');
           var $tr = $(this).closest('tr');

           if (confirm("삭제하시겠습니까??")) {
           $.ajax({
             url: "<%=request.getContextPath()%>/admin/rvrRelease.do",
             type: 'get',
             data: {
                rvr_id: rvr_id,
                mem_id: defendant 
             },
             success: function(res) {
               if(res.flag=="okay"){
                  alert("삭제되었습니다.");
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
      
     
})


</script>

<title>Insert title here</title>
</head>

<body>

<button class='btn btn-primary' id='ReportBtn' name='ReportBtn'>신고목록</button>
<button class='btn btn-primary' id='rvReportBtn' name='rvReportBtn'>리뷰신고목록</button>
<button class='btn btn-primary' id='cmtReportBtn' name='cmtReportBtn'>댓글신고목록</button>


<div id = "Report-result">
   <div class='Report-result' id='Report-result1'>
   
   </div>
   <div class='Report-result' id='Report-result2'>
   
   </div>
</div>

</body>
</html>