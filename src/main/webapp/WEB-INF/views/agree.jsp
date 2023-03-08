<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
   <meta charset="UTF-8">
<title>게시글 관리</title>
<link rel="stylesheet" href="">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<style>


.all_fild{
width: 100%;
}

.agree_fild{
width:700px;
margin: 0 auto;
background-color: yellow;
}

.banner{
text-align: center;
}

.agree_inner{
width: 700px;
height: 200px;
}

.text_box{
width: 700px;
height: 150px;
border: 2px solid gray;
box-sizing: border-box;
overflow:auto;
}
</style>
<body>



   <div class="all_fild" style="background-color: red;"><!-- 전체 범위 -->
   
   <div class="banner"><img src="/img/banner.png"></div><!-- 배너 -->
  
   <div class="agree_fild"><!-- 약관동의 범위 -->
   

   <div><input type="checkbox">가지 이용약관, 개인정보 수집 및 이용, 프로모션 정보 수신(선택)에 모두 동의합니다.</div><br><!-- 약관 모두 동의-->

   <div class="agree_inner" style="background-color: #BDE08C;"><!-- 약관동의 A범위 -->
   
   <label><input type="checkbox">가지 이용약관 동의(필수)</label><!-- 약관동의A-->
  
  <div class="text_box"><!-- 텍스트 박스 -->
  <b>여러분을 환영합니다.</b>
  <p>가지 서비스를 이용해 주셔서 감사합니다.
  본 약관은 다양한 가지 서비스의 이용과 관련하여 가지 서비스를
  제공하는 가지와 이를 이용하는 가지 서비스 회원
  또는 비회원과의 관계를 설명하며, 아울러 여러분의 가지 서비스 이용에 도움이 될 수 있는
  유익한 정보를 포함하고 있습니다.
  가지 서비스를 이용하시거나 가지 서비스 회원으로 가입하실 경우
  여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하되므로,
  잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.
  </p>
  </div><!-- 텍스트 끝 -->
  
  </div><br><!-- 약관 동의 A끝 -->
  
<!-- ================================================================================= -->
    
  <div class="agree_inner" style="background-color: #8EA9D7;"><!-- 약관동의 B범위 -->
   <label><input type="checkbox">개인정보 수집 및 이용 동의(필수)</label><!-- 약관동의B-->
  
  <div class="text_box"><!-- 텍스트 박스 -->
  <p>개인정보보호법에 따라 가지에 회원가입 신청하시는 분께 수집하는 개인정보의 항목,
  개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시
  불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
  </p>
  
  <p>
  1. 수집하는 개인정보
  이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 가지 서비스를 회원과 동일하게 이용할 수 있습니다.
  이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 가지는
  서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.

  회원가입 시점에 가지가 이용자로부터 수집하는 개인정보는 아래와 같습니다.
  - 회원 가입 시 필수항목으로 아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호를, 선택항목으로 본인확인 이메일주소를 수집합니다.
  단, 비밀번호 없이 회원 가입 시에는 필수항목으로 아이디, 이름, 생년월일, 휴대전화번호를, 선택항목으로 비밀번호를 수집합니다.
  만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다.
  </p>
  
  
  </div><!-- 텍스트 끝 -->
  
  </div><br><!-- 약관 동의 B끝 -->
  
  <!-- ================================================================================= -->
    
  <div class="agree_inner" style="background-color: #FBD262;"><!-- 약관동의 C범위 -->
   <label><input type="checkbox">프로모션 정보 수신 동의(선택)</label><!-- 약관동의C-->
  
  <div class="text_box"><!-- 텍스트 박스 -->
  <p>가지에서 제공하는 이벤트/혜택 등 다양한 정보를 휴대전화(가지앱 알림 또는 문자),
  이메일로 받아보실 수 있습니다. 일부 서비스(별도 회원 체계로 운영하거나 가지 가입 이후 추가 가입하여 이용하는 서비스 등)의 경우,
  개별 서비스에 대해 별도 수신 동의를 받을 수 있으며, 이때에도 수신 동의에 대해 별도로 안내하고 동의를 받습니다.
  </p>
  </div><!-- 텍스트 끝 -->
  
  </div><!-- 약관 동의 C끝 -->
   
   
   
   <button class="btn btn-primary" style="width: 700px; height:50px;">다음</button>
   </div><!-- 약관 전체 범위 끝 -->
	
	
	

	
   </div><!-- 전체 끝 -->

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</html>