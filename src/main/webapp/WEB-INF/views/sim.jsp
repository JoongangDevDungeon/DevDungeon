<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>동영</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">

<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
	
	<!-- Navbar Brand-->
	<a class="navbar-brand ps-3" href="index.html">레시피</a>
	
	<!-- Sidebar Toggle-->
	<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
	
	<!-- Navbar Search-->
	
	<!-- Navbar-->
	<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
		<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
			<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
				<li><a class="dropdown-item" href="#!">Settings</a></li>
				<li><a class="dropdown-item" href="#!">Activity Log</a></li>
				<li><hr class="dropdown-divider" /></li>
				<li><a class="dropdown-item" href="#!">Logout</a></li>
			</ul>
		</li>
	</ul>
</nav>

<div id="layoutSidenav">
	<div id="layoutSidenav_nav">
		<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
			<div class="sb-sidenav-menu">
				<div class="nav">
				
					<div class="sb-sidenav-menu-heading">레시피</div>
					<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
						<div class="sb-nav-link-icon">
							<i class="fas fa-columns"></i>
						</div>
						레시피 검색
						<div class="sb-sidenav-collapse-arrow">
							<i class="fas fa-angle-down"></i>
						</div>
					</a>
					
					<div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
						<nav class="sb-sidenav-menu-nested nav">
							<a class="nav-link" href="layout-static.html">재료</a>
							<a class="nav-link" href="layout-sidenav-light.html">요리방법</a>
							<a class="nav-link" href="layout-sidenav-light.html">영양성분표</a>
						</nav>
					</div>
					
					<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
						<div class="sb-nav-link-icon">
							<i class="fas fa-book-open"></i>
						</div>
                        Pages
						<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
					</a>
					<div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
						<nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
							<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
								권한
								<div class="sb-sidenav-collapse-arrow">
									<i class="fas fa-angle-down"></i>
								</div>
							</a>
							
							<div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
								<nav class="sb-sidenav-menu-nested nav">
									<a class="nav-link" href="login.html">로그인</a>
									<a class="nav-link" href="register.html">레지스터</a>
									<a class="nav-link" href="password.html">비밀번호 찾기</a>
								</nav>
							</div>
							
							
						</nav>
					</div>
				</div>
			</div>
		</nav>
	</div>
	<div id="layoutSidenav_content">

<main>
<!-- 원 -->
<!-- 	<canvas class="circle"></canvas> -->
<div class="container-fluid px-4">
	<h1 class="mt-4">레시피 검색</h1>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
	
	<!-- Search 레이아웃 -->
	<ol class="breadcrumb mb-4">	
	
		<!-- Navbar Search-->
		<form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
				<button class="btn btn-primary" id="btnNavbarSearch" type="button">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</form>
	</ol>
	
	<div class="row">
		<div class="col-xl-3 col-md-6">
			<div class="card bg-primary text-white mb-4">
				<div class="card-body">재료</div>
				<div class="card-footer d-flex align-items-center justify-content-between">
					<a class="small text-white stretched-link" href="#">재료보기</a>
					<div class="small text-white">
						<i class="fas fa-angle-right"></i>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xl-3 col-md-6">
			<div class="card bg-warning text-white mb-4">
				<div class="card-body">영양성분표</div>
				<div class="card-footer d-flex align-items-center justify-content-between">
					<a class="small text-white stretched-link" href="#">영양성분표 보기</a>
					<div class="small text-white">
						<i class="fas fa-angle-right"></i>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xl-3 col-md-6">
			<div class="card bg-success text-white mb-4">
				<div class="card-body">요리과정</div>
				<div class="card-footer d-flex align-items-center justify-content-between">
					<a class="small text-white stretched-link" href="#">요리과정보기</a>
					<div class="small text-white">
						<i class="fas fa-angle-right"></i>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xl-3 col-md-6">
			<div class="card bg-danger text-white mb-4">
				<div class="card-body">주의사항</div>
				<div class="card-footer d-flex align-items-center justify-content-between">
					<a class="small text-white stretched-link" href="#">주의사항보기</a>
					<div class="small text-white">
						<i class="fas fa-angle-right"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xl-6">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-chart-area me-1"></i>
					선그래프
				</div>
				<div class="card-body">
					<canvas id="myAreaChart" width="100%" height="40"></canvas>
				</div>
			</div>
		</div>
		<div class="col-xl-6">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-chart-bar me-1"></i>
					막대바
				</div>
				<div class="card-body">
					<canvas id="myBarChart" width="100%" height="40"></canvas>
				</div>
			</div>
		</div>
	</div>
	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table me-1"></i>
			데이터 테이블
		</div>
		<div class="card-body">
			<table id="datatablesSimple">
				<thead>
					<tr>
						<th>테이블1</th>
						<th>테이블2</th>
						<th>테이블3</th>
						<th>테이블4</th>
						<th>테이블5</th>
						<th>테이블6</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th>테이블1</th>
						<th>테이블2</th>
						<th>테이블3</th>
						<th>테이블4</th>
						<th>테이블5</th>
						<th>테이블6</th>
					</tr>
				</tfoot>
				<tbody>
					<%-- <%for(int=i; i<list.size(); i++){ %> --%>
					<!-- <tr> -->
						<%-- <td><%=list. %></td> --%>
						<%-- <td><%=list. %></td> --%>
						<%-- <td><%=list. %></td> --%>
						<%-- <td><%=list. %></td> --%>
						<%-- <td><%=list. %></td> --%>
						<%-- <td><%=list. %></td> --%>
					<!-- </tr> -->
					<%-- <%} %> --%>
				</tbody>
			</table>
		</div>
	</div>
</div>
</main>
	<footer class="py-4 bg-light mt-auto">
		<div class="container-fluid px-4">
			<div class="d-flex align-items-center justify-content-between small">
				<div class="text-muted">Copyright &copy; Your Website 2022</div>
				<div>
					<a href="#">Privacy Policy</a>
					&middot;
					<a href="#">Terms &amp; Conditions</a>
				</div>
			</div>
		</div>
	</footer>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="assets/demo/chart-area-demo.js"></script>
<script src="assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="js/datatables-simple-demo.js"></script>
</body>
</html>
<script>    
const canvas = document.getElementById('circle');
const ctx = canvas.getContext('2d');

var width = canvas.clientWidth;
var height = canvas.clientHeight;

var value = [50, 100, 100];
var degree = 360;
const radius = 50;

var sum = value.reduce((a, b) => a + b);  //총합계

var conv_array = value.slice().map((data)=>{  //conv_array는 비율이 담긴 배열
var rate = data / sum;  //값을 총합계로 나누어 비율을 구함
var myDegree = degree * rate;  //비율을 360을(degree) 곱해 비율에 따른 도(degree)를 구함.
return myDegree;
});
</script>