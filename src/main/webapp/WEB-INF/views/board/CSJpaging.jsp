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
<nav>
  <ul class="pagination justify-content-center">
    <li class="page-item"><a class="page-link" onclick="moving(1)">First</a></li>
    <li class="page-item"><a class="page-link" onclick="moving(${pageInfo.pageNum-1})">Previous</a></li>
    <c:if test="${pageInfo.pages gt 9 }">
			<c:forEach
			begin="${pageInfo.pageNum lt pageInfo.pages-9 ? pageInfo.pageNum:pageInfo.pages-9}"
			end="${pageInfo.pageNum+9 gt pageInfo.pages ? pageInfo.pages:pageInfo.pageNum+9}"
			var="p">
			<li class="page-item"><a class="page-link" onclick="moving(${p })"<c:if test="${pageInfo.pageNum eq p }">style="color:pink"</c:if>>${p }</a></li>
			</c:forEach>
		</c:if>
		<c:if test="${pageInfo.pages le 9 }">
			<c:forEach
			begin="${1 }"
			end="${pageInfo.pages }"
			var="p">
			<li class="page-item"><a class="page-link" onclick="moving(${p })"<c:if test="${pageInfo.pageNum eq p }">style="color:pink"</c:if>>${p }</a></li>			
			</c:forEach>
		</c:if>
    <li class="page-item"><a class="page-link" onclick="moving(${pageInfo.pageNum eq pageInfo.pages ? pageInfo.pageNum:pageInfo.pageNum+1 })">Next</a></li>
    <li class="page-item"><a class="page-link" onclick="moving(${pageInfo.pages })">End</a></li>
  </ul>
</nav>