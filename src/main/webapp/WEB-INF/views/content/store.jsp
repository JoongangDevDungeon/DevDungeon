<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
   <meta charset="UTF-8">
   <title>스토어</title>
   <link rel="icon" href="/img/Gazi_shortCut.png" />
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   <link rel="stylesheet" href="/css/layout.css">
</head>
<body>
   <%@include file="../top.jsp"%>
   <%@include file="../menu.jsp"%>
   <section>
         <div class="main">
            <div class="add1">광고1</div>
            <div class="content">
               <!-- 구매자 정보 -->
               <div>

               </div>
               <!-- 아이콘 목록 -->
               <div>
                  <c:forEach var="i" begin="1" end="6" step="1" >
                     <div style="border: 1px solid #ccc; border-radius: 10px; box-sizing: border-box; margin: 10px; padding: 0; width: 300px; height: 100px; float: left;">
                        <div style="width: 80px; height: 100px; padding-top: 24px; float: left;">
                           <img src="/img/icon/icon${i}.png" style="display: inline-block; width: 45px; height: 45px;">
                        </div>
                        <div style="width: 214px; height: 100px; padding-left: 10px; box-sizing: border-box; float: left;">
                           <label style="width: 214px; height: 33px; line-height: 33px; text-align: left; font-weight: bold; float: left;">이모티콘 이름</label>
                           <label style="width: 214px; height: 33px; line-height: 33px; text-align: left; float: left;">사용기간</label>
                           <div style="width: 214px; height: 33px; line-height: 33px; text-align: left; float: left;">
                              <label style="width: 50px;">구매</label>
                              <label style="width: 50px;">선물</label>
                           </div>
                        </div>
                     </div>
                  </c:forEach>
               </div>
            </div>
            <div class="add2">광고2</div>
         </div>
   </section>
   <%@include file="../footer.jsp"%>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</html>
