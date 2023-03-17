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
<script type="text/javascript" src="/js/admin/AdminCouponPaging.js"></script>
<script type="text/javascript" src="/js/admin/AdminCouponSearch.js"></script>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".coupon_type").click(function(){
		let button = $(this);
		if(confirm("삭제하시겠습니까?")){
			let coupon_del = $(this).val();
			$.ajax({
				url : "/adminCouponDel",
				type : 'post',
				data : {
					couponDel : coupon_del
				},
				success : function(data) {
					button.closest('tr').fadeOut();
					alert('삭제되었습니다.');	
		     	},
				error : function() {
					alert("error");
				}
			});
		};
	});
});
//페이지 뒤쪽 버튼
function moveNext(pageNo){
	let searchType = document.getElementById("searchType");
	let searchValue = document.getElementById("searchValue");
	let url =  document.location.href.split("?",1);
	
	if(pageNo > ${pages.lastPage } ) { return false; }
	else if (pageNo != ${pages.lastPage } ){
		
		if((searchType.value != null && searchType.value != "none") && searchValue.value != null){
			location.href=url+"?searchType="+ searchType.value+"&searchValue="+searchValue.value+"&pageNo="+(pageNo+1);
		}else{
			location.href="/adminCoupon?pageNo="+(pageNo+1);
		}
		
	}else if(pageNo == ${pages.lastPage }){
		
		if((searchType.value != null && searchType.value != "none") && searchValue.value != null){
			location.href=url+"?searchType="+ searchType.value+"&searchValue="+searchValue.value+"&pageNo="+pageNo;
		}else{ 
			location.href="/adminCoupon?pageNo="+pageNo;
		}
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
			<h1>관리자 쿠폰발급 페이지</h1>
			<hr class="hr1">
			<table class="table">
				<tr class="table-header">
					<th class="col-1">쿠폰 유형</th>
					<th class="col-3">이벤트 넘버</th>
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
						<button class="btn btn-danger coupon_type" value="${row.coupon_type }">쿠폰삭제</button>
					</td>
				</tr>
				</c:forEach>
			</table>
			<button class="btn btn-primary" type="button" onclick="location.href='/adminCouponCreate';">쿠폰생성</button>
			<!-- 페이징 -->
			<div class="pagingBox">
				<ul class="pagingList">
					<li class="pageNo page_btn" onclick="moveBefore(1)"><i class="xi-backward xi-x"></i></li>
					<li class="pageNo page_btn" onclick="moveBefore(${pageNo})"><i class="xi-step-backward xi-x"></i></li>
					<c:forEach var="i" begin="${Math.floor((pageNo-1)/10)*10+1 }" end="${Math.floor((pageNo-1)/10)*10 +10 gt pages.lastPage ? pages.lastPage : Math.floor((pageNo-1)/10)*10 +10}">
						<li class="pageNo" onclick="move(${i })" <c:if test="${pageNo eq i }" >style="color:red; font-weight: bold;"</c:if>>${i }</li>
					</c:forEach>
					<li class="pageNo page_btn" onclick="moveNext(${pageNo})"><i class="xi-step-forward xi-x"></i></li>
					<li class="pageNo page_btn" onclick="moveNext(${pages.lastPage })"><i class="xi-forward xi-x"></i></li>
				</ul>
			</div>
			<br>
			
			<!-- 검색 -->
				<div class="searchForm">
					<form action="/adminCoupon" method="get" onsubmit="return search()">
						<select name="searchType" id="searchType">
							<option value="none">선택</option>
							<option value="title" <c:if test='${ pages.searchType eq "title"}'>selected</c:if>>쿠폰이름</option>
							<option value="writer" <c:if test='${ pages.searchType eq "writer"}'>selected</c:if>>쿠폰내용</option>
						</select>
						<input type="text" name="searchValue" id="searchValue" value="${pages.searchValue }">
						<button class="search_btn">검색</button>
					</form>
				</div>
		</div>	
	</div>
</div>
</body>
</html>