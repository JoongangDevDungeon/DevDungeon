<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
   <meta charset="UTF-8">
   <title>메인 화면</title>
   <link rel="icon" href="/img/Gazi_shortCut.png" />
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   <link rel="stylesheet" href="/css/layout.css">
</head>
<style>

   .main_img_place{
      width: 1920px;
      height: 500px;
      background-color: #ff8080;
   }


</style>
<body>
   <%@include file="top.jsp"%>
   <%@include file="menu.jsp"%>
   <section>
         <div class="main">
            <div class="main_img_place">

               <%--<img alt="index..." src="/img/index.jpg" style="width:1000px; height:700px; margin-top:50px;">--%>

            </div>
            <div class="add1">광고1</div>
            <div class="add2">광고2</div>
            <div class="content">
			<!-- 이 곳을 수정하여 사용해주세요. -->

            </div>

         </div>
   </section>
   <%@include file="footer.jsp"%>
</body>
<script>
   $(function() {
      var error_msg = "${error_msg}";
      if(error_msg == "login_fail") alert("아이디와 비밀번호를 확인해주세요.");
      else if(error_msg == "not_login") alert("로그인이 필요한 서비스 입니다.");
   });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</html>
