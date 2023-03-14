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
               <!-- 좌측 화면 인포메이션 -->
               <div style=" width: 200px; height: 800px; float: left;">
                  <!-- 구매자 현재 상태 -->
                  <div style="width: 200px; height: 90px; border: 1px solid #ccc; border-radius: 5px;">
                     <div style="width: 198px; height: 30px; line-height: 30px; background-color: black; color: white; border-radius: 5px 5px 0 0; box-sizing: border-box;">현재 아이콘 상태</div>
                     <div style="width: 200px; height: 30px;">
                        <span style="display: block; width: 30px; height: 30px; line-height: 30px; margin-left: 5px; float: left;">Lv.1</span>
                        <span style="display: block; width: 30px; height: 30px; margin-left: 5px; padding-top: 2px; box-sizing: border-box; border-radius: 5px; float: left;">
                           <img src="/img/icon/icon1.png" style="width: 25px; height: 25px;">
                        </span>
                        <span style="display: block; width: 120px; height: 30px; margin-left: 5px; padding-top: 2px; box-sizing: border-box; border-radius: 5px; float: left;">유정목</span>
                     </div>
                     <div>
                        <span style="display: block; width: 200px; height: 30px; line-height: 30px;">보유 포인트 : 12,000</span>
                     </div>
                  </div>

                  <!-- 아이콘 검색 -->
                  <div class="mt-3 list-group" style="width: 200px; height: 65px;">
                     <input class="form-control" type="text" style="width: 200px; height: 30px;" placeholder="아이콘 이름을 입력하세요.">
                     <button class="btn btn-primary" type="text" style="width: 200px; height: 30px; margin-top: 5px;">검색</button>
                  </div>

                  <!-- 카테고리 -->
                  <div class="mt-3 list-group" style="width: 200px; height: auto;">
                     <ul class="list-group" style="list-style: none; margin: 0; padding: 0;">
                        <li class="list-group-item list-group-item-action">카테고리1</li>
                        <li class="list-group-item list-group-item-action">카테고리2</li>
                        <li class="list-group-item list-group-item-action">카테고리3</li>
                        <li class="list-group-item list-group-item-action">카테고리4</li>
                     </ul>
                  </div>
               </div>
               <!-- 아이콘 목록 화면 전체 -->
               <div style="width: 950px; height: 800px; margin-left: 50px; float: left;">
                  <!-- 아이콘 리스트 -->
                  <div style="width: 660px; height: 800px; margin: 0 auto;">
                     <!-- 아이콘 개별 -->
                     <c:forEach step="1" begin="1" end="6" var="i">
                        <div style="width: 330px; height: 150px; margin-top: 10px; float: left;">
                           <input type="checkbox" style="width: 20px; height: 20px; margin-top: 60px; margin-right: 5px; margin-left: 5px; float: left;">
                           <div style="border: 1px solid #ccc; border-radius: 10px; width: 280px; height: 150px; float: left;">
                              <!-- 아이콘 이미지 -->
                              <div style="width: 60px; height: 150px;  float: left;">
                                 <span style="display: block; width: 45px; height: 45px; padding-top: 45px; box-sizing: border-box; margin: 0 auto;">
                                    <img src="/img/icon/icon${i}.png" style="width: 45px; height: 45px;">
                                 </span>
                              </div>
                              <!-- 아이콘 내용 -->
                              <div style="width: 217px; height: 150px; float: left;">
                                 <div style="width: inherit; height: 37.5px; line-height: 37px;">
                                    <span>아이콘 이름</span>
                                 </div>
                                 <div style="width: inherit; height: 37.5px; line-height: 37px;">
                                    <span style="display: block; width: 108px; height: 37.5px; float: left;">수량</span>
                                    <span style="display: block; width: 108px; height: 37.5px; float: left;">가격</span>
                                 </div>
                                 <div style="width: inherit; height: 37.5px; line-height: 37px;">
                                    <span style="display: block; width: 108px; height: 37.5px; float: left;">사용 시간</span>
                                    <span style="display: block; width: 108px; height: 37.5px; float: left;">등록일</span>
                                 </div>
                                 <div style="width: inherit; height: 37.5px; line-height: 37px;">
                                    <span style="display: block; width: 108px; height: 37.5px; float: left;">구매</span>
                                    <span style="display: block; width: 108px; height: 37.5px; float: left;">선물</span>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </c:forEach>
                     <!-- 테스트용 이미지 -->
                     <div style="width: 330px; height: 150px; margin-top: 10px; float: left;">
                        <input type="checkbox" style="width: 20px; height: 20px; margin-top: 60px; margin-right: 5px; margin-left: 5px; float: left;">
                        <div style="border: 1px solid #ccc; border-radius: 10px; width: 280px; height: 150px; float: left;">
                           <!-- 아이콘 이미지 -->
                           <div style="width: 60px; height: 150px;  float: left;">
                                 <span style="display: block; width: 45px; height: 45px; padding-top: 45px; box-sizing: border-box; margin: 0 auto;">
                                    <img src="data:image/png;base64,${imageDataString}" style="width: 45px; height: 45px;">
                                 </span>
                           </div>
                           <!-- 아이콘 내용 -->
                           <div style="width: 217px; height: 150px; float: left;">
                              <div style="width: inherit; height: 37.5px; line-height: 37px;">
                                 <span>아이콘 이름</span>
                              </div>
                              <div style="width: inherit; height: 37.5px; line-height: 37px;">
                                 <span style="display: block; width: 108px; height: 37.5px; float: left;">수량</span>
                                 <span style="display: block; width: 108px; height: 37.5px; float: left;">가격</span>
                              </div>
                              <div style="width: inherit; height: 37.5px; line-height: 37px;">
                                 <span style="display: block; width: 108px; height: 37.5px; float: left;">사용 시간</span>
                                 <span style="display: block; width: 108px; height: 37.5px; float: left;">등록일</span>
                              </div>
                              <div style="width: inherit; height: 37.5px; line-height: 37px;">
                                 <span style="display: block; width: 108px; height: 37.5px; float: left;">구매</span>
                                 <span style="display: block; width: 108px; height: 37.5px; float: left;">선물</span>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="mt-3" style="width: 660px; float: left;">
                        <span>페이징</span>
                     </div>
                     <div class="mt-3" style="width: 660px; float: left; position: relative;">
                        <button class="btn btn-primary" style="position: absolute; left: 0;" onclick="location.href='/iconApply'">아이콘 신청</button>
                        <div style="position: absolute; right: 0;">
                           <button class="btn btn-primary" onclick="location.href='/payShoppingBag'">구매</button>
                           <button class="btn btn-primary" onclick="location.href='/giftShoppingBag'">선물</button>
                        </div>
                     </div>
                  </div>

               </div>
            </div>
            <div class="add2">광고2</div>
         </div>
   </section>
   <%@include file="../footer.jsp"%>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</html>
