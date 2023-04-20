/**
 * 
 */
$.cancelBookMark = function(mmid){
	$.ajax({
	url : `${mypath}/member/cancelBookMark.do`,
	type : 'post',
	data : {"rstid" : rst_id,
			"memid" : mmid},
	success : function(res) {
		console.log(res);
	},
	error : function(xhr) {
		alert("Error : "+xhr.status)
	},
	dataType : 'json'
})
}

$.addBookMark = function(mmid){
	$.ajax({
	url : `${mypath}/member/addBookMark.do`,
	type : 'post',
	data : {"rstid" : rst_id,
			"memid" : mmid},
	success : function(res) {
		console.log(res);
	},
	error : function(xhr) {
		alert("Error : "+xhr.status)
	},
	dataType : 'json'
})

}

 $.memInfo = function(info){
	 infodate = info.bir;
	 infodate = infodate.substring(0,10);
	 code = `
	 	<form id="form" action="${mypath}/modifyMem.do" method="post">
		<h2>내 정보</h2><hr>
		
		<table id="infotable">
			<tr>
				<td style="width: 130px;"><span class="infospan"> 아이디 </span></td>
				<td><span class="p1">${info.id}</span><span><input type="hidden" value="${info.id}" name="memid" readonly></span><br></td>
			</tr>
			<tr>
				<td><span class="infospan"> 비밀번호 </span></td>
				<td><span class="p1 cm">******</span><span><input type="hidden" value="${info.pass}"name="mempass" id="pwd"  class="canmod"></span><br></td>
			</tr>
			<tr>
				<td><span class="infospan"> 이름 </span></td>
				<td><span class="p1">${info.name}</span><span><input type="hidden" value="${info.name}"name="memname" readonly></span><br></td>
			</tr>
			<tr>
				<td><span class="infospan"> 닉네임 </span></td>
				<td><span class="p1 cm">${info.nick}</span><span><input type="hidden" value="${info.nick}"name="memnick" class="canmod"></span><br></td>
			</tr>
			<tr>
				<td><span class="infospan"> 생년월일 </span></td>
				<td><span class="p1">${infodate}</span><span><input type="hidden" value="${infodate}"name="membir" readonly></span><br></td>
			</tr>
			<tr>
				<td><span class="infospan"> 휴대폰 번호 </span></td>
				<td><span class="p1 cm">${info.tel}</span><span><input type="hidden" value="${info.tel}"name="memtel" class="canmod"></span><br></td>
			</tr>
			<tr>
				<td><span class="infospan"> E - Mail </span></td>
				<td><span class="p1 cm">${info.mail}</span><span><input type="hidden" value="${info.mail}"name="memmail" class="canmod"></span><br></td>
			</tr>
		</table>
		<hr><br>
		
		<table>
			<tr>
				<td style="width: 130px;">
					<br>
					<a href="javascript:void(0);" data-toggle="modal" data-target="#outModal">회원탈퇴 바로가기</a>
				</td>
				<td id="btnbtn2">
					<input type="button" value="수정" id="modify" class="btnTM" >
				</td>
			</tr>
		</table>
		
		
		
	</form>`;
	$('#selectMem').empty().html(code);
 }
 
 // 댓글 리스트 출력
 $.reviewList = function(m){
	 $.ajax({
		url: `${mypath}/memReplyList.do`,
		type: 'post',
		data: { "id": info.id, "more": m },
		success: function(res) {
//			alert("댓글리스트 출력 성공!");
			if(res == "") {
				rsvcode = `<h3>등록한 리뷰가 없습니다.</h3>`;
				$('#selectMem').empty().html(rsvcode);			
			} else {
			rcode = `<hr><table class="rtable">`;
			$.each(res,function(i,v){
				content = v.rv_content;
				content = content.replaceAll(/\n/g,"<br>");
				vidx = v.rv_id;
				
				sc = v.rv_sc;
				sc1 = "";
				for(let i=1; i<=sc; i++) {
					sc1 += "★";
				}
				rcode += `<tr class="replyBody">
						      <td>
						      	  <img id="reviewPic" src="${mypath}/rphotoPrint.do?reviewId=${v.rv_photo}">
						      </td>
						      
						      <td id=rvcont class="replyContent">
						      	  <p id="pbutton"><span id="star">${sc1}&nbsp;&nbsp;</span>작성일 : ${v.rv_date}
						 			  <input type="button" class="action btnTM btnTM3" idx = '${v.rv_id}' name = "r_modify" value="수정">
						 			  <input type="button" class="action btnTM btnTM3" idx = '${v.rv_id}' name = "r_delete" value="삭제">
						 		  </p>	
						 		  <span class="rcontent">${content}</span>
						      </td>
						  </tr>`
			})
			rcode += `</table><hr>`
			$('#selectMem').empty().html(rcode);
			}
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
				alert("해당 리뷰가 삭제되었습니다");
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
//				alert("댓글 수정성공");
				
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
//				alert("회원탈퇴가 정상적으로 완료되었습니다. 이용해주셔서 감사합니다.")
				alert("중급 프로젝트 끝!!!!!!!!\n안녕!!!!!!!!\n(최프때만나요)")
				
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
				rsvcode = `<h3>예약정보가 없습니다.</h3>`;
				$('#selectMem').empty().html(rsvcode);			
			} else {
//				alert(res);
				
				rsvcode = "";
				rsvcode += `<h2>예약정보 리스트</h2><hr>`;
				rsvcode += `<div id="accordion">`;
				$.each(res,function(i, v){
					rs_id = v.rs_id;
					
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
									 rsvcode += `<button type="button" class="action rsvbtn btnTM btn-sm" idx = '${v.rs_id}' name = "rsvDel">예약취소</button>`
//									 			 <button type="button" class="action rsvbtn btn btn-primary btn-sm" idx = '${v.rs_id}' name = "rsvUpdate">수정하기</button>`
									  
								  } else {
					 				 rsvcode += `<button type="button" class="rsreview rsvbtn btnTM btn-sm" data-toggle="modal" data-target="#reviewModal" rsid="${v.rs_id}">리뷰달기</button>`;
					 
								  }
					 rsvcode += `</div></div><hr>`;
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
 
  $.memIprList = function(info, cont){
   $.ajax({
      url : `${mypath}/IqrList.do`,
      type : 'post',
      data : {"id" : info.id},
      success : function(res){
         icode = "";
         icode += "<table class='table table-striped'><thead class='thead-dark'>";
         icode += "<tr><th style='width: 120px;text-align: center;'>게시글번호</th><th style='width: 120px;text-align: center;'>문의글번호</th>";
         icode += "<th style='width: auto;text-align: center;'>제목</th><th style='width: 120px;text-align: center;'>작성자</th>";
         icode += "<th style='width: 200px;text-align: center;'>작성일</th></tr></thead><tbody>";
         
         if(res.length == 0){
               icode += "<tr><td colspan='5' style='text-align: center;'>글이 존재하지 않습니다.</td></tr>";
         }else{
            $.each(res, function(i, v){
               if(i < cont){
                  icode += "<tr><td style='text-align: center;'>"+(res.length-i)+"</td>";
                  icode += "<td style='text-align: center;'>"+v.iqr_id+"</td>";
                  icode += "<td><a id='atitle' href='"+mypath+"/IqrView.do?id="+v.iqr_id+"'>"+v.iqr_title+"</a></td>";
                  icode += "<td>"+v.mem_id+"</td>";
                  icode += "<td style='text-align: center;'>"+v.iqr_date.substring(0, 10)+"</td></tr>";
               }
            })
         }
         icode += "</tbody></table>";
         icode += "<button id='more' class='btnTM'>더보기</button>";
         
         $('#selectMem').empty().html(icode);
      },
      error : function(xhr){
         alert("상태 : " + xhr.status);
      },
      dataType : 'json'
   })
   
}
 
 $.reviewInsert = function(){
	 $.ajax({
		url: `${mypath}/reviewInsert.do`,
		type: 'post',
		data: { "id": info.id, "rsid": rs_id },
		success: function(res) {
			alert(res.flag);
			
		},
		error: function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	})
 }

 $.bookmarkList = function(){
	 $.ajax({
		url: `${mypath}/bookmarkList.do`,
		type: 'get',
		data: { "id": info.id },
		success: function(res) {
//			alert("성공");
			if(res == "") {
				rsvcode = `<h3>찜한 가게가 없습니다.</h3>`;
				$('#selectMem').empty().html(rsvcode);			
			} else {
			bcode = "";
			$.each(res,function(i,v){
				bcode += `
					<div class="card bookcard" style="width:300px">
				      <img class="card-img-top bookimg" src="${mypath}/rphotoPrint.do?reviewId=${v.rst_photo}" alt="Card image" style="width:100%">
				      <div class="card-body">
				        <h4 class="card-title">${v.rst_name}</h4>
				        <p class="card-text">평균별점: ${v.starcountavg}</p>
				        <p class="card-text">${v.rst_info}</p>
				        <a href="${mypath}/RstView.do?rst_id=${v.rst_id}" class="bookbtn btnTM btnTM2">가게정보보기</a>
				      </div>
				    </div>`;
				
			})
				$('#selectMem').empty().html(bcode);
			}
		},
		error: function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	})
 }
 
 $.reservationDelete = function(){
	 $.ajax({
		url: `${mypath}/rsvDelete.do`,
		type: 'get',
		data: { "rsid": vidx },
		success: function(res) {
			alert("예약이 취소되었습니다.");
			$.memRsvList(info);
			
			
		},
		error: function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType: 'json'
	})
 }
