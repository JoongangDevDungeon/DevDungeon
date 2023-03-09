<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>쪽지 보내기</title>
    <link rel="icon" href="/img/Gazi_shortCut.png"/>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/message.css">
</head>
<style>

</style>
<body>
    <div class="banner" style="text-align: center;">
        <img src="/img/banner.png">
    </div>
    <form action="/message" method="post">
        <div style="width: 700px; margin: 0 auto;">
            <div style="width: 580px; line-height: 40px; margin: 0 auto;">
                <h1>쪽지 보내기</h1>
                <div class="mt-4">
                    <label for="member_name" style="float: left;">받는 사람</label>
                    <input class="form-control" style="float: left; width: 400px; height: 40px; margin-left: 10px;" type="text" id="member_name" name="member_name" placeholder="받는 사람 입력">
                    <button class="btn btn-primary" style="width: 100px; height: 40px; margin-left: 10px;" id="id_chk" type="button">ID 확인</button>
                </div>
                <div class="mt-3">
                    <textarea class="form-control" name="msg_content" placeholder="쪽지 내용을 입력하세요." rows="10"></textarea>
                </div>
                <div class="mt-3">
                    <button class="btn btn-primary" style="width: 100px; height: 40px; float: right;" type="submit">전송</button>
                </div>
            </div>
        </div>
    </form>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</html>