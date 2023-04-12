<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@6.1.5/index.global.min.js'></script>
    <script src="../js/jquery-3.6.4.min.js"></script>
<link href='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css' rel='stylesheet' />
    <script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js'></script>
<style type="text/css">
body{
	padding: 30px;
}
table {
	border: 3px solid gray;
	text-align: center;
	margin: auto;
}
.reservList table tr:first-child {
	background-color: lightblue;
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
	font-weight: bold;
}
</style>
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		contentHeight: 600,
		headerToolbar : {
			left : 'prevYear,prev,next,nextYear today',
			center : 'title',
			right : 'dayGridMonth,dayGridWeek,dayGridDay'
		},
		selectable : true,
		selectMirror : true,
		initialView : 'dayGridMonth',
		events : [ 
			$.ajax({
				url : '<%=request.getContextPath()%>/ScheduleInfo.do',
				type : 'get',
				data : {"id" : "bs001"},
				success : function(res) {
					if(res.flag =="ok"){
						// 예약 정보 rdata에 저장 
						rdata = res.datas;
//	 					alert(res.flag);
						console.log(res.datas);	
						code ="<table border='1'>";
						code +="<tr><td>예약 번호</td><td>예약 시간</td><td>회원 아이디</td><td>예약 인원</td></tr>";
						$.each(res.datas,function(){
							code +=`<tr>`;
							code += `<td class="rid">${this.title}</td>`;
							code += `<td>${this.start}</td>`;
							code += `<td>${this.member}</td>`;
							code += `<td>${this.numofpeople}</td>`;
							code +=`</tr>`;
							calendar.addEvent({
					              title: this.title,
					              start: this.start
					        })
						})	
						code +="</table>";
						$('.reservList').html(code);
						
					}
				},
				error : function(xhr) {
					alert("Error : "+xhr.status)
				},
					dataType : 'json'
			})
		]
	});
	calendar.render();
});
$(function() {
	$(document).on('click','.rid',function(){
		rid = $(this).text().trim();
		$('#rdModal').modal('show');
		$.ajax({
		url : '<%=request.getContextPath()%>/reservationDetail.do',
		type : 'get',
		data : {"id" : rid},
		success : function(res) {
			console.log(res);
			alert("성공~")
		},
		error : function(xhr) {
			alert("Error : "+xhr.status)
		},
		dataType : 'json'
		})
	})
})
</script>
</head>
<body>
 	<div id='calendar'></div>
	<div class="reservList"></div>
	
	
	<!-- The Modal -->
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
       <label>예약 번호 :</label><p id="rp1"></p>
       <label>예약자 성함 :</label><p id="rp2"></p>
       <label>예약자 연락처 :</label><p id="rp3"></p>
       <label>방문 일자 :</label><p id="rp4"></p>
       <label>방문 인원 :</label><p id="rp5"></p>
       <label>예약 메뉴 :</label><p id="rp6"></p>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
</body>
</html>