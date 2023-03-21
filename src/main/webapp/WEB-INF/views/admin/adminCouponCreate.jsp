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
	let couponRat = document.getElementById("couponRat").value;
	let endDate = document.getElementById("endDate").value;
	
	if(couponKind === "이벤트 제목을 선택하세요" || couponName === "" || endDate === "" || couponRat === "쿠폰 할인율 선택"){
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
					<select class="form-select" name="event_no" id="couponKind">
						<option selected="selected">이벤트 제목을 선택하세요</option>
	    				<c:forEach items="${list }" var="row">
	    					<option value="${row.event_no }">${row.event_title }</option>
	    				</c:forEach>
					</select><br>
					<input type="text" class="form-control coupontxt" name="couponName" id="couponName" placeholder="쿠폰이름 지정해주세요"><br>
					
					<select class="form-select" id="couponRat" name="couponContent">
						<option selected="selected">쿠폰 할인율 선택</option>
	    					<option value="5">5%</option>
	    					<option value="10">10%</option>
	    					<option value="15">15%</option>
	    					<option value="20">20%</option>
					</select><br>
					
					만료일 : <input type="date" name="endDate" id="endDate"><br><br>
					<button class="btn btn-success" type="button" onclick="couponbtn()">쿠폰 생성하기</button>
				</form>
				
			</div>
		
		
		</div>
	</div>
</div>
</body>
</html>