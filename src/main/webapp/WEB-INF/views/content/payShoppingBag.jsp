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
<script>
   let error = "${error}";
   if(error == "empty_payBag") {
      alert("장바구니 비었습니다.");
      location.href = "/store";
   }

   let total_price;
   let coupon_type;
   let coupon_content;
   let sale_price;
   let result_price;

   $(function() {
      total_price = $("#total_price").attr("value");
      $("#result_price").text(total_price);

      $("#coupon_btn").click(function() { // 쿠폰 팝업
         window.open('/couponChoice', 'popup', 'width=700, height=660');
      });

      $("#pay_btn").click(function() {
         if(result_price == "" || result_price == null) {
            result_price = total_price;
         }
         console.log("최종 결제 금액 : " + result_price);
         $.post({
            url : "/payProduct",
            data : { "result_price" : result_price },
            dataType : "text",
            success : function (result) {
               console.log("구매 완료");
            },
            error : function() {
               alert("상품 구매중 오류가 발생했습니다.\n잠시 후 다시 시도해주세요.");
            }
         });
      });
   });

   function couponInfo(type, content) {
      coupon_type = type;
      coupon_content = content;
      sale_price = total_price * (coupon_content / 100);
      result_price = total_price - sale_price;

      document.getElementById("result_price").innerHTML = result_price;

      console.log("총 상품금액 : " + total_price);
      console.log("쿠폰 발급번호 : " + coupon_type);
      console.log("쿠폰 할인율 : " + coupon_content);
      console.log("실제 할인 금액 : " + sale_price);
   }
</script>
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
                        <th>상품명</th>
                        <th>판매자</th>
                        <th>가격</th>
                     </tr>
                  </thead>
                  <c:forEach items="${cart}" var="cart">
                     <tbody style="text-align: center;">
                        <td style="width: 120px; height: 50px; padding-top: 18px; box-sizing: border-box;">
                           <img src="data:image/png;base64,${cart.icon_image}" onerror="this.src='/img/Gazi_shortcut.png'" style="width: 30px; height: 30px;">
                        </td>
                        <td style="width: 100px; height: 50px;">
                           <div style="line-height: 50px;">${cart.product_name}</div>
                        </td>
                        <td>
                           <div style="line-height: 50px;">${cart.seller_name}</div>
                        </td>
                        <td>
                           <div style="line-height: 50px;">${cart.product_price}</div>
                        </td>
                     </tbody>
                  </c:forEach>
               </table>

               <div class="form-control mt-4" style="width: 700px; margin: 0 auto;">
                  <h5>쿠폰 할인</h5>
                  <u class="form-control-plaintext" id="coupon_selected">선택된 쿠폰이 없습니다.</u>
                  <button class="btn btn-primary mt-2" id="coupon_btn">쿠폰사용</button>
               </div>

               <div class="form-control mt-4" style="width: 700px; margin: 0 auto;">
                  <h5>결제 금액</h5>
                  <div>
                     <c:forEach items="${cart}" var="cart">
                        <c:set var="total" value="${total + cart.product_price}"/>
                     </c:forEach>
                     <h4 class="form-control-plaintext" id="result_price">총 상품 금액</h4>
                     <span style="color: #ccc;"><span id="total_price" value="${total}">상품 총 금액</span> - <span id="coupon_sale">쿠폰할인 금액</span></span>
                  </div>
               </div>

               <div class="mt-3" style="width: 700px; height: 100px; margin: 0 auto;">
                  <div style="width: 700px;">
                     <button class="btn btn-primary" style="float: left; width: 700px;" id="pay_btn" type="button">구매</button>
                     <button class="btn btn-secondary mt-2" style="float: left; width: 700px; background-color: white; border: 1px solid #ccc; color: black;" onclick="location.href='/gifctShoppingBag'" type="button">선물 장바구니</button>
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
