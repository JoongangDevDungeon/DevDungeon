<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트</title>
<link rel="icon" href="/img/Gazi_shortCut.png" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="/css/layout.css">
<script>
	var onoff = 1;
	$(document).ready(
			function() {
				$(".commentReplyEnter").toggle(0, false);
				$(".commentSub").toggle(0, false);
				$("#boardBtnLike").click(function() {
					let no = $(this).attr("value");
					if (confirm("추천 하시겠습니까?")) {
						location.href = "/likethis?bno=" + no;
					}
				});
				$(".commentBanBtn").click(
						function() {
							var no = $(this).val();
							$("#banType").val("댓글 신고");
							$("#banCommentWriter").val(
									$("#commentWriter" + no).val());
							window.open("/csjBan?cno=" + no, '신고팝업',
									'width=510px,height=600px,scrollbars=yes');
						});
				$("#boardBtnBan").click(
						function() {
							var no = $(this).val();
							$("#banType").val("게시글 신고");
							window.open("/csjBan", '신고팝업',
									'width=510px,height=600px,scrollbars=yes');
						});
				$(".commentShowBtn").click(function() {
					var no = $(this).val();
					var txt = $(this).text();
					var btn = $(this);
					$(".sub" + no).toggle(0, function() {
						if (txt == "show") {
							btn.text("hide");
						} else {
							btn.text("show");
						}
					});
				});
				$(".commentReplyBtn").click(function() {
					var no = $(this).val();
					if ($(".rep" + no).css("display") == "none") {
						$(".commentReplyEnter").hide(0);
						$(".rep" + no).show(0);
						$("#commentEnter").hide(0);
					} else {
						$(".rep" + no).hide(0);
						$("#commentEnter").show(0);
					}

				});

				$("#detailBtnDelete").click(function() {
					var no = $(this).val();
					if (confirm("진짜 삭제하시겠습니까?")) {
						location.href = "/userBoardDelete?bno=" + no;
					}
				});
				$("#detailBtnUpdate").click(function() {
					var no = $(this).val();
					if (confirm("진짜 수정하시겠습니까?")) {
						location.href = "/csjBoardUpdate?bno=" + no;
					}
				});
				$(".commentDeleteBtn").click(function() {
					var event_no = $(this).val();
					if (confirm("진짜 삭제하시겠습니까?")) {
						location.href = "/userCommentDelete?cno=" + no;
					}
				});
				$(".eventJoinBtn").click(function() {
					var no = $(this).val();
					$.post({
						url : "/eventJoin",
						data : {
							"event_no" : no
						},
						dataType : "json"
					}).done(function(data) {
						if (data.result == 1) {
							alert("참여가 완료되었습니다");
						} else {
							alert("이미 참여한 이벤트입니다");
						}
					}).fail(function(xhr) {
						alert("문제가 발생함");
					});
				});

			});
</script>
<style>
.commentAll {
	text-align: left;
}
h1{
	border-bottom: 2px solid black;
}
.detailTitle {
	height: 40px;
	font-size: 30px;
	text-align: left;
/* 	border-top: 1px solid black; */
	margin: 10px 0px 20px 0px;

}

.detailInfo {
	height: 30px;
	border: 1px solid black;
}

.detailContent {
	text-align: left;
	border: 1px solid black;
	min-height: 400px;
	border-radius: 5px;
}

.detailUserProfile {
	
}

.detailBtnZone {
	text-align: right;
}

.commentEnter {
	width: 1200px;
	height: 100px;
	margin: 0;
	padding: 0;
}

.commentInput {
	/* 	width: 1070px; */
	height: 100px;
	/* 	box-sizing: border-box; */
}

#commentEnterBtn {
	/* 	width: 100px; */
	height: 100px;
	/* 	box-sizing: border-box; */
}

.commentZone {
	min-height: 100px;
}

.commentSub {
	
}

.commentBtnZone {
	text-align: right;
}
.eventJoinBtn{
	width:100%;
	height:100px;
}
</style>
</head>
<body>
	<%@include file="../top.jsp"%>
	<%@include file="../menu.jsp"%>
	<section>
		<div class="main">
			<div class="add1">광고1</div>
			<div class="content">
				<h1 onclick="location.href='eventboard'">E V E N T</h1>
				<div class="detailBody">
					<div class="detailTitle">${det.event_title }</div>
					<div class="detailContent" style="text-align: center; overflow:hidden;">
						<c:if test="${eventFile ne null }">
							<div>
								<img src="data:image/png;base64,${imageDataString}" width="100%" />
							</div>
						</c:if>
						${det.event_content }
					</div>
					<c:if test="${sessionScope.member_name ne null }">
					<div style="margin-top:5px;">
						<button class="eventJoinBtn btn btn-warning" value="${det.event_no }">참여하기</button>
					</div>
					</c:if>
					<br>
					<div class="detailBtnZone">
						<button class="btn btn-primary"
							onclick="location.href='/eventboard'">목록</button>
						<button class="btn btn-Info" style="cursor: pointer;"
							onclick="window.scrollTo(0,0);">TOP</button>
					</div>
					<br>
					<div class="CommentAll">
						<c:forEach items="${comment }" var="c">
							<div id="commentZone"
								<c:if test="${c.comment_depth ne 0}">class="commentSub sub${c.comment_root }"</c:if>>
								<c:if test="${c.comment_depth ne 0 }">
									<div style="width: 20px; min-height: 100px; float: left;">
										<i class="xi-subdirectory-arrow"></i>
									</div>
								</c:if>
								<div>
									<span>${c.member_name }</span><input type="hidden"
										id="commentWriter${c.comment_no }" value="${c.member_name }"><span>
										${c.comment_time }</span>
									<div>${c.comment_content }</div>
								</div>
								<div class="commentBtnZone">
									<button class="commentBanBtn" value="${c.comment_no }">신고</button>
									<c:if test="${sessionScope.member_name eq c.member_name  }">
										<button class="commentDeleteBtn" value="${c.comment_no }">삭제</button>
									</c:if>
									<c:if test="${c.comment_no eq c.comment_root }">
										<c:if test="${sessionScope.member_name ne null }">
											<button class="commentReplyBtn" value="${c.comment_no }">답글</button>
										</c:if>
										<c:if test="${c.comment_cnt ne 0 }">${c.comment_cnt }</c:if>
										<button class="commentShowBtn" value="${c.comment_no }">show</button>
									</c:if>
								</div>
						
						<hr>
						<c:if test="${c.comment_no eq c.comment_root }">
							<div class="commentReplyEnter rep${c.comment_no }"
								style="background-color: gray;">
								<form action="csjReplyWrite" method="post">
									<input type="hidden" name="root" value=${c.comment_no }>
									<input type="hidden" name="bno" value=${det.board_no }>
									<input type="text" class="commentInput" name="commentContent">
									<button id="commentEnterBtn">댓글 입력</button>
								</form>
							</div>
						</c:if>
						</div>
						</c:forEach>
					</div>

					<c:if test="${sessionScope.member_name ne null }">
						<div id="commentEnter">
							<form id="commentForm" action="csjCommentWrite" method="post"
								class="row g-3">
								<input type="hidden" name="bno" value="${det.board_no }">
								<div class="col-10">
									<input type="text" class="commentInput form-control"
										name="commentContent" disabled>
								</div>
								<div class="col-2">
									<button id="commentEnterBtn" class="btn" disabled>지금은
										댓글을 막아둠</button>
								</div>
							</form>
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