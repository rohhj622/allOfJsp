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
	String mem_id= request.getParameter("mem_id");
	String mem_pw = request.getParameter("mem_pw");
	
	if(mem_id.equals("rohhj622")){
		
		session.setAttribute("mem_id", mem_id);
		response.sendRedirect("test01.jsp");
		
	}else if(mem_id.equals("rohwk129")){
		session.setAttribute("mem_id", mem_id);
		response.sendRedirect("test01.jsp");
	}else{
		session.setAttribute("mem_id", mem_id);
		response.sendRedirect("test01.jsp");
	}
	
%>


</body>
</html>