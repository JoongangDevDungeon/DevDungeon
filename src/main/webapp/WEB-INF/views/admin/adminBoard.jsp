<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminBoard</title>
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
		<h1>관리자 게시글 관리</h1>
		<table>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>날짜</th>
				<th>추천수</th>
				<th>관리</th>
			</tr>
			<c:forEach items="${list }" var="row">
			<tr>
				<td>${row.board_no }</td>
				<td>${row.board_title }</td>
				<td>${row.member_id }</td>
				<td>${row.board_date }</td>
				<td>${row.board_like }</td>
				<td>관리</td>
			</tr>
			</c:forEach>
		</table>
		
		
		
	</div>
</div>
</body>
</html>