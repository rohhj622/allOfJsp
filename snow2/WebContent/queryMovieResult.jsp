<%@page import="java.util.ArrayList"%>
<%@page import="model.Movie"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>queryEmpResult</title>
</head>
<body>
<!-- menu -> queryEmp -> queryEmpResult -> menu -->
	<table border="1" style="text-align:center;">
		<tr><td colspan="5">사원목록 조회 결과</td></tr>
		<tr bgcolor="orange">
			<th>no</th>
			<th>title</th>
			<th>director</th>
			<th>created</th>
			<th>information</th>
		</tr>
		<%
			response.setContentType("text/html;charset=utf8");
			request.setCharacterEncoding("utf-8");
			
			ArrayList<Movie> list = (ArrayList<Movie>)request.getAttribute("list"); 
			
		%>

		<c:forEach var="movie" items="${list }">
			<tr>
				<td>${movie.getNo() }</td>
				<td>${movie.getTitle() }</td>
				<td>${movie.getDirector() }</td>
				<td>${movie.getCreated() }</td>
				<td>${movie.getInformation() }</td>
				
				
			</tr>			
		</c:forEach>
	</table>
<br><br>
</body>
</html>