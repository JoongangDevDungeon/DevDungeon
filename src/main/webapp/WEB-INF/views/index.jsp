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
      height: 550px;
      background-image: url('/resources/img_place.png');
   }

   .board_top_list{/*보드 top.5 공간*/
	   margin: 0 auto;
	   margin-top: 50px;
	   width: 804px;
	   height: 604px;
	   border: 2px solid #ded8c3;
	   box-sizing: border-box;
   }

   .notice_top_list{/*공지사항 top.5 공간*/
      width:400px;
      height:300px;
      float: left;
      opacity:0.8;
	   border: 4px solid #ded8c3;
/*      background-color: #6867AC;*/
   }

   .question_top_list{/*질문게시판 top.5 공간*/
      width:400px;
      height:300px;
      float: left;
      opacity:0.8;
	   border: 4px solid #ded8c3;
/*      background-color: #A267AC;*/
   }

   .like_top_list{/*좋아요 top.5 공간*/
      width:400px;
      height:300px;
      float: left;
      opacity:0.8;
	   border: 4px solid #ded8c3;
/*      background-color: #CE7BB0;*/
   }

   .read_top_list{/*조회수 top.5 공간*/
      width:400px;
      height:300px;
      float: left;
      opacity:0.8;
	   border: 4px solid #ded8c3;
   }
/*===================슬라이드===================*/

   .slider{/* 슬라이드 이미지 크기*/
      width: 1000px;
      height: 500px;
      position: relative;
      margin: 0 auto;
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
      margin-top: 50px;
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
      background-color: #88a2a2;
   }
   .slider input[type=radio]:nth-child(2):checked~.bullets>label:nth-child(2){
      background-color: #88a2a2;
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

   .notice_logo{
	   width: 60px;
	   height: 60px;
	   margin: 0px -80px 0px 20px;
	   float: left;
	   background-image: url('/resources/notice_logo.png');
   }

   .question_logo{
	   width: 60px;
	   height: 60px;
	   margin: 0px -80px 0px 20px;
	   float: left;
	   background-image: url('/resources/question_logo.png');
   }

   .like_logo{
	   width: 60px;
	   height: 60px;
	   margin: 0px -80px 0px 20px;
	   float: left;
	   background-image: url('/resources/like_logo.png');
   }

   .read_logo{
	   width: 60px;
	   height: 60px;
	   margin: 0px -80px 0px 20px;
	   float: left;
	   background-image: url('/resources/read_logo.png');
   }

   h3{
	   line-height: 50px;
	   font-weight: bold;
	   color: gray;
   }

</style>
<body>
   <%@include file="top.jsp"%>
   <%@include file="menu.jsp"%>
   <section>
         <div class="main">
            <div class="main_img_place">
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

            <div class="content">

				<%--공지사항 부분--%>
               <div class="board_top_list">
				   <div class="notice_top_list"><h3><div class="notice_logo"></div> 공지사항 New.5</h3>
                  	<div class="ListFive">
                  	<table class="table table-striped">
                  	<c:forEach items="${noticeFive }" var="n">
                  		<tr>
                  			<td class="text-truncate" style="max-width:200px;" onclick="location.href='/noticeDetail?notice_no=${n.notice_no }'">${n.notice_title }</td>
                  			<td>${n.notice_date }</td>
                  		</tr>
                  	</c:forEach>
                  	</table>
                  	</div>
                  </div>

				   <%--질문 게시판 부분--%>
				   <div class="question_top_list"><h3><div class="question_logo"></div> 이벤트 New.5</h3>
                  	<div class="ListFive">
                  	<table class="table table-striped">
                  	<c:forEach items="${eventFive }" var="e">
                  		<tr>
                  			<td class="text-truncate" style="max-width:200px;" onclick="location.href='eventDetail?bno=${e.event_no }'">${e.event_title }</td>
                  			<td>${e.event_date }</td>
                  		</tr>
                  	</c:forEach>
                  	</table>
                  	</div>
                  </div>

				   <%--좋아요 부분--%>
				   <div class="like_top_list"><h3><div class="like_logo"></div> 좋아요 Top.5</h3>
                  	<div class="ListFive">
                  	<table class="table table-striped">
                  	<c:forEach items="${likeFive }" var="l">
                  		<tr>
                  			<td class="text-truncate" style="max-width:200px;" onclick="location.href='csjDetail?bno=${l.board_no}'">${l.board_title }</td>
                  			<td>${l.board_date }</td>
                  		</tr>
                  	</c:forEach>
                  	</table>
                  	</div>
                  </div>

				   <%--조휘수 부분--%>
				   <div class="read_top_list"><h3><div class="read_logo"></div> 조회수 Top.5</h3>
                  	<div class="ListFive">
                  	<table class="table table-striped">
                  	<c:forEach items="${viewFive }" var="v">
                  		<tr>
                  			<td class="text-truncate" style="max-width:200px;" onclick="location.href='csjDetail?bno=${v.board_no}'">${v.board_title }</td>
                  			<td>${v.board_date }</td>
                  		</tr>
                  	</c:forEach>
                  	</table>
                  	</div>
                  </div>
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
