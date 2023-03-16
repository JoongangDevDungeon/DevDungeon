<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.page-item{	cursor: pointer; }
</style>
<script>
function moving(page){
	 const form = document.getElementById('searchForm');
    var queryParams = {pageNo:(page)?page:1};
    if(form.searchValue.value!=""){
    	queryParams={
          pageNo: (page) ? page : 1
         , searchType: form.searchType.value
         , searchValue: form.searchValue.value
    }
    }
    location.href = location.pathname + '?' + new URLSearchParams(queryParams).toString();
}
</script>
<nav>
<!-- <div class="pagingBox"> -->
<!-- 					<ul class="pagingList"> -->
<!-- 						<li class="pageNo page_btn" onclick="moveBefore(1)"><i class="xi-backward xi-x"></i></li> -->
<%-- 						<li class="pageNo page_btn" onclick="moveBefore(${pageNo})"><i class="xi-step-backward xi-x"></i></li> --%>
<%-- 						<c:forEach var="i" begin="${Math.floor((pageNo-1)/10)*10+1 }" end="${Math.floor((pageNo-1)/10)*10 +10 gt pages.lastPage ? pages.lastPage : Math.floor((pageNo-1)/10)*10 +10}"> --%>
<%-- 							<li class="pageNo" onclick="move(${i })" <c:if test="${pageNo eq i }" >style="color:red; font-weight: bold;"</c:if>>${i }</li> --%>
<%-- 						</c:forEach> --%>
<%-- 						<li class="pageNo page_btn" onclick="moveNext(${pageNo})"><i class="xi-step-forward xi-x"></i></li> --%>
<%-- 						<li class="pageNo page_btn" onclick="moveNext(${pages.lastPage })"><i class="xi-forward xi-x"></i></li> --%>
<!-- 					</ul> -->
<!-- 				</div> -->
<div class="pagingBox">
  <ul class="pagingList">
    <li class="pageNo page_btn" onclick="moving(1)"><i class="xi-backward xi-x"></i></li>
    <li class="pageNo page_btn" onclick="moving(${pageInfo.pageNum-1})"><i class="xi-step-backward xi-x"></i></li>
    <c:if test="${pageInfo.pages gt 9 }">
			<c:forEach
			begin="${pageInfo.pageNum lt pageInfo.pages-9 ? pageInfo.pageNum:pageInfo.pages-9}"
			end="${pageInfo.pageNum+9 gt pageInfo.pages ? pageInfo.pages:pageInfo.pageNum+9}"
			var="p">
			<li class="pageNo" onclick="moving(${p })"<c:if test="${pageInfo.pageNum eq p }">style="color:red;"</c:if>>${p }</li>
			</c:forEach>
		</c:if>
		<c:if test="${pageInfo.pages le 9 }">
			<c:forEach
			begin="${1 }"
			end="${pageInfo.pages }"
			var="p">
			<li class="pageNo" onclick="moving(${p })"<c:if test="${pageInfo.pageNum eq p }">style="color:pink"</c:if>>${p }</li>			
			</c:forEach>
		</c:if>
    <li class="pageNo page_btn" onclick="moving(${pageInfo.pageNum eq pageInfo.pages ? pageInfo.pageNum:pageInfo.pageNum+1 })"><i class="xi-step-forward xi-x"></i></li>
    <li class="pageNo page_btn" onclick="moving(${pageInfo.pages })"><i class="xi-forward xi-x"></i></li>
  </ul>
</div>
</nav>