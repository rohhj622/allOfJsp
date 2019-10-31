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
	<h3> Cookie value change</h3>
	<% 
		Cookie[] cookies = request.getCookies();
		if(cookies != null && cookies.length>0){
			for(Cookie c : cookies){
				if(c.getName().equals("name")){
					Cookie cookie = new Cookie("name",URLEncoder.encode("오레오cookie", "utf-8"));
					/* 원래 있던 이름으로 쿠키 다시 생성하면 , 옛날에있던거 변경됨.  */
					response.addCookie(cookie);
				}
			}
		}
		
	%>
	
	name cookie value is changed.
</body>
</html>