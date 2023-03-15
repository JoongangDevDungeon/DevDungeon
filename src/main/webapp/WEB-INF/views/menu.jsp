<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<nav class="menu">
   <ul class="menu_ul">
      <li><a href="/index"><img src="/img/logo.png" alt="가지"></a></li>
      <li><a href="/notice">공지사항</a></li>
      <li>
         <div class="dropdown">
            <a class="board_dropdown" type="button" data-bs-toggle="dropdown" aria-expanded="false">
               게시판
            </a>
            <ul class="dropdown-menu none">
               <li class="drop_menu"><a class="dropdown-item items" href="/board/HJHBoard">HJH Board</a></li>
               <li class="drop_menu"><a class="dropdown-item items" href="/csjboard">CSJ Board</a></li>
            </ul>
         </div>
      </li>
      <li><a href="/store">스토어</a></li>
      <li><a href="/level">레벨 등급표</a></li>
   </ul>
</nav>