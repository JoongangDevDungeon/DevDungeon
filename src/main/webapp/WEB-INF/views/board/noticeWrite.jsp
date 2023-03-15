<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/img/Gazi_shortCut.png" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<link type="text/css" rel="stylesheet" href="/css/layout.css">
<title>Notice Write</title>
</head>
<style>
body {
	margin: 0;
	padding: 0;
}

a {
	text-decoration: none;
	color: black;
}

a:hover {
	color: #ccc;
}
.none{ width:252px; height:104px; line-height:48px; padding:0; margin:0; }
.container {
	width: 1200px;
	height: 100%;
	text-align: left;
}

.notice_tag {
	display: inline-block;
	margin: 10px;
	border-radius: 0px;
	border: 2px solid black;
	font-size: 20px;
}

.writeBox {
	height: 935px;
	border: 2px solid black;
	border-radius: 5px;
}

.writeTop {
	width: 100%;
	height: 60px;
}

.writeTitle {
	margin: 5px 5px 0px 0px;
	padding-left: 10px;
	height: 50px;
	border: 2px solid black;
	font-size: 20px;
	font-weight: bold;
	width: 1068px;
	border-radius: 5px;
}

.writeContent {
	margin: 5px;
	width: 1163px;
	height: 790px;
	border: 2px solid black;
	display: flex;
	flex-direction: column;
	font-size: 25px;
	border-radius: 5px;
	font-weight: bold;
	padding-left: 10px;
}

.btnBox {
	margin: 5px;
	height: 60px;
	line-height: 60px;
	float: right;
}

.writeBtn {
	display: inline-block;
	line-height: 50px;
	width: 100px;
	height: 50px;
	border: none;
	border-radius: 5px;
	color: white;
	font-weight: bold;
	margin-right: 5px;
	background-color: #90adac;
}

.noticeList {
	margin: 5px;
	float: right;
}

.fileUpload {
	padding: 5px;
	font-size: 17px;
	margin-top: 15px;
}
</style>
<script type="text/javascript">
	function check() {
		let writeTitle = document.getElementById("writeTitle");
		let writeContent = document.getElementById("writeContent");
		if (writeTitle.value == "") {
			alert("제목을 입력해주세요");
			writeTitle.focus();
			return false;
		}
		if (writeContent.value == "") {
			alert("내용을 입력해주세요");
			writeContent.focus();
			return false;
		}

	}
</script>
<body>
	<%@ include file="../top.jsp"%>
	<%@ include file="../menu.jsp"%>
	<div class="main">
		<div class="add1">광고1</div>
		<div class="content">
			<div class="container">
				<div class="writeTop">
					<h1	style="display: inline-block; font-weight: bold; padding-left: 10px;">Notice Write</h1>
					<input type="button" class="writeBtn noticeList" onclick="location.href='/notice'" value="목록">
				</div>
				<div class="writeBox">
					<form action=
					<c:choose>
						<c:when test="${noticeDetail.notice_no ne null }">"/noticeWrite?notice_no=${noticeDetail.notice_no}"</c:when>
						<c:otherwise>"/noticeWrite"</c:otherwise>
					</c:choose>
					 method="post" onsubmit="return check()" enctype="multipart/form-data">
						<select class="notice_tag" name="notice_tag" id="notice_tag">
							<option value="1">공지</option>
						</select>
						<input type="text" name="writeTitle" id="writeTitle" class="writeTitle" placeholder="제목을 입력하세요" <c:if test="${noticeDetail.notice_title ne null }">value="${ noticeDetail.notice_title }"</c:if>>
						<textarea name="writeContent" id="writeContent"	class="writeContent" placeholder="내용을 입력하세요"><c:if test="${noticeDetail.notice_content ne null }">${ noticeDetail.notice_content }</c:if></textarea>
						<input type="file" class="fileUpload">
						<div class="btnBox">
							<button class="writeBtn" style="background-color: #6867AC;">
							<c:choose>
								<c:when test="${noticeDetail.notice_no ne null }">수정</c:when>
								<c:otherwise>저장</c:otherwise>
							</c:choose>
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="add2">광고2</div>
	</div>
	<%@ include file="../footer.jsp"%>

</body>
</html>