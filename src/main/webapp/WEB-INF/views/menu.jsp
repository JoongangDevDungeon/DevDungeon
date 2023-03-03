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
      <!-- 로그인 버튼 -->
      <div class="dropdown">
         <c:choose>
            <c:when test="${sessionScope.member_id eq null }"><!-- 로그인 안했을때 -->
               <button type="button" class="btn text-white dropdown-toggle login-btn" data-bs-toggle="dropdown" aria-expanded="false" data-bs-auto-close="outside" >로그인</button>
               <form class="dropdown-menu p-4" action="/login.do" method="post">
            </c:when>
            <c:otherwise><!-- 로그인 했을때 사용자 정보 출력 -->
               <button type="button" class="btn text-white dropdown-toggle login-btn" data-bs-toggle="dropdown" aria-expanded="false" data-bs-auto-close="outside" >내정보</button>
               <form class="dropdown-menu p-4" action="/login.do" method="post">
            </c:otherwise>
         </c:choose>
         
         <c:choose>
            <c:when test="${sessionScope.member_id eq null }"><!-- 로그인 안했을때 id/pass 칸 출력 -->
               <div class="mb-3">
                  <label for="exampleDropdownFormEmail2" class="form-label">ID</label>
                  <input type="id" class="form-control" id="exampleDropdownFormEmail2" name="member_id" placeholder="아이디를 입력하세요.">
               </div>
               <div class="mb-3">
                  <label for="exampleDropdownFormPassword2" class="form-label">Password</label>
                  <input type="password" class="form-control" id="exampleDropdownFormPassword2" name="member_pw" placeholder="패스워드를 입력하세요.">
               </div>
               <div class="mb-3">
                  <div class="form-check">
                     <input type="checkbox" class="form-check-input" id="dropdownCheck2">
                     <label class="form-check-label" for="dropdownCheck2"> 아이디 저장 </label>
                  </div>
               </div>
               <button type="submit" class="btn btn-primary">로그인</button> <button type="submit" class="btn btn-primary">회원가입</button>
            </c:when>
            <c:otherwise><!-- 로그인 했을때 사용자 정보 출력 -->
               <div>${sessionScope.member_name }님 환영합니다.</div><br>
                <p>
                   Member Point : ${member.member_point }
                </p>
               <a onclick="location.href='/logout.do'"  class="btn btn-primary">로그아웃</a> <a onclick="location.href='/myinfo.do'"  class="btn btn-primary">마이페이지</a> 
            </c:otherwise>
         </c:choose>
      </form>
      </div>
            
      <!-- 메뉴 리스트 -->
      <div class="menu-list">
         <span class="btn text-white menu-board">쪽지</span> 
         <span class="btn text-white menu-board">레벨</span> 
         <span class="btn text-white menu-board">포인트</span> 
         <span class="btn text-white menu-board">마이페이지</span>
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