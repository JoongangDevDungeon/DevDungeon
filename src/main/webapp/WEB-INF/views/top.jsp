<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/js/login.js"></script>
<header class="top">
   <ul class="top_ul">
      <li>
         <!-- 로그인 성공 시 -->
         <div class="dropdown" id="login_success" style="<c:choose><c:when test="${sessionScope.member_name != null}">display: block;</c:when><c:otherwise>display: none;</c:otherwise></c:choose>">
               <button type="button" class="btn dropdown-toggle" id="member_info" data-bs-toggle="dropdown" aria-expanded="false" data-bs-auto-close="outside">
                  <c:choose>
                     <c:when test="${sessionScope.member_name != null}">${sessionScope.member_name} 님</c:when>
                     <c:otherwise>${sessionScope.id}</c:otherwise>
                  </c:choose>

               </button>
               <div class="dropdown-menu">
                  <ul>
                     <li>
                        레벨
                     </li>
                     <li>
                        보유 포인트
                     </li>
                     <li>
                        <a href="/checkPassword">마이 페이지</a>
                     </li>
                     <li>
                        <a href="">쪽지함</a>
                     </li>
                     <li>
                        <a href="/logout">로그아웃</a>
                     </li>

                  </ul>
               </div>
            </div>
            <!-- 미로그인 시 -->
            <div class="dropdown" id="guest" style="<c:choose><c:when test="${sessionScope.member_name == null}">display: block;</c:when><c:otherwise>display: none;</c:otherwise></c:choose>">
               <button type="button" class="btn dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" data-bs-auto-close="outside">
                  로그인
               </button>
               <form class="dropdown-menu" action="/login" method="post">
                  <div class="mb-3">
                     <label for="member_id" class="form-label">아이디</label>
                     <a href="/accountInquiry">계정찾기</a>
                     <input type="text" class="form-control" id="member_id" name="member_id" placeholder="아이디를 입력하세요.">
                  </div>
                  <div class="mb-3">
                     <label for="member_pw" class="form-label">비밀번호</label>
                     <input type="password" class="form-control" id="member_pw" name="member_pw" placeholder="비밀번호를 입력하세요.">
                  </div>
                  <div class="mb-3">
                     <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="dropdownCheck2">
                        <label class="form-check-label" for="dropdownCheck2">
                           아이디 저장
                        </label>
                     </div>
                  </div>
                  <button type="button" class="btn btn-primary" id="login_btn">로그인</button>
                  <button type="button" class="btn btn-secondary" onclick="location.href='/agree'">회원가입</button>
               </form>
            </div>
      </li>
   </ul>
</header>