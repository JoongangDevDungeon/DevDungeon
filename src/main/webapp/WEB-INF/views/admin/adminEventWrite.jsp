<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Favicon-->
<link rel="icon" href="/img/admin/adminGazi.png" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<title>이벤트 작성 페이지</title>
<link rel="stylesheet" href="/css/admin.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script type="text/javascript">function url(link){location.href="/"+link;}</script>
</head>
<script type="text/javascript">
function Event_btn() {
	let EventTag = document.getElementById("EventTag").value;
	let EventTitle = document.getElementById("EventTitle").value;
	let EventContent = document.getElementById("EventContent").value;
	let EventEndDate = document.getElementById("EventEndDate").value;

	if(EventTag === 4 || EventTitle === "" || EventContent === "" || EventEndDate ===""){
		alert("모든 항목을 입력해주세요");
	} else{
		document.getElementById("EventForm").submit();
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
			<h1>관리자 이벤트 작성</h1>
			<hr class="hr1">
			<br><br>
			<div class="adminEvent">
				<form action="/adminEventWrite" method="post" id="EventForm">
					<input type="hidden" name="eventTag" value="4" id="EventTag">
					<input type="text" class="form-control" name="eventTitle" id="EventTitle" placeholder="이벤트 제목입력"><br>
					<input type="textarea" class="form-control EventTxt" name="eventContent" id="EventContent" placeholder="이벤트 내용입력"><br>
					이벤트 만료일 : <input type="date" name="EventEndDate" id="EventEndDate"><br><br>
					<button class="btn btn-success" type="button" onclick="Event_btn()">게시글 올리기</button>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>