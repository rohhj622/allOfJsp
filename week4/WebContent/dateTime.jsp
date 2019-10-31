<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("hh:mm:ss");
	
	String time =sdf.format(date);
	Calendar cal = Calendar.getInstance();
	

%>
	<h1>today  <%=cal.get(Calendar.YEAR) %>
		<%=cal.get(Calendar.MONTH)+1 %>
		<%=cal.get(Calendar.DATE) %>
	</h1>
</body>
</html>