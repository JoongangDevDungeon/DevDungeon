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
<title>Notice Detail</title>
</head>
<style>
.container{	width:1200px; height:100%; text-align: left; }
h6{
	display: inline-block;
	width:20px;
	height:20px;
	line-height:20px;
	text-align: center;
	color:white;
	background-color: red;
	border-radius: 5px;
}
.none{ width:252px; height:104px; line-height:48px; padding:0; margin:0; }
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
			url: "/noticeLike",	//데이터를 전송할 url
//	 		dataType: 서버가 리턴한는 데이터 타입,
			type: "POST",
			data: { 'notice_no' : ${ noticeDetail.notice_no } },	//서버에 전송할 데이터, key/value형태의 객체
			dataType:"json",
			success: function(result){
// 				$("#thumsUp").load(location.href+" #thumsUp");	//주의사항 공백 한칸 띄워야 함
				document.location.reload();
			},
			error: function(xhr,status,error){ alert("실패") }
		});
	});
	
	$(".commentDel").click(function(){
		if(confirm("삭제하시겠습니까?")){
			$.ajax({
				url: "/noticeCommentDel",	//데이터를 전송할 url
				type: "POST",
				data: { 'comment_no' : $(this).val() },	//서버에 전송할 데이터, key/value형태의 객체
				dataType:"json",
				success: function(data){ document.location.reload(); },
				error: function(xhr,status,error){ alert("실패") }
			});
		}
	});
	//댓글 게시글 신고
	$(".commentBanBtn").click(function() {
		var no = $(this).val();
		$("#banType").val("댓글 신고");
		$("#banCommentWriter").val($("#commentWriter"+no).val());
		window.open("/csjBan?cno="+no, '신고팝업', 'width=510px,height=600px,scrollbars=yes');
	});
	
});//제이쿼리 끝

function comment_check(){	//댓글 공백체크
	let commentText = document.getElementById("commentText");
	if(commentText.value ==""){ alert("댓글을 입력하세요");	return false; }
}
function noticeUpdate(notice_no){ location.href="/noticeUpdate?notice_no="+notice_no; }
function noticeDelete(notice_no){ 
	if(confirm("정말로 삭제하시겠습니까?")){ location.href="/noticeDelete?notice_no="+notice_no; }
}
function subComment_check(){
	let c_commentText = document.getElementById("c_commentText");
	if(c_commentText.value ==""){ alert("댓글을 입력하세요");	return false; }
}
</script>
<body>
	<%@ include file="../top.jsp"%>
	<%@ include file="../menu.jsp"%>
<div class="main">
	<div class="add1">광고1</div>
	<div class="content">
	<div class="container">
		<h1 style="font-weight: bold; display: inline-block;">Notice Detail</h1>
		<button class="detailBtn boardList" onclick="location.href='/notice'">목록</button>
		<!-- 상세화면 -->
		<div class="detailBox" <c:if test="${sessionScope.member_id eq null }"> style="height:920px;"</c:if>>
			<div class="detailTop">
				<div class="detailTop_item">${noticeDetail.notice_title }</div>
				<div class="detailTop_item"><input type="hidden" id="detailWriter" value="${noticeDetail.admin_id }">${noticeDetail.admin_id }</div>
				<div class="detailTop_item">${noticeDetail.notice_date }</div>
			</div>
			<div class="detailMid">
				<c:if test="${noticeFile ne null }">
					<div class="form-control">
						<span>
							<label class="col-form-label"><a href = "data:image/png;base64,${imageDataString}" download = "${noticeFile.file_name }">${noticeFile.file_name }</a></label>
						</span>
						</div>
						<c:if test="${noticeFile.file_extension eq jpg||noticeFile.file_extension eq png||noticeFile.file_extension eq jpeg}">
							<div>
								<img src="data:image/png;base64,${imageDataString}" />
							</div>
						</c:if>
				</c:if>
				<div class="detailMid_item">${noticeDetail.notice_content }</div>
			</div>
			<div class="btnBox">
				<c:if test="${sessionScope.member_id eq null }"> <b>미로그인시 이용에 제한이 있습니다. 로그인을 해주세요</b></c:if>
				<div class="btnBox_1">
					<c:if test="${sessionScope.member_id ne null && sessionScope.member_id ne noticeDetail.admin_id }">
					<button class="detailBtn" style="background-color: #3dcc00; width:100px;" id="thumsUp">
						<img src="/img/thumbs-up.png" style="margin-bottom: 5px; width:25px; height:25px;"> (${noticeDetail.notice_like })
					</button>
					</c:if>
				</div>
				<div class="btnBox_2">
					<c:if test="${sessionScope.id eq noticeDetail.admin_id  }">
						<button class="detailBtn" style="background-color: #ffc414;" onclick="noticeUpdate(${noticeDetail.notice_no })">수정</button> 
						<button class="detailBtn" style="background-color: #ff3d3d;" onclick="noticeDelete(${noticeDetail.notice_no })">삭제</button>
					</c:if>
				</div>
			</div>
			<!-- 댓글쓰기 -->
			<c:if test="${sessionScope.member_id ne null }">
			<div class="commentBox">
				<form action="/noticeComment" method="post" onsubmit="return comment_check()">
					<input type="hidden" value="${noticeDetail.notice_no }" name="notice_no">
					<input type="text" class="commentText" name="commentText" id="commentText" placeholder="댓글을 입력하세요">
					<button class="commentBtn">댓글쓰기</button>
				</form>
			</div>
			</c:if>
		</div>
		<!-- 댓글창 -->
		<c:forEach var="c" items="${ detailComments }">
			<c:if test="${ c.comment_depth eq 1 }">
				<div class="subArrow subArrow${c.comment_root }" style="display: inline-block; height:50px; line-height: 50px;"><i class="xi-subdirectory-arrow xi-2x"></i></div>
			</c:if>
				<div class="comments <c:if test="${ c.comment_depth eq 1 }"> subComment subComment${c.comment_root }</c:if>">
					<div class="commentWrited ">${ c.member_name } <input type="hidden" id="commentWriter${c.comment_no }" value="${c.member_name }"> ${ c.comment_time } 
					<c:if test="${c.comment_depth eq 0 && c.comment_cnt ne 0 }"><h6>${c.comment_cnt}</h6></c:if>
						<c:if test="${sessionScope.member_id eq c.member_id  }">
							<button class="commentBtn_1 commentDel" style="background-color: #CB0E00; position: relative;" value="${c.comment_no }"><i class="xi-trash-o "></i></button>
						</c:if>
						<c:if test="${sessionScope.member_id ne null && sessionScope.member_id ne noticeDetail.member_id && c.comment_depth eq 0}">
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
						<form action="/noticeSubComment" method="post" onsubmit="return subComment_check()">
							<input type="hidden" value="${noticeDetail.notice_no }" name="notice_no">
							<input type="hidden" value="${c.comment_root }" name="comment_root">
							<input type="text" class="c_commentText" name="c_commentText" id="c_commentText" placeholder="댓글을 입력하세요">
							<button class="c_commentBtn">댓글쓰기</button>
						</form>
					</div>
				</c:if>
		</c:forEach>
		</div>
	</div>
	<div class="add2">광고2</div>
	<%@ include file="../footer.jsp"%>
</div>
</body>
</html>