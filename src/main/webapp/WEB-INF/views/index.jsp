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

   .main_img_place{/*메인 슬라이드 이미지 공간*/
      width: 1920px;
      height: 500px;
      background-color: #ff8080;
   }

   .board_top_list{/*보드 top.5 공간*/
      margin: 0 auto;
      width: 800px;
      height: 600px;
   }

   .notice_top_list{/*공지사항 top.5 공간*/
      width:400px;
      height:300px;
      float: left;
      opacity:0.8;
      background-color: #6867AC;
   }

   .question_top_list{/*질문게시판 top.5 공간*/
      width:400px;
      height:300px;
      float: left;
      opacity:0.8;
      background-color: #A267AC;
   }

   .like_top_list{/*좋아요 top.5 공간*/
      width:400px;
      height:300px;
      float: left;
      opacity:0.8;
      background-color: #CE7BB0;
   }

   .read_top_list{/*조회수 top.5 공간*/
      width:400px;
      height:300px;
      float: left;
      opacity:0.8;
      background-color: #FFBCD1;
   }

</style>
<body>
   <%@include file="top.jsp"%>
   <%@include file="menu.jsp"%>
   <section>
         <div class="main">
            <div class="main_img_place"><img alt="index..." src="/img/index.jpg" style="width:1000px; height:400px; margin-top:50px;"></div>
            <div class="add1">광고1</div>
            <div class="add2">광고2</div>
            <div class="content" style="background-color: antiquewhite">

               <div class="board_top_list">
                  <div class="notice_top_list">공지사항 Top.5</div>
                  <div class="question_top_list">질문 게시판 Top.5</div>
                  <div class="like_top_list">좋아요 Top.5</div>
                  <div class="read_top_list">조회수 Top.5</div>
               </div>


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
