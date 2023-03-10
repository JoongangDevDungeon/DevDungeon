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

</script>
</head>
<body>
	<div>
	<h1>신고창</h1>
	</div>
	<div>
		<div id="banMember"></div>
		<div id="bantype">게시글 신고</div>
	</div>
	<div style="width:500px;height:500px; background-color:pink;">
		<div style="width:500px;height:50px;background-color:gray;">신고사유</div>
		<form>
			<input type="radio" id="banChoice1" name="banWhy" value="스팸홍보/도배글입니다.">
			<label for="banChoice1">스팸홍보/도배글입니다.</label><br>			
			<input type="radio" id="banChoice2" name="banWhy" value="음란물입니다.">
			<label for="banChoice2">음란물입니다.</label><br>
			<input type="radio" id="banChoice3" name="banWhy" value="불법정보를 포함하고 있습니다.">
			<label for="banChoice3">불법정보를 포함하고 있습니다.</label><br>
			<input type="radio" id="banChoice4" name="banWhy" value="청소년에게 유해한 내용입니다.">
			<label for="banChoice4">청소년에게 유해한 내용입니다.</label><br>
			<input type="radio" id="banChoice5" name="banWhy" value="욕설/혐오/차별적 표현입니다.">
			<label for="banChoice5">욕설/혐오/차별적 표현입니다.</label><br>
			<input type="radio" id="banChoice6" name="banWhy" value="기타">
			<label for="banChoice6">기타</label><br>
			<button style="width:500px;height:50px; background-color:red color:white">신고하기</button>
		</form>
	</div>
</body>
</html>