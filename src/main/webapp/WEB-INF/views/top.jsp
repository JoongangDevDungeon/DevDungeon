<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="/js/login.js"></script>
<header class="top">
   <ul class="top_ul">
      <li>
         <!-- 로그인 성공 시 -->
         <div class="dropdown" id="login_success" style="<c:choose><c:when test="${sessionScope.member_name != null || sessionScope.id == 'admin'}">display: block;</c:when><c:otherwise>display: none;</c:otherwise></c:choose>">
               <span style="margin-right:20px; cursor: pointer; font-weight:bold; color: #7e7e7e;" id="member_point"></span>
               <span style="margin-right:5px; font-weight:bold; color: #7e7e7e;" id="member_level"></span>
               <button style="margin-top: -3px; font-weight:bold; color: #7e7e7e;" type="button" class="btn dropdown-toggle" id="member_info" data-bs-toggle="dropdown" aria-expanded="false" data-bs-auto-close="outside">
                  <c:choose>
                     <c:when test="${sessionScope.member_name ne null}">${sessionScope.member_name} 님</c:when>
                     <c:when test="${sessionScope.id eq 'admin'}">${sessionScope.id} 님</c:when>
                  </c:choose>
				</button>
				<div class="dropdown-menu" style=" margin: 0; padding: 0; box-sizing: border-box; width: 200px; height: 250px;">
					<ul>
						<li onclick="location.href='/level'">레벨현황표</li>
<!--                	 <li>보유 포인트</li> -->
						<li onclick="location.href='/myPage'">마이 페이지</li>
                   		<li onclick="location.href='/msgBox'">쪽지함<span class="msg_Cnt"></span></li>
                   		<li onclick="location.href='/payShoppingBag?type=cart_pay'">장바구니</li>
                   		<li onclick="location.href='/logout'">로그아웃</li>
					</ul>
				</div>
            </div>
            <!-- 미로그인 시 -->
            <div class="dropdown" id="guest" style="<c:choose><c:when test="${sessionScope.member_name == null}">display: block;</c:when><c:otherwise>display: none;</c:otherwise></c:choose>">
               <button style="font-weight:bold; color: #7e7e7e;" type="button" class="btn dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" data-bs-auto-close="outside">
                  로그인
               </button>
               <div class="dropdown-menu" action="/login" method="post">
                  <div class="mb-3">
                     <label for="member_id" class="form-label">아이디</label>
                     <a style="float: right;" href="/accountInquiry">계정찾기</a>
                     <input type="text" class="form-control" id="member_id" name="member_id" placeholder="아이디를 입력하세요.">
                  </div>
                  <div class="mb-3">
                     <label for="member_pw" class="form-label">비밀번호</label>
                     <input type="password" class="form-control" id="member_pw" name="member_pw" placeholder="비밀번호를 입력하세요.">
                  </div>
                  <div class="mb-3">
                     <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="dropdownCheck2">
                        <label class="form-check-label" for="dropdownCheck2" style="margin-top: -8px;">
                           아이디 저장
                        </label>
                     </div>
                  </div>
                  <button type="button" class="btn btn-primary" id="login_btn">로그인</button>
                  <button type="button" class="btn btn-secondary" onclick="location.href='/agree'">회원가입</button>
               </div>
            </div>
      </li>
   </ul>
</header>
