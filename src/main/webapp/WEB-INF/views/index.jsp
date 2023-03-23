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
/*===================슬라이드===================*/

   .slider{/* 슬라이드 이미지 크기*/
      width: 1000px;
      height: 500px;
      position: relative;
      margin: 0 auto;
      background-color: #D4D3E8;
      overflow: hidden; /* 현재 슬라이드 오른쪽에 위치한 나머지 슬라이드 들이 보이지 않도록 가림 */
   }
   .radio{
      display: none;
   }
   ul.imgs{
      padding: 0;
      list-style: none;
   }
   ul.imgs li{
      position: absolute;
      left: 640px;
      transition-delay: 1s; /* 새 슬라이드가 이동해 오는 동안 이전 슬라이드 이미지가 배경이 보이도록 지연 */

      padding: 0;
      margin: 0;
   }
   .bullets{
      position: absolute;
      left: 50%;
      transform: translateX(-50%);
      bottom: 20px;
      z-index: 2;
   }
   .bullets label{
      display: inline-block;
      border-radius: 50%;
      background-color: rgba(0,0,0, 0.6);
      width: 25px;
      height: 25px;
      cursor: pointer;
   }
   /* 현재 선택된 불릿 배경 흰색으로 구분 표시 */
   .slider input[type=radio]:nth-child(1):checked~.bullets>label:nth-child(1){
      background-color: #6867AC;
   }
   .slider input[type=radio]:nth-child(2):checked~.bullets>label:nth-child(2){
      background-color: #6867AC;
   }
   .slider input[type=radio]:nth-child(3):checked~.bullets>label:nth-child(3){
      background-color: #6867AC;
   }
   .slider input[type=radio]:nth-child(4):checked~.bullets>label:nth-child(4){
      background-color: #6867AC;
   }

   .slider input[type=radio]:nth-child(1):checked~ul.imgs>li:nth-child(1){/*slider 클래스 안에 1번째 라디오가 체크가 된다면 이미지 ul에 있는 이미지를 */
      left: 0;
      transition: 0.5s;
      z-index:1;
   }
   .slider input[type=radio]:nth-child(2):checked~ul.imgs>li:nth-child(2){
      left: 0;
      transition: 0.5s;
      z-index:1;
   }
   .slider input[type=radio]:nth-child(3):checked~ul.imgs>li:nth-child(3){
      left: 0;
      transition: 0.5s;
      z-index:1;
   }
   .slider input[type=radio]:nth-child(4):checked~ul.imgs>li:nth-child(4){
      left: 0;
      transition: 0.5s;
      z-index:1;
   }

/*===================슬라이드===================*/

</style>
<body>
   <%@include file="top.jsp"%>
   <%@include file="menu.jsp"%>
   <section>
         <div class="main">
            <div class="main_img_place">
               <%--<img alt="index..." src="/img/index.jpg" style="width:1000px; height:400px; margin-top:20px;">--%>

                  <div class="slider">
                     <input class="radio" type="radio" name="slide" id="slide1" checked>
                     <input class="radio" type="radio" name="slide" id="slide2">

                     <ul id="imgholder" class="imgs">
                        <li><img src="/img/slider_img_1.png"></li>
                        <li><img src="/img/slider_img_2.png"></li>

                     </ul>
                     <div class="bullets">
                        <label for="slide1">&nbsp;</label>
                        <label for="slide2">&nbsp;</label>

                     </div>
                  </div>



            </div><%--메인 이미지 슬라이드 공간 끝--%>


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
