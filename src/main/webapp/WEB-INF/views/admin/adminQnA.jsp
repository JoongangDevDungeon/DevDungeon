<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Favicon-->
<link rel="icon" href="/img/admin/adminGazi.png" />
<title>admin QnA</title>
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
		<h1>관리자 QnA FAQ 페이지</h1>
		<table class="table">
				<tr>
					<td>보드번호</td>
					<td>멤버번호</td>
					<td>질문 제목</td>
					<td>질문 내용</td>
					<td>질문한 날짜</td>
					<td>답변상태</td>								
				</tr><c:forEach items="${qna }" var="row">
				<tr>
					<td>${row.question_board_no}</td>
					<td>${row.member_no }</td>
					<td>${row.question_board_title }</td>
					<td>${row.question_board_content }</td>
					<td>${row.question_board_date }</td>
					<td>
					<c:choose>
							<c:when test="${row.question_board_status eq 1}">
								<form action="/adminAnswer" method="get">
								<input type="hidden" name="answer" value="${row.question_board_no}">
								<button type="submit">답변달기</button>
								</form>
							</c:when>
					<c:otherwise>답변완료</c:otherwise>
					</c:choose>
					</td>
				</tr></c:forEach>
		</table>	
		
		
	</div>
</div>
</body>
</html>