<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Of CSJ</title>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
	<link rel="icon" href="/img/favicon.png" />
</head>
<body>
	<div id="container">
		<div class="header">
			<%-- 			<%@ include file="menu.jsp"%> --%>
		</div>
		<div class="main">
			<h1>BOARD NAME HERE</h1>
			<div>
				<table class="table">
					<tr>
						<th>구분</th>
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>날짜</th>
						<th>조회수</th>
						<th>좋아요</th>
					</tr>
					<c:forEach items="${list }" var="b">
						<tr>
							<td>${b.tag_no }</td>
							<td>${b.board_no }</td>
							<td><a href="csjDetail?bno=${b.board_no }">${b.board_title }</a></td>
							<td>${b.member_name }</td>
							<td>${b.board_date }</td>
							<td>${b.board_read }</td>
							<td>${b.board_like }</td>
						</tr>
					</c:forEach>
				</table>

			</div>
			<%@ include file="CSJpaging.jsp" %>
			<div class="searchForm">
				<form action="csjboard" method="get" id="searchForm"> 
					<select name="searchType">
						<option value="title">제목</option>
						<option value="writer"<c:if test='${searchType eq "writer"}'>selected</c:if>>글쓴이</option>
					</select> <input type="text" name="searchValue" value="${searchValue }">
					<button class="btn btn-primary">검색</button>
				</form>
			</div>
			<button class="btn btn-primary" onclick="location.href='/csjWrite'">글쓰기</button>
		</div>
		<div class="footer">
			<!-- 여기에 footer -->
		</div>
	</div>
</body>
</html>