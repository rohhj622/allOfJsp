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
	<h3> logOut</h3>
	<% 
		Cookie[] cookies = request.getCookies();
	
		if(cookies != null && cookies.length>0){
			for(Cookie c : cookies){
				if(c.getName().equals("id")){
					Cookie cookie = new Cookie("id","");
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
			}
		}
	%>
		LogOut
</body>
</html>