<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%request.setCharacterEncoding("utf-8"); %>
	
	include 전 name parameter : <%=request.getParameter("name") %>
	<hr>
	<jsp:include page="body_Sub.jsp" flush="false">
		<jsp:param value="노현진" name="name"/>
	</jsp:include>
	
	include 후 name parameter : <%=request.getParameter("name") %>
</body>
</html>