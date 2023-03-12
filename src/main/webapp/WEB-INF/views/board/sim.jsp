<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<link type="text/css" rel="stylesheet" href="/css/HJHBoard.css">
<title>동영</title>
</head>
<body>
<%@include file="../menu.jsp"%>
	<div class="container">
		<h1>동영</h1>
		<div class="card-body">
			<table id="datatablesSimple">
				<thead>
					<tr>
						<th>사진</th>
						<th>요리명</th>
						<th>요리재료</th>
						<th>조리과정</th>
						<th>영양성분</th>
						<th>주의사항</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th>사진</th>
						<th>요리명</th>
						<th>요리재료</th>
						<th>조리과정</th>
						<th>영양성분</th>
						<th>주의사항</th>
					</tr>
				</tfoot>
				<tbody>
					<%-- <%for(int=i; i<list.size(); i++){ %> --%>
					<!-- <tr> -->
						<%-- <td><%=list. %></td> --%>
						<%-- <td><%=list. %></td> --%>
						<%-- <td><%=list. %></td> --%>
						<%-- <td><%=list. %></td> --%>
						<%-- <td><%=list. %></td> --%>
						<%-- <td><%=list. %></td> --%>
					<!-- </tr> -->
					<%-- <%} %> --%>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>