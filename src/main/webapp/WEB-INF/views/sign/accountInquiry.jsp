<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>계정 찾기</title>
    <link rel="icon" href="/img/Gazi_shortCut.png"/>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/sign.css">
</head>
<style>

</style>
<body>
    <div>
        <div class="banner"><img src="/img/banner.png"></div>
        <form action="/accountInquiry" method="post">
            <div class="form-control find-form">
                <label class="find-label mt-4" for="member_email">이메일 주소</label>
                <div class="find-info mb-5">
                    <input class="form-control find-input mt-2" type="email" id="member_email" name="member_email" placeholder="이메일을 입력하세요."/>
                    <button class="btn btn-secondary find-btn mt-3" type="button">취소</button>
                    <button class="btn btn-primary find-btn mt-3" type="submit">계정 찾기</button>
                </div>
            </div>
        </form>
    </div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</html>