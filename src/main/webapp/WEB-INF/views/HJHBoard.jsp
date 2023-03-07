<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<link type="text/css" rel="stylesheet" href="/css/HJHBoard.css">
<title>HJHBoard</title>
</head>
<script type="text/javascript">
function paging(pageNo){
		if(pageNo=="-1"){
			window.location.href=referrer;
		}
		else{
		location.href="/HJHBoard?pageNo="+pageNo;
		}	
}

function check(){
	let searchContext = document.getElementById("searchContext");
	let keyword = document.getElementById("keyword");
	if(searchContext.value=="") {
		alert("입력해주세요");
		return false;
	}
	if(keyword.value=="none") {
		alert("검색어를 확인해주세요");
		return false;
	}
}

</script>
<body>
	<div class="menubar">메뉴바</div>
	<div class="container">
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
				<tr class="table-header">
					<td>${board.bno }</td>
					<td class="title">${board.b_title }</td>
					<td>${board.member_no }</td>
					<td>${board.b_date }</td>
					<td>${board.b_read }</td>
					<td>${board.b_like }</td>
				</tr>
			</c:forEach>
		</table>
		
		<!-- 페이징 -->
		<div class="pagingBox">
			<ul class="pagingList">
					<li class="pageNo" onclick="paging(1)">처음</li>
					<li class="pageNo" onclick="paging(1)">이전</li>
					<c:forEach var="page" items="${paging }">
						<li onclick="paging(${page})" class="pageNo">${page }</li>
					</c:forEach>
					<li class="pageNo" onclick="paging(1)">다음</li>
					<li class="pageNo" onclick="paging(1)">끝</li>
			</ul>
		</div>
		
<%-- 			<div th:if="${!list.isEmpty()}"> --%>
<!-- 				<ul class="pagination justify-content-center" -->
<%-- 					th:with="start=${(list.number / maxPage) * maxPage + 1}, end=(${(list.totalPages == 0) ? 1 : (start + (maxPage - 1) < list.totalPages ? start + (maxPage - 1) : list.totalPages)})"> --%>
<!-- 					<li class="page-item" -->
<%-- 						th:classappend="${!list.hasPrevious} ? 'disabled'"><a --%>
<%-- 						class="page-link" th:href="@{/board(pageNo=${pageNo - 1})}">이전</a> --%>
<!-- 					</li> -->

<!-- 					<li class="page-item" -->
<%-- 						th:each="page: ${#numbers.sequence(start, end)}" --%>
<%-- 						th:classappend="${page - 1 == list.number} ? 'active'"><a --%>
<%-- 						class="page-link" th:text="${page}" --%>
<%-- 						th:href="@{/board(pageNo=${page})}"></a></li> --%>

<!-- 					<li class="page-item" -->
<%-- 						th:classappend="${!list.hasNext} ? 'disabled'"><a --%>
<%-- 						class="page-link" th:href="@{/board(pageNo=${pageNo + 1})}">다음</a> --%>
<!-- 					</li> -->
<!-- 				</ul> -->
<!-- 			</div> -->

		<!-- 검색 -->
		<div class="searchForm">
			<form action="/search" method="get" onsubmit="return check()">
				<select name="keyword" id="keyword">
					<option value="none">선택</option>
					<option value="b_title">제목</option>
					<option value="member_no">글쓴이</option>
				</select>
				<input type="text" name="searchContext" id="searchContext">
				<button>검색</button>
			</form>
		</div>
		<!-- 글쓰기 -->
		<div class="write_btn">
			<button onclick="location.href='/boardWrite'">글쓰기</button>
		</div>
	</div>
</body>
</html>