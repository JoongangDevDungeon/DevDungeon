<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<link rel="stylesheet" href="/css/menu.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
   <!-- 메뉴 -->
   <div class="menu">
            
      <!-- 메뉴 리스트 -->
      <div class="menu-list">
         <span class="btn text-white menu-board">쪽지</span> 
         <span class="btn text-white menu-board">레벨</span> 
         <span class="btn text-white menu-board">포인트</span> 
         <span class="btn text-white menu-board">마이페이지</span>
         <span class="btn text-white menu-board">로그인</span>
      </div>
      <!-- 메뉴 리스트 -->

   </div>
   <!-- 메뉴 -->
   <div class="menu-lists">
   <div class="menu_list2">
      <div class="logo">로고</div>
      <div class="board">공지사항</div>
      <div class="board">게시판</div>
      <div class="board">스토어</div>
      <div class="board">고객센터</div>
   	</div>
   </div>

   <script src="/resources/js/scripts.js"></script>
</body>
</html>