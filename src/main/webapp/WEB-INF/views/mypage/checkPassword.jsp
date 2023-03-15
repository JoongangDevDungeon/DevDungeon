<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이 페이지 - 비밀번호 확인</title>
    <link rel="icon" href="/img/Gazi_shortCut.png" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/layout.css">
    <link rel="stylesheet" href="/css/sign.css">
</head>
<script>
    $(function() {
        var msg = "${error}";
        if(msg == "password_fail") {
            alert("비밀번호가 틀렸습니다.\n다시 확인해주세요.");
        }
    });
</script>
<body>
<%@include file="../top.jsp"%>
<%@include file="myPageMenu.jsp"%>
<section>
    <div class="main">
        <div class="add1">광고1</div>
        <div class="content">
            <form action="/checkPassword" method="post" style="width: 700px; padding-top: 200px; box-sizing: border-box; margin: 0 auto;">
                <div class="form-control find-form">
                    <label class="find-label mt-4" for="member_pw">비밀번호 확인</label>
                    <div class="find-info mb-3">
                        <input class="form-control find-input mt-2" type="password" id="member_pw" name="member_pw" placeholder="비밀번호를 입력하세요."/>
                        <button class="btn btn-secondary find-btn mt-3" type="button">취소</button>
                        <button class="btn btn-primary find-btn mt-3" type="submit">확인</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="add2">광고2</div>
    </div>
</section>
<%@include file="../footer.jsp"%>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</html>
