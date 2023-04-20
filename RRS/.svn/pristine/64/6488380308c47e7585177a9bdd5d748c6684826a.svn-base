<%@page import="rrs.vo.RestautantVO"%>
<%@page import="rrs.vo.ReservationVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="../js/Rst.js" type="text/javascript"></script>
<script type="text/javascript">
<%
RestautantVO vo = (RestautantVO)session.getAttribute("loginRst");
%>
mypath = "<%=request.getContextPath()%>";
content = `<%=vo.getRst_info()%>`;
let maxChecked = 5; // 최대 선택 가능한 체크박스 수
let checkedCount = 0; // 선택된 체크박스 수

	$(function() {
		$.getCategorys();
		$.ajax({
			url : '<%=request.getContextPath()%>/getTag.do',
			type : 'get',
			data : {"id" : "<%=vo.getRst_id()%>"},
			success : function(res) {
				console.log(res);
				code = "";
				
				
				$.each(res.tagList,function(i){
					 let checked = ''; // 체크박스가 체크되어야 하는지 확인하기 위한 변수
					  for (let j = 0; j < res.selectTag.length; j++) {
					    if (res.selectTag[j].tag_name == this.tag_name) {
					      checked = 'checked'; // selectTag에 포함된 태그이면 checked 속성 추가
					      checkedCount++;
					      break;
					    }
					  }
					code +=`<input type="checkbox" name="tagLt" value="${this.tag_id}" ${checked}>${this.tag_name}
						&nbsp; &nbsp;`;
					if(i%5==0 && i != 0){
						code +=`<br>`;
					}
				})
				$('#tagL').html(code);
				$('#info').val(content.trim());
			},
			error : function(xhr) {
				alert("Error : "+xhr.status)
			},
			dataType : 'json'
		})
		
		$('#tagL').on('click', 'input[type=checkbox]', function() {
			  if ($(this).prop('checked')) {
			    // 선택된 항목이 최대 선택 가능한 항목 수보다 많을 경우 체크 해제
			    if (checkedCount >= maxChecked) {
			      $(this).prop('checked', false);
			      alert(`최대 ${maxChecked}개까지 선택 가능합니다.`);
			      return;
			    }
			    checkedCount++;
			  } else {
			    checkedCount--;
			  }
			});
		
		$('#showpwd').on('click',function(){
			if($('#pass').prop('type') == 'password'){
				$('#pass').attr('type','text');
			}else if($('#pass').prop('type') == 'text'){
				$('#pass').attr('type','password');
			}
		})
		
		
	})
	function cancelChanges() {
		  window.close(); // 현재 창을 닫음
		}
	
</script>
<style type="text/css">
table {
	display :  block;
	border : 2px solid #ff3d00;
	margin : 10px;
	padding : 10px;
	border-radius: 15px;
	
}
table tr td:first-child{
	text-align: center;
	background: white;
/* 	background: rgba(10,10,10,0.2); */
	font-weight: bold;
	font-size: 0.8em;
	margin-right : 10px;
}
#saddr{
 display: inline-block;
 width : 100px;
 height: 30px;
  font-size: 16px;
  font-weight: bold;
  text-align: center;
  text-decoration: none;
  background-color: white;
  color: #ff3d00;
  border: 1px solid #ff3d00;
  border-radius: 5px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
  transition: background-color 0.3s ease;
  cursor : pointer;
  
}
input[type=submit],#cancel{
	  display: inline-block;
  padding: 10px 20px;
  font-size: 16px;
  font-weight: bold;
  text-align: center;
  text-decoration: none;
  background-color: white;
  color: #ff3d00;
  border: 1px solid #ff3d00;
  border-radius: 5px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
  transition: background-color 0.3s ease;
  cursor : pointer;
  
}

textarea {
	width: 100%;
	border-radius: 10px;
	background : #f8f9fa;
	border : 0px;
	padding-left: 10px;
padding-right: 10px;
}
input[type="text"], input[type="password"]{
border : 0px;
background: #f8f9fa;
width : 80%;
border-radius: 10px;
padding-left: 10px;
padding-right: 10px;

}
select{
	border : 0px;
}

select:hover{
	background: #f8f9fa;
	border : 0.5px solid  #ff3d00;
	border-radius: 10px;
}
</style>
</head>
<body>

