<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var = "date" value="<%=new Date() %>"/>
	Today! <fmt:formatDate value="${date }"/><br>
	Now! <fmt:formatDate value="${date }" type="time"/><br>
	<br>
	Today! <fmt:formatDate value="${date }" type="date" pattern="yyyy/MM/dd(E)"/><br>
	Now! <fmt:formatDate value="${date }" type="time" pattern="hh:mm:ss"/><br>
	total! <fmt:formatNumber value="10000000" type="currency" currencySymbol="$" /><br>
	percent! <fmt:formatNumber value="0.65" type="percent"/> <br>
	<br>
	지역 : 미국 <br>
	<fmt:setLocale value="en"/>
	Today! <fmt:formatDate value="${date }"/><br>
	Now! <fmt:formatDate value="${date }" type="time"/><br>
	<br>
	지역 : 일본 <br>
	<fmt:setLocale value="ja_jp"/>
	Today! <fmt:formatDate value="${date }"/><br>
	Now! <fmt:formatDate value="${date }" type="time"/><br>
	
	
</body>
</html>