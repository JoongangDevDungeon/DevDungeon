<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>${det.board_title}</title>
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
	$(document).ready(function() {
		$(".commentReplyEnter").toggle(0, false);
		$(".commentSub").toggle(0, false);
		$("#boardBtnLike").click(function() {
			let no = $(this).attr("value");
			if (confirm("추천 하시겠습니까?")) {
				location.href = "/likethis?bno=" + no;
			}
		});
		$(".commentBanBtn").click(function() {
			var no = $(this).val();
			$("#banType").val("댓글 신고");
			$("#banCommentWriter").val($("#commentWriter"+no).val());
			window.open("/csjBan?cno="+no, '신고팝업', 'width=510px,height=600px,scrollbars=yes');
		});
		$("#boardBtnBan").click(function() {
			var no = $(this).val();
			$("#banType").val("게시글 신고");
			window.open("/csjBan", '신고팝업', 'width=510px,height=600px,scrollbars=yes');
		});
		$(".commentShowBtn").click(function() {
			var no = $(this).val();
			var btn = $(this);
			$(".sub" + no).toggle(0, function() {

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
		
		$("#detailBtnDelete").click(function(){
			var no = $(this).val();
			if(confirm("진짜 삭제하시겠습니까?")){
				location.href="/userBoardDelete?bno=" + no;
			}
		});
		$("#detailBtnUpdate").click(function(){
			var no = $(this).val();
			if(confirm("진짜 수정하시겠습니까?")){
				location.href="/csjBoardUpdate?bno=" + no;
			}
		});
		$(".commentDeleteBtn").click(function(){
			var no = $(this).val();
			if(confirm("진짜 삭제하시겠습니까?")){
				location.href="/userCommentDelete?cno=" + no;
			}
		});

	});
</script>
<script>
function sendMessageTo(receiver){
	window.open("/message?receiver="+receiver,'쪽지', 'width=510px,height=450px,scrollbars=yes');
}
function sendPointTo(receiver){
	window.open("/sendPoint?receiver="+receiver,'쪽지', 'width=510px,height=450px,scrollbars=yes');
}
</script>
<style>
.commentAll {
	text-align: left;
}

.detailTitle {
	height: 40px;
	font-size: 24px;
	font-weight: bold;
	text-align: left;
/* 	border: 1px solid black; */
}

.detailInfo {
	height: 40px;
	line-height: 40px;
	border-bottom: 1px solid black;
	border-top : 1px solid black;
}

.detailContent {
	text-align: left;
/* 	border: 1px solid black; */
	min-height: 400px;
	font-size : 16px;
	white-space:normal;
	padding:5px;
}

.detailUserProfile {
	
}

.detailBtnZone {
	text-align: right;
}

.commentInput {
/* 	width: 1090px; */
	height: 100px;
	box-sizing: border-box;
}

#commentEnterBtn {
/* 	width: 100px; */
	width:100%;
	height: 100px;
	box-sizing: border-box;
	background-color:#FFBCD1;
}

.commentZone {
	min-height: 100px;
	white-space: normal;
	word-wrap:break-word;
}

.commentSub {
	
}

.commentBtnZone {
	text-align: right;
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
				<h1 onclick="location.href='csjboard'">자 유 게 시 판 II</h1>
				<div class="detailBody">
					<div class="detailTitle">${det.board_title }</div>
					<div class="detailInfo d-flex justify-content-around">
						<span>글쓴이 : ${det.member_name } <span onclick="sendMessageTo('${det.member_name }')"><img src="/img/send.png" style="width:30px; height:30px;"><span onclick="sendPointTo'${det.member_name }')"><img src="/img/point.png" style="width:30px; height:30px;"></span></span><input type="hidden" id="detailWriter" value="${det.member_name }"></span> 
						<span>${det.board_date } </span>
						<span>조회수 : ${det.board_read }</span>
					</div>
					<div class="detailContent" style="word-wrap: break-word;">
					<c:if test="${boardFile ne null }">
						<div class="form-control">
							<span>
							<label class="col-form-label"><a href = "data:image/png;base64,${imageDataString}" download = "${boardFile.file_name }">${boardFile.file_name }</a></label>
							</span>
						</div>
						<c:if test="${noticeFile.file_extension eq jpg||noticeFile.file_extension eq png||noticeFile.file_extension eq jpeg}">
							<div>
								<img src="data:image/png;base64,${imageDataString}" />
							</div>
						</c:if>
					</c:if>
					${det.board_content }
					</div>
					<button id="boardBtnLike" class="btn btn-success"
						value="${det.board_no }">추천 ${det.board_like }</button>
						<c:if test="${sessionScope.member_name ne null }">
					<button id="boardBtnBan" class="btn btn-danger"
						value="${det.board_no }">신고</button>
						</c:if>
						<input type="hidden" id="banType">
						<input type="hidden" id="banCommentWriter">
					<!-- 작성자 프로필 -->
					<div class="detailUserProfile">
						<div class="mt-3"
							style="margin: 0 auto; width: 810px; height: 242px; border: 1px solid #ccc; border-radius: 10px; box-sizing: border-box;">
							<div style="width: 180px; height: 240px; float: left;">
                        <img id="previewImg" src="data:image/png;base64,${profile.profile_image}" style="width: 180px; height: 240px; border-radius: 10px 0px 0px 10px; object-fit: none;">
                    </div>
							<div
								style="width: 620px; height: 240px; float: left; text-align: left;">
								<!-- 레벨, 아이콘, 이름 -->
								<div
									style="width: 620px; height: 60px; box-sizing: border-box; padding-top: 7px; padding-left: 10px;">
									<span style="display: inline-block; width: 48px; height: 40px; border-radius: 8px; text-align: center; line-height: 38px; background-color: black; color: white;">
                                Lv.${profile.member_level}
                            </span><span>
                                <img src="data:image/png;base64,${profile.icon_image}" style="display: inline-block; width: 40px; height: 40px;">

                            </span><span
										style="display: inline-block; width: 500px; height: 45px; border-radius: 8px; text-align: left; box-sizing: border-box; padding-left: 5px; line-height: 40px; font-size: 20px;">
										${profile.member_name } </span>
								</div>

								<div
									style="padding: 10px; padding-top: 5px; box-sizing: border-box;">
									<textarea class="form-control" rows="6" readonly
										placeholder="간단한 자기소개를 입력해주세요.">${mem.member_intro }</textarea>
								</div>
							</div>
						</div>
					</div>
				</div>
				<br>
				<div class="detailBtnZone">
					<c:if test="${sessionScope.member_name eq det.member_name }">
						<button class="btn btn-warning" id="detailBtnDelete" value="${det.board_no }">삭제</button>
						<button class="btn btn-primary" id="detailBtnUpdate" value="${det.board_no }">수정</button>
					</c:if>
					<button class="btn btn-primary" onclick="location.href='/csjboard'">목록</button>
					<c:if test="${sessionScope.member_name ne null }">
						<button class="btn btn-primary"
							onclick="location.href='/csjWrite'">글쓰기</button>
					</c:if>
				</div>
				<hr>
				<div class="CommentAll">
					<c:forEach items="${comment }" var="c">
						<div id="commentZone" style="white-space: normal;word-wrap:break-word;"
							<c:if test="${c.comment_depth ne 0}">class="commentSub sub${c.comment_root }"</c:if>>
							<c:if test="${c.comment_depth ne 0 }">
								<div style="width: 20px; min-height:100px; float: left;">
									<i class="xi-subdirectory-arrow"></i>
								</div>
							</c:if>
							<div>
								<span>${c.member_name }</span><input type="hidden" id="commentWriter${c.comment_no }" value="${c.member_name }"><span> ${c.comment_time }</span>
								<div>${c.comment_content }</div>
							</div>
							<div class="commentBtnZone">
								<c:if test="${sessionScope.member_name ne null }">
									<button class="commentBanBtn btn btn-danger" value="${c.comment_no }">신고</button>
								</c:if>
								<c:if test="${sessionScope.member_name eq c.member_name  }">
									<button class="commentDeleteBtn btn btn-warning" value="${c.comment_no }">삭제</button>
								</c:if>
								<c:if test="${c.comment_no eq c.comment_root }">
									<c:if test="${sessionScope.member_name ne null }">
										<button class="commentReplyBtn btn btn-Info" value="${c.comment_no }">답글</button>
									</c:if>
									<c:if test="${c.comment_cnt ne 0 }">
									<button class="commentShowBtn btn btn-outline-dark" value="${c.comment_no }">답글 ${c.comment_cnt }개</button>
									</c:if>
								</c:if>
							</div>
							<hr>
							<c:if test="${c.comment_no eq c.comment_root }">
								<div class="commentReplyEnter rep${c.comment_no }">
									<form action="csjReplyWrite" method="post" class="row g-3">
										<input type="hidden" name="root" value=${c.comment_no }>
										<input type="hidden" name="bno" value=${det.board_no }>
										<div class="col-10">
										<input type="text" class="commentInput form-control" name="commentContent" placeholder="${c.member_name } 에게 작성하는 답글입니다" maxlength="200" required>
										</div>
										<div class="col-2">
										<button id="commentEnterBtn" class="btn">댓글 입력</button>
										</div>
									</form>
								</div>
							</c:if>
						</div>
					</c:forEach>
					<c:if test="${sessionScope.member_name ne null }">
						<div id="commentEnter">
							<form id="commentForm" action="csjCommentWrite" method="post" class="row g-3">
								<input type="hidden" name="bno" value="${det.board_no }">
								<div class="col-10">
								<textarea class="commentInput form-control" name="commentContent" placeholder="명예훼손, 개인정보 유출, 분쟁 유발, 허위사실 유포 등의 글은 이용약관에 의해 제재는 &#13;&#10;물론 법률에 의해 처벌 받을 수 있습니다. 건전한 커뮤니티를 위해 자제를 당부 드립니다." required  maxlength="200"></textarea>
								</div>
								<div class="col-2">
								<button id="commentEnterBtn" class="btn">댓글 입력</button>
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