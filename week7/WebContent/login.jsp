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
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		
		if(id.equals(pw)){
			/* id==pw */
			Cookie cookie = new Cookie("id","admin");
			response.addCookie(cookie);
			out.println("login success");
		}else{
			out.println("login denied");
		}
				
				
	%>
</body>
</html>