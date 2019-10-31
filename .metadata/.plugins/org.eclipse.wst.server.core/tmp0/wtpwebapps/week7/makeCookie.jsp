<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie!</title>
</head>
<body>
	<%
		Cookie cookie  = new Cookie("name","오레오");
		response.addCookie(cookie);
	%>
	
	<h3>
		<%=cookie.getName() %>  / cookie value <%=cookie.getValue() %>
	</h3>
</body>
</html>