<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="/resources/assets/favicon.ico" />
	<div class="menu">
	<div>
	<!-- 로고 -->
	<div>로고임당</div>
	<!-- 사용자 이모티콘 -->
	<div>이모티콘임당</div>
	<!-- 관리자 이름 -->
	${sessionScope.id }님 환영합니다!
	</div>
	<!-- 선 -->
	<div>
	--------------------------------
	</div>
	<!-- 사이트관리 -->
	사이트 관리
	
	
	
		<div class="menu-item" onclick="url('admin')"><img src="./img/admin/adminhome1.png">메인 대쉬보드</div>
		<div class="menu-item" onclick="url('adminMember')"><img src="./img/admin/adminmainboard1.png">사용자 관리</div>
		<div class="menu-item" onclick="url('adminBoard')"><img src="./img/admin/adminuser1.png">게시글 관리</div>
		<div class="menu-item" onclick="url('adminLog')"><img src="./img/admin/admincookie1.png">로그 데이터</div>
		<div class="menu-item" onclick="url('adminStatistics')"><img src="./img/admin/adminstatistics1.png">통계</div>
		<div class="menu-item" onclick="url('adminCoupon')"><img src="./img/admin/admincoupon1.png">쿠폰발급</div>
		<div class="menu-item" onclick="url('adminQnA')"><img src="./img/admin/adminQnA1.png">QnA FAQ</div>
		<div class="menu-item" onclick="url('adminStore')"><img src="./img/admin/adminstore1.png">스토어</div>
		<div class="menu-item" onclick="url('adminEvent')"><img src="./img/admin/adminevent1.png">이벤트</div>
		<div class="menu-item" onclick="url('adminPoint')"><img src="./img/admin/adminpoint1.png">포인트 정산</div>
	</div>