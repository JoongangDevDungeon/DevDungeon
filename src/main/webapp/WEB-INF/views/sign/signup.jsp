<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="icon" href="/img/Gazi_shortCut.png"/>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<script>
    $(function() {

        $('#member_id').focusout(function (result){
            let member_id = $('#member_id').val();
            $.ajax({
                url: 'checkid',
                type: 'post',
                data: {"member_id" : member_id},
                dataType: 'text',
                success : function(result) {
                    if(result == "0"){
                        $("#checkId").html('가능');
                        $("#checkId").css('color', 'green');
                    } else{
                        $("#checkId").html('불가능');
                        $("#checkId").css('color','red');
                    }
                },
                error : function() {
                    alert("요청 실패 재시도 바람.");
                }
            });

        });

        $('#send_mail').click(function (){
            let member_email = $('#member_email').val();
            alert("사용자가 입력한 이메일"+member_email);

            $.ajax({
                url: 'send_mail',
                type: 'post',
                data : {"member_email" : member_email},
                dataType: 'text',
                success : function(send) {
                    alert("메일 성공적으로 보냄.");
                },
                error : function() {
                    alert("요청 실패 재시도 바람.");
                }
            });

        });


    });
</script>
<style>
    .all_fild {
        width: 100%;
    }

    .banner {
        text-align: center;
    }

    .inner_fild {
        margin: auto;
        width: 450px;
    }

    .text_box {
        width: 450px;
        height: 40px;
    }

    .text_box_id {
        width: 350px;
        height: 40px;
    }

    .check_btn {
        height: 40px;
        margin-left: 18px;
        border: none;
        box-sizing: border-box;
    }

    .text_box_year {
        width: 140px;
        height: 40px;
    }

    .text_box_month {
        width: 139px;
        height: 40px;
        margin-left: 10px;
    }

    .text_box_day {
        width: 139px;
        height: 40px;
        margin-left: 10px;
    }
</style>
<body>
    <div class="all_fild"><!-- 전체 범위 -->
        <div class="banner"><img src="/img/banner.png"></div>
        <%-- 배너 --%>
        <form action="signup" method="post">
            <input name="agree1" type="hidden" value="${agree1}">
            <input name="agree2" type="hidden" value="${agree2}">
            <input name="agree3" type="hidden" value="${agree3}">

            <div class="inner_fild"> <%--회원가입 시작--%>
                <label>아이디</label><br>
                <div class="text_fild">
                    <input class="text_box_id" type="text" id="member_id" name="member_id" placeholder="아이디를 입력하세요.">
                    <%--<button class="check_btn" id="check_id">중복검사</button>--%>
                    <span id = "checkId"></span>
                </div>
                <br>

                <label>비밀번호</label><br>
                <div class="text_fild">
                    <input class="text_box" type="password" name="member_pw1" placeholder="비밀번호를 입력해주세요.">
                </div>
                <br>

                <label>비밀번호 확인</label><br>
                <div class="text_fild">
                    <input class="text_box" type="password" name="member_pw2" placeholder="비밀번호를 다시 입력하세요.">
                </div>
                <br>

                <label>이름</label><br>
                <div class="text_fild">
                    <input class="text_box" type="text" name="member_name" placeholder="이름을 입력하세요.">
                </div>
                <br>

                <label>생년월일</label><br>
                <div class="text_fild">
                    <input class="text_box_year" type="text" name="year" placeholder="년(자)">
                    <select class="text_box_month" name="month">
                        <option>월</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                    </select>
                    <input class="text_box_day" type="text" name="day" placeholder="일">
                </div>
                <br>

                <label>성별</label><br>
                <div class="text_fild">
                    <select class="text_box" name="member_gender">
                        <option>성별</option>
                        <option>남</option>
                        <option>여</option>
                    </select>
                </div>
                <br>

                <label>본인 확인 이메일</label><br>
                <div class="text_fild">
                    <input class="text_box_id" type="email" id="member_email" name="member_email" placeholder="이메일을 입력하세요.">
                    <a class="check_btn" id="send_mail">전송하기</a>
                </div>
                <br>
                <div class="text_fild" id="verify_code">
                    <input class="text_box_id" type="text" name="verify_code" placeholder="인증번호를 입력하세요.">
                    <button class="check_btn" id="verify_btn" onclick="location.href='/myinfo.do'">인증하기</button>
                </div>
                <br>

                <label>휴대전화</label><br>
                <div class="text_fild">
                    <input class="text_box" type="text" name="member_tel" placeholder="전화번호를 입력하세요.">
                </div>
                <br>
                <button style="width:450px; height:40px;" type="submit" class="btn btn-primary">가입하기</button>
            </div>
        </form>
    </div><!-- 회원가입 끝 끝 -->
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</html>