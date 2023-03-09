<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이 페이지 - 꾸미기</title>
    <link rel="icon" href="/img/Gazi_shortCut.png" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/layout.css">
    <link rel="stylesheet" href="/css/sign.css">
</head>
<style>
</style>
<body>
<%@include file="../top.jsp"%>
<%@include file="myPageMenu.jsp"%>
<section>
    <div class="main">
        <div class="add1">광고1</div>
        <div class="content">
            <div>
               <div style="width: 640px; height: 360px; margin: 0 auto;">
                   <!-- 이모티콘 목록 -->
                   <c:forEach var="i" begin="1" end="6" step="1" >
                       <div style="border: 1px solid #ccc; border-radius: 10px; box-sizing: border-box; margin: 10px; padding: 0; width: 300px; height: 100px; float: left;">
                           <div style="width: 80px; height: 100px; padding-top: 24px; float: left;">
                               <img src="/img/icon/icon${i}.png" style="display: inline-block; width: 45px; height: 45px;">
                           </div>
                           <div style="width: 214px; height: 100px; padding-left: 10px; box-sizing: border-box; float: left;">
                               <label style="width: 214px; height: 33px; line-height: 33px; text-align: left; font-weight: bold; float: left;">이모티콘 이름</label>
                               <label style="width: 214px; height: 33px; line-height: 33px; text-align: left; color: #ccc; float: left;">2023-03-12 까지</label>
                               <div style="width: 214px; height: 33px; line-height: 33px; text-align: left; float: left;">
                                   <a href="">대표설정</a>
                                   <label>삭제</label>
                               </div>
                           </div>
                       </div>
                   </c:forEach>
               </div>
                <div>
                    페이징
                </div>
            </div>

            <hr>
            <div class="mt-3">
                파일 업로드
            </div>
            <!-- 유저 프로필 미리보기 -->
            <form action="" method="post">
                <div class="mt-3" style="margin: 0 auto; width: 810px; height: 242px; border: 1px solid #ccc; border-radius: 10px; box-sizing: border-box;">
                    <div style="width: 180px; height: 240px; float: left;">
                        <img src="/img/profile/test.jpeg" style="width: 180px; height: 240px; border-radius: 10px 0px 0px 10px;">
                    </div>
                    <div style="width: 620px; height: 240px; float: left; text-align: left;">
                        <!-- 레벨, 아이콘, 이름 -->
                        <div style="width: 620px; height: 60px; box-sizing: border-box; padding-top: 7px; padding-left: 10px;">
                            <span style="display: inline-block; width: 45px; height: 45px; border-radius: 8px; text-align: center; line-height: 40px; background-color: black; color: white;">
                                LV.1
                            </span>
                            <span>
                                <img src="/img/icon/icon1.png" style="display: inline-block; width: 45px; height: 45px;">
                            </span>
                            <span style="display: inline-block; width: 500px; height: 45px; border-radius: 8px; text-align: left; box-sizing: border-box; padding-left: 5px; line-height: 40px; font-size: 20px;">
                                유정목
                            </span>
                        </div>

                        <div style="padding: 10px; padding-top: 5px; box-sizing: border-box;">
                            <textarea class="form-control" rows="6" placeholder="간단한 자기소개를 입력해주세요."></textarea>
                        </div>
                    </div>
                </div>
                <button class="btn btn-primary mt-4" type="submit" style="width: 620px;">저장</button>
            </form>

        </div>
        <div class="add2">광고2</div>
    </div>
</section>
<%@include file="../footer.jsp"%>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</html>
