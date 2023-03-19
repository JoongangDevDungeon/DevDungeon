<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>계정 찾기 - 비밀번호 변경</title>
    <link rel="icon" href="/img/Gazi_shortCut.png"/>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/sign.css">
</head>
<script>
    $(function() {

        $(document).on("keydown", "#member_pw1, #member_pw2", function(event) {
            if (event.keyCode === 13) {
                event.preventDefault();
                $('#changePassword').click();
                return false;
            }
        });

        $('#changePassword').click(function (result) {

            if ($("#member_pw1").val().length == 0) {
                alert("비밀번호를 입력 해주세요.");
                return false;
            }else if($("#member_pw2").val().length == 0){
                alert("비밀번호를 입력 해주세요.");
                return false;
            }else if($("#member_pw1").val() != $("#member_pw2").val()){
                alert("두 비밀번호가 동일하지 않습니다.")
                return false;
            }

            $.ajax({
                url: '/modifyPassword',
                type: 'post',
                data: {"member_pw": $("#member_pw2").val(),"member_email": $("#user_email").val()},
                dataType: 'text',
                success: function () {
                    alert("비밀번호 변경완료")
                    window.location.href = "/index";
                },
                error: function () {
                    alert("요청 실패 재시도 바람.");
                }
            });

        });
    });
</script>
<body>
    <div>
        <div class="banner"><img src="/img/banner.png"></div>
            <form action="/changePassword" method="post">
                <div class="form-control find-form">
                    <label class="find-label mt-4" for="member_pw1">새 비밀번호</label>
                    <div class="find-info mb-3">
                        <input class="form-control find-input mt-2" type="password" id="member_pw1" name="member_pw1" placeholder="비밀번호를 입력하세요."/>
                    </div>
                    <label class="find-label" for="member_pw2">비밀번호 확인</label>
                    <div class="find-info mb-5">
                        <input class="form-control find-input mt-2" type="password" id="member_pw2" name="member_pw2" placeholder="비밀번호를 다시 입력하세요."/>
                        <button class="btn btn-secondary find-btn mt-3" type="button">취소</button>
                        <button class="btn btn-primary find-btn mt-3" id="changePassword" type="button">변경</button>
                        <input type="hidden" id="user_email" name="user_email" value="${user_email}">
                    </div>
                </div>
            </form>
    </div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</html>