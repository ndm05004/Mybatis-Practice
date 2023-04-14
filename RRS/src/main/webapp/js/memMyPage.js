/**
 * 
 */

 $.memInfo = function(info){
	 code = `
	 	<form id="form" action="${mypath}/modifyMem.do" method="post">
		<h1>내 정보</h1>
		<label> 아이디 </label>
		<p class="p1">${info.id}</p><p><input type="hidden" value="${info.id}" name="memid" readonly></p><br>
		<label> 비밀번호 </label>
		<p class="p1">******</p><p><input type="hidden" value="${info.pass}"name="mempass" id="pwd"></p><br>
		<label> 이름 </label>
		<p class="p1">${info.name}</p><p><input type="hidden" value="${info.name}"name="memname" readonly></p><br>
		<label> 닉네임 </label>
		<p class="p1">${info.nick}</p><p><input type="hidden" value="${info.nick}"name="memnick" readonly></p><br>
		<label> 생년월일 </label>
		<p class="p1">${info.bir}</p><p><input type="hidden" value="${info.bir}"name="membir" readonly></p><br>
		<label> 휴대폰 번호 </label>
		<p class="p1">${info.tel}</p><p><input type="hidden" value="${info.tel}"name="memtel" ></p><br>
		<label> E - Mail </label>
		<p class="p1">${info.mail}</p><p><input type="hidden" value="${info.mail}"name="memmail" ></p><br>
		
		<input type="button" value="수정" id="modify"  class="btn btn-outline-primary" ><br><br><br>
		<a href="javascript:void(0);" data-toggle="modal" data-target="#myModal">회원탈퇴 바로가기</a>
		
	</form>`;
	$('#selectMem').empty().html(code);
 }
 
 // 댓글 리스트 출력
 $.reviewList = function(info){
	 $.ajax({
		url: `${mypath}/memReplyList.do`,
		type: 'post',
		data: { "id": info.id },
		success: function(res) {
//			alert("댓글리스트 출력 성공!");
			
			rcode = "";
			$.each(res,function(i,v){
//				content = v.cont;
//				content = content.replaceAll(/\n/g,"<br>");
				vidx = v.rv_id;
				
				 rcode += `
				 <div class="replyBody">
				 	<img id="reviewPic" src="${mypath}/rphotoPrint.do?reviewId=${v.rv_photo}">
				 	
				 	<div id="replyContent">
				 		<p id="pbutton">작성일 : ${v.rv_date}
				 			<input type="button" class="action" idx = '${v.rv_id}' name = "r_modify" value="수정">
				 			<input type="button" class="action" idx = '${v.rv_id}' name = "r_delete" value="삭제">
				 		</p>	
				 		
				 		<p class="rcontent">${v.rv_content}</p>	
				 	</div>
				 </div>`
			})
				 $('#selectMem').empty().html(rcode);
		},
		error: function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	})
 }
 
 // 리뷰 삭제
 $.memReviewDelete = function(target){
	 $.ajax({
		url: `${mypath}/memReviewDelete.do`,
		type: 'get',
		data: { "renum": vidx },
		success: function(res) {
			if(res.flag == "ok") {
				alert("리뷰 삭제성공");
				$(target).parents('.replyBody').remove();
			}
		},
		error: function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	})
 }
 
 // 리뷰 수정
 $.replyUpdateServer = function(target){
	$.ajax({
		url: `${mypath}/reviewUpdate.do`,
		type: 'get',
		data: review, // review객체 - renum, cont 들어있다
		success: function(res) {
			if(res.flag == "ok") {
				alert("댓글 수정성공");
				
				$(vp3).html(modiout);
			}
		},
		error: function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	})
}
 
 $.memDelete = function(info){
	 $.ajax({
		url: `${mypath}/memDelete.do`,
		type: 'get',
		data: { "id": info.id },
		success: function(res) {
			if(res.flag == "OK") {
				alert("회원탈퇴가 정상적으로 완료되었습니다. 이용해주셔서 감사합니다.")
				window.location.href = `${mypath}/mainPage.jsp`;
			} else {
				alert(res.flag);
			}
		},
		error: function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	})
 }
 
 $.memRsvList = function(info){
	 $.ajax({
		url: `${mypath}/memRsvList.do`,
		type: 'post',
		data: { "id": info.id },
		success: function(res) {
			if(res == "") {
				rsvcode = `<h1>예약정보가 없습니다.</h1>`;
				$('#selectMem').empty().html(rsvcode);			
			} else {
//				alert(res);
				
				rsvcode = "";
				rsvcode += `<h1>예약정보 리스트</h1>`;
				rsvcode += `<div id="accordion">`;
				$.each(res,function(i, v){
					rdate = v.rs_time;
					r1 = rdate.substring(0,4);
					r2 = rdate.substring(4,6);
					r3 = rdate.substring(6,8);
					rdate = r1 + "-" + r2 + "-" + r3;
					
					vdate = v.rs_datetime;
					vdate = vdate.substring(0,10);
					
					now = new Date();
					year = now.getFullYear(); // 현재 연도 가져오기
					month = String(now.getMonth() + 1).padStart(2, '0'); // 현재 월 가져오기
					day = String(now.getDate()).padStart(2, '0'); // 현재 일 가져오기
					
					currentDate = `${year}-${month}-${day}`; // yyyy-mm-dd 형식으로 현재 날짜 저장
					
					if(vdate > currentDate) {
						vstate = "방문전";
					} else {
						vstate = "방문후";
					}
					rsvcode +=   `<div class="card">
						            <div class="card-header">
						              <a class="card-link" data-toggle="collapse" href="#collapse${v.rs_id}">
						                ${v.rst_name}
						              </a>
						              <span class="rsvtitle" style="font-weight:bold;">&nbsp;&nbsp;${vstate}</span>
						              <span class="rsvtitle">방문날짜: ${vdate}</span>
						            </div>
						            <div id="collapse${v.rs_id}" class="collapse" data-parent="#accordion">
						              <div class="card-body">
						              	
						              	<span>예약 번호:&nbsp;&nbsp;</span><span>${v.rs_id}</span><br>
						              	<span>예약자명:&nbsp;&nbsp;</span><span>${v.mem_name}</span><br>
						              	<span>예약 일자:&nbsp;&nbsp;</span><span>${rdate}</span><br>
						              	<span>방문 일자:&nbsp;&nbsp;</span><span>${vdate}</span><br>
						              	<span>방문 인원:&nbsp;&nbsp;</span><span>${v.rs_people}명</span><br>
						              	<span>가게 연락처:&nbsp;&nbsp;</span><span>${v.rst_tel}</span><br>
						              	<span>예약 메뉴:&nbsp;&nbsp;</span>`
						              	
						                $.each(v.menu_list, function(ii, vv){
											rsvcode += `<span>${vv.menu_name} : ${vv.rm_qty}개&nbsp;&nbsp;</span>`
										})
					 rsvcode += `</div>`
					 			 if(vstate == "방문전"){
									 rsvcode += `<input type="button" class="rsvbtn" value="예약취소" >
									 			 <input type="button" class="rsvbtn" value="수정하기" >`
									  
								  } else {
					 				 rsvcode += `<input type="button" class="rsvbtn" value="리뷰달기" >`;
					 
								  }
					 rsvcode += `</div></div>`;
				})
				rsvcode += `</div>`;
				$('#selectMem').empty().html(rsvcode);
			}	
		},
		error: function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	})
 }
