<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SKY MUSIC </title>
</head>
<body>
<!-- After Login, Login check and then move to reserve.jsp -->
	<%
		String mem_id = request.getParameter("mem_id");
		
		if(mem_id.equals("rohhj622")){
			/* out.println("학생"); */	
			session.setAttribute("mem_id",mem_id);
			response.sendRedirect("firstMain.jsp");
		}
		else if(mem_id.equals("rohwk129")){
			session.setAttribute("mem_id",mem_id);
			response.sendRedirect("firstMain.jsp");
		}
		else{
			session.setAttribute("mem_id",mem_id);
			response.sendRedirect("firstMain.jsp");

		}
	%>
	
	
</body>
</html>