<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link href="css/styles.css" rel="stylesheet" />
<script type="text/javascript" src="/js/jquery-3.6.4.min.js"></script>


<title>Insert title here</title>
</head>
<body>
<div class="container mt-3">
  <h2>공지사항</h2>
  <form action='<%=request.getContextPath()%>/admin/noticeBoardWrite.do' method="post">
    <div class="mb-3 mt-3">
      <label for="title">제목: </label>
      <input type="text" class="form-control" id="title" placeholder="제목을 입력하세요" name="title">
    </div>
   <div class="mb-3 mt-3">
      <label for="comment">내용:</label>
      <textarea class="form-control" rows="5" id="comment" name="comment"></textarea>
    </div>
    <button type="submit" class="btn btn-primary">저장</button>
  </form>
</div>


</body>
</html>