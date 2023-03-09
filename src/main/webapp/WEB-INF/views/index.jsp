<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
<link rel="stylesheet" href="/css/layout.css?v=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="icon" href="/img/Gazi_shortCut.png" />
</head>
<body>
   <%@include file="top.jsp"%>
   <%@include file="menu.jsp"%>
   <section>
         <div class="main">
            <span class="add_first">광고</span>
            <div class="content">
               <!-- 이 곳을 수정하여 사용해주세요. -->
               <div class="container">
                  <table class="table">
                     <tr class="table-header">
                        <th class="col-1">번호</th>
                        <th class="col-5">제목</th>
                        <th class="col-2">글쓴이</th>
                        <th class="col-2">날짜</th>
                        <th class="col-1">조회수</th>
                        <th class="col-1">좋아요</th>
                     </tr>
                  </table>
               </div>
            </div>
            <span class="add_second">광고</span>
         </div>
   </section>
   <%@include file="footer.jsp"%>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</html>
