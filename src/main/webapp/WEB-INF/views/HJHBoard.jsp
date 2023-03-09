<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>HJHBoard</title>
</head>
<script type="text/javascript">
function moveBefore(pageNo){	//페이징 시작
	let searchType = document.getElementById("searchType");
	let searchValue = document.getElementById("searchValue");
	let url =  document.location.href.split("?",1);
	if(pageNo < 1) { return false; }
	else if (pageNo != 1){
		if((searchType.value != null && searchType.value != "none") && searchValue.value != null){
			location.href=url+"?searchType="+ searchType.value+"&searchValue="+searchValue.value+"&pageNo="+(pageNo-1);
		}else{
			location.href="/HJHBoard?pageNo="+(pageNo-1);
		}
	}else{
		if((searchType.value != null && searchType.value != "none") && searchValue.value != null){
			location.href=url+"?searchType="+ searchType.value+"&searchValue="+searchValue.value+"&pageNo="+1;
		}else{
			location.href="/HJHBoard?pageNo="+1;
		}
	}
}
function moveNext(pageNo){
	let searchType = document.getElementById("searchType");
	let searchValue = document.getElementById("searchValue");
	let url =  document.location.href.split("?",1);
	if(pageNo > ${pages.lastPage } ) { return false; }
	else if (pageNo != ${pages.lastPage } ){
		if((searchType.value != null && searchType.value != "none") && searchValue.value != null){
			location.href=url+"?searchType="+ searchType.value+"&searchValue="+searchValue.value+"&pageNo="+(pageNo+1);
		}else{
			location.href="/HJHBoard?pageNo="+(pageNo+1);
		}
	}else if(pageNo == ${pages.lastPage }){
		if((searchType.value != null && searchType.value != "none") && searchValue.value != null){
			location.href=url+"?searchType="+ searchType.value+"&searchValue="+searchValue.value+"&pageNo="+pageNo;
		}else{
			location.href="/HJHBoard?pageNo="+pageNo;
		}
	}
	
}
function move(pageNo){
	let searchType = document.getElementById("searchType");
	let searchValue = document.getElementById("searchValue");
	let url =  document.location.href.split("?");
	if((searchType.value != null && searchType.value != "none") && searchValue.value != null){
		location.href=url[0]+"?searchType="+ searchType.value+"&searchValue="+searchValue.value+"&pageNo="+pageNo;
	}else{
		location.href="/HJHBoard?pageNo="+pageNo;
	}
	
}//페이징 끝


function check(){	//검색 체크
	let searchType = document.getElementById("searchType");
	let searchValue = document.getElementById("searchValue");
	if(searchType.value=="none") {
		alert("검색 항목을 선택해주세요");
		return false;
	}
	if(searchValue.value=="") {
		alert("검색어를 입력해주세요");
		return false;
	}
}
</script>
<body>
	<%@ include file="top.jsp" %>
	<%@ include file="menu.jsp" %>
	<div class="container">
		<h1>B O A R D</h1>
		<table class="table">
			<tr class="table-header">
				<th class="col-1">번호</th>
				<th class="col-5">제목</th>
				<th class="col-2">글쓴이</th>
				<th class="col-2">날짜</th>
				<th class="col-1">조회수</th>
				<th class="col-1">좋아요</th>
			</tr>
			<c:forEach var="board" items="${list }">
				<tr>
					<td>${board.bno }</td>
					<td class="title"><a href="/HJHBoardDetail?board_no=${board.board_no }">${board.board_title }</a></td>
					<td>${board.member_name}</td>
					<td>${board.board_date }</td>
					<td>${board.board_read }</td>
					<td>${board.board_like }</td>
				</tr>
			</c:forEach>
		</table>
		<!-- 페이징 -->
		<div class="pagingBox">
			<ul class="pagingList">
				<li class="pageNo page_btn" onclick="moveBefore(1)"> << </li>
				<li class="pageNo page_btn" onclick="moveBefore(${pageNo})" > < </li>
				<c:forEach var="i" begin="${Math.floor((pageNo-1)/10)*10+1 }" 
					end="${Math.floor((pageNo-1)/10)*10 +10 gt pages.lastPage ? pages.lastPage : Math.floor((pageNo-1)/10)*10 +10}" >
					<li class="pageNo" onclick="move(${i })" <c:if test="${pageNo eq i }" >style="color:red; font-weight: bold;"</c:if>>${i }</li>
				</c:forEach>
				<li class="pageNo page_btn" onclick="moveNext(${pageNo})"> > </li>
				<li class="pageNo page_btn" onclick="moveNext(${pages.lastPage })"> >> </li>
			</ul>
		</div><br>
		<!-- 검색 -->
		<div class="searchForm">
			<form action="/HJHBoard" method="get" onsubmit="return check()">
				<select name="searchType" id="searchType">
					<option value="none">선택</option>
					<option value="title" <c:if test='${ pages.searchType eq "title"}'>selected</c:if>>제목</option>
					<option value="writer" <c:if test='${ pages.searchType eq "writer"}'>selected</c:if>>글쓴이</option>
				</select>
				<input type="text" name="searchValue" id="searchValue" value="${pages.searchValue }">
				<button class="search_btn">검색</button>
			</form>
		</div>
		<!-- 글쓰기 -->
		<div class="write">
			<button class="write_btn"onclick="location.href='/HJHBoardWrite'">글쓰기</button>
		</div>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>