<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Favicon-->
<link rel="icon" href="/img/admin/adminGazi.png" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
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
		<div class="container">
		<h1>관리자 사용자 관리 페이지</h1>
			<table class="table">
					<tr class="table-header">
						<td class="col-1">멤버번호</td>
						<td class="col-3">이름</td>
						<td class="col-2">멤버 아이디</td>
						<td class="col-2">멤버 번호</td>
						<td class="col-1">멤버 이메일</td>
						<td class="col-1">생일</td>
						<td class="col-1">멤버상태변경</td>								
					</tr><c:forEach items="${list }" var="row">
					<form action="/adminMember" method="post">
					<input type="hidden" name="member_no" value="${row.member_no }">
					<tr>
						<td>${row.member_no }</td>
						<td>${row.member_name }</td>
						<td>${row.member_id }</td>
						<td>${row.member_tel }</td>
						<td>${row.member_email }</td>
						<td>${row.member_birth }</td>
						<td>
						<c:choose>
							<c:when test="${row.member_grade eq 0}">
								<button class="btn btn-primary" type="submit" value="1" name="member_grade">활성화</button>
							</c:when>
							<c:otherwise>
								<button class="btn btn-danger" type="submit" value="0" name="member_grade">비활성화</button>
							</c:otherwise>
						</c:choose>
						</td>
					</tr>
					</form>
					</c:forEach>
			</table>
		</div>
	</div>
</div>
</body>
</html>