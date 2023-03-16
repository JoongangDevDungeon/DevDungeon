<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 페이지</title>
<link type="text/css" rel="stylesheet" href="/css/HJHBoard.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
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
	function detail(bno) {
		location.href = "/eventDetail?bno=" + bno;
	}
</script>
<style>
.eventBanner{ 
	width:390px;
	height:310px;
	float:left; 
	border:2px solid black;
	box-sizing: border-box;
	cursor: pointer;
/* 	margin: 0px 5px 5px 0px; */
	margin:5px;
	border-radius: 5px;
}
.eventBanner:hover{ background-color: #d3d3d3; }
</style>
</head>
<body>
	<%@include file="../top.jsp"%>
	<%@include file="../menu.jsp"%>
	<section>
		<div class="main">
			<div class="add1">광고1</div>
			<div class="content">
				<!-- 이 곳을 수정하여 사용해주세요. -->
					<h1 onclick="location.href='eventboard'">E v e n t</h1>
					<div style="width:1200px; height:650px;">
						<ul style="width:1200px;list-style:none; padding:0;">
						<c:forEach items="${list }" var="e">
							<li class="eventBanner" onclick="detail(${e.event_no})">
								<c:choose>
									<c:when test="${e.imageDataString ne null }">
									<img src="data:image/png;base64,${e.imageDataString}" style="width:100%;height:270px;" />
									</c:when>
									<c:otherwise>
									<img src="/img/logo.png" width="100%" height="270px">
									</c:otherwise>
								</c:choose>
								<b>${e.event_title }</b>
							</li>
						</c:forEach>
						</ul>
					</div>
					<%@ include file="CSJpaging.jsp"%>
					<br>
					<div class="searchForm" style="float:none;">
						<form action="eventboard" method="get" id="searchForm">
							<select name="searchType">
								<option value="title">제목</option>
							</select> <input type="text" name="searchValue" value="${searchValue }">
							<button class="search_btn">검색</button>
						</form>
					</div>
				</div>
			<div class="add2">광고2</div>
		</div>
	</section>
	<%@include file="../footer.jsp"%>
</body>
<script>
	$(function() {
		var error_msg = "${error_msg}";
		if (error_msg == "login_fail")
			alert("아이디와 비밀번호를 확인해주세요.");
	});
</script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
</html>
