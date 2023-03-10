<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
   <meta charset="UTF-8">
   <title>메인 화면</title>
   <link rel="icon" href="/img/Gazi_shortCut.png" />
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   <link rel="stylesheet" href="/css/layout.css">
</head>
<body>
   <%@include file="../top.jsp"%>
   <%@include file="../menu.jsp"%>
   <section>
         <div class="main">
            <div class="add1">광고1</div>
            <div class="content">
            <h1 onclick="location.href='csjboard'">BOARD NAME HERE</h1>
			<div class="writeForm">
				<form action="csjWrite" method="post" enctype="multipart/form-data">
					<input type="hidden" name="category" value="1">
					<input type="hidden" name="tag" value="1">
					<input type="text" name="title" class="form-control" placeholder="제목을 입력하세요">
					<textarea name="content" class="form-control" rows="20"  placeholder="내용을 입력하세요"></textarea>
					<input type="file" name="file" accept="image/*">
					<button class="btn btn-primary">글쓰기</button>
				</form>
				<button class="btn btn-primary">목록</button>
			</div>
			
            </div>
            <div class="add2">광고2</div>
         </div>
   </section>
   <%@include file="../footer.jsp"%>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</html>
