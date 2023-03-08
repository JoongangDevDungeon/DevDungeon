<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		<div>
			<h1>관리자 통계 페이지</h1>
		
		</div>
		--------------------------------
		<div class="">
			<div class="graph1">
				<canvas id="myBarChart" width="100" height="100"></canvas>
				막대그래프
			</div>
			<div class="graph2">
				표2
			</div>
			<div class="graph3">
				표3
			</div>
			<div class="graph4">
				표4
			</div>
		</div>
		
		
		
<!-- 			<div class="col-xl-6"> -->
<!-- 				<div class="card mb-4"> -->
<!-- 					<div class="card-header"> -->
<!-- 						<i class="fas fa-chart-bar me-1"></i> -->
<!-- 						바그래프 -->
<!-- 					</div> -->
<!-- 					<div class="card-body"> -->
<%-- 						<canvas id="myBarChart" width="100%" height="40"></canvas> --%>
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
		
		
	</div>
</div>
<script src="/js/admin/AdminStatistics.js"></script>
</body>
</html>