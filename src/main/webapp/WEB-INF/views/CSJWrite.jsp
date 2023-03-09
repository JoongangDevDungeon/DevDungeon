<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Of CSJ</title>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<link rel="icon" href="/img/favicon.png" />
</head>
<body>
	<div id="container">
		<div class="header">
<%-- 			<%@ include file="menu.jsp"%> --%>
		</div>
		<div class="main">
			<h1>BOARD NAME HERE</h1>
			<div class="writeForm">
				<form action="csjWrite" method="post" enctype="multipart/form-data">
					<input type="hidden" name="category" value="1">
					<input type="hidden" name="tag" value="1">
					<input type="text" name="title" class="form-control">
					<textarea name="content" class="form-control" rows="20"></textarea>
					<input type="file" name="file" accept="image/*">
					<button class="btn btn-primary">글쓰기</button>
				</form>
				<button class="btn btn-primary">목록</button>
			</div>
		</div>
		<div class="footer">
		
		</div>
	</div>
</body>
</html>