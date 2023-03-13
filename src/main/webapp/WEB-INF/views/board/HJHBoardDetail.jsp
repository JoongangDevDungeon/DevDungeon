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
<link type="text/css" rel="stylesheet" href="/css/HJHBoard.css">
<title>Board Detail</title>
</head>
<style>
.container{	width:1200px; height:100%; }

</style>
<script type="text/javascript">
$(function(){ //제이쿼리 시작
	
	$(".subComment").toggle();
	$(".subArrow").toggle();
	$(".c_subComment").toggle();
	$(".c_subArrow").toggle();

	$(".commentDropdown").click(function(){
		let sub = $(this).val();
		$(".subComment"+sub).toggle();
		$(".subArrow"+sub).toggle();
	});
	
	$(".c_comment").click(function(){
		let sub = $(this).val();
		$(".c_subComment"+sub).toggle();
		$(".c_subArrow"+sub).toggle();
	});
	
	$("#thumsUp").click(function(){	//ajax 통신
		$.ajax({
			url: "/board/boardLike",	//데이터를 전송할 url
//	 		dataType: 서버가 리턴한는 데이터 타입,
			type: "POST",
			data: { 'board_no' : ${ boardDetail.board_no } },	//서버에 전송할 데이터, key/value형태의 객체
			dataType:"json",
			success: function(data){
// 				$("#thumsUp").load(location.href+" #thumsUp");	//주의사항 공백 한칸 띄워야 함
				document.location.reload();
			},
			error: function(xhr,status,error){ alert("실패") }
		});
	});
	
	$(".commentDel").click(function(){	//ajax 통신
		if(confirm("삭제하시겠습니까?")){
			$.ajax({
				url: "/board/HJHBoardCommentDel",	//데이터를 전송할 url
//	 			dataType: 서버가 리턴한는 데이터 타입,
				type: "POST",
				data: { 'comment_no' : $(this).val() },	//서버에 전송할 데이터, key/value형태의 객체
				dataType:"json",
				success: function(data){ document.location.reload(); },
				error: function(xhr,status,error){ alert("실패") }
			});
		}
	});
	
	$("#boardBanBtn").click(function() {
		var no = $(this).val();
		alert(no + "번 글을 신고합니다");
		$("#banType").val("게시글 신고");
		window.open("/board/boardBan", '신고팝업', 'width=510px,height=600px,scrollbars=yes');
	});
	$(".commentBanBtn").click(function() {
		var no = $(this).val();
		alert(no + "번 댓글을 신고합니다");
		$("#banType").val("댓글 신고");
		window.open("/board/boardBan?cno="+no, '신고팝업', 'width=510px,height=600px,scrollbars=yes');
	});
	
});//제이쿼리 끝

