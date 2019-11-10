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
	<h4>jstl tag choose result</h4>
	<ul>
		<c:choose> 
			<c:when test="${param.name=='노현진' }">
				<li> Your name is ${param.name } </li>
			</c:when>
			<c:when test="${param.age>20}">
				<li> 당신의 나이는 20세 이상입니다.</li>
			</c:when>
			<c:otherwise>
				<li>노현진도 아니고 20세 이하임.</li>
			</c:otherwise>
		</c:choose> 
		
	</ul>
</body>
</html>