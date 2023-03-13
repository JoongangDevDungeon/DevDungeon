<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Favicon-->
<link rel="icon" href="/img/admin/adminGazi.png" />
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
		<h1>QnA 댓글달기</h1>
		board_status = 변경시키기 -> 테이블 board에 있음.
		answer_board 에 값담아주기 를 동시에 수행해야함. 
		<form action="/adminAnswerComplete" method="post">
			<input type="text" name="title" value="${qna.get(0).question_board_title }" readonly><br>
			<textarea rows="10" name="content" cols="100" readonly>${qna.get(0).question_board_content }</textarea><br>
			답변<br>
			<input type="hidden" name="questionNo" value="${qna.get(0).question_board_no }">
			<input type="text" name="answerTitle"><br>
			<textarea rows="10" cols="100" name="answerContent"></textarea><br>
			<button type="submit">답변달기</button>
		</form>
	</div>
</div>
</body>
</html>