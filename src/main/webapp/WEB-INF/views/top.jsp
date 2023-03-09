<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<header class="top">
   <ul class="top_ul">
      <li>
         <div class="dropdown">
            <button type="button" class="btn dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" data-bs-auto-close="outside">
               로그인
            </button>
            <form class="dropdown-menu">
               <div class="mb-3">
                  <label for="member_id" class="form-label">아이디</label>
                  <a href="/signup">계정찾기</a>
                  <input type="email" class="form-control" id="member_id" name="member_id" placeholder="아이디를 입력하세요.">
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
               <button type="submit" class="btn btn-primary">로그인</button>
               <button type="button" class="btn btn-secondary" onclick="location.href='/agree'">회원가입</button>

            </form>
         </div>
      </li>
   </ul>
</header>