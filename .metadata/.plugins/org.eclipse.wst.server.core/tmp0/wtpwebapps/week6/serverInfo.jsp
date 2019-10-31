<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>서버정보 읽어오기</h1>
	<%=application.getServerInfo() %><Br>
	
	<h1>Servlet Info</h1>
	<%=application.getMajorVersion() %>.<%=application.getMinorVersion() %><br>
	
	<h1>Jsp Info</h1>
	<%=JspFactory.getDefaultFactory().getEngineInfo().getSpecificationVersion() %>
	
</body>
</html>