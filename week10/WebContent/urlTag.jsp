<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:url value="http://search.daum.net/search" var="searchUrl" >
		<c:param name="code" value="blog"/>
		<c:param name="place" value="park"/>	
	</c:url>
	
	<!-- http://search.daum.net/search?code=blog&place=park -->
	
	<ul>
		<li>${searchUrl }</li>
		<li><c:url value="forToken.jsp"/></li>
	</ul>
</body>
</html>