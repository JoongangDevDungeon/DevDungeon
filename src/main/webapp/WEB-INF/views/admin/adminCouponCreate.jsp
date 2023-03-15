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
<script type="text/javascript">
function couponbtn() {
	let couponKind = document.getElementById("couponKind").value;
	let couponName = document.getElementById("couponName").value;
	let couponContent = document.getElementById("couponContent").value;
	
	if(couponKind === "쿠폰종류를 선택하세요" || couponName === "" || couponContent === ""){
		alert("모든 항목을 입력해주세요");
	} else{
		document.getElementById("couponForm").submit();
	}
}

</script>
<body>
<div id="container">
	<div class="header">
		<%@include file="./adminMenu.jsp"%>
	</div>
	
	<!-- 메인 시작 -->
	<div class="main">
		<div class="container">
			<h1>관리자 쿠폰생성</h1>
			<hr class="hr1">
			<br><br>
			<div class="admincoupon">
				<form action="/adminCouponCreate" method="post" id="couponForm">
					<select class="form-select" name="coupon" id="couponKind">
						<option selected="selected">쿠폰종류를 선택하세요</option>
	    				<option value="1">쿠폰발급</option>
	    				<option value="2">x</option>
	    				<option value="3">x</option>
	    				<option value="4">x</option>
					</select><br>
					<input type="text" class="form-control" name="couponName" id="couponName" placeholder="쿠폰이름 지정해주세요"><br>
					<input type="text" class="form-control coupontxt" name="couponContent" id="couponContent" placeholder="쿠폰내용을 지정해주세요"><br>
					<button class="btn btn-success" type="button" onclick="couponbtn()">쿠폰 생성하기</button>
				</form>
			</div>
		
		
		</div>
	</div>
</div>
</body>
</html>