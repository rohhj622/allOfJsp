 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>main.jsp에서 생성한 내용. </h1>
	<hr>
	<jsp:include page="sub.jsp" flush="false" ></jsp:include>
	<hr>
	<h1>include 이후의 내용.</h1>
	
</body>
</html>