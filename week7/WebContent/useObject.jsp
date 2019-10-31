<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="member" class="week7.MemberInfo" scope="request"/>
	<%=member.getName() %>( <%=member.getId() %> ) Hello!
	<br>
	your email is <%=member.getEmail() %> .
	
</body>
</html>