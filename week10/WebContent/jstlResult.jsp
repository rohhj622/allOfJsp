<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>jstl core tag</h3>
	name : ${name }<br>
	gender : ${gender }<br>
	age : ${age }<br>
	array data : <c:forEach var="data" items="${array }">
					${data }
				</c:forEach>
	<br>
	 하나씩 건너뛴 data:
	 	<c:forEach var ="data" items="${array}" begin="0" end="4" step ="2">
			${data }	 	
	 	</c:forEach>
</body>
</html>