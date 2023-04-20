<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="../js/jquery.serializejson.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
.container{
	display: grid;
}
.button-wrapper {
  max-width: 300px;
  margin: 0 auto;
}

.justify-content-flex-end {
  display: flex;
  justify-content: flex-end;
}
.card{
	margin: 10px;
}
.card-wrapper{
	border-top: 1px solid rgba(10,10,10,0.2);
}
.modal-body table td:first-child{
	font-weight: bold;
	text-align: right;
}
img{
	border: 2px solid rgba(10,10,10,0.2);
}
#modForm label{
	font-weight: bold;
}
</style>
<script type="text/javascript">
	mcon = {};
	$(function() {
		$.ajax({
			url : '<%=request.getContextPath()%>/menuShow1.do',
			type : 'get',
			data : {"id" : "bs001"},
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
		// 매뉴 추가 모달
		$('#addMenu').on('click',function(){
			$('#addModal').modal('show');
		})
		
		//매뉴 모달 안보일때 초기화 해주는방법
		$('#addModal').on('hide.bs.modal', function () {
			$(this).find('form')[0].reset();
			$(this).find('#image_container').text('');
		});
		
		// 매뉴 정보 보는 모달 수정 삭제 가능함
		$(document).on('click','.minfo',function(){
			menuId = $(this).val();
			mcon.mid = menuId;
			mcon.rid = "bs001";
			$.ajax({
				url : '<%=request.getContextPath()%>/menuShow.do',
				type : 'post',
				data : mcon,
				success : function(res) {
					console.log(res);
					$('#menuInfoModal #menuImage').attr('src',`<%=request.getContextPath()%>/menuImg.do?photo=${res.menu_photo}`);
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
		})	
		
		// 메뉴 수정 버튼 눌렀을때
		$('#updateMenu').on('click',function(){
			
			aa = $(this).attr('id');
			if(aa == 'saveMenu'){
				$('#modifyContent').click();
				
			}else if(aa == 'updateMenu'){
				$(this).text('저장');
				$(this).attr('id', 'saveMenu');
				$(this).removeClass('btn-danger').addClass('btn-primary');
				$("#menuInfoModal").find('form input,textarea').removeAttr("disabled");
			}
		})
		
		
		$('#menuInfoModal').on('hide.bs.modal', function () {
			$(this).find('form input,textarea').attr('disabled',true);
			$(this).find('#saveMenu').text('수정');
			$(this).find('#saveMenu').removeClass('btn-primary').addClass('btn-danger');
			$(this).find('#saveMenu').attr('id', 'updateMenu');
		});
		
		$('#deleteMenu').on('click',function(){
			if(confirm("해당 메뉴를 삭제 하시겠습니까?")){
				$.ajax({
					url : '<%=request.getContextPath()%>/deleteMenu.do',
					type : 'post',
					data : mcon,
					success : function(res) {
						if(res.flag==1){
							alert("메뉴가 삭제 되었습니다.");
							$('#menuInfoModal').modal('hide');
							window.location.reload();
						}
					},
					error : function(xhr) {
						alert("Error : "+xhr.status)
					},
						dataType : 'json'
				})
			}
		})
		
		<%-- $('#send').on('click',function(){
			fdata = $('form').serializeJSON();
			$.ajax({
				url : '<%=request.getContextPath()%>/menuAdd.do',
				type : 'post',
				data : fdata,
				success : function(res) {
					if(res.flag==1){
						alert("성공")
					}
				},
				error : function(xhr) {
					alert("Error : "+xhr.status)
				},
				dataType : 'json'
			})
		}) --%>
	})
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
	
</script>
</head>
<body>
 
<div class="container">
  <h2>내 메뉴 정보</h2>
  <div class="justify-content-flex-end">
	 <button class="btn btn-primary" id="addMenu">메뉴 추가</button>
  </div>
  <br>
  <div class="card-wrapper d-flex flex-wrap mx-n2">
  </div>
</div>


 <!-- The Modal -->
<div class="modal fade" id="addModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">메뉴 추가</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form action="<%=request.getContextPath()%>/menuAdd.do" 
        	 method="post" enctype="multipart/form-data">
        	<input type="hidden" value="bs001" name="rid">
        	<table>
        		<tr>
        			<td>메뉴 이름 :</td>
        			<td><input type="text" class="form-control" id="mname" name="mname"></td>
        		</tr>
        		<tr>
        			<td>메뉴 가격 :</td>
        			<td><input type="text" class="form-control" id="mprice" name="mprice"></td>
        		</tr>
        		<tr>
        			<td>메뉴 사진 첨부 :</td>
        			<td>
						<input class="form-control form-control-user" type="file" 
							name="product_image" id="product_image" onchange="setThumbnail(event);">
					</td>
        		</tr>
        		<tr>
        			<td></td>
        			<td>
        				<div id="image_container"></div>
        			</td>
        		</tr>
        		<tr>
        			<td>메뉴 설명 :</td>
        			<td><textarea class="form-control" rows="5" id="comment" name="mds"></textarea></td>
        		</tr>
        	</table>
        	<button type="submit" class="btn btn-primary">저장</button>
        </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>





<!-- The Modal -->
  <div class="modal fade" id="menuInfoModal">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">메뉴 상세 정보</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <form action="<%=request.getContextPath()%>/menuUpdate.do" 
        	 method="post" enctype="multipart/form-data" id="modForm">
        	 <label for="menuFileInput">
        	 	<img id="menuImage" src="" style="width: 100%;">
        	 </label>
        	 <input id="menuFileInput" type="file" style="visibility: hidden;" name="mphoto" onchange="changeImage(event)" disabled>
        	 	<br>
	          <label>매뉴 이름</label>
	          <input type="text" class="form-control" id="modName" name="modName" disabled>
	          <label>매뉴 가격</label>
	          <input type="text" class="form-control" id="modPrice" name="modPrice" disabled>
	          <label>매뉴 설명</label>
	          <textarea class="form-control" rows="5" id="modDs" name="modDs" disabled></textarea>
	          <input type="hidden" name="menuDetailId" id="menuDetailId">
	          <input type="hidden" name="rstId" id="rstId">
	          <input type="submit" id="modifyContent" style="display: none;">
          </form>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" id="updateMenu">수정</button>
          <button type="button" class="btn btn-danger" id="deleteMenu">삭제</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
</body>
</html>