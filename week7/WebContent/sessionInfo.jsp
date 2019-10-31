<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Date time = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	%>
	
	session Id : <%=session.getId() %> <br>
	
	<%
		time.setTime(session.getCreationTime());
		/* 위에서 만든 time객체에 넣어줌.  */
	%>
	session created time : <%=sdf.format(time) %><br>
	
	<%
		time.setTime(session.getLastAccessedTime());
	%>
	session last accessed time :  <%=sdf.format(time) %>
</body>
</html>