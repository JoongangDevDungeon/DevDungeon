<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<style>
   .line{
      margin: 0px;
      padding: 0px;
      width:1920px;
      height:10px;
      background-image: url('/resources/line.png');
   }
</style>
<nav class="menu">
   <ul class="menu_ul">
      <li><a href="/index"><img src="/img/logo.png" alt="가지"></a></li>
      <li><a style="font-weight:bold; color: #7e7e7e;" href="/notice">공지사항</a></li>
      <li>
         <div class="dropdown">
            <a style="font-weight:bold; color: #7e7e7e;" class="board_dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
               게시판
            </a>
            <ul class="dropdown-menu none">
               <li class="drop_menu"><a class="dropdown-item items" href="/board/HJHBoard">자유게시판 [홍]</a></li>
               <li class="drop_menu"><a class="dropdown-item items" href="/csjboard">자유게시판 [최]</a></li>
            </ul>
         </div>
      </li>
      <li><a style="font-weight:bold; color: #7e7e7e;" href="/store">스토어</a></li>
      <li><a style="font-weight:bold; color: #7e7e7e;" href="/eventboard">이벤트</a></li>
   </ul>
</nav>
<div class="line"></div>