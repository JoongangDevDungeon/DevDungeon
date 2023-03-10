<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Favicon-->
<link rel="icon" href="/img/admin/adminGazi.png" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<title>admin event</title>
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
			<h1>관리자 이벤트 페이지</h1>
			<table class="table">
				<tr class="table-header">
					<th class="col-1">번호</th>
					<th class="col-3">이벤트 제목</th>
					<th class="col-2">글쓴이</th>
					<th class="col-2">이벤트 기간</th>
					<th class="col-1">추천수</th>
					<th class="col-1">관리</th>
				</tr>
				<!-- 수정 하면댐 -->
<%-- 				<c:forEach items="${list }" var="row"> --%>
<!-- 				<tr> -->
<%-- 					<td>${row.board_no }</td> --%>
<%-- 					<td>${row.board_title }</td> --%>
<%-- 					<td>${row.member_id }</td> --%>
<%-- 					<td>${row.board_date }</td> --%>
<!-- 					<td> -->
<!-- 						<form action="/adminBoard" method="post"> -->
<%-- 							<input type="hidden" name="board_no" value="${row.board_no }"> --%>
<%-- 							<input type="hidden" name="status_no" value="${row.status_no }"> --%>
<%-- 							<button type="submit" class="${row.status_no eq '1' ? 'btn btn-primary' : 'btn btn-danger'}">${row.status_no eq '1' ? '활성화' : '비활성화'}</button> --%>
<!-- 						</form> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<%-- 				</c:forEach> --%>
				<!-- 수정 하면댐 -->
			</table>
		
		</div>
	</div>
</div>
</body>
</html>