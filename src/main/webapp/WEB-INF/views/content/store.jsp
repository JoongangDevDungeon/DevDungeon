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
            <div style="width: 300px; min-height: 800px; float: left; box-sizing: border-box; text-align: center;">
               <!-- 레벨, 아이콘, 이름 -->
               <div style="border: 1px solid #ccc; border-radius: 5px;">
                  <div style="width: 299px; height: 60px; box-sizing: border-box; padding-top: 7px; margin: 0 auto; border-bottom: 1px solid #ccc;">
                     <span style="display: inline-block; width: 45px; height: 45px; border-radius: 8px; text-align: center; line-height: 40px; background-color: black; color: white;">
                        LV.1
                     </span>
                     <span>
                        <img src="/img/icon/icon1.png" style="display: inline-block; width: 45px; height: 45px;">
                     </span>
                     <span style="display: inline-block; width: 100px; height: 45px; border-radius: 8px; text-align: left; box-sizing: border-box; padding-left: 5px; line-height: 40px; font-size: 20px;">
                        유정목
                     </span>
                  </div>
                  <div style="font-size: 18px; width: 300px; height: 37px;">
                     <table class="table">
                        <tr>
                           <th style="border-right: 1px solid #ccc; width: 100px; background-color: #8EA9D7; color: white; border: 0;">보유 포인트</th>
                           <td style="border: 0;">1,000</td>
                        </tr>
                     </table>
                  </div>
               </div>
               <div class="mt-5" style="border: 1px solid #ccc; border-radius: 5px;">
                  <div style="background-color: #ccc; height: 30px; line-height: 30px;">카테고리</div>
                  <ul style="list-style: none; margin: 0; padding: 0;">
                     <li style="border-bottom: 1px dashed #ccc;">전체</li>
                     <li style="border-bottom: 1px dashed #ccc;">귀여운</li>
                     <li>멋진</li>
                  </ul>
               </div>

               <div class="mt-5 mb-5">
                  <input type="text" class="form-control" style="width: 235px; float: left;" placeholder="이모티콘 이름">
                  <button type="button" class="btn btn-primary" style="margin-left: 10px; float: left;">검색</button>

                  <button class="btn btn-primary mt-5" style="width: 300px;" type="button">아이콘 등록 신청</button>
               </div>


            </div>
            <div class="content">
               <div style="width: 720px; height: 360px; margin: 0 auto;">
                  <!-- 이모티콘 목록 -->
                  <c:forEach var="i" begin="1" end="6" step="1" >
                     <div>
                        <input type="checkbox" style="background-color: #ff8080; width: 20px; height: 20px; margin-top: 50px; box-sizing: border-box; float: left; margin-left: 10px; margin-right: 10px;">
                        <div style="border: 1px solid #ccc; border-radius: 10px; box-sizing: border-box; margin: 10px; padding: 0; width: 300px; height: 100px; float: left;">
                           <div style="width: 80px; height: 100px; padding-top: 24px; float: left;">
                              <img src="/img/icon/icon${i}.png" style="display: inline-block; width: 45px; height: 45px;">
                           </div>
                           <div style="width: 214px; height: 100px; padding-left: 10px; box-sizing: border-box; float: left;">
                              <label style="width: 214px; height: 23px; line-height: 23px; text-align: left; font-weight: bold; float: left;">이모티콘 이름</label>
                              <div style="width: 214px; height: 23px; line-height: 33px; text-align: left; float: left;">
                                 <span style="display: inline-block; width: 60px; height: inherit;">가격</span>
                                 <span style="display: inline-block; width: 60px; height: inherit;">수량</span>
                              </div>
                              <div style="width: 214px; height: 23px; line-height: 33px; text-align: left; float: left;">
                                 <span style="display: inline-block; width: 60px; height: inherit;">사용 기간</span>
                                 <span style="display: inline-block; width: 60px; height: inherit;">등록일</span>
                              </div>
                              <div style="width: 214px; height: 23px; line-height: 33px; text-align: left; float: left;">
                                 <span style="display: inline-block; width: 60px; height: inherit;">구매</span>
                                 <span style="display: inline-block; width: 60px; height: inherit;">선물</span>
                              </div>
                           </div>
                        </div>
                     </div>
                  </c:forEach>
               </div>
               <div class="mt-3">
                  <span>페이징</span>
               </div>
               <div style="width: 580px; float: right;">
                  <button type="button" class="btn btn-primary" onclick="location.href='/giftShoppingBag'">선물</button>
                  <button type="button" class="btn btn-primary" onclick="location.href='/payShoppingBag'">구매</button>
               </div>
            </div>
            <div class="add2">광고2</div>
         </div>
   </section>
   <%@include file="../footer.jsp"%>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</html>
