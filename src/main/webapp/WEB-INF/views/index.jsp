<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
	<meta charset="UTF-8">
<title>게시글 관리</title>
<link rel="stylesheet" href="/css/index.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<style>

.ground{
width:1200px;
margin: 0 auto;
background-color: yellowgreen;
}

.left{
width: 350px;
background-color: blue;
}


</style>
<body>

 	<%@include file="menu.jsp" %> 
	
	<div class="left">a</div>
	
	
	
<div class="ground">	
	
	<div>

		<form action="/index" method="post">
		<input type="text" name="dto" value="${dto}">
		<button type="submit">전송</button><br>

		<a href="./sim">레시피</a>

        </form>
    </div>
    
</div>
    
    
    
    
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</html>
