<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이 페이지 - 로그인 기록</title>
    <link rel="icon" href="/img/Gazi_shortCut.png" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/layout.css">
    <link rel="stylesheet" href="/css/sign.css">
</head>
<body>
<%@include file="../top.jsp"%>
<%@include file="myPageMenu.jsp"%>
<section>
    <div class="main">
        <div class="add1">광고1</div>
        <div class="content">
            <c:choose>
                <c:when test="${!empty logList}">
                    <table class="table table-hover mt-5">
                        <thead style="background-color: #88a2a2; color: white; border: none; font-weight: bold; text-align: center;">
                        <th>분류</th>
                        <th>아이피 주소</th>
                        <th>정보</th>
                        <th>날짜</th>
                        </thead>
                        <c:forEach items="${logList}" var="log">
                            <tbody style="text-align: center;">
                            <td>로그인</td>
                            <td>${log.ip}</td>
                            <td>${log.path}</td>
                            <td>${log.created_at}</td>
                            </tbody>
                        </c:forEach>
                    </table>
                </c:when>
                <c:otherwise>
                    <div class="mt-5">
                        아직 로그인 기록이 없습니다!
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="add2">광고2</div>
    </div>
</section>
<%@include file="../footer.jsp"%>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</html>