function comment_check(){	//댓글 공백체크
	let commentText = document.getElementById("commentText");
	if(commentText.value ==""){ alert("댓글을 입력하세요");	return false; }
}
function boardUpdate(board_no){	location.href="/board/HJHBoardUpdate?board_no="+board_no; }
function boardDelete(board_no){ 
	if(confirm("정말로 삭제하시겠습니까?")){ location.href="/board/HJHBoardDelete?board_no="+board_no; }
}
function subComment_check(){
	let c_commentText = document.getElementById("c_commentText");
	if(c_commentText.value ==""){ alert("댓글을 입력하세요");	return false; }
}
</script>
<body>
	<%@ include file="../top.jsp"%>
	<%@ include file="../menu.jsp"%>
	<div class="container">
		<h1 style="font-weight: bold; display: inline-block;">Detail</h1>
		<button class="detailBtn boardList" onclick="location.href='/board/HJHBoard'">목록</button>
		<!-- 상세화면 -->
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
					<c:if test="${sessionScope.member_id ne null && sessionScope.member_id ne boardDetail.member_id }">
					<button class="detailBtn" style="background-color: #3dcc00; width:100px;" id="thumsUp">
						<img src="/img/thumbs-up.png" style="margin-bottom: 5px; width:25px; height:25px;"> (${boardDetail.board_like })
					</button>&nbsp;
					<button class="detailBtn" style="background-color: #ff8080;" id="boardBanBtn" value="${boardDetail.board_no}">
						<img src="/img/siren.png" style="margin-bottom: 7px;">
						<input type="hidden" id="banType">
					</button>
					</c:if>
				</div>
				<div class="btnBox_2">
					<c:if test="${sessionScope.member_id eq boardDetail.member_id  }">
						<button class="detailBtn" style="background-color: #ffc414;" onclick="boardUpdate(${boardDetail.board_no })">수정</button> 
						<button class="detailBtn" style="background-color: #ff3d3d;" onclick="boardDelete(${boardDetail.board_no })">삭제</button>
					</c:if>
				</div>
			</div>
			<!-- 댓글쓰기 -->
			<div class="commentBox">
				<form action="/board/HJHBoardComment" method="post" onsubmit="return comment_check()">
					<input type="hidden" value="${boardDetail.board_no }" name="board_no">
					<input type="text" class="commentText" name="commentText" id="commentText" placeholder="댓글을 입력하세요">
					<button class="commentBtn">댓글쓰기</button>
				</form>
			</div>
		</div>
		<!-- 댓글창 -->
		<c:forEach var="c" items="${ detailComments }">
			<c:if test="${ c.comment_depth eq 1 }">
				<div class="subArrow subArrow${c.comment_root }" style="display: inline-block; height:50px; line-height: 50px;"><i class="xi-subdirectory-arrow xi-2x"></i></div>
			</c:if>
				<div class="comments <c:if test="${ c.comment_depth eq 1 }"> subComment subComment${c.comment_root }</c:if>">
					<div class="commentWrited ">${ c.member_name } ${ c.comment_time } <c:if test="${ c.comment_depth eq 0 }">()</c:if>
						<c:if test="${sessionScope.member_id eq c.member_id  }">
							<button class="commentBtn_1 commentDel" style="background-color: #CB0E00; position: relative;" value="${c.comment_no }"><i class="xi-trash-o "></i></button>
						</c:if>
						<c:if test="${sessionScope.member_id ne null && sessionScope.member_id ne boardDetail.member_id && c.comment_depth eq 0}">
							<button class="commentBtn_1 c_comment" style="background-color: #A267AC; position: relative;" value="${c.comment_root }" ><i class="xi-pen-o "></i></button>
						</c:if>
						<c:if test="${sessionScope.member_id ne null}">
							<button class="commentBtn_1 commentBanBtn" style="background-color: #ff8080; margin-left:5px;" value="${c.comment_no }"><img src="/img/siren.png" style="margin-bottom: 10px;"></button>
						</c:if>
						<c:if test="${c.comment_depth eq 0 }">
							<button class="commentDropdown" value="${c.comment_root }"><i class="xi-caret-down "></i></button>
						</c:if>
					</div>
					<div class="commentWrited_But">${ c.comment_content }</div>
				</div>
				<c:if test="${sessionScope.member_id ne null && c.comment_depth eq 0}">
					<div class="c_subArrow c_subArrow${c.comment_root }"  style="display: inline-block; height:50px; line-height: 50px; margin-top:10px;">
						<i class="xi-subdirectory-arrow xi-2x"></i></div>
					<div class="c_commentBox c_subComment c_subComment${c.comment_root } ">
						<form action="/board/HJHSubComment" method="post" onsubmit="return subComment_check()">
							<input type="hidden" value="${boardDetail.board_no }" name="board_no">
							<input type="hidden" value="${c.comment_root }" name="comment_root">
							<input type="text" class="c_commentText" name="c_commentText" id="c_commentText" placeholder="댓글을 입력하세요">
							<button class="c_commentBtn">댓글쓰기</button>
						</form>
					</div>
				</c:if>
		</c:forEach>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>