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
<%-- 			${list } --%>
			
			<c:forEach items="${list }" var="row">
			번호 : ${row.board_no }<br>
			제목 : ${row.board_title }<br>
			글쓴이 : ${row.member_id }<br>
			활성화 : ${row.status_no }<br>
			내용 : ${row.board_content }<br>
			날짜 : ${row.formatted_date }
			</c:forEach>
			
			
			
			
		</div>
	</div>
</div>
</body>
</html>