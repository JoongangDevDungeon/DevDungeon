<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/img/Gazi_shortCut.png" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
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
.container{	width:1200px; height:100%; }
.detailBox{	height:1000px; border:1px solid gray; }
.detailTop{
	margin:5px;
	height:50px;
	border:1px solid black;
	font-size:20px;
	font-weight:bold;
	display: flex;
}
.detailTop_item{
	width:100px;
	height:100%;
	line-height:50px;
	margin-left:5px;
	font-size: 20px;
}
.detailTop_item:nth-child(1){ flex-grow:2; }
.detailMid{
	margin:5px;
	height:790px;
	border:1px solid black;
	display: flex;
	flex-direction: column;
	font-size: 25px;
}
.detailMid_item{ margin-left:5px; }
.userProfile{
	height:150px;
	border:1px solid black;
	margin:5px;
	margin-top: auto;
}
.btnBox{
	margin:5px;
	height:60px;
	border:1px solid black;
	text-align: center;
	line-height:60px;
}
.btnBox_1{
	margin-left: 200px;
	display:inline-block;
}
.btnBox_2{
	display:inline-block;
	float:right;
}
.detailBtn{
	line-height:50px;
	width:50px;
	height:50px;
	border:none;
	border-radius: 5px;
	color:white;
	font-weight: bold;
}
.boardList{
	width:100px;
	margin-right:5px;
	background-color: #90adac;
	display: inline-block;
	text-decoration: none;
}
.commentBox{
	margin:5px;
	height:70px;
	border:1px solid black;
	line-height: 70px;
}
.commentText{
	width:1000px; 
	height:60px; 
	font-size: 20px;
	margin-left:5px;

}
.commentBtn{
	margin-left:10px;
	width:130px; 
	height:60px;
	border:none;
	border-radius: 5px;
	background-color: #7a14ff;
	color:white;
	font-weight: bold;
	line-height:60px;
}
.commentBtn_1{
	width:40px;
	height:40px;
	border:none;
	color:white;
	border-radius: 5px;
}
.comments{
	margin-top:10px;
	height:100%;
	font-size:20px;
}
.commentWrited{
	border-bottom: 1px solid black;
}
.i{

}
.commentDropdown{
	float:right;
	margin-right:20px;
	border:none;
	border-radius: 5px;
	background-color: white;
}
</style>
<script type="text/javascript">
$(function(){

	$(".commentDropdown").click(function(){
		$(".subComment").toggle();
	});
	
});


function check(){
	let commentText = document.getElementById("commentText");
	if(commentText.value ==""){
		alert("댓글을 입력하세요");
		return false;
	}
}
// function dropdown(value){
// 	let down =  document.getElementsByClassname("subComment");
// 	if(value==1){
// 		$(selector).hide(speed,callback);
// 	}
// }

</script>
<body>
	<%@ include file="top.jsp"%>
	<%@ include file="menu.jsp"%>
	<div class="container">
		<h1>Detail</h1>
		<div class="detailBox">
			<div class="detailTop">
				<div class="detailTop_item">${boardDetail.board_title }</div>
				<div class="detailTop_item">${boardDetail.member_name }</div>
				<div class="detailTop_item">${boardDetail.board_date }</div>
			</div>
			<div class="detailMid">
			<div class="detailMid_item">${boardDetail.board_content }</div>
				<div class="userProfile">유저프로필</div>
			</div>
			<div class="btnBox">
				<div class="btnBox_1">
					<button class="detailBtn" style="background-color: #3dcc00;"><i class="xi-thumbs-up "></i></button> 
					<button class="detailBtn" style="background-color: #ff8080;"><img src="/img/siren.png"></button>
<!-- 					style="background-color: #ff8080;" -->
				</div>
				<div class="btnBox_2">
					<button class="detailBtn" style="background-color: #ffc414;"><i class="xi-save "></i></button> 
					<button class="detailBtn" style="background-color: #ff3d3d;"><i class="xi-trash-o "></i></button> 
					<button class="detailBtn boardList" onclick="location.href='/HJHBoard'">목록</button>
				</div>
			</div>
			<div class="commentBox">
				<form action="/HJHComment" method="post" onsubmit="return check()">
					<input type="hidden" value="${boardDetail.board_no }" name="board_no">
					<input type="text" class="commentText" name="commentText" id="commentText" placeholder="댓글을 입력하세요">
					<button class="commentBtn">댓글쓰기</button>
				</form>
			</div>
		</div>
		<c:forEach var="comment" items="${ detailComments }">			
				<div class="comments <c:if test="${ comment.comment_depth eq 1 }"> subComment </c:if>">
					<div class="commentWrited ">${ comment.member_name } ${ comment.comment_time } 
						<button class="commentBtn_1" style="background-color: #ff8080;"><img src="/img/siren.png"></button>
						<c:if test="${comment.comment_depth eq 0 }">
							<button class="commentDropdown"><i class="xi-caret-down "></i></button>
						</c:if>
					</div>
					<div>${ comment.comment_content }</div>
				</div>
		</c:forEach>
	</div><br>
	<%@ include file="footer.jsp"%>

</body>
</html>