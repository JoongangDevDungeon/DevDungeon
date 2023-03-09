<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="/css/paging.css">
<div class="pagingBar">
	<!-- 지금은 어디서 페이지를 눌러도 csjboard로 넘어감 -->
	<ul>
		
			<li><a onclick="moving(1)">[처음]</a></li>
			<li><a onclick="moving(${pageInfo.pageNum-1})">[이전]</a></li>
		
		<c:if test="${pageInfo.pages gt 9 }">
			<c:forEach
			begin="${pageInfo.pageNum lt pageInfo.pages-9 ? pageInfo.pageNum:pageInfo.pages-9}"
			end="${pageInfo.pageNum+9 gt pageInfo.pages ? pageInfo.pages:pageInfo.pageNum+9}"
			var="p">
			<li><a onclick="moving(${p })"<c:if test="${pageInfo.pageNum eq p }">style="color:pink"</c:if>>[${p }]</a></li>
			</c:forEach>
		</c:if>
		<c:if test="${pageInfo.pages le 9 }">
			<c:forEach
			begin="${1 }"
			end="${pageInfo.pages }"
			var="p">
			<li><a onclick="moving(${p })"<c:if test="${pageInfo.pageNum eq p }">style="color:pink"</c:if>>[${p }]</a></li>			
			</c:forEach>
		</c:if>
			<li><a onclick="moving(${pageInfo.pageNum eq pageInfo.pages ? pageInfo.pageNum:pageInfo.pageNum+1 })">[다음]</a></li>
			<li><a onclick="moving(${pageInfo.pages })">[끝]</a></li>
	
	</ul>
		<c:forEach 
			begin="${Math.floor((pageNo-1)/10)*10 +1 }" 
			end="${Math.floor((pageNo-1)/10)*10 +10 gt pageInfo.pages ? pageInfo.pages : Math.floor((pageNo-1)/10)*10 +10}" 
			var="p">
			${p }
		</c:forEach>
	
</div>