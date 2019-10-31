<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	body_Sub에서 이름  :  <%=request.getParameter("name") %>
	<br>
	name parameter list:
	<ul>
		<%
			String[] nameArray = request.getParameterValues("name");
		
			for (String s : nameArray){
		%>
			<li><%=s %></li>
		<%} %>
	</ul>
</body>
</html>