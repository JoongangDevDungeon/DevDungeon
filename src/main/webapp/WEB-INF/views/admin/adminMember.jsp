<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin member</title>
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
		<h1>관리자 사용자 관리 페이지</h1>
		<table class="table">
							<tr>
								<td>멤버번호</td>
								<td>이름</td>
								<td>멤버 아이디</td>
								<td>멤버 번호</td>
								<td>멤버 이메일</td>
								<td>생일</td>
							</tr><c:forEach items="${list }" var="row">
							<tr>
								<td>${row.member_no }</td>
								<td>${row.member_name }</td>
								<td>${row.member_id }</td>
								<td>${row.member_tel }</td>
								<td>${row.member_email }</td>
								<td>${row.member_birth }</td>
							</tr></c:forEach>
						</table>
		
		
	</div>
</div>
</body>
</html>