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
<script type="text/javascript" src="/js/admin/AdminMemberPaging.js"></script>
<script type="text/javascript" src="/js/admin/AdminMemberSearch.js"></script>
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
			location.href="/adminMember?pageNo="+(pageNo+1);
		}
		
	}else if(pageNo == ${pages.lastPage }){
		
		if((searchType.value != null && searchType.value != "none") && searchValue.value != null){
			location.href=url+"?searchType="+ searchType.value+"&searchValue="+searchValue.value+"&pageNo="+pageNo;
		}else{ 
			location.href="/adminMember?pageNo="+pageNo;
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
		<h1>관리자 사용자 관리 페이지</h1>
		<hr class="hr1">
			<table class="table">
					<tr class="table-header">
						<td class="col-1">멤버번호</td>
						<td class="col-3">이름</td>
						<td class="col-2">멤버 아이디</td>
						<td class="col-2">멤버 번호</td>
						<td class="col-1">멤버 이메일</td>
						<td class="col-1">생일</td>
						<td class="col-2">멤버상태변경</td>								
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
						<input type="hidden" name="pageNo" value="${pageNo }">
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