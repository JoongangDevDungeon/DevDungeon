<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<div class="menu">
	<div>
		<!-- 로고 -->
		<img class="logo" src="./img/logo.png">
		<hr class="hr1">
		
		<!-- 사용자 이모티콘 -->
		<div class="adminuser">
			<img src="./img/admin/adminManage.png">${sessionScope.id } 님
		</div>
	</div>
	
	<!-- 선 -->
	<hr class="hr1">
	
	<!-- 사이트관리 -->
	<div class="">
		<div class="menu-item" onclick="url('admin')"><img src="./img/admin/adminhome1.png">메인 대쉬보드</div>
		<div class="menu-item" onclick="url('adminMember')"><img src="./img/admin/adminuser1.png">사용자 관리</div>
		<div class="menu-item" onclick="url('adminBoard')"><img src="./img/admin/adminmainboard1.png">게시글 관리</div>
		<div class="menu-item" onclick="url('adminLog')"><img src="./img/admin/admincookie1.png">로그 데이터</div>
		<div class="menu-item" onclick="url('adminStatistics')"><img src="./img/admin/adminstatistics1.png">통계</div>
		<div class="menu-item" onclick="url('adminCoupon')"><img src="./img/admin/admincoupon1.png">쿠폰발급</div>
		<div class="menu-item" onclick="url('adminQnA')"><img src="./img/admin/adminQnA1.png">QnA</div>
		<div class="menu-item" onclick="url('adminStore')"><img src="./img/admin/adminstore1.png">스토어</div>
		<div class="menu-item" onclick="url('adminEvent')"><img src="./img/admin/adminevent1.png">이벤트</div>
		<div class="menu-item" onclick="url('adminPoint')"><img src="./img/admin/adminpoint1.png">포인트 정산</div>
	</div>
	</div>