<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이 페이지 - 비밀번호 변경</title>
    <link rel="icon" href="/img/Gazi_shortCut.png" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/layout.css">
    <link rel="stylesheet" href="/css/sign.css">
</head>
<script>
    $(function() {
        $("#change_pw").click(function() {
            const now_pw = $("#now_pw").val();
            $.post({
                url : "/nowPassCheck",
                data : { "member_pw" : now_pw },
                dataType : "text",
                success : function(result) {
                    if(result == 1) {
                        const pw1 = $("#member_pw1").val();
                        const pw2 = $("#member_pw2").val();
                        if(pw1 == pw2) {
                            $.post({
                                url : "/modifyPassword",
                                data : { "member_pw" : pw1},
                                dataType : "text",
                                success : function(result) {
                                    if(result == 1) {
                                        alert("비밀번호가 변경됐습니다.");
                                        location.href = "/myPageChangePassword";
                                    } else {
                                        alert("비밀번호 변경 중 문제가 발생했습니다.\n잠시후 다시 시도해주세요.");
                                        return false;
                                    }
                                }
                            });
                        } else {
                            alert("변경할 비밀번호가 다릅니다.\n확인 후 다시 시도해주세요.");
                            return false;
                        }
                    } else {
                        alert("현재 비밀번호가 틀렸습니다.\n확인 후 다시 시도해주세요.");
                        return false;
                    }
                },
                error : function() {
                    alert("비밀번호 변경 중 문제가 발생했습니다.\n잠시후 다시 시도해주세요.");
                    return false;
                }
            });
        });
    });
</script>
<body>
<%@include file="../top.jsp"%>
<%@include file="myPageMenu.jsp"%>
<section>
    <div class="main">
        <div class="add1">광고1</div>
        <div class="content">
            <form class="change-pw-frm" method="post" style="width: 700px; padding-top: 100px; box-sizing: border-box; margin: 0 auto;">
                <div class="form-control find-form">
                    <label class="find-label mt-4" for="now_pw">현재 비밀번호</label>
                    <div class="find-info mb-3">
                        <input class="form-control find-input mt-2" type="password" id="now_pw" name="now_pw" placeholder="비밀번호를 입력하세요."/>
                    </div>
                    <label class="find-label mt-1" for="member_pw1">새 비밀번호</label>
                    <div class="find-info mb-3">
                        <input class="form-control find-input mt-2" type="password" id="member_pw1" name="member_pw1" placeholder="변경할 비밀번호를 입력하세요."/>
                    </div>
                    <label class="find-label mt-1" for="member_pw2">비밀번호 확인</label>
                    <div class="find-info mb-5">
                        <input class="form-control find-input mt-2" type="password" id="member_pw2" name="member_pw2" placeholder="비밀번호를 다시 입력하세요."/>
                        <button class="btn btn-secondary find-btn mt-3" type="button">취소</button>
                        <button class="btn btn-primary find-btn mt-3" id="change_pw" type="button">확인</button>
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
