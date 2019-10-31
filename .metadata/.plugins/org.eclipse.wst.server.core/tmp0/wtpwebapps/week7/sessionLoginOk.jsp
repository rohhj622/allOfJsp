<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
	<h4>login status</h4>
	<%=session.getAttribute("id") %>님 반갑습니다. 
	<h1>Main</h1>
	
	<form action="sessionLogout.jsp">
		<input type="submit" value="logout">
	</form>
</body>
</html>