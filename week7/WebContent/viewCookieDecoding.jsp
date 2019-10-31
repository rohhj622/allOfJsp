<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3> Cookie list - Decoding</h3>
	<%
		Cookie[] cookies = request.getCookies();
	
		if(cookies != null && cookies.length > 0){
			/* 확장 for문 배열에서 한개씩 읽어서 c 로 불러옴  */
			for(Cookie c : cookies){
				out.println(c.getName() + "=");
				out.println(URLDecoder.decode(c.getValue(), "utf-8")+ "<br>");
			}
		}else{
			out.println("Cookie box is empty. ");
		}
	%>
</body>
</html>