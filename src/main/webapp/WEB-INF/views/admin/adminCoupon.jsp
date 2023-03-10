<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Favicon-->
<link rel="icon" href="/img/admin/adminGazi.png" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<title>admin coupon</title>
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
			<h1>관리자 쿠폰발급 페이지</h1>
			<hr class="hr1">
			<table class="table">
				<tr class="table-header">
					<th class="col-1">쿠폰 유형</th>
					<th class="col-3">쿠폰 넘버</th>
					<th class="col-2">쿠폰 이름</th>
					<th class="col-2">쿠폰 내용</th>
					<th class="col-1">시작일</th>
					<th class="col-1">종료일</th>
					<th class="col-1">쿠폰 삭제</th>
				</tr>
				<c:forEach items="${list }" var="row">
				<tr>
					<td>${row.coupon_type }</td>
					<td>${row.event_no }</td>
					<td>${row.coupon_name }</td>
					<td>${row.coupon_content }</td>
					<td>${row.coupon_start }</td>
					<td>${row.coupon_end }</td>
					<td>
						<button class="btn btn-danger" value="${row.coupon_type }" name="coupon_type" type="submit">쿠폰삭제</button>
					</td>
				</tr>
				</c:forEach>
			</table>
			
			
			<button class="btn btn-primary" type="button" onclick="location.href='/adminCouponCreate';">쿠폰생성</button>
			
		</div>	
	</div>
</div>
</body>
</html>