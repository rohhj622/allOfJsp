<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl If</title>
</head>
<body>
<%
	int[] list = {1,2,3,4,5,6,7,8,9,10};

%>
	<c:if test="${list.length != 0 }"> <!-- test 안에 조건  -->
		<c:forEach var="data" items="<%=list %>"> <!-- 해당되는 값을 자동으로 하나씩 읽음.  -->
			${data }
		</c:forEach>
	</c:if>
	<c:if test="${list.length }">
		데이터가 없습니다.
	</c:if>
</body>
</html>
