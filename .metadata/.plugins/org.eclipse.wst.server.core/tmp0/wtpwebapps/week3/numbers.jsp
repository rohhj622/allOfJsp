<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calculate final</title>
</head>
<body>
	
	<%  int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
	%>
	
	<h1> 사칙 연산 결과 </h1>
	
	<%=num1 %> + <%=num2 %> = <%=num1+num2 %><br>
	<%=num1 %> - <%=num2 %> = <%=num1-num2 %><br>
	<%=num1 %> * <%=num2 %> = <%=num1*num2 %><br>
	<%=num1 %> / <%=num2 %> = <%=num1/num2 %><br>
	
</body>
</html>