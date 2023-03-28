<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이 페이지 - 회원정보 수정</title>
    <link rel="icon" href="/img/Gazi_shortCut.png" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/layout.css">
    <link rel="stylesheet" href="/css/sign.css">
</head>
<style>
    .profile-edit {
        width: 700px;
    }
</style>
<script>
    $(function() {
       $("#btn_sumbit").click(function(){
           const pattern = /^\d{3}-\d{3,4}-\d{4}$/;
           const member_tel = $("#member_tel").val();
           if(!pattern.test(member_tel)) {
               alert("올바르지 않은 형식입니다.\n다시 입력해주세요.\n(예시 : 010-1234-5678)");
               return false;
           }
           $.post({
               url : "/profile",
               data : $(".profile-frm").serialize(),
               dataType : "text",
               success : function (result) {
                   if(result == 1) {
                       alert("프로필 변경 성공");
                       location.href="/profile?event=update";
                   } else alert("프로필 변경 중 문제가 발생했습니다.\n잠시 후 다시 시도해주세요.");
               },
               error : function () {
                   alert("프로필 변경 중 문제가 발생했습니다.\n잠시 후 다시 시도해주세요.");
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
        <div class="content">
            <form class="profile-frm" style="width: 700px; padding-top: 100px; box-sizing: border-box; margin: 0 auto;">
                <div class="form-control profile-edit" style="line-height: 35px;">
                    <div style="padding-left: 75px; box-sizing: border-box;">
                        <div class="mt-3">
                            <label style="float: left; width: 100px;">아이디</label>
                            <input class="form-control" style="border: 0; width: 400px; background-color: white;" value="${member_info.member_id}" disabled>
                        </div>
                        <div class="mt-3">
                            <label style="float: left; width: 100px;">이름</label>
                            <input class="form-control" style="width: 400px;" type="text" name="member_name" value="${member_info.member_name}" placeholder="이름을 입력하세요.">
                        </div>
                        <div class="mt-3">
                            <label style="float: left; width: 100px;">생년월일</label>
                            <div>
                                <input class="form-control"  style="width: 200px; float: left;" type="text" name="year" value="${year}" placeholder="년(4자)">
                                <select class="form-select" name="month"  style="width: 100px; float: left;">
                                    <option>월</option>
                                    <c:forEach var="mon" begin="1" end="12" step="1"><option value="${mon}" <c:if test="${month == mon}">selected</c:if> >${mon}</option></c:forEach>
                                </select>
                                <input class="form-control"  style="width: 100px;" type="text" name="day" value="${day}" placeholder="일">
                            </div>
                        </div>
                        <div class="mt-3">
                            <label style="float: left; width: 100px;">이메일</label>
                            <input class="form-control" style="width: 400px;" type="email" name="member_email" value="${member_info.member_email}" placeholder="이메일을 입력하세요.">
                        </div>
                        <div class="mt-3">
                            <label style="float: left; width: 100px;">휴대전화</label>
                            <input class="form-control" style="width: 400px;" type="text" name="member_tel" id="member_tel" value="${member_info.member_tel}" placeholder="전화번호를 입력하세요.">
                        </div>
                    </div>
                    <button type="button" class="btn btn-primary mt-3 mb-4" id="btn_sumbit" style="width: 600px;">수정</button>
                </div>
            </form>
        </div>
    </div>
</section>
<%@include file="../footer.jsp"%>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</html>
