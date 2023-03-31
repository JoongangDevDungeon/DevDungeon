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
			<h1>관리자 페이지 메인 대쉬보드</h1>
			<hr class="hr1">
			

			<div class="mtoday">
				<div class="mth">오늘의 할일</div>
				<hr class="hr1">
				<div class="mtc">
					<div class="mtc1">
						<a class="mhov">
							오늘의 방문객 : 
							<span class="mhov hr">${today[0].today_user }</span>
						</a>
						
					</div>
					<div class="mtc2">
						<a class="mhov" href="/adminMember">
							오늘의 신규회원 : 
							<span class="mhov hr">${today[0].join_today }</span>
						</a>
					</div>
					<div class="mtc3">
						<a class="mhov" href="/adminBoard">
							게시판 신규글 : 
							<span class="mhov hr">${today[0].board_today }</span>
						</a>
					</div>
					<div class="mtc4">
						<a class="mhov" href="/adminQnA">
							답변대기문의 : 
							<span class="mhov hr">${today[0].question_board_count }</span>
						</a>
					</div>
					<div class="mtc5">
						<a class="mhov" href="/adminStore">
							신규 스토어상품 : 
							<span class="mhov hr">${today[0].new_product }</span>
						</a>
					</div>
					
					
					
					
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
									<c:forEach items="${date }" var="row" end="6">
										<tr>
											<td>${row.date }</td>
											<td>${row.visitors }</td>
											<td>${row.questions }</td>
											<td>${row.new_members }</td>
										</tr>
									</c:forEach>
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
<script src="/js/admin/AdminMainStatistics.js"></script>
</body>
</html>