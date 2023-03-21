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
<script>
    $(function() {

        $(document).on("keydown", "#find_code", function(event) {
            if (event.keyCode === 13) {
                event.preventDefault();
                $('#find_account').click();
                return false;
            }
        });

        $('#find_account').click(function (result) {

            if ($("#find_code").val().length == 0) {
                alert("인증번호를 입력 해주세요.");
                return false;
            }

            $.ajax({
                url: 'find_account_email',
                type: 'post',
                data: {"find_code": $("#find_code").val(),"member_email": $("#user_email").val()},
                dataType: 'text',
                success: function (result) {
                    if (result == 1) {
                        alert("인증코드를 올바르게 입력해주세요.");
                    }else{
                        $(".change").attr("action", "/changePassword");
                        $(".change").attr("method", "post")
                        $(".change").submit();
                    }
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
        <form class="change">
            <div class="form-control find-form">
                <label class="find-label mt-4">계정 찾기</label>
                <div class="find-info mb-5">
                    <input class="form-control find-input mt-2" type="text" id="find_code" name="find_code" placeholder="인증번호를 입력하세요."/>
                    <button class="btn btn-primary find-btn mt-3" id="find_account" type="button">인증하기</button>
                </div>
            </div>
            <input id="user_email" name="user_email" type="text" value="${user_email}">
        </form>
    </div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</html>