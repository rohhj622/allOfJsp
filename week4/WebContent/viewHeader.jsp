<%@page import="java.util.Enumeration"%>
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
		Enumeration headerEnum = request.getHeaderNames();
		while(headerEnum.hasMoreElements()){
			String hname = (String)headerEnum.nextElement();
			String hValue = request.getHeader(hname);	
		}
	%>
</body>
</html>