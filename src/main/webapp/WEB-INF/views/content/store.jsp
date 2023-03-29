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
   <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
   <link rel="stylesheet" href="/css/layout.css">
</head>
<style>
   /* adminPaging*/
   .pagingBox{	width:700px; margin:0 auto; }
   .pagingList{
      margin:0;
      padding:0;
      list-style: none;
      display: flex;
      justify-content: start;
      justify-content: center;
      font-size: 13px;
   }
   .pageNo{
      cursor: pointer;
      width:30px;
      height:30px;
      text-align: center;
      line-height: 30px;
      border-radius: 5px;
   }
   .pageNo:hover{ background-color: #d3d3d3; }
   .page_btn{
      background-color: #88a2a2;
      margin:0 2px;
      color:white;
      font-weight: bold;
      font-size: 14px;
   }

   /* adminSearch bar */
   .searchForm{ display: flex; justify-content: center; }
   .search_btn{
      background-color: #88a2a2;
      border:none;
      border-radius: 5px;
      font-size: 15px;
      width:60px;
      height:30px;
      color:white;
      font-weight: bold;
   }
</style>
<script>
   function search(){	//검색 체크
      let searchValue = document.getElementById("searchValue");
      if(searchValue.value=="") {
         alert("검색어를 입력해주세요");
         return false;
      }
   }

   function moveBefore(pageNo){	//페이징 시작
      let searchValue = document.getElementById("searchValue");
      let url =  document.location.href.split("?",1);
      if(pageNo < 1) { return false; }
      else if (pageNo != 1){
         if(searchValue.value != ""){
            location.href=url+"?searchValue="+searchValue.value+"&pageNo="+(pageNo-1);
         }else{
            location.href="/store?pageNo="+(pageNo-1);
         }
      }else{
         if(searchValue.value != ""){
            location.href=url+"?searchValue="+searchValue.value+"&pageNo="+1;
         }else{
            location.href="/store?pageNo="+1;
         }
      }
   }

   function moveNext(pageNo){	//페이지 뒤쪽 버튼
      let searchValue = document.getElementById("searchValue");
      let url =  document.location.href.split("?",1);

      if(pageNo > ${pages.lastPage } ) { return false; }
      else if (pageNo != ${pages.lastPage } ){

         if(searchValue.value != ""){
            location.href=url+"?searchValue="+searchValue.value+"&pageNo="+(pageNo+1);
         }else{
            location.href="/store?pageNo="+(pageNo+1);
         }

      }else if(pageNo == ${pages.lastPage }){

         if(searchValue.value != ""){
            location.href=url+"?searchValue="+searchValue.value+"&pageNo="+pageNo;
         }else{
            location.href="/store?pageNo="+pageNo;
         }
      }
   }
   function move(pageNo){
      let searchValue = document.getElementById("searchValue");
      let url =  document.location.href.split("?");
      if(searchValue.value != ""){
         location.href=url[0]+"?searchValue="+searchValue.value+"&pageNo="+pageNo;
      }else{
         location.href="/store?pageNo="+pageNo;
      }

   }//페이징 끝


   $(function() {
      const shopping_bag = [];

      $(".pay_one").click(function() {
         let icon_no = $(this).attr("value")
         $.post({
            url : "/shoppingBag",
            data : {"shoppingBag" : [icon_no], "sell_type" : "pay" },
            dataType : "text",
            success : function (result) {
               if(result == 1) {
                  location.href = "/payShoppingBag?type=pay";
               } else if(result == 2) {
                  alert("이미 구매한 아이콘이 있습니다.\n다시 한번 확인해주세요.");
               }
            },
            error : function () {
               console.log("구매 중 오류가 발생했습니다.\n잠시 후 다시 시도해주세요.");
            }
         });
      });

      $(".gift_one").click(function(){
         alert("단일 선물" + " : " + $(this).attr("value"));
      });

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
                data : {"shoppingBag" : shopping_bag, "sell_type" : "cart_pay" },
                dataType : "text",
                success : function (result) {
                    if(result == 1) {
                       alert("구매 장바구니에 담았습니다.");
                    } else if(result == 2) {
                       alert("이미 구매한 아이콘이 있습니다.\n다시 한번 확인해주세요.");
                    } else {
                       if(confirm("이미 구매 장바구니에 아이콘이 있습니다.\n구매 화면으로 이동하겠습니까?.")) {
                           location.href = "/payShoppingBag?type=cart_pay";
                       }
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
                     if(confirm("선물 장바구니에 담았습니다.\n선물 화면으로 이동하겠습니까?")) {
                        location.href = "/giftShoppingBag";
                     }
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

      $("#multi_pay_btn").click(function() {
         if((shopping_bag == null || shopping_bag == "")) {
            location.href = "/payShoppingBag?type=cart_pay";
            return false;
         } else {
            console.log("구매 목록 : " + shopping_bag);
            $.post({
               url : "/shoppingBag",
               data : {"shoppingBag" : shopping_bag, "sell_type" : "cart_pay" },
               dataType : "text",
               success : function (result) {
                  if(result == 1) {
                     location.href = "/payShoppingBag?type=cart_pay";
                  } else if(result == 2) {
                     alert("이미 구매한 아이콘이 있습니다.\n다시 한번 확인해주세요.");
                  } else {
                     if(confirm("이미 구매 장바구니에 아이콘이 있습니다.\n구매 화면으로 이동하겠습니까?.")) {
                        location.href = "/payShoppingBag?type=cart_pay";
                     }
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
                     <div style="width: 198px; height: 30px; line-height: 30px; background-color: #88a2a2; color: white; border-radius: 5px 5px 0 0; box-sizing: border-box;">현재 아이콘 상태</div>
                     <div style="width: 200px; height: 30px;">
                        <span style="display: block; width: 30px; height: 30px; line-height: 30px; margin-left: 5px; float: left;">Lv.${profile.member_level}</span>
                        <span style="display: block; width: 30px; height: 30px; margin-left: 10px; padding-top: 2px; box-sizing: border-box; border-radius: 5px; float: left;">
                           <img src="data:image/png;base64,${profile.icon_image}" onerror="this.src='/img/Gazi_shortCut.png'" style="width: 25px; height: 25px;"/>
                        </span>
                        <span style="display: block; width: 120px; height: 30px; padding-top: 2px; box-sizing: border-box; border-radius: 5px; float: left;">${profile.member_name}</span>
                     </div>
                     <div>
                        <span style="display: block; width: 200px; height: 30px; line-height: 30px;">보유 포인트 : <fmt:formatNumber value="${profile.member_point }" pattern="#,###" /></span>
                     </div>
                  </div>

                  <!-- 아이콘 검색 -->
                  <div class="mt-3 list-group" style="width: 200px; height: 65px;">
                     <form action="/store" method="get" onsubmit="return search()">
                        <input class="form-control" style="width: 138px; height: 30px; float: left;" type="text" name="searchValue" id="searchValue" value="${pages.searchValue }">
                        <button class="search_btn" style="float: left; height: 30px;">검색</button>
                     </form>
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
                                    <img src="data:image/png;base64,${iconList.icon_image}" onerror="this.src='/img/Gazi_shortCut.png'" style="width: 45px; height: 45px;"></img>
                                 </span>
                              </div>
                              <!-- 아이콘 내용 -->
                              <div style="width: 217px; height: 150px; float: left;">
                                 <div style="width: inherit; height: 37.5px; line-height: 37px;">
                                    <span style="font-size: 18px; font-weight: bold;">${iconList.product_name}</span>
                                 </div>
                                 <div style="width: inherit; height: 37.5px; line-height: 37px;">
                                    <span style="display: block; width: 100px; height: 37.5px; float: left;"><span style="display: block; width: 50px; height: inherit; padding-left: 10px; box-sizing: border-box; float: left;">재고</span><span style="display: block; text-align: left; width: 50px; height: inherit; float: left;">: ${iconList.product_sell_cnt}</span></span>
                                    <span style="display: block; width: 108px; height: 37.5px; float: left;">가격 : <fmt:formatNumber value="${iconList.product_price }" pattern="#,###" /></span>
                                 </div>
                                 <div style="width: inherit; height: 37.5px; line-height: 37px;">
                                    <span style="display: block; width: 228px; height: 37.5px; float: left; padding-right: 50px; box-sizing: border-box;">등록일&nbsp;&nbsp;:&nbsp;&nbsp;<fmt:formatDate value="${iconList.product_update}" pattern="yyyy-MM-dd" type="date"/></span>
                                 </div>
                                 <div style="width: inherit; height: 37.5px; line-height: 37px;">
                                    <span style="display: block; width: 100px; height: 37.5px; float: left;"><span class="pay_one" value="${iconList.product_no}">구매</span><!--&nbsp;|&nbsp;<span class="gift_one" value="${iconList.product_no}">선물</span>--></span>
                                    <span style="display: block; width: 108px; height: 37.5px; float: left;">신청:<c:choose><c:when test="${iconList.member_name != null}">${iconList.member_name}</c:when><c:otherwise>탈퇴자</c:otherwise></c:choose></span>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </c:forEach>
                     <div class="mt-5 mb-4" style="width: 660px; float: left;">
                        <!-- 페이징 -->
                        <div class="pagingBox">
                           <ul class="pagingList">
                              <li class="pageNo page_btn" onclick="moveBefore(${pageNo})"><i class="xi-step-backward xi-x"></i></li>
                              <c:forEach var="i" begin="${Math.floor((pageNo-1)/8)*8+1 }" end="${Math.floor((pageNo-1)/8)*8+8 gt pages.lastPage ? pages.lastPage : Math.floor((pageNo-1)/8)*8+8}">
                                 <li class="pageNo" onclick="move(${i })" <c:if test="${pageNo eq i }" >style="color:red; font-weight: bold;"</c:if>>${i }</li>
                              </c:forEach>
                              <li class="pageNo page_btn" onclick="moveNext(${pageNo})"><i class="xi-step-forward xi-x"></i></li>
                           </ul>
                        </div>
                     </div>
                     <div class="mt-3" style="width: 660px; float: left; position: relative;">
                        <button class="btn btn-primary" style="position: absolute; left: 0;" onclick="location.href='/iconApply'">아이콘 신청</button>

                        <div style="position: absolute; right: 0;">
                           <button class="btn btn-primary" id="pay_shopping_bag">장바구니 추가</button>
                           <button class="btn btn-primary" id="multi_pay_btn">결제하기</button>
                           <!--<button class="btn btn-primary" id="gift_shopping_bag">선물</button>-->
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