<form action="<%=request.getContextPath()%>/updateRstInfo.do" method="post" enctype="multipart/form-data">
	<table>
		<tr style="height : 10px;">
		<div style="display: flex;">
			<img src="../images/로고c.png" style="width:120px; vertical-align: center;">
			<span style="font-size:30px; font-weight:bold;vertical-align: center; color:#ff3d00">정보변경</span>
		</div>
		</tr>
		<tr>
			<td>사업자<br>번호</td>

			<td>
				<input type="hidden" name="bsnum" value="<%=vo.getBs_num()%>">
				<input type="text" name="bsnum" value="<%=vo.getBs_num()%>" disabled>
			</td>
			<td rowspan="4" style="width: 300px;">
				<label for="menuFileInput">
        	 	<img id="rstimgg" src="<%=request.getContextPath()%>/rstimg.do?photo=<%=vo.getRst_photo()%>" style="width: 100%; height: auto;">
        	 </label>
        	 <input id="menuFileInput" type="file" style="display: none;" name="photo" onchange="changeImage2(event)">
			</td>
		</tr>
		<tr>
			<tr style="height : 10px;">
		</tr>
			<td>상호명</td>
			<td>
				<input type="text" name="name" id="name" value="<%=vo.getRst_name()%>" readonly>
			</td>
		</tr>
			<tr style="height : 10px;">
		</tr>
		<tr>
			<td>아이디</td>
			<td>
				<input type="hidden" name="id" value="<%=vo.getRst_id()%>">
				<input type="text" name="id" value="<%=vo.getRst_id()%>" disabled>
			</td>
		</tr>
			<tr style="height : 10px;">
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>
				<input type="password" name="pass" id="pass" value="<%=vo.getRst_pass()%>">
				<img src="<%=request.getContextPath()%>/images/free-icon-hide-2767146.png"  id="showpwd"/>
			</td>
		</tr>
			<tr style="height : 10px;">
		</tr>
		<tr>
			<td>연락처</td>
			<td colspan="2">
				<input type="text" name="tel" id="tel" value="<%=vo.getRst_tel()%>">
			</td>
		</tr>
			<tr style="height : 10px;">
		</tr>
		<tr>
			<td>주소</td>
			<td colspan="2">
				<input type="text" id="add1" name="add1" value="<%=vo.getRst_addr()%>" readonly>
				<input type="button" onclick="inputAddress()" value="주소 검색" id="saddr"><br>
				<input style="border:0px;"type="text" id="add2" name="add2" placeholder="상세주소를 입력해주세요.">
			</td>
		</tr>
			<tr style="height : 10px;">
		</tr>
		<tr>
			<td>이메일</td>
			<td colspan="2">
				<input type="text" name="mail" id="mail" value="<%=vo.getRst_mail()%>">
			</td>
		</tr>
		
		<tr style="height : 10px;">
		</tr>
		
		<tr>
			<td>휴무일</td>
			<td colspan="2">
				<select name="holiday">
					<option value="월요일">월요일</option>
					<option value="화요일">화요일</option>
					<option value="수요일">수요일</option>
					<option value="목요일">목요일</option>
					<option value="금요일">금요일</option>
					<option value="토요일">토요일</option>
					<option value="일요일">일요일</option>
				</select>
			</td>
		</tr>
			<tr style="height : 10px;">
		</tr>
		<tr>
			<td>영업시간</td>
			<td colspan="2">
				<select name="opentime" id="opentime">
					<option value="00:00">00:00</option>
					<option value="01:00">01:00</option>
					<option value="02:00">02:00</option>
					<option value="03:00">03:00</option>
					<option value="04:00">04:00</option>
					<option value="05:00">05:00</option>
					<option value="06:00">06:00</option>
					<option value="07:00">07:00</option>
					<option value="08:00">08:00</option>
					<option value="09:00">09:00</option>
					<option value="10:00">10:00</option>
					<option value="11:00">11:00</option>
					<option value="12:00">12:00</option>
					<option value="13:00">13:00</option>
					<option value="14:00">14:00</option>
					<option value="15:00">15:00</option>
					<option value="16:00">16:00</option>
					<option value="17:00">17:00</option>
					<option value="18:00">18:00</option>
					<option value="19:00">19:00</option>
					<option value="20:00">20:00</option>
					<option value="21:00">21:00</option>
					<option value="22:00">22:00</option>
					<option value="23:00">23:00</option>
				</select>
				 - 
				 <select name="closetime" id="closetime">
				    <option value="00:00">00:00</option>
					<option value="01:00">01:00</option>
					<option value="02:00">02:00</option>
					<option value="03:00">03:00</option>
					<option value="04:00">04:00</option>
					<option value="05:00">05:00</option>
					<option value="06:00">06:00</option>
					<option value="07:00">07:00</option>
					<option value="08:00">08:00</option>
					<option value="09:00">09:00</option>
					<option value="10:00">10:00</option>
					<option value="11:00">11:00</option>
					<option value="12:00">12:00</option>
					<option value="13:00">13:00</option>
					<option value="14:00">14:00</option>
					<option value="15:00">15:00</option>
					<option value="16:00">16:00</option>
					<option value="17:00">17:00</option>
					<option value="18:00">18:00</option>
					<option value="19:00">19:00</option>
					<option value="20:00">20:00</option>
					<option value="21:00">21:00</option>
					<option value="22:00">22:00</option>
					<option value="23:00">23:00</option>
				</select>
			</td>
		</tr>
			<tr style="height : 10px;">
		</tr>
		<tr>
			<td>카테고리</td>
			<td colspan="2">
				<select name="ctg" id="ctg">
				</select>
			</td>
		</tr>
			<tr style="height : 10px;">
		</tr>
		<tr>
			<td>태그</td>
			<td colspan="2" id="tagL">
			</td>
		</tr>
			<tr style="height : 10px;">
		</tr>
		<tr>
			<td>가게<br>설명</td>
			<td colspan="2">
				<textarea rows="5" cols="30" name="info" id="info">
				</textarea>
			</td>
		</tr>
			<tr style="height : 10px;">
		</tr>
		<tr>
			<td colspan="3" style="text-align: center;">
				<input type="submit" value="정보 변경" id="updateSubmit">
				<input type="button" id="cancel" onclick="cancelChanges()" value="취소">
			</td>
		</tr>
		
	</table>
</form>
</body>
</html>