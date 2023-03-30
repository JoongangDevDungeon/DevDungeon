<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Favicon-->
<link rel="icon" href="/img/admin/adminGazi.png" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<title>adminBoard</title>
<link rel="stylesheet" href="/css/admin.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script type="text/javascript">function url(link){location.href="/"+link;}</script>
<script type="text/javascript" src="/js/admin/AdminBoardPaging.js"></script>
<script type="text/javascript" src="/js/admin/AdminBoardSearch.js"></script>
</head>
<script type="text/javascript">
function moveNext(pageNo){	//페이지 뒤쪽 버튼
	let searchType = document.getElementById("searchType");
	let searchValue = document.getElementById("searchValue");
	let url =  document.location.href.split("?",1);
	
	if(pageNo > ${pages.lastPage } ) { return false; }
	else if (pageNo != ${pages.lastPage } ){
		
		if((searchType.value != null && searchType.value != "none") && searchValue.value != null){
			location.href=url+"?searchType="+ searchType.value+"&searchValue="+searchValue.value+"&pageNo="+(pageNo+1);
		}else{
			location.href="/adminBoard?pageNo="+(pageNo+1);
		}
		
	}else if(pageNo == ${pages.lastPage }){
		
		if((searchType.value != null && searchType.value != "none") && searchValue.value != null){
			location.href=url+"?searchType="+ searchType.value+"&searchValue="+searchValue.value+"&pageNo="+pageNo;
		}else{ 
			location.href="/adminBoard?pageNo="+pageNo;
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
			<h1>관리자 게시글 관리
			<button class="btn btn-primary" onclick="location.href='/csjboard'">최보드</button>
			<button class="btn btn-primary" onclick="location.href='/board/HJHBoard'">홍보드</button>
			</h1>
			<hr class="hr1">
			<table class="table">
				<tr class="table-header">
					<th class="col-1">번호</th>
					<th class="col-4">제목</th>
					<th class="col-2">글쓴이</th>
					<th class="col-1">날짜</th>
					<th class="col-1">조회수</th>
					<th class="col-1">신고수</th>
					<th class="col-1">상태</th>
				</tr>
				<c:forEach items="${list }" var="row">
				<tr>
					<td>${row.board_no }</td>
					<td><a href="/adminBoardDetail?board_no=${row.board_no }">${row.board_title }</a></td>
					<td>${row.member_id }</td>
					<td>${row.formatted_date }</td>
					<td>${row.board_read }</td>
					<td>
    					<c:if test="${not empty row.ban_count}"><a href="/adminBanBoard?board_no=${row.board_no}">${row.ban_count}</a>
    					</c:if><c:if test="${empty row.ban_count}">0</c:if>
					</td>
					<td>
						<form action="/adminBoard" method="post">
							<input type="hidden" name="board_no" value="${row.board_no }">
							<input type="hidden" name="status_no" value="${row.status_no }">
							<input type="hidden" name="pageNo" value="${pageNo }">
							<input type="hidden" name="url" value="/adminBoard">
							<button type="submit" class="${row.status_no eq '1' ? 'btn btn-primary' : 'btn btn-danger'}">${row.status_no eq '1' ? 'ON' : 'OFF'}</button>
						</form>
					</td>
				</tr>
				</c:forEach>
			</table><br>
			
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
					<form action="/adminBoard" method="get" onsubmit="return search()">
						<select name="searchType" id="searchType">
							<option value="none">선택</option>
							<option value="title" <c:if test='${ pages.searchType eq "title"}'>selected</c:if>>제목</option>
							<option value="writer" <c:if test='${ pages.searchType eq "writer"}'>selected</c:if>>글쓴이</option>
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