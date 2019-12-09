<%@page import="java.util.ArrayList"%>
<%@page import="Model.Emp"%>
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
			<th>사번</th>
			<th>이름</th>
			<th>부서코드</th>
			<th>업무</th>
			<th>급여</th>
		</tr>
		<%
			response.setContentType("text/html;charset=utf8");
			request.setCharacterEncoding("utf-8");
			
			ArrayList<Emp> list = (ArrayList<Emp>)request.getAttribute("list"); 
			
		%>
		
		<c:forEach var="emp" items="${list }">
			<tr>
				<td>${emp.getEmpno() }</td>
				<td>${emp.getEmpName() }</td>
				<td>${emp.getEmpDept() }</td>
				<td>${emp.getEmpJob() }</td>
				<td>${emp.getEmpSal() }</td>
			</tr>			
		</c:forEach>
	</table>
<br><br>
<form action="main.do">
	<input type="submit" value="메뉴화면">
</form>
</body>
</html>