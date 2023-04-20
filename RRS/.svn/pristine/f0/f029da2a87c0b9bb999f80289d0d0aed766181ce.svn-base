/**
 * 
 */
$.getCategorys = function(){
	$.ajax({
		url : `${mypath}/getCategory.do`,
		type : 'get',
		success : function(res) {
			code ="";
			$.each(res, function () {
				console.log(res);
                // 옵션작성
                code +=`<option value='${this.ctg_id}'>${this.ctg_name}</option>`
            })
            $('#ctg').html(code);
			$('#ctg').trigger('change');
		},
		error : function(xhr) {
			alert("Error : "+xhr.status)
		},
		dataType : 'json'
	})
}

$.deleteMenu = function(){
	$.ajax({
					url : `${mypath}/deleteMenu.do`,
					type : 'post',
					data : mcon,
					success : function(res) {
						if(res.flag==1){
							alert("메뉴가 삭제 되었습니다.");
							$('#menuInfoModal').modal('hide');
							$.showMenus();
						}
					},
					error : function(xhr) {
						alert("Error : "+xhr.status);
					},
						dataType : 'json'
	})
}
$.showMenus = function(){
	$.ajax({
				url : `${mypath}/menuShow.do`,
				type : 'get',
				data : {"id" : resId},
				success : function(res) {
					console.log(res);
					code = "";
					let cardSize = res.length > 9 ? 2 : 3;
					$.each(res,function(){
						code +=`<div class="card col-md-${cardSize} px-2">
						    <img class="card-img-top" id="mig" src="${mypath}/menuImg.do?photo=${this.menu_photo}" alt="Card image" style="width:100%;">
						    <div class="card-body">
						      <h4 class="card-title">${this.menu_name}</h4>
						      <p class="card-text">가격 : ${this.menu_price}</p>
						      <button type="button" class="btn btn-primary minfo" value="${this.menu_id}">메뉴 정보</button>
						    </div>
						  </div>`;
					})
					$('.card-wrapper').html(code);
				},
				error : function(xhr) {
					alert("Error : "+xhr.status)
				},
				dataType : 'json'
	})	
}
 $.sendAnswer = function(){
    $.ajax({
       url : `${mypath}/sendAnswer.do`,
       type :'get',
       data : {"wid":writerId,
              "qcontent":qcontent,
              "rstid" :resId,
              "qno" : qno,
              "acontent" : acontent},
       success : function(res){
       },
       error:function(xhr){
          alert("실패:" + xhr.status )
          
       },
       dataType:'json'
    })
 }
 
