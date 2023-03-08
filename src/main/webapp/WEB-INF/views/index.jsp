<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
   <meta charset="UTF-8">
<title>게시글 관리</title>
<link rel="stylesheet" href="/css/index.css">
<link rel="stylesheet" href="/cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<style>

   /* 헤더 */
   .top {
      width: 1920px;
      height: 40px;
      background-color: #6867AC;
   }

   .top_ul {
      margin: 0;
      padding: 0;
      width: auto;
      height: 40px;
      line-height: 40px;
      list-style: none;
      float: right;
      color: white;
      margin-right: 390px;
   }

   .top_ul > li {
      float: left;
      margin-right: 10px;
   }

   .dropdown-toggle {
      color: white;
   }

   .dropdown-menu {
      padding-right: 30px;
      padding-left: 30px;
      padding-bottom: 10px;
      box-sizing: border-box;
      width: 300px;
   }

   /* 네비게이션 */

   .menu {
      width: 1920px;
      height: 100px;
      text-align: center;
   }

   .menu_ul {
      padding: 0;
      height: 100px;
      list-style: none;
      display: inline-block;
   }

   .menu_ul > li {
      float: left;
      width: 200px;
      height: 100px;
      line-height: 100px;
      text-align: center;
      display: inline-block;
   }

   .menu_ul > li:nth-child(1) > img {
      width: 170px;
      height: 100px;
   }

   /* 섹션 */

   .main {
      width: 1920px;
      height: auto;
      text-align: center;
      display: inline-block;
   }

   .add_first {
      width: 190px;
      min-height: 800px;
      background-color: #ccc;
      display: inline-block;
   }

   .add_second {
      width: 190px;
      min-height: 800px;
      background-color: #ccc;
      display: inline-block;
   }

   .content {
      text-align: justify;
      border: 1px solid #ccc;
      box-sizing: border-box;
      width: 1000px;
      min-height: 1080px;
      display: inline-block;
   }

   /* 푸터 */

   footer {
      margin-top: 30px;
      padding-top: 18px;
      border-top: 1px solid #ccc;
      width: 100%;
      height: 40px;
      text-align: center;
   }

   footer > ol {
      list-style: none;
      height: 40px;
      line-height: 40px;
      display: inline-block;
   }

   footer > ol > li {
      width: 200px;
      height: 30px;
      line-height: 30px;
      text-align: center;
      float: left;
      position: relative;
      color: #7e7e7e;
      font-size: 13px;
      font-weight: 700;
      cursor: pointer;
   }

   footer > ol > li:after {
      content: "|";
      position: absolute;
      right: 0;
   }

   footer > ol > li:nth-child(6):after {
      content: "";
   }
</style>
<body>
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
                  <button type="button" class="btn btn-secondary">회원가입</button>
                  <a href="/signup">계정찾기</a>
               </form>
            </div>
         </li>
      </ul>
   </header>
   <nav class="menu">
      <ul class="menu_ul">
         <li><img src="/img/logo.png" alt="가지"></li>
         <li>공지사항</li>
         <li>게시판</li>
         <li>스토어</li>
         <li>고객센터</li>
      </ul>
   </nav>
   <section>
         <div class="main">
            <span class="add_first">광고</span>
            <div class="content">
               본문
            </div>
            <span class="add_second">광고</span>
         </div>
   </section>
   <footer>
      <ol>
         <li>서비스 이용약관</li>
         <li>개인정보처리방침</li>
         <li>운영정책</li>
         <li>청소년보호정책</li>
         <li>콘텐츠 가이드</li>
         <li>고객센터</li>
      </ol>
   </footer>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</html>
