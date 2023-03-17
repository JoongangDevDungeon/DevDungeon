<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A</title>
<link rel="icon" href="/img/Gazi_shortCut.png" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="/css/layout.css">
<link type="text/css" rel="stylesheet" href="/css/HJHBoard.css">
<script>
	$(document).ready(function() {
		$(".subContent").hide(0);
		$(".mainContent").click(function() {
			var no = $(this).children("#QuestionNo").text();
			if ($(".sub" + no).css("display") == "none") {
				$(".subContent").hide(0);
				$(".sub" + no).show(0);
			} else {
				$(".sub" + no).hide(0);
			}
		});
		$(".write_btn").click(function() {
			$("#writeModal").modal("show");
		});
		$("#modalWriteBtn").click(function() {
			let title = $("#title").val();
			let content = $("#content").val();
			$("#title").val("");
			$("#content").val("");//초기화
			if (title.length < 1) {
				alert("제목은 4글자 이상");
				$("#title").focus();
				return false;
			}
			if (content == "" || content.length < 1) {
				alert("내용을 적어주세요");
				$("#content").focus();
				return false;
			}
			$.post({
				url : "/qnaWrite",
				data : {
					"title" : title,
					"content" : content
				},
				dataType : "json"
			}).done(function(data) {
				if (data.result == 1) {
					alert("저장했다");
				} else {
					alert("저장하지 못했다");
				}
			}).fail(function(xhr) {
				alert("문제가 발생함");
			});
		});
	});
</script>
</head>
<style>
.subContent{ background-color: #fbe0db; }

</style>
<body>
	<%@include file="../top.jsp"%>
	<%@include file="../mypage/myPageMenu.jsp"%>
	<section>
		<div class="main">
			<div class="add1">광고1</div>
			<div class="content">
				<!-- 이 곳을 수정하여 사용해주세요. -->
				<h1>Q & A</h1>
				<table class="table">
					<tr class="table-header">
						<th class="col-1">번호</th>
						<th class="col-6">제목</th>
					</tr>
					<c:forEach var="board" items="${list }">
						<tr class="mainContent">
							<td id="QuestionNo" style="cursor: pointer; font-weight: bold;">${board.question_board_no }</td>
							<td class="title" style="cursor: pointer; font-weight: bold;">${board.question_board_title }</td>
						</tr>

						<c:choose>
							<c:when test="${sessionScope.member_name ne board.member_name }">
								<tr class="subContent sub${board.question_board_no }">
									<td></td>
									<td class="title">작성자만 볼 수 있습니다</td>
								</tr>
							</c:when>
							<c:when test="${board.answer_board_no ne null }">
								<tr class="subContent sub${board.question_board_no }">
									<td><b>질문</b></td>
									<td class="title">${board.question_board_content }</td>
								</tr>
								
								<tr class="subContent sub${board.question_board_no }">
									<td><b>[답변]</b></td>
									<td class="title">${board.answer_board_content }</td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr class="subContent sub${board.question_board_no }">
									<td><b>질문</b></td>
									<td class="title">${board.question_board_content }</td>
								</tr>
								<tr class="subContent sub${board.question_board_no }">
									<td></td>
									<td class="title"><b>답변을 기다리고 있는 질문입니다.</b></td>
								</tr>
							</c:otherwise>
						</c:choose>
					<c:if test="${board.question_board_no eq null }"><br><br><b style="font-size: 20px;">게시글이 없습니다.</b></c:if>
					</c:forEach>
				</table>
				<br><br><br>
				<c:if test="${sessionScope.member_id ne null }">
					<div class="write" style="justify-content: start;">
						<button class="write_btn" style="margin-left:35px;">질문하기</button>
					</div>
				</c:if><br>
				<%@ include file="CSJpaging.jsp"%>
				<!-- Write Modal -->
				<div class="modal fade" id="writeModal" data-bs-backdrop="static"
					tabindex="-1" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-xl  modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">질문하기</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div id="form" class="mb-3">
									<label for="title" class="form-label">질문 제목</label> <input
										class="form-control" type="text" id="title" name="title">
									<label for="content" class="form-label">질문 내용</label>
									<textarea class="form-control" rows="20" id="content"
										name="content"></textarea>
									<button type="button" id="modalWriteBtn"
										class="btn btn-primary">질문하기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="add2">광고2</div>
		</div>
	</section>
	<%@include file="../footer.jsp"%>
</body>
<script>
	$(function() {
		var error_msg = "${error_msg}";
		if (error_msg == "login_fail")
			alert("아이디와 비밀번호를 확인해주세요.");
	});
</script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
</html>
