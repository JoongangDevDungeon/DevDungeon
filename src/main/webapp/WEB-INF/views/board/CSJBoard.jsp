<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>메인 화면</title>
<link rel="icon" href="/img/Gazi_shortCut.png" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/layout.css">
<script>
function detail(bno){
	location.href="/csjRead?bno="+bno;
}
</script>
</head>
<body>
	<%@include file="../top.jsp"%>
	<%@include file="../menu.jsp"%>
	<section>
		<div class="main">
			<div class="add1">광고1</div>
			<div class="content">
				<div>
				<h1 onclick="location.href='csjboard'">BOARD NAME HERE</h1>
					<div>
						<table class="table table-striped">
							<tr>
								<th class="col-1">구분</th>
								<th class="col-1">번호</th>
								<th class="col-5">제목</th>
								<th class="col-2">글쓴이</th>
								<th class="col-1">날짜</th>
								<th class="col-1">조회수</th>
								<th class="col-1">좋아요</th>
							</tr>
							<c:forEach items="${list }" var="b">
								<tr>
									<td>${b.tag_name }</td>
									<td>${b.board_no }</td>
									<td onclick="detail(${b.board_no})" class="text-truncate" style="max-width:1px;">${b.board_title }
									<c:if test="${b.comment_cnt ne 0 }">[${b.comment_cnt}]</c:if></td>
									<td class="text-truncate" style="max-width:1px;">${b.member_name }</td>
									<td>${b.board_date }</td>
									<td>${b.board_read }</td>
									<td>${b.board_like }</td>
								</tr>
							</c:forEach>
						</table>

					</div>
					<%@ include file="CSJpaging.jsp"%>
					<div class="searchForm">
						<form action="csjboard" method="get" id="searchForm">
							<select name="searchType">
								<option value="title">제목</option>
								<option value="writer"
									<c:if test='${searchType eq "writer"}'>selected</c:if>>글쓴이</option>
							</select> <input type="text" name="searchValue" value="${searchValue }">
							<button class="btn btn-primary">검색</button>
						</form>
					</div>
					<c:if test="${sessionScope.member_name ne null }">
					<div  style="display:flex; justify-content:end;">
					<button class="btn btn-primary" onclick="location.href='/csjWrite'">글쓰기</button>
					</div>
					</c:if>
				</div>

			</div>
			<div class="add2">광고2</div>
		</div>
	</section>
	<%@include file="../footer.jsp"%>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
</html>
