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
	<h3> login Check</h3>
	<% 
		boolean sw = false;
		Cookie[] cookies = request.getCookies();
	
		if(cookies != null && cookies.length>0){
			for(Cookie c : cookies){
				if(c.getName().equals("id")){
					out.println("id"+c.getValue()+ "login success");
					sw=true;
					break;
					
				}
			}
		}
		if(sw == false){
			out.println("로그인안한 상태");
		}
		
	%>
</body>
</html>