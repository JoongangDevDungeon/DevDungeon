<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Favicon-->
<link rel="icon" href="/img/admin/adminGazi.png" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<title>admin event</title>
<link rel="stylesheet" href="/css/admin.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">function url(link){location.href="/"+link;}</script>
<script type="text/javascript" src="/js/admin/AdminEventPaging.js"></script>
<script type="text/javascript" src="/js/admin/AdminEventSearch.js"></script>
</head>
<script type="text/javascript">
//페이지 뒤쪽 버튼
function moveNext(pageNo){
	let searchType = document.getElementById("searchType");
	let searchValue = document.getElementById("searchValue");
	let url =  document.location.href.split("?",1);
	
	if(pageNo > ${pages.lastPage } ) { return false; }
	else if (pageNo != ${pages.lastPage } ){
		
		if((searchType.value != null && searchType.value != "none") && searchValue.value != null){
			location.href=url+"?searchType="+ searchType.value+"&searchValue="+searchValue.value+"&pageNo="+(pageNo+1);
		}else{
			location.href="/adminEvent?pageNo="+(pageNo+1);
		}
		
	}else if(pageNo == ${pages.lastPage }){
		
		if((searchType.value != null && searchType.value != "none") && searchValue.value != null){
			location.href=url+"?searchType="+ searchType.value+"&searchValue="+searchValue.value+"&pageNo="+pageNo;
		}else{ 
			location.href="/adminEvent?pageNo="+pageNo;
		}
	}
}

/* 모달 */
const myModal = document.getElementById('modal');
myModal.modal("show");

function winsBtn(){
	document.getElementById("eModalForm").submit();
}

</script>
<body>
<div id="container">
	<div class="header">
		<%@include file="./adminMenu.jsp"%>
	</div>
	
	<!-- 메인 시작 -->
	<div class="main">
		<div class="container">
			<h1>관리자 이벤트 페이지</h1>
			<hr class="hr1">
			<table class="table">
				<tr class="table-header">
					<th class="col-1">번호</th>
					<th class="col-3">이벤트 제목</th>
					<th class="col-2">이벤트 기간</th>
					<th class="col-1">관리</th>
				</tr>
				
				<c:forEach items="${list }" var="row">
				<tr>
					<td>${row.event_no }</td>
					<td>${row.event_title }</td>
					<td>${row.formatted_start } ~ ${row.event_end }</td>
					<td>
						<form action="/adminEvent" method="post" class="exentf1">
							<input type="hidden" name="event_no" value="${row.event_no }">
							<input type="hidden" name="status_no" value="${row.status_no }">
							<input type="hidden" name="pageNo" value="${pageNo }">
							<button type="submit" class="${row.status_no eq '1' ? 'btn btn-primary' : 'btn btn-danger'}">${row.status_no eq '1' ? 'ON' : 'OFF'}</button>
						</form>
						
						<!-- 모달 시작 -->
						<form action="/adminEventModal" method="post" class="exentf2" id="eModalForm">
							<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#staticBackdrop${row.event_no }">뽑기</button>
							<!-- Modal -->
							<div class="modal" id="staticBackdrop${row.event_no }" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered">
									<div class="modal-content">
										<div class="modal-header">
											<div class="modal-title fs-5" id="staticBackdropLabel">${row.event_no }번 이벤트</div>
											<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
										<input type="hidden" name="pageNo" value="${pageNo }">
										<input type="hidden" name="eventNo" value="${row.event_no }">
										총 당첨자수 : <input type="number" name="winner">
										
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
											<button type="submit" class="btn btn-primary" id="eWinE" onclick="winsBtn()">저장</button>
										</div>
									</div>
								</div>
							</div>
						</form>
						
					</td>
				</tr>
				</c:forEach>
			</table>
			
			
			<!-- 이벤트 글쓰기 버튼 -->
			<div class="ED-btn">
				<button class="btn btn-primary" onclick="location.href='/adminEventWrite'">이벤트 글쓰기</button>
			</div><br><br>
			
			<!-- 페이징 -->
			<div class="pagingBox">
				<ul class="pagingList">
					<li class="pageNo page_btn" onclick="moveBefore(1)"><i class="xi-backward xi-x"></i></li>
					<li class="pageNo page_btn" onclick="moveBefore(${pageNo})"><i class="xi-step-backward xi-x"></i></li>
					<c:forEach var="i" begin="${Math.floor((pageNo-1)/10)*10+1 }" end="${Math.floor((pageNo-1)/10)*10 +10 gt pages.lastPage ? pages.lastPage : Math.floor((pageNo-1)/10)*10 +10}">
						<li class="pageNo" onclick="move(${i })" <c:if test="${pageNo eq i }" >style="color:red; font-weight: bold;"</c:if>>${i }</li>
					</c:forEach>
					<li class="pageNo page_btn" onclick="moveNext(${pageNo})"><i class="xi-step-forward xi-x"></i></li>
					<li class="pageNo page_btn" onclick="moveNext(${pages.lastPage })"><i class="xi-forward xi-x"></i></li>
				</ul>
			</div>
			<br>
			
			<!-- 검색 -->
			<div class="searchForm">
				<form action="/adminEvent" method="get" onsubmit="return search()">
					<select name="searchType" id="searchType">
						<option value="none">선택</option>
						<option value="title" <c:if test='${ pages.searchType eq "title"}'>selected</c:if>>제목</option>
						<option value="writer" <c:if test='${ pages.searchType eq "writer"}'>selected</c:if>>내용</option>
					</select>
					<input type="text" name="searchValue" id="searchValue" value="${pages.searchValue }">
					<button class="search_btn">검색</button>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>