<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고창</title>
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
<script type="text/javascript">
	$(document).ready(function() {
		var banMember = "";
		var banBoardWriter = opener.$("#detailWriter").val();
		var banCommentWriter = opener.$("#banCommentWriter").val();
		var banBoard = opener.$("#boardBtnBan").val();
		var banType = opener.$("#banType").val();
		if(banType == "게시글 신고"){
			banMember = banBoardWriter;
		}else{
			banMember = banCommentWriter;
		}
		$("#bantype").text("신고 유형 : " + banType);
		var url = $(location).attr('href');
		var number = url.split("no=");
		var banNumber = number[1];
		$("#banMember").text("피신고인 : " + banMember);
		$("#banMem").attr("value", banMember);
		if(banType == "게시글 신고"){
			$("#banBoard").attr("value", banBoard);
		}else{
			$("#banBoard").attr("value", banBoard);
			$("#banComment").attr("value", banNumber);
		}
		$("#formbanType").attr("value", banType);
		if($("#banChoice6").checked != false){
			$("#banWrite").attr("required",true);
		}
		$("#btnBan").click(function() {
			opener.name = "detail";
			$("#formBan").action = "csjBan";
			$("#formBan").target = "detail";
			var banWhy = $("input[name='banWhy']:checked").val();
			if(banWhy=="기타"){
				banWhy = $("#banWrite").val();
				$("#banChoice6").val(banWhy);
			}
			if (banWhy == null || banWhy == "") {
				alert("신고사유를 선택하세요");
			} else {
				$("#formBan").submit();
				alert("신고가 완료되었습니다");
			}
		});
		$("#banWrite").click(function(){
			$("#banChoice1").attr("checked",false);
			$("#banChoice2").attr("checked",false);
			$("#banChoice3").attr("checked",false);
			$("#banChoice4").attr("checked",false);
			$("#banChoice5").attr("checked",false);
			$("#banChoice6").attr("checked",false);
			$("#banChoice6").attr("checked",true);
		});
	});

</script>
</head>
<style>
.singo_top{
	width: 100%; 
	height: 50px;
	text-align: center;
	line-height: 50px;
	font-size: 20px;
	color:white;
	font-weight: bold;
	background-color: #A267AC;
	border-bottom: 2px solid #ccc;
}
.singo_mid{
	width:100%;
	height:400px;
}
#btnBan{
	border-top: 2px solid #ccc;
	font-weight: bold;	
	width: 100%; 
	height: 60px; 
	background-color: #A267AC; 
	color:white; border:none; 
	border-radius: 5px;
}
#btnBan:hover{ background-color: #d0abd6; }
input{
	font-weight: bold;
	margin:20px 0px 20px 10px;
 } 
</style>
<body>
	<div style="width:100%; text-align: center;">
		<img src="/img/logo.png" alt="가지" style="width:220px;">
	</div>
	<div style="font-weight: bold;">
		<div id="banMember"></div>
		<div id="bantype"></div>
	</div>
	<div style="width:100%; height: 100%;">
		<div class="singo_top" style="">신고사유</div>
		<form action="csjBan" id="formBan" method="post" class="was-validated">
		<div class="singo_mid">
			<input type="hidden" name="banMember" id="banMem"> 
			<input type="hidden" name="formbanType" id="formbanType">
			<input type="hidden" name="banBoard" id="banBoard">
			<input type="hidden" name="banComment" id="banComment">
			<input type="radio" id="banChoice1" name="banWhy" value="스팸홍보/도배글입니다." class="form-check-input" required>
			<label for="banChoice1">스팸홍보/도배글입니다.</label><br>
			<input type="radio" id="banChoice2" name="banWhy" value="음란물입니다."  class="form-check-input" required>
			<label for="banChoice2">음란물입니다.</label><br>
			<input type="radio"	id="banChoice3" name="banWhy" value="불법정보를 포함하고 있습니다."  class="form-check-input" required>
			<label for="banChoice3">불법정보를 포함하고 있습니다.</label><br>
			<input type="radio" id="banChoice4" name="banWhy" value="청소년에게 유해한 내용입니다."  class="form-check-input" required>
			<label for="banChoice4">청소년에게 유해한 내용입니다.</label><br>
			<input type="radio" id="banChoice5" name="banWhy" value="욕설/혐오/차별적 표현입니다."  class="form-check-input" required>
			<label for="banChoice5">욕설/혐오/차별적 표현입니다.</label><br>
			<input type="radio" id="banChoice6" name="banWhy" value="기타"  class="form-check-input" required> 
			<label for="banChoice6">기타</label><br>
			<input type="text" style="width: 97%; height:40px; border-radius: 5px;" id="banWrite" name="banWrite" placeholder="신고 사유를 직접 입력하세요">
		</div>
			<div style="width:100%; border-top: 2px solid #ccc;">
				<button id="btnBan">신고하기</button>
			</div>
		</form>
	</div>
</body>
</html>