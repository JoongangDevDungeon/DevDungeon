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
</head>
<body>
	<div id="container">
		<div class="header">
			<%-- 			<%@ include file="menu.jsp"%> --%>
		</div>
		<div class="main">
			<h1>BOARD NAME HERE</h1>
			<div>
				<div>제목 : ${det.board_no }</div>
				<div>글쓴이 ${det.member_name } 날짜 ${det.board_date } 조회수 ${det.board_read }</div>
				<div>본문 ${det.board_content }</div>
			</div>
			<div>유저프로필 ${mem.member_name }<br>${mem.member_email }</div>
			<button>추천</button>
			<button>신고</button>
			<button class="btn btn-primary" onclick="location.href='/csjboard'">목록</button>
			<button class="btn btn-primary" onclick="location.href='/csjWrite'">글쓰기</button>
			<div>
				댓글창 구현
			</div>
			<div>
				댓글입력 구현
			</div>
		</div>
		<div class="footer">
			<!-- 여기에 footer -->
		</div>
	</div>
</body>
</html>