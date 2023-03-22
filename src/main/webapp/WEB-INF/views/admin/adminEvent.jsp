<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Favicon-->
<link rel="icon" href="/img/admin/adminGazi.png" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
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
/*
const myModal = document.getElementById('staticBackdrop');

myModal.addEventListener('show.bs.modal', event => {
	// Button that triggered the modal
	const button = event.relatedTarget;
	// Extract info from data-bs-* attributes
	const recipient = button.getAttribute('data-bs-whatever');
	// If necessary, you could initiate an AJAX request here
	// and then do the updating in a callback.
	//
	// Update the modal's content.
	const modalTitle = myModal.querySelector('.modal-title');
	const modalBodyInput = myModal.querySelector('.modal-body input');
	
	modalTitle.textContent = `New message to ${recipient}`
	modalBodyInput.value = recipient
});
*/

/*
*/
$().ready(function(){
	$("#staticBackdrop").modal("show");
	
});
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
					<td>${row.event_date } ~ ${row.event_end }</td>
					<td>
						<form action="/adminEvent" method="post">
							<input type="hidden" name="event_no" value="${row.event_no }">
							<input type="hidden" name="status_no" value="${row.status_no }">
							<input type="hidden" name="pageNo" value="${pageNo }">
							<button type="submit" class="${row.status_no eq '1' ? 'btn btn-primary' : 'btn btn-danger'}">${row.status_no eq '1' ? '활성화' : '비활성화'}</button>
						</form>
						
						<form>
							<!-- 모달 시작 -->
							<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#staticBackdrop">당첨자 뽑기</button>
							
							<!-- Modal -->
							<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h1 class="modal-title fs-5" id="staticBackdropLabel">Modal	title</h1>
											<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">당첨자 뽑기 본문</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
											<button type="button" class="btn btn-primary">Save changes</button>
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