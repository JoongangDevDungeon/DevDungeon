<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Favicon-->
<link rel="icon" href="/img/admin/adminGazi.png" />
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
					<td>멤버상태변경</td>								
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
						<c:when test="${row.member_grade eq 0}"><button type="submit" value="1" name="member_grade">활성화</button></c:when>
					<c:otherwise><button type="submit" value="0" name="member_grade">비활성화</button></c:otherwise>
					</c:choose>
					</td>
				</tr>
				</form>
				</c:forEach>
		</table>	
	</div>
</div>
</body>
</html>