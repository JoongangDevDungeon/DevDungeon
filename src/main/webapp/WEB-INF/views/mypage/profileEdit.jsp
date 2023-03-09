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
<body>
<%@include file="../top.jsp"%>
<%@include file="myPageMenu.jsp"%>
<section>
    <div class="main">
        <div class="add1">광고1</div>
        <div class="content">
            <form action="/profileEdit" method="post" style="width: 700px; padding-top: 100px; box-sizing: border-box; margin: 0 auto;">
                <div class="form-control profile-edit" style="line-height: 35px;">
                    <div style="padding-left: 75px; box-sizing: border-box;">
                        <div class="mt-3">
                            <label style="float: left; width: 100px;">아이디</label>
                            <input class="form-control" style="border: 0; width: 400px; background-color: white;" value="wjdahr125" disabled>
                        </div>
                        <div class="mt-3">
                            <label style="float: left; width: 100px;">이름</label>
                            <input class="form-control" style="width: 400px;" type="text" name="member_name" value="유정목" placeholder="이름을 입력하세요.">
                        </div>
                        <div class="mt-3">
                            <label style="float: left; width: 100px;">생년월일</label>
                            <div>
                                <input class="form-control"  style="width: 200px; float: left;" type="text" name="year" value="1998" placeholder="년(4자)">
                                <select class="form-select" name="month"  style="width: 100px; float: left;">
                                    <option>월</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8" selected>8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                </select>
                                <input class="form-control"  style="width: 100px;" type="text" name="day" value="3" placeholder="일">
                            </div>
                        </div>
                        <div class="mt-3">
                            <label style="float: left; width: 100px;">성별</label>
                            <select class="form-control" style="width: 400px;" name="member_gender">
                                <option>선택</option>
                                <option selected>남자</option>
                                <option>여자</option>
                            </select>
                        </div>
                        <div class="mt-3">
                            <label style="float: left; width: 100px;">이메일</label>
                            <input class="form-control" style="width: 400px;" type="email" name="member_email" value="wjdahr125@naver.com" placeholder="이메일을 입력하세요.">
                        </div>
                        <div class="mt-3">
                            <label style="float: left; width: 100px;">휴대전화</label>
                            <input class="form-control" style="width: 400px;" type="text" name="member_tel" value="wjdahr125@naver.com" placeholder="전화번호를 입력하세요.">
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary mt-3 mb-4" style="width: 600px;">수정</button>
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
