<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<link type="text/css" rel="stylesheet" href="/css/HJHBoard.css">
<title>HJHBoard</title>
</head>
<body>
	<div class="container">
		<h1>홍준호님의 board 입니다.</h1>
		<table class="table">
			<tr class="table-header">
				<th class="col-1">번호</th>
				<th class="col-5">제목</th>
				<th class="col-2">글쓴이</th>
				<th class="col-3">날짜</th>
				<th class="col-1">좋아요</th>
			</tr>

			<c:forEach var="board" items="${list }">
				<tr class="table-header">
					<td>${board.bno }</td>
					<td class="title">${board.b_title }</td>
					<td>${board.member_no }</td>
					<td>${board.b_date }</td>
					<td>${board.b_like }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>