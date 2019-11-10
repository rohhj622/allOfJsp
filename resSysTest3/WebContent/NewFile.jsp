<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
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
	Calendar cal = Calendar.getInstance();
	SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd"); 

	cal.setTime(new Date());
	cal.add(Calendar.DATE, 7);
    String strDate = sf.format(cal.getTime());
    System.out.println(strDate);
    
    cal.add(Calendar.DATE, -7);
    strDate = sf.format(cal.getTime());
    System.out.println(strDate);
    
%>
</body>
</html>