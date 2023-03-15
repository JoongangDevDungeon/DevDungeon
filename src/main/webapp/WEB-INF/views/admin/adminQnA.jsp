<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Favicon-->
<link rel="icon" href="/img/admin/adminGazi.png" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<title>admin QnA</title>
<link rel="stylesheet" href="/css/admin.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script type="text/javascript">function url(link){location.href="/"+link;}</script>
<script type="text/javascript" src="/js/admin/AdminQnAPaging.js"></script>
<script type="text/javascript" src="/js/admin/AdminQnASearch.js"></script>
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
			location.href="/adminQnA?pageNo="+(pageNo+1);
		}
		
	}else if(pageNo == ${pages.lastPage }){
		
		if((searchType.value != null && searchType.value != "none") && searchValue.value != null){
			location.href=url+"?searchType="+ searchType.value+"&searchValue="+searchValue.value+"&pageNo="+pageNo;
		}else{ 
			location.href="/adminQnA?pageNo="+pageNo;
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
			<h1>관리자 QnA FAQ 페이지</h1>
			<hr class="hr1">
			<table class="table">
				<tr class="table-header">
					<td class="col-1">보드 번호</td>
					<td class="col-1">멤버 번호</td>
					<td class="col-2">질문 제목</td>
					<td class="col-3">질문 내용</td>
					<td class="col-1">질문한 날짜</td>
					<td class="col-1">답변상태</td>								
				</tr>
				<c:forEach items="${qna }" var="row">
					<tr>
						<td>${row.question_board_no}</td>
						<td>${row.member_no }</td>
						<td>${row.question_board_title }</td>
						<td>${row.question_board_content }</td>
						<td>${row.question_board_date }</td>
						<td>
							<c:choose>
								<c:when test="${row.question_board_status eq 0}">
									<form action="/adminAnswer">
										<input type="hidden" value="${row.question_board_no}" name="qnaNo">
										<button class="btn btn-success" onclick="location.href='/adminAnswer'">답변달기</button>
									</form>
								</c:when>
								<c:otherwise>
									<!-- 답변 수정으로 변경 해야할듯 -->
									<div class="btn btn-primary btn1">답변완료</div>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
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
				<form action="/adminQnA" method="get" onsubmit="return search()">
					<select name="searchType" id="searchType">
						<option value="none">선택</option>
						<option value="title" <c:if test='${ pages.searchType eq "title"}'>selected</c:if>>제목</option>
						<option value="writer" <c:if test='${ pages.searchType eq "writer"}'>selected</c:if>>내용</option>
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