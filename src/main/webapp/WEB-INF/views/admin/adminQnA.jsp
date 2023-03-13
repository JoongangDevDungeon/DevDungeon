<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Favicon-->
<link rel="icon" href="/img/admin/adminGazi.png" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
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
		<div class="container">
			<h1>관리자 QnA FAQ 페이지</h1>
			<hr class="hr1">
			<table class="table">
				<tr class="table-header">
					<td class="col-1">보드 번호</td>
					<td class="col-1">멤버 번호</td>
					<td class="col-3">질문 제목</td>
					<td class="col-2">질문 내용</td>
					<td class="col-1">질문한 날짜</td>
					<td class="col-1">답변상태</td>								
				</tr>
				<c:forEach items="${qna }" var="row">
					<tr>
						<td>${row.question_board_no}</td>
						<td>${row.member_no }</td>
						<td>${row.question_board_title }</td>
						<td>${row.question_board_content }</td>
						<td>${row.question_board_date }</td>
						<td>
							<c:choose>
								<c:when test="${row.question_board_status eq 1}">
									<form action="/adminAnswer">
										<input type="hidden" value="${row.question_board_no}" name="qnaNo">
										<button class="btn btn-success" onclick="location.href='/adminAnswer'">답변달기</button>
									</form>
								</c:when>
								<c:otherwise>
									
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</table>	
		</div>
	</div>
</div>
</body>
</html>