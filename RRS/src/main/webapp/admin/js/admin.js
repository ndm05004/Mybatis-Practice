/**
 * 
 */

   // 승인대기 메뉴 페이징
    function createPaginationRst(page, sp, ep, tp) {
        let pager = "";
        pager += "<ul class='pagination'>";
        if (sp > 1) {
          pager += "<li class='page-item'><a id='prev' class='rstPageno1 page-link' href='#'>Previous</a></li>";
        }
        for (let i = sp; i <= ep; i++) {
          if (i == page) { 
            pager += "<li class='active page-item'><a class='page-link rstPageno pageno' id='rstpageno' href='#'>" + i + "</a></li>";
          } else {
            pager += "<li class='page-item'><a class='page-link rstPageno1 pageno' href='#'>" + i + "</a></li>";
          }
        }
        if (ep < tp) {
          pager += "<li class='page-item'><a id='next' class='rstPageno1 page-link' href='#'>Next</a></li>";
        }
        pager += "</ul>";
        
        return pager;
      }
      

   // 사업자 메뉴 페이징
    function createPaginationRinfo(page, sp, ep, tp) {
        let pager = "";
        pager += "<ul class='pagination'>";
        if (sp > 1) {
          pager += "<li class='page-item'><a id='prev' class='rstPageno2 page-link' href='#'>Previous</a></li>";
        }
        for (let i = sp; i <= ep; i++) {
          if (i == page) { 
            pager += "<li class='active page-item'><a class='rstPageno2 page-link pageno' id='rstpageno2' href='#'>" + i + "</a></li>";
          } else {
            pager += "<li class='page-item'><a class='rstPageno2 page-link pageno' id='rstpageno2' href='#'>" + i + "</a></li>";
          }
        }
        if (ep < tp) {
          pager += "<li class='page-item'><a id='next' class='rstPageno2 page-link' href='#'>Next</a></li>";
        }
        pager += "</ul>";
        return pager;
      }
      
      
    // 회원 메뉴 페이징
    function createPaginationMinfo(page, sp, ep, tp) {
        let pager = "";
        pager += "<ul class='pagination'>";
        if (sp > 1) {
          pager += "<li class='page-item'><a id='prev' class='rstPageno3 page-link' href='#'>Previous</a></li>";
        }
        for (let i = sp; i <= ep; i++) {
          if (i == page) { 
            pager += "<li class='active page-item'><a class='rstPageno3 page-link pageno' id='rstpageno3' href='#'>" + i + "</a></li>";
          } else {
            pager += "<li class='page-item'><a class='rstPageno3 page-link pageno' id='rstpageno3' href='#'>" + i + "</a></li>";
          }
        }
        if (ep < tp) {
          pager += "<li class='page-item'><a id='next' class='rstPageno3 page-link' href='#'>Next</a></li>";
        }
        pager += "</ul>";
        return pager;
      }
      
      
    // 블랙리스트 메뉴 페이징
    function createPaginationBinfo(page, sp, ep, tp) {
        let pager = "";
        pager += "<ul class='pagination'>";
        if (sp > 1) {
          pager += "<li class='page-item'><a id='prev' class='rstPageno4 page-link' href='#'>Previous</a></li>";
        }
        for (let i = sp; i <= ep; i++) {
          if (i == page) { 
            pager += "<li class='active page-item'><a class='rstPageno4 page-link pageno' id='rstpageno4' href='#'>" + i + "</a></li>";
          } else {
            pager += "<li class='page-item'><a class='rstPageno4 page-link pageno' id='rstpageno4' href='#'>" + i + "</a></li>";
          }
        }
        if (ep < tp) {
          pager += "<li class='page-item'><a id='next' class='rstPageno4 page-link' href='#'>Next</a></li>";
        }
        pager += "</ul>";
        return pager;
      }
      
      
   // 공지사항관리 메뉴 페이징
    function createPaginationNinfo(page, sp, ep, tp) {
        let pager = "";
        pager += "<ul class='pagination'>";
        if (sp > 1) {
          pager += "<li class='page-item'><a id='prev' class='rstPageno5 page-link' href='#'>Previous</a></li>";
        }
        for (let i = sp; i <= ep; i++) {
          if (i == page) { 
            pager += "<li class='active page-item'><a class='rstPageno5 page-link pageno' id='rstpageno5' href='#'>" + i + "</a></li>";
          } else {
            pager += "<li class='page-item'><a class='rstPageno5 page-link pageno' id='rstpageno5' href='#'>" + i + "</a></li>";
          }
        }
        if (ep < tp) {
          pager += "<li class='page-item'><a id='next' class='rstPageno5 page-link' href='#'>Next</a></li>";
        }
        pager += "</ul>";
        return pager;
      }


   // 승인대기 리스트 출력   
   function getRetaurantAwait(page) {
        $.ajax({
          url: `${mypath}/admin/awaitAproval.do`,
          type: 'post',
          data: {
            "page": page
          },
          success: function(res) {
            let code = "<table border='1' class='table table-striped'>"
            code += "<tr><td>식당ID</td><td>식당이름</td><td>사업자번호</td><td>승인요청일</td><td>결제관리</td>"
            $.each(res.datas, function(i, v) {
              code += "<tr><td>"+v.rst_id+"</td><td>"+v.rst_name+"</td><td>"+v.bs_num+"</td><td>"+v.rst_req+"</td>";
              code += "<td><button class='btn btn-primary' id='"+v.rst_id+"' name='approvalbtn'>승인</button>";
              code += "<button class='btn btn-primary' id='"+v.rst_id+"' name='deletebtn'>반려</button></td></tr>";
            });
            code += "</table>";
            code += "<br><div id ='pagelist1'></div>"
            
            $('#result').html(code);

            let pager = createPaginationRst(page, res.sp, res.ep, res.tp);
            $('#pagelist1').html(pager); 
          },
          error: function(xhr) {
            alert("Status: " + xhr.status); 
          },
          dataType: 'json'
      }); 
   };
   
   
   // 사업자 메뉴 페이지         
   function getRestaurantInfo(page){
   
         $.ajax({
            url : `${mypath}/admin/restaurantInfo.do`,
            type : 'get',
            data: {"page": page},
            dataType : 'json',
            error : function(xhr) {
               alert("상태 : " + xhr.status);
            },  
            success : function(res) {
               code = "<table border='1' class='table table-striped'>"
               code += "<tr><td>식당ID</td><td>식당이름</td><td>주소</td><td>전화번호</td><td>카테고리</td></tr>"
               $.each(res.datas, function(i, v){
                  code += "<tr><td><a href='#' name='restaurant-link' class='restaurant-link' id='" + v.rst_id + "'>" + v.rst_id + "</a></td>";
                  code += "<td>"+v.rst_name+"</td><td>"+v.rst_addr+"</td><td>"+v.rst_tel+"</td><td>"+v.rst_menu+"</td><tr>";
               });
               code += "</table>";
               code += "<br><div id ='pagelist2'></div>"
               
               $('#result').html(code);
               
               let pager = createPaginationRinfo(page, res.sp, res.ep, res.tp);
                $('#pagelist2').html(pager);
            }
         });
      };
      
   // 식당승인버튼   
   function approveRestaurant(rst_id, $tr) {
     $.ajax({
       url:`${mypath}/admin/approveRestaurant.do`,
       type: 'get',
       data: {rst_id: rst_id},
       success: function(res) {
         if (res.flag == "okay") {
           alert("승인되었습니다.");
           $tr.remove();
         }
       },
       error: function(xhr) {
         alert("Status: " + xhr.status);
       },
       dataType: 'json'
     });
   }
   
   
   function deleteRestaurant(rst_id, $tr) {
      $.ajax({
         url: `${mypath}/admin/deleteRestaurant.do`,
         type: 'get',
         data: {rst_id: rst_id},
         success: function(res) {
            if(res.flag=="okay"){
               alert("반려되었습니다.");
               $tr.remove();
               }
             },
             error: function(xhr) {
               alert("상태: " + xhr.status);
             },
             dataType: 'json'
           });
      }
      
      function getMemberInfo(page){
           $.ajax({
             url : `${mypath}/admin/memberInfo.do`,
            type : 'get',
            data: {"page": page},
            dataType : 'json',
             error : function(xhr) {
               alert("상태 : " + xhr.status);
             },
             success : function ( res ) {
               code = "<table border='1' class='table table-striped'>";
               code += "<tr><td>사용자ID</td><td>이메일</td><td>닉네임</td><td>신고받은횟수</td><td>제재횟수</td><td>활성화여부</td></tr>"
               $.each ( res.datas , function ( i , v ) {
                 code += "<tr><td><a href='#' name='member-link' class='member-link' id='" + v.mem_id + "'>" + v.mem_id + "</a></td ><td>"+v.mem_mail+"</td><td>"+v.mem_nick+"</td><td>"+v.mem_rn+"</td><td>"+v.mem_lc+"</td><td>"+v.mem_st+"</td></tr>";
               });
               code += "</table>"
               code += "<br><div id ='pagelist3'></div>"
              
               $('#result').html(code);
               
               let pager = createPaginationMinfo(page, res.sp, res.ep, res.tp);
               $('#pagelist3').html(pager);

             }
           });
      }
           
      function getNoticeBoardInfo(page){
         
         $.ajax({
            
            url : `${mypath}/admin/noticeBoardInfo.do`,
            type: 'get',
            data: {"page": page},
            success: function(res){
               code="<button class='btn btn-primary' id='noticeboardInsert' name='noticeboardInsert'>공지사항작성</button>";
               code+="<table border='1' class='table table-striped'>";
               code+="<tr><td>공지사항번호</td>";
               code+="<td>제목</td>";
               code+="<td>작성일</td></tr>";

               $.each (res.datas, function(i , v) {
                  code+="<tr><td>"+v.nb_id+"</td>"
                  code+="<td><a href='#' name='noticedetail-link' class='noticedetail-link' id='" + v.nb_id + "'>" + v.nb_title + "</a></td>"
                  code+="<td>"+v.nb_date+"</td><tr>"
               })
               code += "</table>"
               code += "<br><div id ='pagelist5'></div>"
               $('#result').html(code);
               
               let pager = createPaginationNinfo(page, res.sp, res.ep, res.tp);
                 $('#pagelist5').html(pager);
             },
            error: function(xhr){
               alert("상태: " + xhr.status);
            },
            dataType: 'json'
            })
         }
         
      function getNoticedetail(nb_id){
             $.ajax({
                  url: `${mypath}/admin/noticeBoardDetail.do`,
                  type: 'get',
                  data: {nb_id: nb_id},
                  success: function(res) {
                     
                     code = "<div class='container mt-3'>";
                     code += "<div class='d-flex justify-content-end'>";
                     code += "<button class='btn btn-primary' id='noticeboardUpdate"+res.nb_id+"' name='noticeboardUpdate' style='margin-right:10px;'>공지사항수정</button>"; 
                     code += "<button class='btn btn-primary' id='noticeboardDelete"+res.nb_id+"' name='noticeboardDelete'>공지사항삭제</button>";
                     code += "</div>";
                     code += "<div class='mb-3 mt-3 topline'>";
                     code += "<div class='topline2'>";  
                     code += "<label for='exampleFormControlInput1' class='form-label'>공지사항번호</label>";
                     code += "<input class='form-control btopbox' type='text' value='"+res.nb_id+"' aria-label='readonly input example' readonly>";
                     code += "<label for='exampleFormControlInput1' class='form-label bdate'>작성일</label>";
                     code += "<input class='form-control' type='text' value='"+res.nb_date +"' aria-label='readonly input example' readonly>";
                     code += "</div>";
                     code += "<label for='exampleFormControlInput1' class='form-label titleBox'>제목</label>";
                     code += "<input class='form-control' type='text' value='"+res.nb_title +"' aria-label='readonly input example' readonly>";
                     code += "</div>";
                     code += "<label for='title'>내용</label>"; 
                     code += "<textarea class='form-control bcontent contetnBox' aria-label='readonly input example' readonly>" + res.nb_content.replace(/<br>/g, '\n') + "</textarea>";
                     code += "</div>";
                      $('#result').html(code);
                  },
                  error: function(xhr) {
                       alert("상태: " + xhr.status);
                  },
                  dataType: 'json'
             });
             }
             
             
          function getBlackListInfo(page){               
            $.ajax({
               url : `${mypath}/admin/blackListInfo.do`,
                 type : 'get',
                 dataType : 'json',
                 data: {"page": page},
                 error : function(xhr) {
                     alert("상태 : " + xhr.status);
                 },  
                 success : function(res) {
                     code = "<table border='1' class='table table-striped'>"
                     code += "<tr><td>사용자ID</td><td>이름</td><td>신고받은횟수</td><td>제재횟수</td><td>활성화여부</td><td>결재관리</td></tr>"
                     $.each(res.datas, function(i, v){
                        code+="<td><a href='#' name='blacklist-link' class='blacklist-link' id='" + v.mem_id + "'>" +v.mem_id + "</a></td>"
                        code +="<td>"+v.mem_name+"</td><td>"+v.mem_rn+"</td><td>"+v.mem_lc+"</td><td>"+v.mem_st+"</td>"                    
                        code += "<td><button class='btn btn-primary' id='"+v.mem_id+"' name='blackListCancel'>해제</button></td></tr>";
                      });
               code += "</table>"
               code += "<br><div id ='pagelist6'></div>"
               $('#result').html(code);
               
               let pager = createPaginationBinfo(page, res.sp, res.ep, res.tp);
                 $('#pagelist6').html(pager);
                     }
                  });
                  }
  
           
   