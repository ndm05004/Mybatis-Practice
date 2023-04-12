<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
</head>
<!-- fullcalender -->
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@6.1.5/index.global.min.js'></script>
<script>
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
			/* plugins: [timeGridPlugin], */
			/* initialView: 'timeGridWeek', */
			/* headerToolbar: {
			    left: 'prev,next',
			    center: 'title',
			    right: 'timeGridWeek,timeGridDay' // user can switch between the two
			}, */
			events : [ {
				title : "지현이 누나 지각",
				start : "2023-04-12T10:00:00"
			}, {
				title : "요즘 너무 늦게 오시네요",
				start : "2023-04-12"
			}, {
				title : "누나 책상 왜이리 더러워요?",
				start : "2023-04-12"
			}, {
				title : "제발 됬으면좋겠다.4",
				start : "2023-04-12"
			} ]
		});
		calendar.render();
	});
</script>
<body>
	<div id="calendar"></div>
</body>
</html>
