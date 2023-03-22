<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Favicon-->
<link rel="icon" href="/img/admin/adminGazi.png" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<title>adminAnswer</title>
<link rel="stylesheet" href="/css/admin.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script type="text/javascript">function url(link){location.href="/"+link;}</script>
</head>
<body>
<div id="container">
	<div class="header">
		<%@include file="./adminMenu.jsp"%>
	</div>
	
	<!-- 메인 시작 -->
	<div class="main">
		<div class="container">
			<h1>QnA 댓글달기</h1>
			<hr class="hr1">
			
			<br><br>
			
			<div class="adminAnswer">
				<form action="/adminAnswerComplete" method="post">
					<div class="row g-2">
						<div class="col-md">
							<div class="form-floating">
								<input type="text" class="form-control AnswerTxt" id="floatingInputGrid" value="${qna.get(0).question_board_title }" readonly="readonly">
								<label for="floatingInputGrid">문의내용</label>
							</div>
						</div>
					</div>
					
					<br>
					
					<div class="form-floating">
						<textarea class="form-control" name="content" id="floatingTextarea2" style="height: 200px; width: 700px;" readonly="readonly">${qna.get(0).question_board_content }</textarea>
					</div>
					
					<br><br>
					
					<div class="row g-2">
						<div class="col-md">
							<div class="form-floating">
								<input type="hidden" name="questionNo" value="${qna.get(0).question_board_no }">
								<input type="text" class="form-control AnswerTxt" id="floatingInputGrid" name="answerTitle" maxlength="50">
								<label for="floatingInputGrid">답변 제목</label>
							</div>
						</div>
					</div>
					
					<br>
					
					<div class="form-floating">
						<textarea class="form-control" name="answerContent" id="floatingTextarea2" style="height: 200px; width: 700px;"" maxlength="1000"></textarea>
					</div>
					
					<br>
					
					<button class="btn btn-primary AnswerBtn" type="submit">답변달기</button>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>