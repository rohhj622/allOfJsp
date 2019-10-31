<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3> Delete Cookie</h3>
	<% 
		Cookie[] cookies = request.getCookies();
		if(cookies != null && cookies.length>0){
			for(Cookie c : cookies){
				if(c.getName().equals("name")){
					Cookie cookie = new Cookie("name","" );
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
			}
		}
		
	%>
	
	name cookie value is deleted.
</body>
</html>