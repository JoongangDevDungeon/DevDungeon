<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Favicon-->
<link rel="icon" href="/img/admin/adminGazi.png" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
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
		<div class="container">
			<h1>관리자 게시글 관리 Detail</h1>
			<hr class="hr1">
			<br><br>
			<div class="card mb-4">
				<div class="card-body">
					<c:forEach items="${list }" var="row">
						<div class="mb-3 mt-3">
							<label for="bno" class="form-label">보드 번호</label>
							<input type="text" class="form-control" value="${row.board_no }" readonly>
						</div>
						<div class="mb-3">
							<label for="title" class="form-label">제목</label>
							<input type="text" class="form-control"	value="${row.board_title }" readonly>
						</div>
						<div class="mb-3">
							<label for="writer" class="form-label">글쓴이</label>
							<input type="text" class="form-control" value="${row.member_id }" readonly>
						</div>
						<div class="mb-3">
							<label for="content" class="form-label">내용</label>
							<input type="text" class="form-control" value="${row.board_content }" readonly>
						</div>
						<div class="mb-3">
							<label for="regDate" class="form-label">게시일</label>
							<input type="text" class="form-control" value="${row.formatted_date }" readonly>
						</div>
							<button type="submit" class="${row.status_no eq '1' ? 'btn btn-primary' : 'btn btn-danger'}">${row.status_no eq '1' ? '활성화된 게시물' : '비활성화 완료'}</button>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>