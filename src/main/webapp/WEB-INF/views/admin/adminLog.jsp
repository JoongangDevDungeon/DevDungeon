<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Favicon-->
<link rel="icon" href="/img/admin/adminGazi.png" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<title>admin log</title>
<link rel="stylesheet" href="/css/admin.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script type="text/javascript">function url(link){location.href="/"+link;}</script>
<script type="text/javascript" src="/js/admin/AdminLogPaging.js"></script>
<script type="text/javascript" src="/js/admin/AdminLogSearch.js"></script>
</head>
<script type="text/javascript">
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
			location.href="/adminLog?pageNo="+(pageNo+1);
		}
		
	}else if(pageNo == ${pages.lastPage }){
		
		if((searchType.value != null && searchType.value != "none") && searchValue.value != null){
			location.href=url+"?searchType="+ searchType.value+"&searchValue="+searchValue.value+"&pageNo="+pageNo;
		}else{ 
			location.href="/adminLog?pageNo="+pageNo;
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
			<h1>관리자 로그 데이터 페이지</h1>
			<hr class="hr1">
			<table class="table">
				<tr class="table-header">
					<th class="col-1">번호</th>
					<th class="col-1">접근 경로</th>
					<th class="col-2">접근 주소</th>
					<th class="col-2">상태 코드</th>
					<th class="col-2">로그 시간</th>
					<th class="col-2">ip 주소</th>
					<th class="col-3">파라미터값</th>
				</tr>
				<!-- 수정 하면댐 -->
				<c:forEach items="${list }" var="row">
				<tr>
					<td>${row.id }</td>
					<td>${row.method }</td>
					<td>${row.path }</td>
					<td>${row.status_code }</td>
					<td>${row.created_at }</td>
					<td>${row.ip }</td>
					<td>${row.params }</td>
					<td>
						<form action="/adminBoard" method="post">
							<input type="hidden" name="board_no" value="${row.board_no }">
							<input type="hidden" name="status_no" value="${row.status_no }">
							<input type="hidden" name="pageNo" value="${pageNo }">
						</form>
					</td>
				</tr>
				</c:forEach>
				<!-- 수정 하면댐 -->
			</table>
			
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
				<form action="/adminLog" method="get" onsubmit="return search()">
					<select name="searchType" id="searchType">
						<option value="none">선택</option>
						<option value="status_code" <c:if test='${ pages.searchType eq "status_code"}'>selected</c:if>>상태코드</option>
						<option value="path" <c:if test='${ pages.searchType eq "path"}'>selected</c:if>>접근경로</option>
						<option value="ip" <c:if test='${ pages.searchType eq "ip"}'>selected</c:if>>ip주소</option>
						<option value="params" <c:if test='${ pages.searchType eq "params"}'>selected</c:if>>파라미터</option>
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