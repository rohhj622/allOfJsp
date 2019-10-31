<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>application 기본객체 경로명 정보 </h1>
	<%
		String realPath = application.getRealPath("/");/* 작업고있는 폴더의 root */
		String contPath = application.getContextPath();
		
	%>
	<!--  명확하게 이해하는게 좋음.  -->
	<h3> 루트의 실제 파일 경로명 : <%=realPath %> </h3><br>
	<h3> 웹어플리케이션의 url 경로명 : <%=contPath %> </h3><br>
	
</body>
</html>