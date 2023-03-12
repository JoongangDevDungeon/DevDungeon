<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
   <meta charset="UTF-8">
   <title>장바구니 - 구매</title>
   <link rel="icon" href="/img/Gazi_shortCut.png" />
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   <link rel="stylesheet" href="/css/layout.css">
</head>
<style>
   th, td {
      border-right: 1px solid #ccc;
   }
</style>
<body>
   <%@include file="../top.jsp"%>
   <%@include file="../menu.jsp"%>
   <section>
         <div class="main">
            <div class="add1">광고1</div>
            <div class="content">
               <table class="table" style="margin: 0 auto; width: 700px; border: 1px solid #ccc;">
                  <thead style="text-align: center;">
                     <tr>
                        <th>상품 이미지</th>
                        <th>상품 수량</th>
                        <th>판매자</th>
                        <th>가격</th>
                     </tr>
                  </thead>
                  <c:forEach var="i" step="1" begin="1" end="6">
                     <tbody style="text-align: center;">
                        <td style="width: 100px; height: 50px;">
                           <img src="/img/icon/icon${i}.png">
                        </td>
                        <td style="width: 100px; height: 50px;">
                           <input class="form-control mt-1" type="number" value="1">
                        </td>
                        <td>
                           <div style="line-height: 50px;">사용자</div>
                        </td>
                        <td>
                           <div style="line-height: 50px;">1,000</div>
                        </td>
                     </tbody>
                  </c:forEach>
               </table>

               <div class="form-control mt-4" style="width: 700px; margin: 0 auto;">
                  <h5>쿠폰 할인</h5>
                  <u class="form-control-plaintext">선택된 쿠폰이 없습니다.</u>
                  <button class="btn btn-primary mt-2" onclick="location.href='/couponChoice'">쿠폰사용</button>
               </div>

               <div class="form-control mt-4" style="width: 700px; margin: 0 auto;">
                  <h5>결제 금액</h5>
                  <div>
                     <h4 class="form-control-plaintext">6,000</h4>
                     <span style="color: #ccc;">보유 포인트 : 12,000</span>
                  </div>
               </div>

               <div class="mt-3" style="width: 700px; height: 100px; margin: 0 auto;">
                  <div style="width: 700px;">
                     <button class="btn btn-primary" style="float: left; width: 700px;" type="button">구매</button>
                  </div>
               </div>
            </div>
            <div class="add2">광고2</div>
         </div>
   </section>
   <%@include file="../footer.jsp"%>
</body>
<script>
   $(function() {
      var error_msg = "${error_msg}";
      if(error_msg == "login_fail") alert("아이디와 비밀번호를 확인해주세요.");
   });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</html>
