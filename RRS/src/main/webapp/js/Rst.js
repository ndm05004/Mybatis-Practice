/**
 * 
 */
function inputAddress() {
	new daum.Postcode({
		oncomplete: function(data) {
			var addr = data.address; // 최종 주소 변수

			// 주소 정보를 해당 필드에 넣는다.
			document.getElementById("add1").value = addr;
			// 주소로 상세 정보를 검색
		}
	}).open();
}
$.modifyCmt = function(resId){
	
	$.ajax({
		url : `${mypath}/modifyCmt.do`,
		type : 'get',
		data : {"no"  : rstcmtNo,
				"new" : newcont
				},
		success : function(res){
			alert("성공");
			if(res.flag =="1"){
				$('#modcont').val("");
				$('#mreplyModal').modal('hide');
				$.reviewAll(resId);
			}
			
		},
		error : function(xhr){
			alert("상태: "+xhr.status);
			
		},
		dataType : 'json'
		
		
	})
	
}
$.deleteCmt = function(resId,rvid){
	$.ajax({
		url : `${mypath}/deleteCmt.do`,
		type: 'get',
		data : {"no" : rstcmtNo},
		success : function(res){
//			alert(res.flag);
			$.reviewAll(resId);
		},
		error : function(xhr){
			
		},
		dataType : 'json'
		
	})
}
$.selectRst=function(resId){
	$.ajax({
		url : `${mypath}/selectRst.do`,
		type : 'get',
		data : {"id": resId},
		success :function(res){
			tag = "";
			$.each(res.tag,function(i,v){
				tag += " #" + v.tag_name;
			})
			nm = res.rst_name;
			console.log(res);
			code = `<fieldset> <legend style="font-weight:bold"> ${home}</legend><br><p id="fileimg"></p>`
			code += `<img id="rstphoto" src="<%=request.getContextPath()%>/rstimg.do?photo=${res.rst.rst_photo}"> <br>`
			code += `<label> 상호명 </label><p class="p1">${res.rst.rst_name}</p><p><input type="hidden" value="${res.rst.rst_name}"name="rstname" readonly></p>`;
			code += `<label> 사업장 주소 </label> <p class="p1"> ${res.rst.rst_addr}</p><p><input type="hidden" value="${res.rst.rst_addr}"name="rstaddr" style="width:500px;"></p>`;
			code += `<label> 사업자 ID </label> <p class="p1"> ${res.rst.rst_id}</p><p><input type="hidden" value="${res.rst.rst_id}"name="rstid" readonly></p>`;
			code += `<label> 사업자 비밀번호 </label> <p class="p1">******</p><p><input type="hidden" value="${res.rst.rst_pass}"name="rstpass" id="pwd"></p>`;
			code += `<label> 사업자번호 </label>  <p class="p1">${res.rst.bs_num}</p><p><input type="hidden" value="${res.rst.bs_num}"name="rstnum" readonly></p>`;
			code += `<label> 사업자 연락처 </label>  <p class="p1">${res.rst.rst_tel}</p><p><input type="hidden" value="${res.rst.rst_tel}"name="rsttel" ></p>`;
			code += `<label> 사업장 설명 </label> <p class="p1"> ${res.rst.rst_info}</p><p><input type="hidden" value="${res.rst.rst_info}"name="rstinfo" ></p>`;
			code += `<label> E - Mail </label> <p class="p1"> ${res.rst.rst_mail}</p><p><input type="hidden" value="${res.rst.rst_mail}"name="rstmail" ></p>`;
			code += `<label> 휴무일 설정 </label>  <p class="p1">${res.rst.closedday}</p><p><input type="hidden" value="${res.rst.closedday}"name="rstclose" ></p>`;
			code += `<label> OPEN TIME </label> <p class="p1">${res.rst.opnetme}</p><p><input type="hidden" value="${res.rst.opnetme}"name="restopen" ></p>`;
			code += `<label> CLOSE TIME </label> <p class="p1"> ${res.rst.closetime}</p><p><input type="hidden" value="${res.rst.closetime}"name="restcltime" ></p>`;
			code += `<label> 카테고리 </label>  <p class="p1">${res.rst.ctg_id}</p><p><input type="hidden" value="${res.rst.ctg_id}"name="rstctg" ></p>`;
			code += `<label> 태그 </label>  <p class="p1">${tag}</p><p><input type="hidden" value="${tag}"name="rsttag" ></p>`;
			code += `</fieldset>`;
			$('#form').html(code);
			$('#title').html(res.rst.rst_name);
		},
		error : function(xhr){
			alert("상태 : "+xhr.status)
		},
		dataType: 'json'
	})// 회원정보 출력 끝
	
$.reviewAll	= function(resId){
	$.ajax({
		url : `${mypath}/reviewAll.do`,
		type : 'get',
		data : {"id":resId},
		success : function(res){
			console.log(res);
			code2 = "";
			$.each(res.rv,function(i,v){
			code2 += `<div class="review">`
			code2 += `<div id="replybd"><p>작성자 : ${v.mem_id}</p>`;
			code2 += `<input type="hidden" id="rv${i}" value="${v.rv_id}">`;
			code2 += `<p>작성일 : ${v.rv_date}</p>`;
			code2 += `<p id="rpconten">${v.rv_content}</p>`;
			code2 += `<div id="owncmt">`
			$.each(v.rstcmtlist,function(ii,vv){
				code2 += `<p class="owncmt" style="font-weight:bold; font-size:0.8em;"> 사장님 한마디<span href="" class="delCmt" style="margin-left: 210px;">삭제하기</span><span>&nbsp|&nbsp</span>`
				code2 += `<span href="" class="modCmt" data-toggle="modal" data-target="#mreplyModal">수정하기</span>`
				code2 += `</p>`;
				code2 += `<p class="pcont" id="${vv.rcmt_id}">${vv.rcmt_content}</p>`;
			})
			code2 += `</div>`;
			code2 += `</div>`
			code2 += `<div id='bttn'><a href="" class="rvreply" data-toggle="modal" data-target="#replyModal">댓글달기</a><span>&nbsp|&nbsp</span>`
			code2 += `<a href=""class="rvreport" data-toggle="modal" data-target="#repxortModal">신고하기</a></div>`
			code2 += `</div>`
			code2 += `<br>`
		})
//			console.log(code2);
			$('#form').html(code2);
		},
		error: function(xhr){
			alert("상태: "+xhr.status);
		},
		dataType: 'json'
	})
}

//리뷰에 댓글달기
$.setReply = function(resId){
	$.ajax({
		url : `${mypath}/reviewCom.do`,
		type : 'post',
		data : {"id":resId,
				"rvid" : rvid,
				"rvcmt" : cmtta},
		success : function(res){
			if(res.flag==1){
				$('#cmtta').val("");
				$('#replyModal').modal('hide');
				$('#replybd').append(cmtta);
				$.reviewAll(resId);
			}
			else{
				alert("실패");
			}
		},
		error: function(xhr){
			alert("상태: "+xhr.status);
		},
		dataType: 'json'
	})
	
	
}

//리뷰 신고하기
$.reportReview = function(resId){
	$.ajax({
		url : `${mypath}/reviewReport.do`,
		type : 'post',
		data : {"id":resId,
				"rvid" : rvid2,
				"rss" : rss,
				"rs" : rs },
		success : function(res){
			if(res.flag==1){
				alert("접수되었습니다.\n신고는 관리자 검토 후 처리됩니다.")
				$('#reportRs').val("");
				$('#reportModal').modal('hide');
				$.reviewAll(resId);
			}
			else{
				alert("실패");
			}
		},
		error: function(xhr){
			alert("상태: "+xhr.status);
		},
		dataType: 'json'
	})
	
	
}
	
}