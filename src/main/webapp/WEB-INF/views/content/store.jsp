<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
   <meta charset="UTF-8">
   <title>스토어</title>
   <link rel="icon" href="/img/Gazi_shortCut.png" />
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   <link rel="stylesheet" href="/css/layout.css">
</head>
<script>
   $(function() {
      const shopping_bag = [];

      $(".icon_check").click(function() {
         var icon_checked = $(this).is(":checked");
         var icon_no = $(this).val();

         if(icon_checked) {
            console.log("장바구니 추가 : " + icon_no);
            shopping_bag.push(icon_no);
         } else {
            for(var i = 0; i < shopping_bag.length; i++) {
               if((shopping_bag[i] == icon_no)) {
                    console.log("장바구니 삭제 : " + shopping_bag[i]);
                    shopping_bag.splice(i, 1);
               }
            }
         }

      });

      $("#pay_shopping_bag").click(function() {
         if((shopping_bag == null || shopping_bag == "")) {
            alert("구매 목록이 없습니다.");
            return false;
         } else {
             console.log("구매 목록 : " + shopping_bag);
             $.post({
                url : "/shoppingBag",
                data : {"shoppingBag" : shopping_bag, "sell_type" : "pay" },
                dataType : "text",
                success : function (result) {
                    if(result > 0) {
                       alert("구매 장바구니에 담았습니다.");
                    } else {
                       alert("이미 구매 장바구니에 아이콘이 있습니다.\n다시 한번 확인해주세요.");
                    }
                },
                error : function () {
                    console.log("장바구니에 담지 못했습니다.");
                }
             });
         }

      });

      $("#gift_shopping_bag").click(function() {
         if((shopping_bag == null || shopping_bag == "")) {
            alert("선물 목록이 없습니다.");
            return false;
         } else {
             console.log("선물 목록 : " + shopping_bag);
            $.post({
               url : "/shoppingBag",
               data : {"shoppingBag" : shopping_bag, "sell_type" : "gift" },
               dataType : "text",
               success : function (result) {
                  if(result > 0) {
                     alert("선물 장바구니에 담았습니다.");
                  } else {
                     alert("이미 선물 장바구니에 아이콘이 있습니다.\n다시 한번 확인해주세요.");
                  }
               },
               error : function () {
                  console.log("장바구니에 담지 못했습니다.");
               }
            });
         }
      });

   });
</script>
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
                        <span style="display: block; width: 30px; height: 30px; line-height: 30px; margin-left: 5px; float: left;">Lv.${profile.member_level}</span>
                        <span style="display: block; width: 30px; height: 30px; margin-left: 10px; padding-top: 2px; box-sizing: border-box; border-radius: 5px; float: left;">
                           <img src="data:image/png;base64,${profile.icon_image}" onerror="this.src='/img/Gazi_shortCut.png'" style="width: 25px; height: 25px;">
                        </span>
                        <span style="display: block; width: 120px; height: 30px; padding-top: 2px; box-sizing: border-box; border-radius: 5px; float: left;">${profile.member_name}</span>
                     </div>
                     <div>
                        <span style="display: block; width: 200px; height: 30px; line-height: 30px;">보유 포인트 : <fmt:formatNumber value="${profile.member_point }" pattern="#,###" /></span>
                     </div>
                  </div>

                  <!-- 아이콘 검색 -->
                  <div class="mt-3 list-group" style="width: 200px; height: 65px;">
                     <input class="form-control" type="text" style="width: 200px; height: 30px;" placeholder="아이콘 이름을 입력하세요.">
                     <button class="btn btn-primary" type="text" style="width: 200px; height: 30px; margin-top: 5px;">검색</button>
                  </div>
               </div>
               <!-- 아이콘 목록 화면 전체 -->
               <div style="width: 950px; height: 800px; margin-left: 50px; float: left;">
                  <!-- 아이콘 리스트 -->
                  <div style="width: 660px; height: 800px; margin: 0 auto;">
                     <!-- 아이콘 개별 -->
                     <c:forEach var="iconList" items="${iconList}">
                        <div style="width: 330px; height: 150px; margin-top: 10px; float: left;">
                           <input class="icon_check" type="checkbox" style="width: 20px; height: 20px; margin-top: 60px; margin-right: 5px; margin-left: 5px; float: left;" value="${iconList.product_no}">
                           <div style="border: 1px solid #ccc; border-radius: 10px; width: 280px; height: 150px; float: left;">
                              <!-- 아이콘 이미지 -->
                              <div style="width: 60px; height: 150px;  float: left;">
                                 <span style="display: block; width: 45px; height: 45px; padding-top: 45px; box-sizing: border-box; margin: 0 auto;">
                                    <img src="data:image/png;base64,${iconList.icon_image}" alt="${iconList.emo_img_name}" onerror="this.src='/img/Gazi_shortCut.png'" style="width: 45px; height: 45px;">
                                 </span>
                              </div>
                              <!-- 아이콘 내용 -->
                              <div style="width: 217px; height: 150px; float: left;">
                                 <div style="width: inherit; height: 37.5px; line-height: 37px;">
                                    <span style="font-size: 18px; font-weight: bold;">${iconList.product_name}</span>
                                 </div>
                                 <div style="width: inherit; height: 37.5px; line-height: 37px;">
                                    <span style="display: block; width: 100px; height: 37.5px; float: left;"><span style="display: block; width: 40px; height: inherit; padding-left: 10px; box-sizing: border-box; float: left;">재고</span><span style="display: block; text-align: left; width: 60px; height: inherit; float: left;">:${iconList.product_sell_cnt}</span></span>
                                    <span style="display: block; width: 108px; height: 37.5px; float: left;">가격:<fmt:formatNumber value="${iconList.product_price }" pattern="#,###" /></span>
                                 </div>
                                 <div style="width: inherit; height: 37.5px; line-height: 37px;">
                                    <span style="display: block; width: 228px; height: 37.5px; float: left; padding-right: 50px; box-sizing: border-box;">등록일&nbsp;&nbsp;:&nbsp;&nbsp;<fmt:formatDate value="${iconList.product_update}" pattern="yyyy-MM-dd" type="date"/></span>
                                 </div>
                                 <div style="width: inherit; height: 37.5px; line-height: 37px;">
                                    <span style="display: block; width: 100px; height: 37.5px; float: left;"><a href="">구매</a>&nbsp;|&nbsp;<a href="">선물</a></span>
                                    <span style="display: block; width: 108px; height: 37.5px; float: left;">신청:${iconList.member_name}</span>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </c:forEach>
                     <div class="mt-5 mb-4" style="width: 660px; float: left;">
                        <span>페이징</span>
                     </div>
                     <div class="mt-3" style="width: 660px; float: left; position: relative;">
                        <button class="btn btn-primary" style="position: absolute; left: 0;" onclick="location.href='/iconApply'">아이콘 신청</button>
                        <div style="position: absolute; right: 0;">
                           <button class="btn btn-primary" id="pay_shopping_bag">구매</button>
                           <button class="btn btn-primary" id="gift_shopping_bag">선물</button>
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
