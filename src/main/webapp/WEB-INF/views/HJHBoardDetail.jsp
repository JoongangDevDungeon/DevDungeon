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
<link type="text/css" rel="stylesheet" href="/css/layout.css">
<title>Board Detail</title>
</head>
<style>
body{
	margin:0;
	padding:0;
}
.container{	width:1200px; }
.detailBox{	height:850px; border:1px solid gray; }
.detailTop{
	margin:5px;
	height:100px;
	border:1px solid black;
}
.detailMid{
	margin:5px;
	height:600px;
	border:1px solid black;
	display: flex;
	flex-direction: column;
}
.userProfile{
	height:200px;
	border:1px solid black;
	position: relative;
	margin:5px;
	margin-top: auto;
}
.comment{
	margin:5px;
	height:130px;
	border:1px solid black;
}
.comments{
	margin-top:5px;
	height:200px;
	border:1px solid black;
}

</style>
<body>
	<%@ include file="top.jsp"%>
	<%@ include file="menu.jsp"%>
	<div class="container">
		<h1>Detail</h1>
		<div class="detailBox">
			<div class="detailTop">
			${boardDetail.board_title }
<%-- 			${boardDetail.member_name } --%>
<%-- 			${boardDetail.board_date } --%>
			</div>
			<div class="detailMid">중단
				<div class="userProfile">유저프로필</div>
			</div>
			<div class="comment">댓글쓰기</div>
		</div>
	<div class="comments">댓글내용</div>
	</div>
	<%@ include file="footer.jsp"%>

</body>
</html>