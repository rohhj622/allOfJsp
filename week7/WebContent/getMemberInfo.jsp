<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	세션에 저장된 정보 (id)  = <%=session.getAttribute("id") %> <br>
	세션에 저장된 정보 (name) = <%=session.getAttribute("name") %>
</body>
</html>