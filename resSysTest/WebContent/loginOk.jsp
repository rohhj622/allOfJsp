<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SKY MUSIC </title>
</head>
<body>
<!-- After Login, Main Page -->
	<%
		String mem_id = request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw");
		
		
		if(mem_id.equals("rohhj622")){
			/* out.println("학생"); */	
			session.setAttribute("mem_id",mem_id);
			response.sendRedirect("reserve.jsp");
	%>
<%-- 			<jsp:include page="menu.jsp"/>
			<jsp:include page="reserve.jsp"/>
			<jsp:include page="calendar.jsp"/>
				<jsp:param name="mem_id" value="<%=mem_id%>"/> --%>
			
	<%
		}
		else if(mem_id.equals("rohwk129")){
			session.setAttribute("mem_id",mem_id);
			response.sendRedirect("reserve.jsp");
	%>		
	
<%-- 			<jsp:include page="menu.jsp"/>
			<jsp:include page="reserve.jsp"/>
			<jsp:include page="calendar.jsp"/>
				<jsp:param name="mem_id" value="<%=mem_id%>"/> --%>
			
	
	<% 	}
		else{
			session.setAttribute("mem_id",mem_id);
			response.sendRedirect("reserve.jsp");
	%>
<%-- 			<jsp:include page="adminMain.jsp"/>
			
				<jsp:param name="mem_id" value="<%=mem_id%>"/> --%>
		
	<% 
		}
	%>
	
	
</body>
</html>