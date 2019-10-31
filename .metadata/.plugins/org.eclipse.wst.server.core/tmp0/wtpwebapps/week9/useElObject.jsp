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
		request.setAttribute("name", "Hyun Jin");
		session.setAttribute("id", "admin");
		application.setAttribute("appValue", "EL Object");
	%>
	
	<h3>
		request URI : ${pageContext.request.requestURI };<br>
		code parameter : ${param.code }<br>
		cookies's JESSESIONID : ${cookie.JSESSIONID.value };<br>
		 <hr>
		request name attribute : ${requestScope.name };<br>
		session Id  attribute: ${sessionScope.id };<br>
		application appValue attribute : ${applicationScope.appValue };<br>
	</h3>
	<h3>
		request name attribute : ${name };<br>
		session Id  attribute: ${id };<br>
		application appValue attribute : ${appValue };<br>
	</h3>
	
</body>
</html>