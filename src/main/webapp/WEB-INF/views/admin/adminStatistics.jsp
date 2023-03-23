<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Favicon-->
<link rel="icon" href="/img/admin/adminGazi.png" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<title>admin statistics</title>
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
			<h1>관리자 통계 페이지</h1>

			<hr class="hr1">
			<div class="row">
				<div class="mboard">
				
				
					<!-- 시간별 막대 그래프 -->
					<div class="mbar">
						<div class="col-xl-6 mbar">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-chart-bar me-1">시간별 방문자 현황</i>
								</div>
								<div class="card-body">
									<canvas id="myBarChartTime"></canvas>
								</div>
							</div>
						</div>
					</div>
					
					
					<!-- 요일별 막대 그래프 -->
					<div class="mbar">
						<div class="col-xl-6 mbar">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-chart-bar me-1">요일별 방문자 현황</i>
								</div>
								<div class="card-body">
									<canvas id="myBarChartToday"></canvas>
								</div>
							</div>
						</div>
					</div>
					
					
					<!-- 월별 막대 그래프 -->
					<div class="mbar">
						<div class="col-xl-6 mbar">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-chart-bar me-1">월별 방문자 현황</i>
								</div>
								<div class="card-body">
									<canvas id="myBarChartMonth"></canvas>
								</div>
							</div>
						</div>
					</div>
					
					<button type="button" onclick="location.href='/adminStatistics/time'">시간별방문자 엑셀</button>
					<button type="button" onclick="location.href='/adminStatistics/day'">요일별방문자 엑셀</button>
					<button type="button" onclick="location.href='/adminStatistics/month'">월별방문자 엑셀</button>

				</div>
			</div>
		</div>
	</div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="/js/admin/AdminStatisticsMonth.js"></script>
<script src="/js/admin/AdminStatisticsToday.js"></script>
<script src="/js/admin/AdminStatisticsTime.js"></script>
</body>
</html>