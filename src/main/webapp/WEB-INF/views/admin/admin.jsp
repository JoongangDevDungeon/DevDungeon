<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Favicon-->
<link rel="icon" href="/img/admin/adminGazi.png" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<title>admin</title>
<link rel="stylesheet" href="/css/admin.css">
<script type="text/javascript">function url(link){location.href="/"+link;}</script>
</head>
<body>
<div id="container">
	<div class="header">
		<%@include file="./adminMenu.jsp"%>
	</div>
	
	<!-- 메인 시작 -->
	<div class="main">
		<div class="container">
<!-- 		<img class="logo" src="./img/admin/adminGazi.png"> -->
			<h1>관리자 페이지 메인 대쉬보드</h1>
			<hr class="hr1">
			${today }<br>
			${date }<br>
			${visitor }
			<div class="mtoday">
				<div class="mth">오늘의 할일</div>
				<hr class="hr1">
				<div class="mtc1">
					<a class="mhov" href="/adminQnA">
						답변대기문의 : ${today[0].question_board_count }
					</a>
				</div>
				<div class="mtc2">
					<a class="mhov" href="/adminEvent">
						가입한 유저 : ${today[0].join_today }
					</a>
				</div>
				<div class="mtc3">
					<a class="mhov" href="/adminCoupon">
						추가된 게시물 : ${today[0].board_today }
					</a>
				</div>
			</div>


			<hr class="hr1">
			
			
			<div class="row">
				<div class="mboard">
				<!-- 표 그래프 -->
					<div class="mbar">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-chart-bar me-1">일자별 요약</i>
							</div>
							<div class="card-body">
								<table class="table">
									<tr class="table-header">
										<th class="col-1">일자</th>
										<th class="col-1">방문자</th>
										<th class="col-1">문의</th>
										<th class="col-1">가입</th>
										
									</tr>
									<tr>
										<td>(날짜)</td>
										<td>count(Log방문자)</td>
										<td>count(question_board_status)</td>
										<td>count(Log가입)</td>
										
									</tr>
									
								</table>
							</div>
						</div>
					</div>
				
					<!-- 막대 그래프 -->
					<div class="mbar">
					
						<div class="col-xl-6 mbar">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-chart-bar me-1">일별 방문자 현황</i>
								</div>
								<div class="card-body">
									<canvas id="myBarChart1"></canvas>
								</div>
							</div>
						</div>
					</div>
					
				</div>
			</div>
			
		</div>
	</div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="/js/admin/AdminStatistics.js"></script>
</body>
</html>