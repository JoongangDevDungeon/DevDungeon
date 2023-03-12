<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Favicon-->
<link rel="icon" href="/img/admin/adminGazi.png" />
<title>admin coupon</title>
<link rel="stylesheet" href="/css/admin.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script type="text/javascript">function url(link){location.href="/"+link;}</script>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	
	
});


</script>
<body>
<div id="container">
	<div class="header">
		<%@include file="./adminMenu.jsp"%>
	</div>
	
	<!-- 메인 시작 -->
	<div class="main">
		<h1>관리자 쿠폰발급 페이지</h1>
		<table>
			<tr>
				<th>쿠폰 유형</th>
				<th>쿠폰 넘버</th>
				<th>쿠폰 이름</th>
				<th>쿠폰 내용</th>
				<th>시작일</th>
				<th>종료일</th>
				<th>쿠폰 삭제</th>
			</tr>
			<c:forEach items="${list }" var="row">
			<tr>
				<td>${row.coupon_type }</td>
				<td>${row.event_no }</td>
				<td>${row.coupon_name }</td>
				<td>${row.coupon_content }</td>
				<td>${row.coupon_start }</td>
				<td>${row.coupon_end }</td>
				<td><button type="button" onclick="couponDel(${row.coupon_type });">쿠폰삭제</button></td>
			</tr>
			</c:forEach>
		</table>
		
		
		<button type="button" onclick="location.href='/adminCouponCreate';">쿠폰생성</button>
		
		
	</div>
</div>
</body>
</html>