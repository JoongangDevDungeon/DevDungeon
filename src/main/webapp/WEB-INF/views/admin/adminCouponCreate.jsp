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
<body>
<div id="container">
	<div class="header">
		<%@include file="./adminMenu.jsp"%>
	</div>
	
	<!-- 메인 시작 -->
	<div class="main">
		<h1>관리자 쿠폰생성</h1>
		
		<div>
			<form action="/adminCouponCreate" method="post">
				<select name="coupon">
					<option selected="selected">쿠폰종류를 선택하세요</option>
    				<option value="1">쿠폰발급</option>
    				<option value="">x</option>
    				<option value="">x</option>
    				<option value="">x</option>
				</select>
				<input type="text" name="couponName" placeholder="쿠폰이름 지정해주세요">
				<input type="text" name="couponContent" placeholder="쿠폰내용을 지정해주세요">
				<button type="submit">쿠폰 생성하기</button>
			</form>
		</div>
		
		
		
	</div>
</div>
</body>
</html>