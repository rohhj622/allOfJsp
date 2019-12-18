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
	<c:set var="name" value="노현진" scope="request"/>
	<c:set var="gender" value="female" scope="request"/>
	<c:set var="age" value="21" scope="request"/> 
	<c:set var="array" value="<%=new int[] {1,2,3,4,5} %>" scope="request"/>

	
	<jsp:forward page="jstlResult.jsp"></jsp:forward>
</body>
</html>