$.mebuDetailInfo = function(){
	$.ajax({
				url : `${mypath}/menuShow.do`,
				type : 'post',
				data : mcon,
				success : function(res) {
					console.log(res);
					$('#menuInfoModal #menuImage').attr('src',`${mypath}/menuImg.do?photo=${res.menu_photo}`);
					$('#menuInfoModal #modName').val(res.menu_name);
					$('#menuInfoModal #modPrice').val(res.menu_price);
					$('#menuInfoModal #modDs').val(res.menu_ds);
					$('#menuInfoModal #menuDetailId').val(res.menu_id);
					$('#menuInfoModal #rstId').val(res.rst_id);
					$('#menuInfoModal').modal('show');
				},
				error : function(xhr) {
					alert("Error : "+xhr.status)
				},
				dataType : 'json'
			})
}
$.reloadReservation = function(){
	$.ajax({
			url : `${mypath}/ScheduleInfo.do`,
			type : 'get',
			data : {"id" : resId},
			success : function(res) {
				if(res.flag =="ok"){
					// 예약 정보 rdata에 저장 
					rdata = res.datas;
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
}
$.calendarEvent = function(){
	$.ajax({
			url : `${mypath}/ScheduleInfo.do`,
			type : 'get',
			data : {"id" : resId},
			success : function(res) {
				if(res.flag =="ok"){
					// 예약 정보 rdata에 저장 
					rdata = res.datas;
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
						addEventToCalendar({
								id : this.title,
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
}
$.deleteReservationServer = function(){
	$.ajax({
 	 			url : `${mypath}/reservCancel.do`,
 	 			type : 'get',
 	 			data : {"id" : whowantCancel},
 	 			success : function(res) {
 	 				if(res.flag==1){
 	 					alert("해당 예약이 삭제 되었습니다.");
 	 					$('#rdModal').modal('hide');
 	 					calendar.getEventById(whowantCancel).remove();
 	 					$.reloadReservation();
 	 				}
 	 			},
 	 			error : function(xhr) {
 	 				alert("Error : "+xhr.status)
 	 			},
 	 				dataType : 'json'
 	 })
}
$.showReservationDetailServer = function(){
	$.ajax({
			url : `${mypath}/reservationDetail.do`,
			type : 'get',
			data : {"id" : rid},
			success : function(res) {
				console.log("콘솔"+res);
				menus = "";
				$('#rp1').text(res[0].rs_id);
				$('#rp2').text(res[0].mem_name);
				$('#rp3').text(res[0].rst_tel);
				$('#rp4').text(res[0].rs_datetime);
				$('#rp5').text(res[0].rs_people);
				$.each(res,function(){
					menus +=`${this.rst_addr} `;
				})
				$('#rp6').html(menus);
			},
			error : function(xhr) {
				alert("Error : "+xhr.status)
			},
			dataType : 'json'
		})
}

$.showMenuListServer = function(){
	$.ajax({
				url : `${mypath}/menuShow.do`,
				type : 'get',
				data : {"id" : resId},
				success : function(res) {
					console.log(res);
					code = "";
					let cardSize = res.length > 9 ? 2 : 3;
					$.each(res,function(){
						code +=`<div class="card col-md-${cardSize} px-2">
						    <img class="card-img-top" src="<%=request.getContextPath()%>/menuImg.do?photo=${this.menu_photo}" alt="Card image" style="width:100%">
						    <div class="card-body">
						      <h4 class="card-title">${this.menu_name}</h4>
						      <p class="card-text">가격 : ${this.menu_price}</p>
						      <button type="button" class="btn btn-primary minfo" value="${this.menu_id}">메뉴 정보</button>
						    </div>
						  </div>`;
					})
					$('.card-wrapper').html(code);
				},
				error : function(xhr) {
					alert("Error : "+xhr.status)
				},
				dataType : 'json'
	})	
}

//위에 정재균이 한거입니다.
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
				$('#reviewShow').html('');
				more=0;
				$.reviewAll(more);
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
			$('#reviewShow').html('');
			more=0;
				$.reviewAll(more);
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
				tag += v.tag_name;
			})
			nm = res.rst_name;
			console.log(res);
			code = `<h1>내 가게 정보</h1> <fieldset> <legend style="font-weight:bold"></legend><br><p id="fileimg"></p>`
			code += `<img id="rstphoto" src="${mypath}/rstimg.do?photo=${res.rst.rst_photo}"> <br>`
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
			code += `<input type="button" value="수정" id="modify"  class="btnTM" >`;
			$('#form').html(code);
			$('#title').html(res.rst.rst_name);
		},
		error : function(xhr){
			alert("상태 : "+xhr.status)
		},
		dataType: 'json'
	})// 회원정보 출력 끝
		
}
	
$.reviewAll = function(m){
   $.ajax({
      url : `${mypath}/reviewAll.do`,
      type : 'get',
      data : {"id":resId,
              "more": m},
      success : function(res){
         code2 = "<h1>리뷰 관리</h1><br><table>";
         
         $.each(res.rv,function(i,v){
            sc = v.rv_sc;
            console.log(sc);
            sc1 = "";
            
            for(let i=0; i<sc;i++){
               sc1+= "★"
            }
      
            if(i%2==0) code2+="<tr style='vertical-align:top'>";
            code2 += "<td>";
            code2 += `<div class="review"style="margin-right:20px;">`
            code2 += `<div id="replybd"><p>작성자 : ${v.mem_nick}   <span class="star" style="font-size:1.5em;">${sc1}</span></p>`;
            code2 += `<input type="hidden" id="rv${i}" value="${v.rv_id}">`;
            code2 += `<p>작성일 : ${v.rv_date}</p>`;
            code2 += `<img src="${mypath}/rstimg.do?photo=${v.rv_photo}" style="width:200px; height:200px; "></p>`;
            code2 += `<p id="rpconten">${v.rv_content}</p>`;
            if(v.rstcmtlist.length > 0){
            code2 += `<div id="owncmt" >`
            $.each(v.rstcmtlist,function(ii,vv){
               code2 += `<p class="owncmt" style="font-weight:bold; font-size:0.8em;"> 사장님 한마디<span href="" class="delCmt" style="margin-left: 210px; cursor: pointer;">삭제하기</span><span>&nbsp|&nbsp</span>`
               code2 += `<span href="" class="modCmt" data-toggle="modal" data-target="#mreplyModal" style="cursor:pointer;">수정하기</span>`
               code2 += `</p>`;
               code2 += `<p class="pcont" id="${vv.rcmt_id}">${vv.rcmt_content}</p>`;
            })
            code2 += `</div>`;
            }
            code2 += `</div>`
            code2 += `<div id='bttn'><a href="" class="rvreply" data-toggle="modal" data-target="#replyModal">댓글달기</a><span>&nbsp|&nbsp</span>`
            code2 += `<a href=""class="rvreport" data-toggle="modal" data-target="#reportModal">신고하기</a></div>`
            code2 += `</div>`
            code2 += `<br>`
            code2 += "</td>";
            if(i%2==1) code2+="</tr>";
         
         
      })
      code2 += "</table>"
//         console.log(code2);
         $('#reviewShow').append(code2);
         
   
         
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
				$('#reviewShow').html('');
				more=0;
				$.reviewAll(more);
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
         if (res.flag == 1 || res.flag == 2 || res.flag== 3) {
				alert("접수되었습니다.\n신고는 관리자 검토 후 처리됩니다.")
				$('#reportRs').val("");
				$('#reportModal').modal('hide');
				$('#reviewShow').html('');
				more=0;
				$.reviewAll(more);
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


function hideReservation() {
	if($('#calendar').css('visibility')=='visible'){
		$('#calendar').css('visibility','hidden');
		$('.reservList').css('display','none');
	}
}
function setThumbnail(event){
	var reader = new FileReader();
	
	reader.onload = function(event){
		var img = document.createElement("img");
		img.setAttribute("src", event.target.result);
		img.setAttribute("class", "col-lg-6");
		document.querySelector("div#image_container").appendChild(img);
	};
	reader.readAsDataURL(event.target.files[0]);
}


function changeImage(event){
	  var reader = new FileReader();
	  var img = document.createElement('img'); // 수정된 부분
	  
	  reader.onload = function(event){
	    $('#menuImage').attr("src", event.target.result);
	    document.querySelector("div#image_container").appendChild(img);
	  };
	  reader.readAsDataURL(event.target.files[0]);
	}
	
function changeImage2(event){
	  var reader = new FileReader();
	  var img = document.createElement('img'); // 수정된 부분
	  
	  reader.onload = function(event){
	    $('#rstimgg').attr("src", event.target.result);
	    document.querySelector("div#image_container").appendChild(img);
	  };
	  reader.readAsDataURL(event.target.files[0]);
	}
	
	function hideMenuList() {
		$('.container').css('display','none');
	}
	
	function addEventToCalendar(event) {
	    if (calendar !== null) {
	        calendar.addEvent(event);
	    }
	}
