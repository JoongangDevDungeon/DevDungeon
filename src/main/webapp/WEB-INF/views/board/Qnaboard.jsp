<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
   <meta charset="UTF-8">
   <title>질문과 답변</title>
   <link rel="icon" href="/img/Gazi_shortCut.png" />
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   <link rel="stylesheet" href="/css/layout.css">
<link type="text/css" rel="stylesheet" href="/css/HJHBoard.css">
<script>
$(document).ready(function(){
	$(".subContent").hide(0);
	$(".mainContent").click(function(){
		var no = $(this).children("#QuestionNo").text();
		$(".sub"+no).toggle(0);
	});
});
</script>
   
</head>
<body>
   <%@include file="../top.jsp"%>
   <%@include file="../menu.jsp"%>
   <section>
         <div class="main">
            <div class="add1">광고1</div>
            <div class="content">
			<!-- 이 곳을 수정하여 사용해주세요. -->
				<h1>Q N A B O A R D</h1>
				<table class="table">
					<tr class="table-header">
						<th class="col-1">번호</th>
						<th class="col-6">제목</th>
					</tr>
					<c:forEach var="board" items="${list }">
						<tr class="mainContent">
							<td id="QuestionNo">${board.question_board_no }</td>
							<td class="title">${board.question_board_title }</td>
						</tr>
						<tr class="subContent sub${board.question_board_no }">
							<td>질문 내용</td>
							<td class="title">${board.question_board_content }</td>
						</tr>
						<tr class="subContent sub${board.question_board_no }">
							<td>답변 제목</td>
							<td class="title">${board.answer_board_title }</td>
						</tr>
						<tr class="subContent sub${board.question_board_no }">
							<td>답변 내용</td>
							<td class="title">${board.answer_board_content }</td>
						</tr>
					</c:forEach>
				</table>
				<%@ include file="CSJpaging.jsp" %>
            </div>
            <div class="add2">광고2</div>
         </div>
   </section>
   <%@include file="../footer.jsp"%>
</body>
<script>
   $(function() {
      var error_msg = "${error_msg}";
      if(error_msg == "login_fail") alert("아이디와 비밀번호를 확인해주세요.");
   });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</html>
