<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="/css/paging.css">
<div class="pagingBar">
	<!-- 지금은 어디서 페이지를 눌러도 csjboard로 넘어감 -->
	<ul>
		<c:if test="${pageInfo.isFirstPage ne true }">
			<li><a href="/csjboard?pageNo=${1 }">[처음]</a></li>
		</c:if>
		<c:if test="${pageInfo.pages gt 9 }">
			<c:forEach
			begin="${pageInfo.pageNum lt pageInfo.pages-9 ? pageInfo.pageNum:pageInfo.pages-9}"
			end="${pageInfo.pageNum+9 gt pageInfo.pages ? pageInfo.pages:pageInfo.pageNum+9}"
			var="p">
			<li><a href="/csjboard?pageNo=${p }">[${p }]</a></li>
			</c:forEach>
		</c:if>
		<c:if test="${pageInfo.pages le 9 }">
			<c:forEach
			begin="${1 }"
			end="${pageInfo.pages }"
			var="p">
			<li><a href="/csjboard?pageNo=${p }">[${p }]</a></li>
			</c:forEach>
		</c:if>
		<c:if test="${pageInfo.isLastPage ne true }">
			<li>
			<li><a href="/csjboard?pageNo=${pageInfo.pages }">[끝]</a></li>
		</c:if>
	</ul>
</div>