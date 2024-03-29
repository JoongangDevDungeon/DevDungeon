<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/img/Gazi_shortCut.png" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<link type="text/css" rel="stylesheet" href="/css/HJHBoard.css">
<link type="text/css" rel="stylesheet" href="/css/layout.css">
<script type="text/javascript" src="/js/NoticePaging.js"></script>
<script type="text/javascript" src="/js/search.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<title>Notice</title>
</head>
<style>
h6{
	display: inline-block; 
	width:20px; 
	height:20px; 
	background-color: red;
	line-height: 20px;
	text-align: center;
	color:white;
	border-radius: 5px;
}
.notice_tag{
	display: inline-block;
	width:50px;
	height:30px;
	background-color: red;
	line-height: 30px;
	color:white;
	border-radius: 5px;
	font-weight: bold;
}
.none{ width:252px; height:104px; line-height:48px; padding:0; margin:0; }
</style>
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
			location.href="/notice?pageNo="+(pageNo+1); 
		}
		
	}else if(pageNo == ${pages.lastPage }){
		
		if((searchType.value != null && searchType.value != "none") && searchValue.value != null){
			location.href=url+"?searchType="+ searchType.value+"&searchValue="+searchValue.value+"&pageNo="+pageNo;
		}else{ 
			location.href="/notice?pageNo="+pageNo;
		}
	}
}
</script>
<body>
	<%@ include file="../top.jsp" %>
	<%@ include file="../menu.jsp" %>
	<div class="main">
		<div class="add1">광고1</div>
		<div class="content">
			<div class="container">
				<h1>N O T I C E</h1>
				<table class="table">
					<tr class="table-header">
						<th class="col-1">구분</th>
						<th class="col-1">번호</th>
						<th class="col-6">제목</th>
						<th class="col-1">글쓴이</th>
						<th class="col-1">날짜</th>
						<th class="col-1">조회수</th>
						<th class="col-1">좋아요</th>
					</tr>
					<c:forEach var="notice" items="${list }">
						<tr>
							<td><span class="notice_tag">${notice.tag_name }</span></td>
							<td>${notice.nno }</td>
							<td class="title text-truncate" style="max-width:1px;"><a href="/noticeDetail?notice_no=${notice.notice_no }">${notice.notice_title }
							<c:if
									test="${b.isFile gt 0 }">
									<i class="xi-file-image-o"></i>
								</c:if>
							<c:if test="${ notice.comment_cnt ne 0 }"><h6>${ notice.comment_cnt }</h6></c:if></a></td>
							<td>${notice.admin_id}</td>
							<td>${notice.notice_date }</td>
							<td>${notice.notice_read }</td>
							<td>${notice.notice_like }</td>
						</tr>
					</c:forEach>
				</table><br><br><br><br>
				<!--페이징 -->
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
					<form action="/board/HJHBoard" method="get" onsubmit="return search()">
						<select name="searchType" id="searchType">
							<option value="none">선택</option>
							<option value="title" <c:if test='${ pages.searchType eq "title"}'>selected</c:if>>제목</option>
							<option value="writer" <c:if test='${ pages.searchType eq "writer"}'>selected</c:if>>글쓴이</option>
						</select>
						<input type="text" name="searchValue" id="searchValue" value="${pages.searchValue }">
						<button class="search_btn">검색</button>
					</form>
				</div>
				<!-- 관리자 페이지 이동 -->
				<div class="write">
					<c:if test="${sessionScope.id eq 'admin' }">
						<button class="write_btn" style="background-color: #ff3d3d; margin-right: 10px;" onclick="location.href='/admin'">관리자</button>
					</c:if>
				<!-- 글쓰기 -->
					<c:if test="${sessionScope.id eq 'admin' }">
						<button class="write_btn" onclick="location.href='/noticeWrite'">글쓰기</button>
					</c:if>
				</div>
			</div>
		</div>
		<div class="add2">광고2</div>
	</div>
	<%@ include file="../footer.jsp" %>
</body>
</html>