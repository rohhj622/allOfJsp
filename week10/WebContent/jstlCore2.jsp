<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="week10.MemberInfo" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		MemberInfo member = new MemberInfo();
	%>
	<c:set var="mem" value="<%=member %>" scope= "request"/>
	<c:set target="${mem }" property="id" value ="admin"/>
	<c:set target="${mem }" property="password" value ="admin"/>
	<c:set target="${mem }" property="name" value ="노현진"/>
	
	<jsp:forward page="jstlResult2.jsp"></jsp:forward>
	
</body>
</html>