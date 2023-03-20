<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>쿠폰 선택</title>
    <link rel="icon" href="/img/Gazi_shortCut.png"/>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/sign.css">
</head>
<script>
    $(function() {
        let coupon = "";
        $(".coupon-radio").click(function(){
            coupon = $(this).val();
        });

        $("#coupon_btn").click(function(){
            opener.$("#coupon_selected").text(coupon);
            window.close();
        });
    });

</script>
<body>
    <div>
        <div class="banner"><img src="/img/banner.png"></div>

            <div class="form-control find-form">
                <label class="find-label mt-4">쿠폰 선택</label>
                <!-- 발급 쿠폰 -->
                <c:forEach begin="1" end="6" step="1" var="test">
                <label class="form-control mt-4 mb-4" style="width: 675px; height: 80px; margin: 0 auto;">
                    <div style="width: 100px; height: 70px; float: left; padding-top: 25px; text-align: center; box-sizing: border-box;">
                        <input class="coupon-radio" type="radio" style="width: 20px; height: 20px;" name="coupon_radio" value="${test}">
                    </div>
                    <div class="mt-2">
                        <div style="width: 540px; height: 28px; float: left;">
                            <h5 style="float: left; ">쿠폰 할인</h5>
                            <span style="float: left; margin-left: 10px;  color: #ccc;">유효기간</span>
                        </div>
                        <div style="width: 540px; height: 28px; float: left;">
                            <span style="float: left;">유효기간</span>
                        </div>
                    </div>
                </label>
                </c:forEach>
                <button class="btn btn-primary mt-2 mb-3" style="width: 675px;" id="coupon_btn">쿠폰 선택</button>
            </div>

    </div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</html>