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

        $('#check_id').click(function (result){

            if($("#member_id").val().length < 5 || $("#member_id").val().length > 10){
                alert("아이디는 5글자 이상 10글자 이하로 입력하세요.");
                return false;
            }
            $.ajax({
                url: 'checkid',
                type: 'post',
                data: {"member_id" : $("#member_id").val()},
                dataType: 'text',
                success : function(result) {
                        if(result == "0"){
                            if(confirm("입력하신 아이디를 사용하시겠습니까?")==true){
                                $("#member_id").attr("readonly", "readonly");
                                $("#check_id").attr("disabled", "disabled");
                            }
                        } else{
                            alert("입력하신 아이디는 이미 등록된 아이디 입니다.");
                        }
                },
                error : function() {
                    alert("요청 실패 재시도 바람.");
                }
            });

        });

        $('#check_name').click(function (result){

            if($("#member_name").val().length < 2 || $("#member_name").val().length > 8){
                alert("닉네임은 2글자 이상 7글자 이하로 입력하세요.");
                return false;
            }
            $.ajax({
                url: 'check_name',
                type: 'post',
                data: {"member_name" : $("#member_name").val()},
                dataType: 'text',
                success : function(result) {
                    if(result == "0"){
                        if(confirm("입력하신 닉네임을 사용하시겠습니까?")==true){
                            $("#member_name").attr("readonly", "readonly");
                            $("#check_name").attr("disabled", "disabled");
                        }
                    } else{
                        alert("입력하신 닉네임은 이미 등록된 닉네임 입니다.");
                    }
                },
                error : function() {
                    alert("요청 실패 재시도 바람.");
                }
            });

        });

        $('#send_mail').click(function (){
            if(confirm("입력하신 이메일을 사용하시겠습니까?")==true){
            $.ajax({
                url: 'send_mail',
                type: 'post',
                data : {"member_email" : $("#member_email").val(),"member_id" : $("#member_id").val()},
                dataType: 'text',
                success : function() {
                        alert("인증 번호가 발송 되었습니다.");
                        $("#member_email").attr("readonly", "readonly");
                        $("#send_mail").attr("disabled", "disabled");
                },
                error : function() {
                    if($("#member_email").val().length ==0){
                        alert("이메일을 올바르게 입력해주세요.");
                    }else{
                        alert("이미 등록되어 있는 이메일 입니다.");
                    }

                }
            });
            };

        });

        $('#check_code').click(function (result){
            $.ajax({
                url: 'check_mail_num',
                type: 'post',
                data : {"member_email" : $("#member_email").val(),"mail_code" : $("#mail_code").val()},
                dataType: 'text',
                success : function(result) {
                    if(result == "0"){
                        alert("인증에 성공했습니다.");
                        $("#mail_code").attr("readonly", "readonly");
                        $("#check_code").attr("disabled", "disabled");
                    }else{
                        alert("인증번호가 일치 하지 않습니다.");
                    }

                },
                error : function() {
                    alert("요청 실패 재시도 바람.");
                }
            });

        });

        $('#signup_btn').click(function (result){
            $.ajax({
                url: 'check_final',
                type: 'post',
                data: {"member_id" : $("#member_id").val()},
                dataType: 'text',
                success : function(result) {
                    if(result == "0"){
                        if($("#member_pw1").val().length < 4){
                            alert("패스워드는 5자 이상 입력해주세요.");
                            $("#member_pw1").focus();
                            return false;
                        }else if ($("#member_pw1").val() != $("#member_pw2").val()){
                            alert("입력하신 비밀번호가 동일 하지 않습니다.");
                            $("#member_pw2").focus();
                            return false;
                        }else if(!$("#member_name").prop('readonly')){
                            alert("닉네임은 인증을 확인해주세요.");
                            $("#member_name").focus();
                            return false;
                        }else if ($("#year").val().length < 4){
                            alert("출생년도를 올바르게 입력하세요. 예) 2023");
                            $("#year").focus();
                            return false;
                        }else if ($("#month").val() == "월"){
                            alert("출생년도를 올바르게 입력하세요. 예) 9");
                            return false;
                        }else if ($("#day").val().length == 0){
                            alert("출생년도를 올바르게 입력하세요. 예) 12");
                            $("#day").focus();
                            return false;
                        }else if ($("#member_gender").val() == "성별"){
                            alert("성별을 선택해주세요.");
                            return false;
                        }else if ($("#member_tel").val().length == 0){
                            alert("핸드폰 번호를 올바르게 입력하세요. 예) 01098028739");
                            return false;
                            $("#member_tel").focus();
                        }else if (!$("#mail_code").prop('readonly')){
                            alert("이메일 인증을 확인 해주세요.");
                            return false;
                        }else if (!$("#member_id").prop('readonly')){
                            alert("아이디 중복 체크를 확인 해주세요.");
                            return false;
                        }else if (!$("#member_email").prop('readonly')){
                            alert("이메일 인증을 확인 해주세요.");
                            return false;
                        }

                        if(confirm("입력하신 정보로 회원가입 사용하시겠습니까?")==true) {
                            $(".signup_go").attr("action", "/signup");
                            $(".signup_go").attr("method", "post")
                            $(".signup_go").submit();
                        }
                    } else{
                        alert("요청 실패 재시도 바람.");
                    }
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

    .text_box_mini {
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
        <form class="signup_go">
            <input name="agree_no1" type="hidden" value="1">
            <input name="agree1" type="hidden" value="${agree1}">

            <input name="agree_no2" type="hidden" value="2">
            <input name="agree2" type="hidden" value="${agree2}">

            <input name="agree_no3" type="hidden" value="3">
            <input name="agree3" type="hidden" value="${agree3}">


            <div class="inner_fild"> <%--회원가입 시작--%>
                <label>아이디</label><br>
                <div class="text_fild">
                    <input class="text_box_mini" maxlength="10" type="text" id="member_id" name="member_id" placeholder="아이디를 입력하세요.">
                    <%--<button class="check_btn" id="check_id">중복검사</button>--%>
                    <button type="button" class="check_btn" id="check_id">중복검사</button>
                </div>
                <br>

                <label>비밀번호</label><br>
                <div class="text_fild">
                    <input class="text_box" maxlength="10" type="password" id="member_pw1" name="member_pw1" placeholder="비밀번호를 입력해주세요.">
                </div>
                <br>

                <label>비밀번호 확인</label><br>
                <div class="text_fild">
                    <input class="text_box" maxlength="10" type="password" id="member_pw2" name="member_pw2" placeholder="입력한 비밀번호를 다시 입력해주세요.">
                </div>
                <br>

                <label>닉네임</label><br>
                <div class="text_fild">
                    <input class="text_box_mini" maxlength="6" type="text" id="member_name" name="member_name" placeholder="이름을 입력하세요.">
                    <button type="button" class="check_btn" id="check_name">중복검사</button>
                </div>
                <br>

                <label>생년월일</label><br>
                <div class="text_fild">
                    <input class="text_box_year" maxlength="4" type="text" id="year" name="year" placeholder="년도(4자)">
                    <select class="text_box_month" id="month" name="month">
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
                    <input class="text_box_day" type="text" maxlength="2" id="day" name="day" placeholder="일">
                </div>
                <br>

                <label>성별</label><br>
                <div class="text_fild">
                    <select class="text_box" id="member_gender" name="member_gender">
                        <option>성별</option>
                        <option>남</option>
                        <option>여</option>
                    </select>
                </div>
                <br>

                <label>본인 확인 이메일</label><br>
                <div class="text_fild">
                    <input class="text_box_mini" type="email" id="member_email" name="member_email" placeholder="이메일을 입력하세요.">
                    <button type="button" class="check_btn" id="send_mail">전송하기</button>
                </div>
                <br>
                <div class="text_fild" id="verify_code">
                    <input class="text_box_mini" type="text" id="mail_code" name="mail_code" placeholder="인증번호를 입력하세요.">
                    <button type="button" class="check_btn" id="check_code">인증하기</button>
                </div>
                <br>

                <label>휴대전화</label><br>
                <div class="text_fild">
                    <input class="text_box" type="text" id="member_tel" name="member_tel" placeholder="전화번호를 입력하세요.">
                </div>
                <br>
                <button style="width:450px; height:40px;" type="button" id="signup_btn" class="btn btn-primary">가입하기</button>
            </div>
        </form>
    </div><!-- 회원가입 끝 끝 -->
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</html>