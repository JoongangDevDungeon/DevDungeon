<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>인덱스 페이지</title>
</head>
<body>
    <h1>인덱스 페이지 입니다.</h1>
    <div>
        <form action="/index" method="post">
            <input type="text" name="dto" value="${dto}">
            <button type="submit">전송</button>
        </form>
    </div>
</body>
</html>
