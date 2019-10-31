<%@page import="week9.Thermometer"%>
<%@page import="week9.FormatUtil"%>
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
		Thermometer thermometer = new Thermometer();
		request.setAttribute("th", thermometer);	
	%>
	
	<h3>Temperature converter</h3>
	${th.setCelsius("Seoul",27.3) }
	Seoul Temperature: <br>
	${th.getCelsius("Seoul") }C<br>
	 ${th.getFahrenheit("Seoul") }F<br>
	information : ${th.getInfo() }<br><hr>
	
	Price is <b>${FormatUtil.number(12345,"###,##0") }$</b>.
</body>
</html>