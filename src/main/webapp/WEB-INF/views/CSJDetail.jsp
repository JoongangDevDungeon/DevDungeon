<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>${det.board_title}</title>
<link rel="icon" href="/img/Gazi_shortCut.png" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="/css/layout.css">
<script>
$(document).ready(function(){
	$("#boardBtnLike").click(function(){
		let no = $(this).attr("value");
		if(confirm("추천 하시겠습니까?")){
			location.href="/likethis?bno="+no;
		}
	});
	$(".commentSub").toggle(0,false);
	$(".commentBanBtn").click(function(){
		var no = $(this).val();
		alert(no+"번 댓글을 신고합니다");
	});
	$("#boardBtnBan").click(function(){
		var no = $(this).val();
		alert(no+"번 글을 신고합니다");
	});
	$(".commentShowBtn").click(function(){
		var no = $(this).val();
		var txt = $(this).text();
		var btn = $(this);
		$(".sub"+no).toggle(0,function(){
			if(txt=="show"){
				btn.text("hide");			
			}else{
				btn.text("show");
			}
		});
	});

});
</script>
<style>
.commentAll{
	background-color: pink;
	text-align: left;
}
.detailTitle{
	
	height:30px;
	font-size:20px;
	text-align: left;
	border:1px solid black;
}
.detailInfo{
	height:30px;
	border:1px solid black;
}
.detailContent{
	text-align: left;
	border:1px solid black;
	min-height: 400px;
}
.detailUserProfile{
	background-color: skyblue;
}
.detailBtnZone{
	text-align: right;
}
.commentInput{
	width:1090px;
	height:100px;
	box-sizing: border-box;
}
#commentEnterBtn{
	width:100px;
	height:100px;
	box-sizing: border-box;
}
.commentZone{
	min-height: 100px;
}
.commentSub{
	padding-left: 50px;
}
.commentBtnZone{
	text-align: right;
}
</style>
</head>
<body>
   <%@include file="top.jsp"%>
   <%@include file="menu.jsp"%>
   <section>
         <div class="main">
            <div class="add1">광고1</div>
            <div class="content">
            <div class="detailBody">
				<div class="detailTitle">제목 : ${det.board_no }</div>
				<div class="detailInfo">글쓴이 ${det.member_name } 날짜 ${det.board_date } 조회수 ${det.board_read }</div>
				<div class="detailContent">본문 ${det.board_content }</div>
			<div class="detailUserProfile">
				유저프로필 ${mem.member_name }<br>${mem.member_email }
			</div>
			<button id="boardBtnLike" class="btn btn-success" value="${det.board_no }">추천 ${det.board_like }</button>
			<button id="boardBtnBan" class="btn btn-danger" value="${det.board_no }">신고</button>
			</div>
			<br>
			<div class="detailBtnZone">
			<button class="btn btn-primary" >삭제</button>
			<button class="btn btn-primary" >수정</button>
			<button class="btn btn-primary" onclick="location.href='/csjboard'">목록</button>
			<button class="btn btn-primary" onclick="location.href='/csjWrite'">글쓰기</button>
			</div>
			<div class="CommentAll">
				<c:forEach items="${comment }" var="c">
					<div id="commentZone" <c:if test="${c.comment_depth ne 0}">class="commentSub sub${c.comment_root }"</c:if>>					
						<c:if test="${c.comment_depth ne 0 }">└</c:if>
						<div><span>${c.member_name }</span><span>		
						${c.comment_time }</span></div>
						<div>${c.comment_content }</div>		
						<div class="commentBtnZone"><button class="commentBanBtn" value="${c.comment_no }">신고</button>	
						<c:if test="${c.comment_no eq c.comment_root }"><button class="commentShowBtn" value="${c.comment_no }">show</button></c:if>
						</div>
						<hr>
					</div>	
				</c:forEach>
				<div id="commentEnter">
					<form id="commentForm" action="csjcommentWrite" method="post">
						<input type="text" class="commentInput" name="commentContent">
						<button id="commentEnterBtn">댓글 입력</button>
					</form>
				</div>
			</div>
			
            </div>
            <div class="add2">광고2</div>
         </div>
   </section>
   <%@include file="footer.jsp"%>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</html>