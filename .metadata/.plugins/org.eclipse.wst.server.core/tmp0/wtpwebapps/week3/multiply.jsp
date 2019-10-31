<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Multiply JSP</title>
</head>
<body>
	<%!
		public int multiply(int x,int y){
			return x*y;
		}
	%>
	
	<h3> multiply of two numbers</h3>
	<h3> 13  * 19 = <%= multiply(13,19) %> </h3>
</body>
</html>